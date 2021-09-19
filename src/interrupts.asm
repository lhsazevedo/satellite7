handleInterrupt:
    push af
    in a, (Port_VDPStatus)
    push bc
    push de
    push hl
    push ix
    push iy
    ld a, $FF
    ld (interruptFlag), a

    ; Return if paused
    ld a, (state)
    cp STATE_PAUSED
    jr z, interruptHandlerExit

    call copySpritesToVram

    ; Set a random color for the last palette slot
    ld a, $1F
    out (Port_VDPAddress), a
    ld a, $C0
    out (Port_VDPAddress), a
    ld a, r
    and $0F
    out (Port_VDPData), a

    call runInterruptActions
    call handleMapScrolling
    call readInput

    ; Increment frame counter.
    ld hl, frameCounter
    inc (hl)
    ld a, (hl)

    rrca
    jp c, @oddFrame

    call bomb_LABEL_2AE6_

    ; Related to jellyfish count and player armor, at least.
    call _LABEL_2FD2_

    call updateWave
    call audio.update

    ; If skipped: unlimited grace period without flashing
    call _LABEL_110C_
    jp interruptHandlerExit

@oddFrame:
    call blinkStars
    call checkStatusTextTimer
    call drawScores
    call updateCollisions_LABEL_2682_
    
    ; Flag toggled every two frames.
    ; Used in _LABEL_2770_ and _LABEL_284B_.
    ld hl, two_frame_toggle_RAM_C108_
    inc (hl)
    ld a, (hl)
    cp $02
    jr c, interruptHandlerExit
    ld (hl), $00

interruptHandlerExit:
    pop iy
    pop ix
    pop hl
    pop de
    pop bc
    pop af
    ei
    ret

handlePauseInterrupt:
    push af

    ld a, (state)

    ; Exit if already paused
    cp STATE_PAUSED
    jr z, exitPause

    ; Pause only during gameplay state
    cp STATE_GAMEPLAY
    jr nz, returnPauseInterrupt

    ; Backup game state
    ld (stateBackup), a

    ; Set state to paused
    ld a, STATE_PAUSED
    ld (state), a

returnPauseInterrupt:
    pop af
    retn

exitPause:
    ld a, (stateBackup)
    ld (state), a

    ; Enable cheats if the correct button combination was pressed.
    ld a, (cheatCounter1)
    cp $03
    jr nz, +

    ld a, (cheatCounter2)
    cp $07
    jr nz, +

    ld a, (flags_RAM_C103_)
    or $80
    ld (flags_RAM_C103_), a

    jr ++

+:
    ld a, (flags_RAM_C103_)
    and $7F
    ld (flags_RAM_C103_), a

++:
    ; Reset cheat counters
    xor a
    ld (cheatCounter1), a
    ld (cheatCounter2), a

    jr returnPauseInterrupt
