; This disassembly was created using Emulicious (https://www.emulicious.net)
.MEMORYMAP
DEFAULTSLOT 0
SLOTSIZE $8000
SLOT 0 $0000
.ENDME

.ROMBANKMAP
BANKSTOTAL 1
BANKSIZE $8000
BANKS 1
.ENDRO

.EMPTYFILL $FF

.INCLUDE "constants.asm"
.INCLUDE "structs.asm"
.INCLUDE "variables.asm"
.INCLUDE "macros.asm"

; Ports
.define Port_PSG $7F
.define Port_VDPData $BE
.define Port_VDPAddress $BF
.define _PORT_DE_ $DE
.define _PORT_DF_ $DF

; Input Ports
.define Port_VDPStatus $BF
.define Port_IOPort1 $DC
.define Port_IOPort2 $DD

.BANK 0 SLOT 0
.ORG $0000

start:
    di
    ld sp, $C0FF
    im 1
    jr init

_LABEL_8_:
    call writeVDPCommandWord
    in a, (Port_VDPData)
    ld b, a
    push af
    pop af
    in a, (Port_VDPData)
    ld c, a
    ret

_DATA_14_:
.dw _DATA_506_
.dw _DATA_513_

writeToVdpAddress:
    push af
    call setVDPWriteAddress
    pop af
    out (Port_VDPData), a
    ret

copyToVram:
    call setVDPWriteAddress
    ld a, c
    or a
    jr z, +
    inc b
+:
    ld a, b
    ld b, c
    ld c, Port_VDPData
-:
    outi
    jp nz, -
    dec a
    jp nz, -
    ret

_DATA_36_:
.dw _DATA_2157_

handleInterruptEntrypoint:
    jp handleInterrupt

palette:
.db $0A $06 $05 $00 $29 $25 $3A $3F $34 $3B $03 $0F $0C $08 $0B $02
.db $00 $00 $03 $00 $3F $3F $3A $02 $0B $0C $08 $0F $34 $22 $21 $02

; Data from 5B to 65 (11 bytes)
_DATA_5B_:
.dw _DATA_14_
.db $01
.db $01
.db $00
.db $01
.db $C0
.db $00
.db $70

_DATA_64_:
.dw _DATA_21CA_

handlePauseInterruptEntrypoint:
    jp handlePauseInterrupt

init:
    ld hl, _RAM_C000_
    ld de, _RAM_C000_ + 1
    ld (hl), $00
    ld bc, $1FFF
    ldir

    ld de, _RAM_D100_
    ld hl, _DATA_5F6_
    call extract

    ld (de), a
    ld de, v_map
    ld hl, map
    call extract

    call _LABEL_14A_
    call _LABEL_BA9_
    call _LABEL_BE7_
    call _LABEL_159_
    call clearTilemap
    ld hl, (terrainTiles)
    ld bc, $58D5
    ld de, $2000
    call _LABEL_313C_

    ; Bomb, explosions, player, numbers, stars
    ld hl, (baseTiles)
    ld de, $0000
    ld bc, $440E
    call _LABEL_313C_

    ld hl, characterTiles
    ld de, $0820
    ld b, $F8
    call _LABEL_16C_

    call loadBossTiles

    ld hl, mark3Tiles
    ld de, $1C80
    ld b, $B0
    call _LABEL_16C_

    ; Load title tiles
    call _LABEL_36A1_

    ; Strange tiles
    call _LABEL_31B2_

    ld hl, palette
    ld de, $C000
    ld bc, $0020
    rst copyToVram

    call _LABEL_BEE_
    ld de, $81E0
    ld a, e
    ld (_RAM_C101_), a
    call writeVDPCommandWord

    ld a, STATE_MARK_3_LOGO
    ld (state), a

resetPlayfieldAndUpdate:
    di
    call clear_some_ram_LABEL_13C_
    call _AUDIO_3C65_

    ld a, $01 ; jumpToClearTilemap
    ld (interruptActionSlot2), a
    ld a, $06 ; clearSprites
    ld (interruptActionSlot7), a

    xor a
    ld (_RAM_C133_), a

    ld hl, flags_RAM_C103_
    res 7, (hl)

    ; Reset VDP vertical scroll register
    ld de, $8900
    call writeVDPCommandWord

update:
    ei
    ld a, (interruptFlag)
    or a
    jp z, update
    xor a
    ld (interruptFlag), a

    ld a, (state)

    rrca
    jp c, updateMark3LogoState

    rrca
    jp c, updateStartScreenState

    rrca
    jp c, updateDemoState

    rrca
    jp c, updateGameplayState

    rrca
    jp c, updatePauseState

    jp resetPlayfieldAndUpdate

    ; Unused code 
    ld de, _RAM_C301_
    ld hl, _RAM_C300_
    ld bc, $01FF
    jr +

clear_some_ram_LABEL_13C_:
    ld de, _RAM_C133_ + 1
    ld hl, _RAM_C133_
    ld bc, $0FCD
+:
    ld (hl), $00
    ldir
    ret

_LABEL_14A_:
    ld b, $02
--:
    push bc
    ld bc, $FFFF
-:
    dec bc
    ld a, b
    or c
    jr nz, -
    pop bc
    djnz --
    ret

_LABEL_159_:
    ld a, $92
    out (_PORT_DF_), a
    ld hl, flags_RAM_C103_
    set 6, (hl)
    xor a
    out (_PORT_DE_), a
    in a, (_PORT_DE_)
    or a
    ret z
    res 6, (hl)
    ret

_LABEL_16C_:
    ld a, e
    out (Port_VDPAddress), a
    ld a, d
    or $40
    out (Port_VDPAddress), a
-:
    xor a
    out (Port_VDPData), a
    push af
    pop af
    xor a
    out (Port_VDPData), a
    ld a, (hl)
    push af
    pop af
    out (Port_VDPData), a
    nop
    xor a
    out (Port_VDPData), a
    inc hl
    djnz -
    ret

; Extract RLE compressed data from HL to DE
extract:
    ld a, (hl)
    cp $FF
    ret z
    bit 7, a
    jr nz, @raw
    ld b, a
    inc hl
    ld a, (hl)
@runLoop:
    ld (de), a
    cp $FF
    ret z
    inc de
    djnz @runLoop
    inc hl
    jp extract

@raw:
    and $7F
    ld b, a
@rawLoop:
    inc hl
    ld a, (hl)
    ld (de), a
    cp $FF
    ret z
    inc de
    djnz @rawLoop
    inc hl
    jp extract

.INCLUDE "interrupts.asm"

updatePauseState:
    call _AUDIO_3C65_
    ld a, (flags_RAM_C103_)
    rrca
    jr c, ++

    ; Increment cheat counters
    call readInput
    ld a, (input.player1Changes)
    bit 4, a
    jr z, +
    ld hl, cheatCounter1
    inc (hl)
+:
    bit 5, a
    jr z, ++
    ld hl, cheatCounter2
    inc (hl)
++:
    jp update

updateGameplayState:
    ld a, (_RAM_C133_)
    bit 0, a
    jp z, resetScores
    bit 3, a
    call nz, _LABEL_369_
    call _LABEL_2301_
    call updateEntities
    ld a, (_RAM_C319_)
    cpl
    ld (_RAM_C319_), a
    or a
    call nz, _LABEL_1070_
    call _LABEL_2484_
    call _LABEL_39E_
    ld a, (flags_RAM_C103_)
    rrca
    jr c, ++
    ld a, (_RAM_C133_)
    bit 6, a
    jp z, update
    call _LABEL_70E_
    jr nz, +
    ld a, (_RAM_C300_)
    inc a
    ld (_RAM_C300_), a
    cp $E0
    jp c, update
+:
    ld iy, player1
    call putIYEntityOffscreen
    jp +++

++:
    ld a, (_RAM_C133_)
    and $C0
    jp z, update
    cp $40
    jr z, ++++
    cp $80
    jr z, _LABEL_324_
    call _LABEL_70E_
    jr nz, +
    ld a, (_RAM_C300_)
    inc a
    ld (_RAM_C300_), a
    cp $E0
    jp c, update
+:
    ld iy, player1
    call putIYEntityOffscreen
    ld iy, player2
    call putIYEntityOffscreen
    ld a, (_RAM_C133_)
    and $F9
    ld (_RAM_C133_), a
+++:
    ld a, STATE_MARK_3_LOGO
    ld (state), a

    jp resetPlayfieldAndUpdate

++++:
    call +
    jp c, update
    ld hl, _RAM_C133_
    res 1, (hl)
    ld iy, player1
    call putIYEntityOffscreen
    jp update

_LABEL_324_:
    call +
    jp c, update
    ld hl, _RAM_C133_
    res 2, (hl)
    ld iy, player2
    call putIYEntityOffscreen
    jp update

+:
    ld a, (_RAM_C301_)
    inc a
    ld (_RAM_C301_), a
    cp $E0
    ret c
    xor a
    ret

resetScores:
    ld a, (state)
    cp STATE_DEMO
    jr z, +
    ld hl, player1ScoreChanged
    ld (hl), $00
    ld de, player1ScoreChanged + 1
    ld bc, $0007
    ldir
+:
    call _LABEL_BFC_
    ld a, $09
    ld (_RAM_C133_), a
    ld a, $83
    ld (_RAM_CD00_), a
    jp update

_LABEL_369_:
    ld hl, _RAM_C133_
    res 3, (hl)
    ld a, (flags_RAM_C103_)
    rrca
    jp c, +
    ld a, (_RAM_C133_)
    bit 1, a
    ret nz
    jp _LABEL_48D_

+:
    ld a, (_RAM_C133_)
    and $06
    cp $06
    ret z
    bit 6, a
    jr nz, +
    ld a, (_RAM_C133_)
    and $42
    jp nz, +
    call _LABEL_48D_
+:
    ld a, (_RAM_C133_)
    and $84
    ret nz
    jp _LABEL_48D_

_LABEL_39E_:
    ld a, (_RAM_C133_)
    bit 6, a
    jp nz, _LABEL_3FF_
    ld a, (_RAM_C104_)
    bit 1, a
    jr z, +
    and $F0
    ld (_RAM_C104_), a
    jr _LABEL_3FF_

+:
    and $48
    cp $08
    jp nz, _LABEL_3FF_
    ld a, (_RAM_C104_)
    and $F7
    or $01
    ld (_RAM_C104_), a
    ld hl, _RAM_C133_
    set 3, (hl)
    ld a, (p1Lives)
    dec a
    jp p, +++
    ld a, (_RAM_C104_)
    and $F0
    ld (_RAM_C104_), a
    ld hl, _RAM_C133_
    set 1, (hl)
    ld a, $06
    ld (player1.type), a
    ld a, $01
    ld (player1.data05), a
    ld a, (flags_RAM_C103_)
    rrca
    jr nc, +
    ld a, (_RAM_C133_)
    and $84
    jr z, ++
+:
    call _LABEL_456_
++:
    xor a
+++:
    ld (p1Lives), a
    call drawPlayer1Lives
_LABEL_3FF_:
    ld a, (flags_RAM_C103_)
    rrca
    ret nc
    ld a, (_RAM_C104_)
    bit 5, a
    jr z, +
    and $0F
    ld (_RAM_C104_), a
    ret

+:
    bit 7, a
    ret z
    bit 2, a
    ret nz
    and $7F
    or $10
    ld (_RAM_C104_), a
    ld hl, _RAM_C133_
    bit 7, (hl)
    ret nz
    set 3, (hl)
    ld a, (p2Lives)
    dec a
    jp p, ++
    ld a, (_RAM_C104_)
    and $0F
    ld (_RAM_C104_), a
    ld hl, _RAM_C133_
    set 2, (hl)
    ld a, $06
    ld (_RAM_C622_), a
    ld a, $02
    ld (_RAM_C625_), a
    ld a, (_RAM_C133_)
    and $42
    jr z, +
    call _LABEL_456_
+:
    xor a
++:
    ld (p2Lives), a
    call drawPlayer2Lives
    ret

_LABEL_456_:
    ld a, $84
    ld (_RAM_CD00_), a
    ret

drawPlayer1Lives:
    or a
    push af
    ld a, (p1Lives)
    cp $0A
    jr c, +
    ld a, $09
    ld (p1Lives), a
    jr +

drawPlayer2Lives:
    scf
    push af
    ld a, (p2Lives)
    cp $0A
    jr c, +
    ld a, $09
    ld (p2Lives), a
+:
    ld b, $30
    add a, b
    ld b, a
    pop af
    jr c, +
    ld de, $3D38
    jr ++

+:
    ld de, $3DB8
++:
    ld a, b
    jp writeToVdpAddress

_LABEL_48D_:
    ld a, (_RAM_C104_)
    bit 0, a
    jr z, +
    ld de, player1
    ld hl, _DATA_5B_
    ld bc, $0009
    ldir
    ld a, $FF
    ld (_RAM_C61A_), a
    ld a, $01
    ld (_RAM_C61B_), a
    ld a, $02
    ld (player1.data12), a
    ld a, $03
    ld (_RAM_C614_), a
    ld a, $18
    ld (_RAM_C61C_), a
    ld (_RAM_C302_), a
    ld a, (flags_RAM_C103_)
    bit 0, a
    jr nz, +

    ; Respaw position
    ld a, $58
    ld (player1.xPos.low), a
    ret

+:
    ld a, (_RAM_C104_)
    bit 4, a
    ret z
    ld de, player2
    ld hl, _DATA_517_
    ld bc, $0009
    ldir
    ld a, $FF
    ld (_RAM_C63A_), a
    ld a, $01
    ld (_RAM_C63B_), a
    ld a, $02
    ld (_RAM_C632_), a
    ld a, $03
    ld (_RAM_C634_), a
    ld a, $18
    ld (_RAM_C63C_), a
    ld (autofireTimer), a
    ret

; Data from 4F6 to 516 (33 bytes)
player1AnimationDescriptor:
.dw _DATA_506_
.dw _DATA_541_
.dw _DATA_541_
.dw _DATA_541_
.dw _DATA_506_
.dw _DATA_54E_
.dw _DATA_54E_
.dw _DATA_54E_

_DATA_506_:
.db $04
.db $00 $00 $10
.db $00 $08 $11
.db $08 $00 $12
.db $08 $08 $13

_DATA_513_:
.db $01
.db $04 $04 $00

; Data from 517 to 523 (13 bytes)
_DATA_517_:
.dw _DATA_520_
.db $02 ; type
.db $01 ; data03
.db $00 ; data04
.db $02 ; data05
.db $C0 ; yPos.low
.db $00 ; yPos.high
.db $40 ; xPos.low

_DATA_520_:
.dw _DATA_534_
.db $13 $05

; Data from 524 to 55A (55 bytes)
player2AnimationDescriptor:
.dw _DATA_534_
.dw _DATA_541_
.dw _DATA_541_
.dw _DATA_541_
.dw _DATA_534_
.dw _DATA_54E_
.dw _DATA_54E_
.dw _DATA_54E_

_DATA_534_:
.db $04
.db $00 $00 $10
.db $00 $08 $11
.db $08 $00 $14
.db $08 $08 $15

_DATA_541_:
.db $04
.db $00 $00 $08
.db $00 $08 $09
.db $08 $00 $0A
.db $08 $08 $0B

_DATA_54E_:
.db $04
.db $00 $00 $0C
.db $00 $08 $0D
.db $08 $00 $0E
.db $08 $08 $0F

updateDemoState:
    call _LABEL_70E_
    cp $02
    jr z, +
    ld a, (_RAM_C133_)
    bit 1, a
    jr nz, +
    bit 2, a
    jr nz, +
    ld a, (_RAM_C150_)
    or a
    jr z, ++
    ld a, $01
    ld (player1ScoreChanged), a
    ld (player2ScoreChanged), a
    call +++
    ld a, (_RAM_C150_)
    cp $E0
    jp nz, updateGameplayState
+:
    ld a, STATE_MARK_3_LOGO
    ld (state), a
    jp resetPlayfieldAndUpdate

++:
    ld hl, unknownFlags_RAM_C151_
    set 1, (hl)
    ld a, (flags_RAM_C103_)
    or $01
    ld (flags_RAM_C103_), a
    ld a, $FF
    ld (_RAM_C150_), a
    jp update

+++:
    di
    ld de, $0000
    ld a, (_RAM_C14E_)
    inc a
    ld (_RAM_C14E_), a
    cp $04
    jr nz, +
    xor a
    ld (_RAM_C14E_), a
    ld de, (_RAM_C14C_)
    inc de
    ld (_RAM_C14C_), de
    ld hl, _RAM_D100_
    add hl, de
    ld a, (hl)
    cp $FF
    jr z, ++
    ld (_RAM_C14F_), a
+:
    ld a, (_RAM_C14F_)
    ld b, a
    ld a, r
    rrca
    ld a, b
    jr c, +
    or $20
+:
    ld (input.player1), a
    xor $0C
    ld (input.player2), a
    ld a, (_RAM_C14E_)
    or a
    ret nz
    ld a, (input.player1)
    ld (input.player1Changes), a
    xor $0C
    ld (input.player2Changes), a
    ret

++:
    ld a, $E0
    ld (_RAM_C150_), a
    ret

; Data from 5F6 to 619 (36 bytes)
_DATA_5F6_:
.db $2B $00 $89 $06 $04 $04 $06 $06 $04 $04 $06 $04 $06 $00 $04 $02
.db $05 $06 $82 $04 $04 $03 $00 $0F $01 $09 $08 $81 $00 $09 $04 $03
.db $05 $0B $00 $03

; 2nd entry of Pointer Table from 4058 (indexed by unknown)
; Data from 61A to 61D (4 bytes)
_DATA_61A_:
.db $01 $04 $00 $03

; 2nd entry of Pointer Table from 3F5A (indexed by unknown)
; Data from 61E to 680 (99 bytes)
_DATA_61E_:
.db $02 $04 $06 $83 $04 $06 $04 $07 $00 $07 $08 $05 $01 $84 $00 $00
.db $02 $02 $06 $06 $03 $04 $81 $06 $09 $00 $03 $04 $83 $05 $04 $00
.db $08 $0A $82 $08 $09 $08 $01 $04 $05 $06 $04 $83 $00 $02 $02 $06
.db $06 $03 $04 $87 $06 $02 $02 $06 $06 $04 $04 $0A $05 $03 $01 $81
.db $09 $03 $08 $81 $00 $07 $06 $83 $04 $05 $05 $12 $01 $81 $02 $35
.db $06 $82 $04 $04 $09 $05 $09 $04 $13 $00 $81 $01 $18 $05 $82 $04
.db $06 $01 $FF

updateStartScreenState:
    call +++
    xor a
    ld hl, (_RAM_C148_)
    cp h
    jr nz, +
    cp l
    call z, ++
+:
    inc hl
    ld (_RAM_C148_), hl
    ld a, h
    cp $03
    jp c, update
    ld a, STATE_DEMO
    ld (state), a
    xor a
    ld (interruptActionSlot5), a ; Related to interruptActions jumptable
    jp resetPlayfieldAndUpdate

++:
    di
    push hl
    call _LABEL_36A1_
    pop hl
    ld a, $01 ; jumpToClearTilemap
    ld (interruptActionSlot2), a ; Related to interruptActions jumptable
    ld a, $02 ; drawBlueBG
    ld (interruptActionSlot3), a ; Related to interruptActions jumptable
    ld a, $04 ; drawMenu
    ld (interruptActionSlot5), a ; Related to interruptActions jumptable

    ld a, $81
    ld (_RAM_CD00_), a
    ret

+++:
    ld hl, flags_RAM_C103_
    ld a, (input.player1Changes)
    and $30
    jr z, +
    res 0, (hl)
    jr ++

+:
    ld a, (input.player2Changes)
    and $30
    ret z
    set 0, (hl)
++:
    ld hl, state
    ld (hl), STATE_GAMEPLAY
    ret

updateMark3LogoState:
    ld a, (_RAM_C152_)
    or a
    call z, +++

    call _LABEL_70E_
    cp $02
    jr z, ++
    ld hl, _RAM_C148_
    inc (hl)
    ld a, (hl)
    cp MARK_3_LOGO_TIMER
    jr z, +
    jp update

+:
    call ++++
++:
    xor a
    ld (interruptActionSlot3), a
    jp resetPlayfieldAndUpdate

+++:
    ld a, $02 ; drawBlueBG
    ld (interruptActionSlot3), a ; Related to interruptActions jumptable

    
    ld a, $05 ; drawMark3Logo
    ld (interruptActionSlot6), a ; Related to interruptActions jumptable
    ld (_RAM_C152_), a
    ret

_LABEL_70E_:
    ld a, (input.player1Changes)
    and $30
    or a
    jr nz, ++++
    ld a, (input.player2Changes)
    and $30
    or a
    ret z
++++:
    ld a, STATE_START_SCREEN
    ld (state), a
    or a
    ret

runInterruptActions:
    ld hl, interruptActionSlot1
    ld b, $12
-:
    push hl
    push bc
    ld a, (hl)
    or a
    call nz, +
    pop bc
    pop hl
    inc hl
    djnz -
    ret

+:
    ld (hl), $00
    add a, a
    ld e, a
    ld d, $00
    ld hl, interruptActions - 2
    add hl, de
    ld e, (hl)
    inc hl
    ld d, (hl)
    ex de, hl
    jp (hl)

; Jump Table from 745 to 76C (20 entries, indexed by interruptActionSlot1)
interruptActions:
.dw jumpToClearTilemap
.dw drawBlueBG
.dw setBGColorsToBlack
.dw drawMenu
.dw drawMark3Logo
.dw clearSprites
.dw drawInfoBar
.dw incrementAndDrawPlayer1Lives
.dw incrementAndDrawPlayer2Lives
.dw incrementAndDrawStar
.dw _LABEL_A3E_
.dw loadBossTiles
.dw _LABEL_A9C_
.dw _LABEL_ABB_
.dw drawExtraText
.dw drawBonusText
.dw clearInfoText
.dw interruptNopAction
.dw interruptNopAction
.dw interruptNopAction

; 1st entry of Jump Table from 745 (indexed by interruptActionSlot1)
jumpToClearTilemap:
    jp clearTilemap

drawMark3Logo:
    ld a, $08
    ld (drawRectAttributes), a
    ld de, $3A4C
    ld hl, mark3Logo
    ld bc, $0213
    jp drawTileAreaWithAttributes

; Data from 781 to 7A6 (38 bytes)
mark3Logo:
.db $46 $4A $46 $4A $46 $4A $4B $E4 $00 $E5 $E6 $4B $E4 $E7 $E8 $E9
.db $EA $EB $EC $ED $EE $EF $F0 $F1 $F2 $F3 $F4 $00 $F5 $F6 $F3 $F4
.db $F7 $F8 $F9 $57 $58 $44

; 3rd entry of Jump Table from 745 (indexed by interruptActionSlot1)
setBGColorsToBlack:
    ; Set PAL1 1st color to black
    ld a, $00
    ld de, $C010
    rst writeToVdpAddress

    ; Set PAL0 4th color to black
    ld a, $00
    ld de, $C003
    jp writeToVdpAddress

; 4th entry of Jump Table from 745 (indexed by interruptActionSlot1)
drawMenu:
    ld hl, logo
    ld de, $390A
    ld bc, $042A
    call drawTileArea

    ld hl, titleSevenTop
    ld de, $38EE
    ld b, $02
    ld a, $08
    ld (drawRectAttributes), a
    call drawTiles
    ld a, $D6
    out (Port_VDPData), a
    push af
    pop af
    ld a, $0A
    out (Port_VDPData), a

    ; Draw player 1 push start text
    ld de, $3B88
    ld hl, pushStartText
    ld b, $18
    call drawTiles
    ld de, $3C1A
    ld hl, orText
    ld b, $02
    call drawTiles

    ; Draw player 2 push start text
    ld de, $3C88
    ld hl, pushStartText
    ld b, $18
    call drawTiles
    ld a, $32
    ld de, $3C92
    rst writeToVdpAddress

    ; Draw copyright text
    ld de, $3DC8
    ld hl, copyrightText
    ld b, $18
    jp drawTiles

pushStartText:
.db $50 $55 $53 $48 $20 $31 $20 $50 $4C $41 $59 $20 $53 $54 $41 $52
.db $54 $20 $42 $55 $54 $54 $4F $4E

orText:
.db $4F $52

copyrightText:
.db $4F $52 $49 $47 $49 $4E $41 $4C $20 $47 $41 $4D $45 $20
.db $5B $5C $5D $5E $5F $20 $31 $39 $38 $35

titleSevenTop:
.db $D6 $BD

logo:
.db $BE $08 $BF $08 $C0 $08 $C0 $0A $C1 $08 $C1 $0A $C2 $08 $C3 $08
.db $C4 $08 $00 $08 $C4 $08 $00 $08 $C4 $08 $C1 $08 $C1 $0A $C2 $08
.db $C3 $08 $00 $08 $D6 $0C $C5 $08 $C6 $08 $C7 $08 $CD $0E $C8 $08
.db $C8 $0A $C9 $08 $C9 $0A $C7 $08 $D6 $0A $CA $08 $00 $08 $CA $08
.db $00 $08 $CA $08 $C9 $08 $C9 $0A $C7 $08 $D6 $0A $CB $08 $CB $0A
.db $CC $08 $CC $0E $CD $08 $C7 $0E $CE $08 $CE $0A $C9 $08 $C9 $0A
.db $C7 $0C $D6 $0E $CA $08 $00 $08 $CA $08 $00 $08 $CA $08 $C9 $08
.db $C9 $0A $C7 $0C $D6 $0E $CB $0C $CF $08 $D0 $08 $D1 $08 $BF $0E
.db $BE $0E $D2 $08 $D2 $0A $D3 $08 $D3 $0A $C2 $0C $C3 $08 $C2 $0C
.db $C3 $08 $C2 $0C $C3 $08 $C4 $0C $D3 $08 $D3 $0A $C2 $0C $C3 $08
.db $00 $08 $D4 $08 $D5 $08 $00 $08

; 2nd entry of Jump Table from 745 (indexed by interruptActionSlot1)
drawBlueBG:
    ; Set PAL1 1st color to blue
    ld a, $34
    ld de, $C010
    rst writeToVdpAddress

    ; Set PAL0 4th color to blue
    ld de, $C003
    rst writeToVdpAddress

    ; Fill BG with blue tile
    ld h, $08
    ld l, $20
    jp fillTilemap

; 6th entry of Jump Table from 745 (indexed by interruptActionSlot1)
clearSprites:
    ld de, $3F00
    ld bc, $0020
    ld hl, $D0D0
    jp fillVram

; 7th entry of Jump Table from 745 (indexed by interruptActionSlot1)
drawInfoBar:
    ; @TODO
    ld de, $382E
    ld b, $1C
--:
    push bc
    ld b, $09
-:
    push bc
    ld a, $00
    rst writeToVdpAddress
    inc de
    ld a, $11
    rst writeToVdpAddress
    inc de
    pop bc
    djnz -
    ld hl, $002E
    add hl, de
    ex de, hl
    pop bc
    djnz --

    ld a, $08
    ld (drawRectAttributes), a

    ; Draw "TOP"
    ld de, $3870
    ld hl, _DATA_9A9_ + 1
    ld b, $03
    call drawTiles

    ; Draw "1UP"
    ld de, $3930
    ld hl, _DATA_9AD_
    ld b, $03
    call drawTiles

    ; Draw life count
    ld de, $3D36
    call _LABEL_9A1_

    ; @TODO: Related to high scores
    call drawHighscore

    ; Draw high score
    ld hl, _DATA_9A9_
    ld de, $38BC
    ld b, $01
    call drawTiles

    ; Draw P1 score
    ld hl, _DATA_9A9_
    ld de, $397C
    ld b, $01
    call drawTiles

    ; Draw P1 life icon
    ld de, $3CF2
    ld hl, _DATA_9B3_ + 2
    ld bc, $0202
    ld a, $08
    ld (drawRectAttributes), a
    call drawTileAreaWithAttributes

    ; Return if single player
    ld a, (flags_RAM_C103_)
    rrca
    ret nc

    ; Draw P2 life icon
    ld de, $3D72
    ld hl, _DATA_9B9_
    ld bc, $0202
    ld a, $08
    ld (drawRectAttributes), a
    call drawTileAreaWithAttributes

    ; @TODO
    ld a, $08
    ld (drawRectAttributes), a

    ; Draw "2UP"
    ld de, $39F0
    ld hl, _DATA_9B0_
    ld b, $03
    call drawTiles

    ; Draw P2 score
    ld hl, _DATA_9A9_
    ld de, $3A3C
    ld b, $01
    call drawTiles

    ; Draw P2 life count
    ld de, $3DB6
_LABEL_9A1_:
    ld hl, _DATA_9B3_
    ld b, $02
    jp drawTiles

; Data from 9A9 to 9AC (4 bytes)
_DATA_9A9_:
.db $30 $54 $4F $50

; Data from 9AD to 9AF (3 bytes)
_DATA_9AD_:
.db $31 $55 $50

; Data from 9B0 to 9B2 (3 bytes)
_DATA_9B0_:
.db $32 $55 $50

; Data from 9B3 to 9B8 (6 bytes)
_DATA_9B3_:
.db $5A ($30 + INITIAL_LIVES) $10 $11 $12 $13

; Data from 9B9 to 9BC (4 bytes)
_DATA_9B9_:
.db $10 $11 $14 $15

; 8th entry of Jump Table from 745 (indexed by interruptActionSlot1)
incrementAndDrawPlayer1Lives:
    ld a, $8B
    ld (_RAM_CD00_), a
    ld hl, p1Lives
    inc (hl)
    jp drawPlayer1Lives

; 9th entry of Jump Table from 745 (indexed by interruptActionSlot1)
incrementAndDrawPlayer2Lives:
    ld a, $8B
    ld (_RAM_CD00_), a
    ld hl, p2Lives
    inc (hl)
    jp drawPlayer2Lives

; 10th entry of Jump Table from 745 (indexed by interruptActionSlot1)
incrementAndDrawStar:
    ; Get star type (calculated from tile index)
    ; From 0 to 4: red, purple, green, yellow and white.
    ld a, (lastStarTileIndex)
    sub $3A

    ld c, a
    call getStarTilemapAddress

    ; Calculate address for current star type count.
    ld a, c
    add a, a
    add a, c
    push de
    ld e, a
    ld d, $00
    ld hl, starsCounts
    add hl, de
    pop de

    ; Return if in power up awarded state.
    bit 7, (hl)
    ret nz

    inc (hl)
    ld a, (hl)

    ; Update UI with collected star
    push hl
    dec a
    add a, a
    ld l, a
    ld h, $00
    add hl, de
    ex de, hl
    ld a, (lastStarTileIndex)
    rst writeToVdpAddress
    ld a, $08
    call writeVDPData
    pop hl

    ; Return if less than 5 stars
    ld a, (hl)
    cp $05
    ret c

    jp powerUpAwarded

getStarTilemapAddress:
    ld hl, starsTilemapAddresses
    add a, a
    ld e, a
    ld d, $00
    add hl, de
    ld e, (hl)
    inc hl
    ld d, (hl)
    ret

; Data from A14 to A1D (10 bytes)
starsTilemapAddresses:
.db $B0 $3A
.db $F0 $3A
.db $30 $3B
.db $70 $3B
.db $B0 $3B

powerUpAwarded:
    set 7, (hl)
    inc hl
    ld (hl), $00
    inc hl
    ld (hl), c
    ld a, $8C
    ld (_RAM_CD00_), a
    ld a, c
    or a
    jp z, powerUpAutofireRate
    dec a
    jp z, powerUpSpeedUp
    dec a
    jp z, powerUpShield
    dec a
    jp z, powerUpBonus
    jp powerUpExtraLife

; 11th entry of Jump Table from 745 (indexed by interruptActionSlot1)
_LABEL_A3E_:
    call _LABEL_A63_
    ld d, (iy+30)
    ld e, (iy+31)
    ld a, $3F
    rst writeToVdpAddress
    ld a, $08
    out (Port_VDPData), a
    ld a, $0F
    ld (_RAM_C942_), a
    ld hl, _RAM_C32F_
    ld a, (hl)
    cp $05
    jp c, putIYEntityOffscreen
    dec (hl)
    call _LABEL_2A9A_
    jp putIYEntityOffscreen

_LABEL_A63_:
    ld iy, _RAM_C6A0_
    ld a, (iy+29)
    cp $02
    jr z, +
    ld iy, _RAM_C720_
    ld a, (iy+29)
    cp $02
    ret nz
+:
    ld a, (_RAM_C943_)
    or a
    jp nz, putIYEntityOffscreen
    ld a, (iy + Entity.xPos.low)
    sub $04
    ld (_RAM_C948_), a
    ld a, (iy + Entity.yPos.low)
    sub $04
    ld (_RAM_C946_), a
    ret

; 12th entry of Jump Table from 745 (indexed by interruptActionSlot1)
loadBossTiles:
    ld hl, (enemyTiles)
    ld de, $0C00
    ld bc, $4B08
    jp _LABEL_313C_

; 13th entry of Jump Table from 745 (indexed by interruptActionSlot1)
_LABEL_A9C_:
    call _LABEL_A63_
    ld a, (iy+5)
    ld (_RAM_C945_), a
    ld a, (_RAM_C334_)
    ld (_RAM_C944_), a
    cp $8D
    jr nz, +
    ld a, $22
    ld (_RAM_C942_), a
    ret

+:
    ld a, $21
    ld (_RAM_C942_), a
    ret

; 14th entry of Jump Table from 745 (indexed by interruptActionSlot1)
_LABEL_ABB_:
    ld a, $8F
    ld (_RAM_CD00_), a
    ret

drawExtraText:
    ld a, $80
    ld (statusTextTimer), a

    ld hl, extraText
    jp drawInfoText

extraText:
; EXTRA
.db $45 $51 $54 $52 $41 $20 $20 $20 $20 $20 $20 $20

drawBonusText:
    ld a, $80
    ld (statusTextTimer), a

    ld hl, bonusBaseText
    call drawInfoText

    ld a, (bonusTier)
    add a, a
    ld e, a
    xor a
    ld d, a
    ld (bonusTier), a
    ld hl, bonusTierTextTable
    add hl, de
    ld de, $3C72
    ld b, $02
    jp drawTiles

bonusBaseText:
; BONUS
.db $42 $4F $4E $55 $53
; 0000
.db $20 $20 $20 $30 $30 $30 $30

bonusTierTextTable:
.db $20 $31 ; 01
.db $20 $33 ; 03
.db $20 $35 ; 05
.db $20 $37 ; 07
.db $31 $30 ; 10

clearInfoText:
    ld hl, clearInfoTextData

drawInfoText:
    ld a, $08
    ld (drawRectAttributes), a
    ld de, $3C32
    ld bc, $0206
    jp drawTileAreaWithAttributes

clearInfoTextData:
.dsb 12, $20

interruptNopAction:
    ret

drawTiles:
    call setVDPWriteAddress
    ld c, Port_VDPData
-:
    outi
    ld a, (drawRectAttributes)
    nop
    out (c), a
    nop
    jp nz, -
    ret

clearTilemap:
    ld hl, $0100
fillTilemap:
    ; Tilemap base address
    ld de, $3800
    ; 38 x 28 tiles = $380
    ld bc, $0380
fillVram:
    call setVDPWriteAddress
    ld a, c
    or a
    jr z, _LABEL_B50_
    inc b
_LABEL_B50_:
    ld a, l
    out (Port_VDPData), a
    push af
    pop af
    ld a, h
    out (Port_VDPData), a
    dec c
    jr nz, _LABEL_B50_
    djnz _LABEL_B50_
    ret

/*
 * Draw tiles in an area of C width and B height, using a common attribute.
 * HL = Source address, tile indexes only.
 * DE = VRAM destination address
 * B = Height
 * C = Width
 * drawRectAttributes = Tile attributes
 */
drawTileAreaWithAttributes:
    ; Save height and width in the stack.
    push bc

    call setVDPWriteAddress

    ld b, c
    ld c, Port_VDPData

    ; Draw line.
    -:
        outi
        ld a, (drawRectAttributes)
        nop
        out (c), a
        nop
    jp nz, -

    ; Advance to next line, if there is one.
    ex de, hl
    ld bc, $0040
    add hl, bc
    ex de, hl
    pop bc
    djnz drawTileAreaWithAttributes
    ret

/*
 * Draw tiles in an area of C width and B height.
 * HL = Source address, tile index and attributes pairs.
 * DE = VRAM destination address
 * B = Height
 * C = Width
 */
drawTileArea:
    ; Save height and width in the stack.
    push bc

    call setVDPWriteAddress

    ld b, c
    ld c, Port_VDPData

    ; Draw line.
    -:
        nop
        nop
        outi
    jp nz, -

    ; Advance to next line, if there is one.
    ex de, hl
    ld bc, $0040
    add hl, bc
    ex de, hl
    pop bc
    djnz drawTileArea
    ret

copySpritesToVram:
    ld hl, spriteBuffer
    ld de, $3F00
    ld bc, $0040
    rst copyToVram

    ld hl, spriteBuffer + $40
    ld de, $3F80
    ld bc, $0080
    jp copyToVram

_LABEL_BA9_:
    ld hl, _DATA_BBE_
    ld bc,  $1600 | Port_VDPAddress
    otir
    ld a, (_DATA_BBE_)
    ld (_RAM_C100_), a
    ld a, (_DATA_BBE_ + 2)
    ld (_RAM_C101_), a
    ret

; Data from BBE to BD3 (22 bytes)
_DATA_BBE_:
.db $A6 $80 $80 $81 $FF $82 $FF $83 $FF $84 $FF $85 $FB $86 $00 $87
.db $00 $88 $00 $89 $FF $8A

setVDPWriteAddress:
    ld a, e
    out (Port_VDPAddress), a
    ld a, d
    or $40
    out (Port_VDPAddress), a
    ret

writeVDPCommandWord:
    ld a, e
    out (Port_VDPAddress), a
    ld a, d
    out (Port_VDPAddress), a
    ret

writeVDPData:
    out (Port_VDPData), a
    ret

_LABEL_BE7_:
    ld a, (_RAM_C101_)
    and $BF
    jr +

_LABEL_BEE_:
    ld a, (_RAM_C101_)
    or $40
+:
    ld (_RAM_C101_), a
    ld e, a
    ld d, $81
    jp writeVDPCommandWord

_LABEL_BFC_:
    ld a, $03 ; setBGColorsToBlack
    ld (interruptActionSlot4), a ; Related to interruptActions jumptable
    ld a, $01 ; jumpToClearTilemap
    ld (interruptActionSlot2), a ; Related to interruptActions jumptable
    ld a, $06 ; clearSprites
    ld (interruptActionSlot7), a ; Related to interruptActions jumptable
    ld a, $07 ; drawInfoBar
    ld (interruptActionSlot8), a ; Related to interruptActions jumptable
    ld a, $0C ; loadBossTiles
    ld (interruptActionSlot13), a ; Related to interruptActions jumptable

    ld a, $03
    ld (unknownFlags_RAM_C151_), a

    ; Initial lives
    ld a, INITIAL_LIVES
    ld (p1Lives), a

    ld (p2Lives), a
    ld a, $1E
    ld (_RAM_C32F_), a
    ld a, (flags_RAM_C103_)
    rrca
    jr nc, +
    ld a, $11
    jr ++

+:
    ld a, $01
++:
    ld (_RAM_C104_), a
    ld a, $FF
    ld (wave_RAM_C322_), a
    ret

updateEntities:
    ld b, ENTITY_ARRAY_SIZE
    ld iy, entities
-:
    push bc
    push iy
    ld a, (iy + Entity.type)
    or a
    call nz, +
    pop iy
    ld de, $0020
    add iy, de
    pop bc
    djnz -
    ret

+:
    add a, a
    ld e, a
    ld d, $00
    ld hl, entityUpdatersPointers - 2
    add hl, de
    ld e, (hl)
    inc hl
    ld d, (hl)
    ex de, hl
    jp (hl)

.INCLUDE "entityUpdaters1.asm"

powerUpShield:
    ld de, $0280
    ld hl, flags_RAM_C103_
    ld a, (playerThatCollectedTheLastStar)
    dec a
    jr nz, @player2
    push hl
    ld hl, player1ArmorAnimationDescriptor
    ld a, l
    ld (player1.animationDescriptorPointer.low), a
    ld a, h
    ld (player1.animationDescriptorPointer.high), a
    pop hl
    set 2, (hl)
    ex de, hl
    ld (player1.timer_data0b), hl
    ret

@player2:
    push hl
    ld hl, player2ArmorAnimationDescriptor
    ld a, l
    ld (player2.animationDescriptorPointer.low), a
    ld a, h
    ld (player2.animationDescriptorPointer.high), a
    pop hl
    set 3, (hl)
    ex de, hl
    ld (player2.timer_data0b), hl
    ret

; Data from 164E to 165D (16 bytes)
player1ArmorAnimationDescriptor:
.dw _DATA_166E_
.dw _DATA_541_
.dw _DATA_541_
.dw _DATA_541_
.dw _DATA_166E_
.dw _DATA_54E_
.dw _DATA_54E_
.dw _DATA_54E_

; Data from 165E to 1687 (42 bytes)
player2ArmorAnimationDescriptor:
.dw _DATA_167B_
.dw _DATA_541_
.dw _DATA_541_
.dw _DATA_541_
.dw _DATA_167B_
.dw _DATA_54E_
.dw _DATA_54E_
.dw _DATA_54E_

_DATA_166E_:
.db $04
.db $00 $00 $1E
.db $00 $08 $1F
.db $08 $00 $12
.db $08 $08 $13

_DATA_167B_:
.db $04
.db $00 $00 $1E
.db $00 $08 $1F
.db $08 $00 $14
.db $08 $08 $15

powerUpAutofireRate:
    ld c, $08
    ld a, (playerThatCollectedTheLastStar)
    dec a
    jr nz, @player2
    ld a, c
    ld (player1.data1c), a
    ret

@player2:
    ld a, c
    ld (player2.data1c), a
    ret

powerUpSpeedUp:
    ld hl, player1.data04
    ld a, (playerThatCollectedTheLastStar)
    dec a
    jr z, @player2
    ld hl, player2.data04
@player2:
    ld (hl), $01
    ret

powerUpBonus:
    ld iy, player1
    ld a, (p1ScoreByte1)
    ld c, a
    ld a, (playerThatCollectedTheLastStar)
    dec a
    jr z, @player1
    ld iy, player2
    ld a, (p2ScoreByte1)
    ld c, a
@player1:
    ld a, c
    rrca
    rrca
    rrca
    rrca
    and $0F
    ld bc, $0002
    cp $08
    jp nc, +
    ld bc, $0103
    cp $06
    jp nc, +
    ld bc, $0204
    cp $04
    jp nc, +
    ld bc, $0305
    cp $02
    jp nc, +
    ld bc, $0406
+:
    push bc
    call addScore
    pop bc

    ld a, $10
    ld (interruptActionSlot17), a

    ld a, b
    ld (bonusTier), a

    ret

powerUpExtraLife:
    ld a, $0F
    ld (interruptActionSlot16), a

    ld a, (playerThatCollectedTheLastStar)
    dec a
    jr nz, +
    ld a, $08 ; incrementAndDrawPlayer1Lives
    ld (interruptActionSlot9), a
    ret

+:
    ld a, $09 ; incrementAndDrawPlayer2Lives
    ld (interruptActionSlot10), a
    ret

_LABEL_170F_:
    ld hl, starsCounts
    ld b, $05
-:
    push hl
    push bc
    ld a, (hl)
    rlca
    call c, +
    pop bc
    pop hl
    inc hl
    inc hl
    inc hl
    djnz -
    ret

+:
    ex de, hl
    ld hl, _RAM_C147_
    inc (hl)
    ld a, (hl)
    cp $04
    ret c
    ld (hl), $00
    ex de, hl
    inc hl
    inc (hl)
    ld a, (hl)
    cp $18
    jr nc, ++
    inc hl
    push hl
    ld a, (hl)
    call getStarTilemapAddress
    pop hl
    dec hl
    bit 0, (hl)
    jr nz, +
    inc hl
    ld a, (hl)
    add a, $3A
    ld l, a
    ld h, $08
    ld bc, $0005
    jp fillVram

+:
    ld hl, $0800
    ld bc, $0005
    jp fillVram

++:
    xor a
    dec hl
    ld (hl), a
    inc hl
    ld (hl), a
    inc hl
    ld (hl), a
    ret

checkStatusTextTimer:
    ; Do nothing if it is zero.
    ld a, (statusTextTimer)
    or a
    ret z

    dec a
    ld (statusTextTimer), a

    ; Do nothing if it isn't zero yet.
    ret nz

    ; Schedule clearStatusText action.
    ld a, $11
    ld (interruptActionSlot18), a ; Related to interruptActions jumptable
    ret

.INCLUDE "entityUpdaters2.asm"

.INCLUDE "input.asm"

_LABEL_2301_:
    ld a, (_RAM_C104_)
    and $0F
    or a
    jr nz, +
    ld ix, player1
    ld a, (ix + Entity.type)
    cp $01
    jr nz, +
    ld iy, _RAM_C640_
    ld hl, input.player1
    ld de, _RAM_C302_
    call _LABEL_2371_
    ld a, (ix+25)
    or a
    jr nz, +
    ld a, (_RAM_C6A3_)
    or a
    jr nz, +
    ld ix, player1
    ld iy, entities.6
    ld a, (input.player1)
    call spawnBomb
+:
    ld a, (_RAM_C104_)
    and $F0
    or a
    ret nz
    ld ix, player2
    ld a, (ix + Entity.type)
    cp $02
    ret nz
    ld iy, _RAM_C6C0_
    ld hl, input.player2
    ld de, autofireTimer
    call _LABEL_2371_
    ld a, (ix+24)
    or a
    ret nz
    ld a, (_RAM_C723_)
    or a
    ret nz
    ld ix, player2
    ld iy, entities.10
    ld a, (input.player2)
    jp spawnBomb

_LABEL_2371_:
    ld b, (hl)
    inc hl
    ld c, (hl)
    ex de, hl
    bit JOY_BTN2_BIT, b
    ret z
    bit JOY_BTN2_BIT, c
    jr nz, +
    dec (hl)
    ret nz
+:
    ld a, (ix + Player.autofireRate)
    ld (hl), a
    call _LABEL_246F_
    ret nc
    push iy
    pop de
    ld hl, _DATA_23D6_
    ld bc, $0005
    ldir

    ld a, (ix + Entity.data05)
    ld (iy + Entity.data05), a

    ld a, (ix + Entity.yPos.low)
    ld (iy + Entity.yPos.low), a

    ld a, (ix + Entity.xPos.low)
    add a, $04
    ld (iy + Entity.xPos.low), a

    call unknown_LABEL_2456_

    ld a, (ix + Entity.frame)
    add a, a
    add a, a
    ld e, a
    ld d, $00
    ld hl, _DATA_23E1_
    add hl, de
    ld a, (hl)
    ld (iy + Entity.yVel.low), a
    inc hl
    ld a, (hl)
    ld (iy + Entity.yVel.high), a

    inc hl
    ld a, (hl)
    ld (iy + Entity.xVel.low), a
    inc hl
    ld a, (hl)
    ld (iy + Entity.xVel.high), a

    ld c, $85
    ld a, (ix + Entity.data05)
    dec a
    jr z, +
    ld c, $8E
+:
    ld a, c
    ld (_RAM_CD00_), a

    ret

; Data from 23D6 to 23E0 (11 bytes)
_DATA_23D6_:
.db $DB $23 $03 $01 $01
.db $DD $23 $01 $00 $00
.db $04

; Data from 23E1 to 2400 (32 bytes)
_DATA_23E1_:
; yVel.low / yVel.high / xVel.low / xVel.high
.db $FB $00 $00 $00
.db $FD $00 $FE $00
.db $FC $00 $FC $00
.db $FD $00 $FE $00
.db $FB $00 $00 $00
.db $FC $00 $02 $00
.db $FD $00 $03 $00
.db $FC $00 $02 $00

; IX = Player address
; IY = Entity slot
spawnBomb:
    bit 4, a
    ret z
    ld hl, bombData
    ld bc, $000E
    push iy
    pop de
    ldir

    ; Copy player data05 and position.
    ld a, (ix + Entity.data05)
    ld (iy + Entity.data05), a

    ld a, (ix + Entity.yPos.low)
    ld (iy + Entity.yPos.low), a

    ld a, (ix + Entity.xPos.low)
    add a, $04
    ld (iy + Entity.xPos.low), a

    ld (iy + Entity.data18), ENTITY_BOMB_DRAG
    call unknown_LABEL_2456_

    ld a, $86
    ld (_RAM_CD00_), a
    ret

; Data from 2430 to 2455 (38 bytes)
bombData:
.dw bombAnimationDescriptor
.db ENTITY_BOMB ; type
.db $01         ; data03
.db $01         ; data04
.db $00         ; data05
.db $00         ; yPos.low
.db $00         ; yPos.high
.db $00         ; xPos.low
.db $00         ; xPos.high
.db $00         ; data0a
.db $01         ; data0b
.db $01         ; data0c
.db $FE         ; yVel.low

bombAnimationDescriptor:
.dw bombSpriteDescriptor0
.dw bombSpriteDescriptor1
.dw bombSpriteDescriptor2
.dw bombSpriteDescriptor3

bombSpriteDescriptor0:
.db $01
.db $00 $00 $01

bombSpriteDescriptor1:
.db $01
.db $00 $00 $02

bombSpriteDescriptor2:
.db $01
.db $00 $00 $03

bombSpriteDescriptor3:
.db $01
.db $00 $00 $06

unknown_LABEL_2456_:
    ld a, (ix + Entity.data1b)
    or a
    ret z

    ld (ix + Entity.data1b), $00

    ld hl, player1AnimationDescriptor
    ld a, (ix + Entity.data05)
    dec a

    jp z, _LABEL_1149_
    ld hl, player2AnimationDescriptor
    jp _LABEL_1149_

_LABEL_246F_:
    ld b, $03
-:
    ld a, (iy + Entity.type)
    or a
    jr z, +
    push de
    ld de, $0020
    add iy, de
    pop de
    djnz -
    xor a
    ret

+:
    scf
    ret

_LABEL_2484_:
    xor a
    ld (_RAM_C304_), a
    call +++
    ld b, $19
    ld hl, _RAM_C305_
    ld a, (hl)
    cpl
    ld (hl), a
    or a
    jr nz, +
    call ++++
    jp ++

+:
    call _LABEL_24DD_
++:
    ld a, (_RAM_C304_)
    ld e, a
    ld d, $00
    ld hl, $C500
    add hl, de
    ld (hl), $D0
    ret

+++:
    ld iy, player1
    ld a, (iy + Entity.type)
    cp $05
    jr z, +
    call ++
    ld iy, player2
    jr ++

+:
    ld iy, player2
    call ++
    ld iy, player1
++:
    ld a, (iy+3)
    or a
    ret z
    jp +++++

++++:
    ld iy, _RAM_C640_
    ld de, $0020
    jp _LABEL_24E4_

_LABEL_24DD_:
    ld iy, _RAM_C940_
    ld de, $FFE0
_LABEL_24E4_:
    push bc
    ld a, (iy+3)
    or a
    push de
    call nz, +++++
    pop de
    add iy, de
    pop bc
    djnz _LABEL_24E4_
    ret

+++++:
    ld a, (iy + Entity.frame)
    add a, a
    ld e, a
    ld d, $00
    ld l, (iy + Entity.animationDescriptorPointer.low)
    ld h, (iy + Entity.animationDescriptorPointer.high)
    add hl, de
    ld e, (hl)
    inc hl
    ld d, (hl)
    push de
    ld hl, $C500
    ld a, (_RAM_C304_)
    ld e, a
    ld d, $00
    add hl, de
    pop de
    push de
    ld a, (de)
    ld b, a
    inc de
-:
    ld a, (de)
    add a, (iy + Entity.yPos.low)
    ld (hl), a
    inc hl
    inc de
    inc de
    inc de
    djnz -
    ld hl, $C540
    ld a, (_RAM_C304_)
    add a, a
    ld e, a
    ld d, $00
    add hl, de
    pop de
    push de
    ld a, (de)
    ld b, a
-:
    inc de
    inc de
    ld a, (de)
    add a, (iy + Entity.xPos.low)
    ld (hl), a
    inc hl
    inc de
    ld a, (de)
    ld (hl), a
    inc hl
    djnz -
    pop de
    ex de, hl
    ld a, (_RAM_C304_)
    add a, (hl)
    ld (_RAM_C304_), a
    ld a, (iy+21)
    or a
    ret z
    ld b, $20
    push iy
-:
    ld (iy + Entity.animationDescriptorPointer.low), $00
    inc iy
    djnz -
    pop iy
    ld (iy + Entity.yPos.low), $D8
    ret

/*
 * Add an score table entry to player score. Handle extra life.
 * IY: Player entity.
 * C: Score table index
 */
addScore:
    /*
     * # Add score
     * BCD sum a value from the score
     * table with the player score.
     */

    ; Return if in demo state
    ld a, (state)
    bit STATE_DEMO_BIT, a
    ret nz

    ; Load DE with player1ScoreChanged or
    ; player2ScoreChanged and set it.
    ld de, player1ScoreChanged
    ld a, (iy + Player.playerNumber)
    cp $01
    jr z, +
        ld de, player2ScoreChanged
    +:
    ld a, $01
    ld (de), a

    inc de

    ; Load value from bonus scores table indexed by C.
    ld hl, scoresTable
    dec c
    ld a, c
    add a, a
    add a, c
    ld c, a
    ld b, $00
    add hl, bc

    ; Add to first score byte (least significant).
    ld a, (de)
    add a, (hl)
    daa
    ld (de), a

    ; Add to second score byte.
    inc hl
    inc de
    ld a, (de)
    adc a, (hl)
    daa
    ld (de), a

    ; Add to third score byte (most significant).
    inc hl
    inc de
    ld a, (de)
    adc a, (hl)
    daa
    ld (de), a


    /*
     * # Extra life
     *
     * Add an extra life if score hundred thousands
     * place has changed and is 1, 2, 4 or 8.
     */

    ; Load hundred thousands nibble into c.
    and $0F
    ld c, a

    ; Check if it changed and return if so.
    ld hl, player1ExtraLifeScore
    ld a, (iy + Player.playerNumber)
    dec a
    jr z, +
        ld hl, player2ExtraLifeScore
    +:
    ld a, c
    cp (hl)
    ret z

    ; Return if it isn't 1, 2, 4 or 8.
    cp $01
    jr z, +

    cp $02
    jr z, +

    cp $04
    jr z, +

    cp $08
    ret nz

+:
    ; Update extra life score
    ld (hl), a

    ; Queue increment lives interrupt action
    ld a, (iy + Player.playerNumber)
    dec a
    jr nz, +
    ld a, $08 ; incrementAndDrawPlayer1Lives
    ld (interruptActionSlot9), a
    ret

+:
    ld a, $09 ; incrementAndDrawPlayer2Lives
    ld (interruptActionSlot10), a
    ret


scoresTable:
.db $01 $00 $00
.db $00 $10 $00
.db $00 $30 $00
.db $00 $50 $00
.db $00 $70 $00
.db $00 $00 $01
.db $20 $00 $00
.db $30 $00 $00
.db $50 $00 $00
.db $10 $00 $00
.db $00 $01 $00
.db $50 $01 $00
.db $00 $03 $00
.db $00 $05 $00
.db $00 $15 $00

/*
 * Draw high score and players scores.
 * Update high score if needed.
 */
drawScores:
    ; Skip player 1 if score hasn't changed.
    ld de, player1ScoreChanged
    ld a, (de)
    or a
    jr z, +

        ; Reset scoreChanged flag.
        xor a
        ld (de), a

        ; Update high score if needed.
        inc de
        call @updateAndDrawHighScore

        ; Draw player 1 score.
        ld hl, p1ScoreByte3
        ld de, $3970
        ld b, $06
        call drawScore

    +:

    ; Skip player 2 if score hasn't changed.
    ld de, player2ScoreChanged
    ld a, (de)
    or a
    ret z

    ; Reset player 2 score flag.
    xor a
    ld (de), a

    ; Update high score if needed.
    inc de
    call @updateAndDrawHighScore

    ; Draw player 2 high score.
    ld hl, p2ScoreByte3
    ld de, $3A30
    ld b, $06
    jp drawScore

@updateAndDrawHighScore:
    ; Check if score is higher
    ; and return if it isn't.
    ld hl, highScoreByte1
    ld b, $03
    and a
    push de

    -:
        ld a, (de)
        sbc a, (hl)
        inc hl
        inc de
    djnz -

    pop de
    ret c

    ; Update high score
    ld hl, highScoreByte1
    ex de, hl
    ld bc, $0003
    ldir

drawHighscore:
    ld hl, highScoreByte3
    ld de, $38B0
    ld b, $06

drawScore:
    xor a
    ex af, af'

    ; Score byte in DE, Vram address in HL.
    ex de, hl
    srl b
    jr nc, @drawByte
    inc b
    jr @drawLowNibble

@drawByte:
    ; Draw high nibble
    ld a, (de)
    rrca
    rrca
    rrca
    rrca
    call @drawDigit

@drawLowNibble:
    ; Draw low nibble
    ld a, (de)
    call @drawDigit
    dec de
    djnz @drawByte
    ex af, af'
    ret

@drawDigit:
    and $0F
    push bc
    ld c, a
    ex af, af'
    or c
    pop bc
    jr z, @drawEmptyTile
    ex af, af'

    ; Draw zero tile.
    add a, $30
    ex de, hl
    rst writeToVdpAddress

    ; Write tile attributes (Palette 1 and priority)
    ld a, $18
    call writeVDPData

    ex de, hl
    inc hl
    inc hl
    ret

@drawEmptyTile:
    ex af, af'
    push af

    ; Draw empty tile.
    ld a, $20
    ex de, hl
    rst writeToVdpAddress

    ; Write tile attributes (Palette 1 and priority)
    ld a, $18
    call writeVDPData

    ex de, hl
    inc hl
    inc hl
    pop af
    ret

_LABEL_2682_:
    call _LABEL_284B_
    jp _LABEL_2760_

_LABEL_2688_:
    ld a, (_RAM_C133_)
    and $20
    jp nz, _LABEL_2717_
    ld l, (iy + Entity.xPos.low)
    call _LABEL_26B6_
    ld c, (ix+8)
    call _LABEL_26E4_
    call _LABEL_26AC_
    ret nc
    ld l, (iy + Entity.yPos.low)
    call _LABEL_26CA_
    ld c, (ix+6)
    call _LABEL_26FC_
_LABEL_26AC_:
    ld a, h
    cp d
    jr nc, +
    ld a, l
    cp d
    ccf
    ret

+:
    cp e
    ret

_LABEL_26B6_:
    ld de, $0007
    ld a, (iy + Entity.type)
    cp $03
    jr z, +
    cp $04
    jr z, +
    ld de, $040B
    jp +

_LABEL_26CA_:
    ld de, $F810
    ld a, (iy + Entity.type)
    cp $03
    jr z, +
    ld de, $0007
    cp $04
    jr z, +
    ld de, $040C
+:
    ld a, l
    add a, d
    ld h, a
    add a, e
    ld l, a
    ret

_LABEL_26E4_:
    ld de, $0206
    ld a, (ix + Entity.type)
    cp $07
    jr z, _LABEL_2711_
    cp $16
    jr z, _LABEL_2711_
    cp $1B
    jr z, _LABEL_2711_
    ld de, $010E
    jp _LABEL_2711_

_LABEL_26FC_:
    ld de, $0206
    ld a, (ix + Entity.type)
    cp $07
    jr z, _LABEL_2711_
    cp $16
    jr z, _LABEL_2711_
    cp $1B
    jr z, _LABEL_2711_
    ld de, $010E
_LABEL_2711_:
    ld a, c
    add a, d
    ld d, a
    add a, e
    ld e, a
    ret

_LABEL_2717_:
    ld l, (iy + Entity.xPos.low)
    call _LABEL_26B6_
    ld c, (ix+8)
    call +
    call _LABEL_26AC_
    ret nc
    ld l, (iy + Entity.yPos.low)
    call _LABEL_26CA_
    ld c, (ix+6)
    call ++
    jp _LABEL_26AC_

+:
    ld de, $F810
    ld a, (ix + Entity.type)
    cp $11
    jp z, _LABEL_2711_
    ld de, $001F
    cp $14
    jp z, _LABEL_2711_
    ld de, $0304
    jp _LABEL_2711_

++:
    ld de, $0018
    ld a, (ix + Entity.type)
    cp $14
    jp z, _LABEL_2711_
    ld de, $000C
    jp _LABEL_2711_

_LABEL_2760_:
    ld a, (two_frame_toggle_RAM_C108_)
    or a
    ret nz
    ld a, (flags_RAM_C103_)
    bit 0, a
    ret z
    ld a, (player1.type)
    cp $01
    ret nz
    ld a, (_RAM_C622_)
    cp $02
    ret nz
    ld a, (_RAM_C61B_)
    or a
    ret nz
    ld a, (_RAM_C63B_)
    or a
    ret nz
    ld c, $00
    ld a, (player1.xPos.low)
    add a, $02
    call _LABEL_282B_
    jr nc, +
    ld a, (player1.yPos.low)
    add a, $02
    call _LABEL_283B_
    jr nc, +
    set 0, c
+:
    ld a, (player1.xPos.low)
    add a, $0A
    call _LABEL_282B_
    jr nc, +
    ld a, (player1.yPos.low)
    add a, $02
    call _LABEL_283B_
    jr nc, +
    set 1, c
+:
    ld a, (player1.xPos.low)
    add a, $02
    call _LABEL_282B_
    jr nc, +
    ld a, (player1.yPos.low)
    add a, $0A
    call _LABEL_283B_
    jr nc, +
    set 2, c
+:
    ld a, (player1.xPos.low)
    add a, $0A
    call _LABEL_282B_
    jr nc, +
    ld a, (player1.yPos.low)
    add a, $0A
    call _LABEL_283B_
    jr nc, +
    set 3, c
+:
    ld a, c
    ld c, $00
    ld bc, $0102
    cp $0C
    jr z, +
    ld bc, $0201
    cp $03
    jr z, +
    ld bc, $0408
    cp $0A
    jr z, +
    ld bc, $0804
    cp $05
    jr z, +
    ld bc, $0A05
    cp $01
    jr z, +
    ld bc, $0609
    cp $02
    jr z, +
    ld bc, $0906
    cp $04
    jr z, +
    ld bc, $050A
    cp $08
    ret nz
+:
    ld a, $01
    ld (_RAM_C619_), a
    ld (_RAM_C639_), a
    ld a, b
    ld (_RAM_C618_), a
    ld a, c
    ld (_RAM_C638_), a
    ld a, $8D
    ld (_RAM_CD00_), a
    ret

_LABEL_282B_:
    ld h, a
    add a, $03
    ld l, a
    ld a, (player2.xPos.low)
    add a, $02
    ld d, a
    add a, $0B
    ld e, a
    jp _LABEL_26AC_

_LABEL_283B_:
    ld h, a
    add a, $03
    ld l, a
    ld a, (player2.yPos.low)
    add a, $02
    ld d, a
    add a, $0B
    ld e, a
    jp _LABEL_26AC_

_LABEL_284B_:
    ld a, (two_frame_toggle_RAM_C108_)
    or a
    jr z, +
    call _LABEL_2894_
    jp _LABEL_28A5_

+:
    ld a, (_RAM_C61B_)
    or a
    jr nz, +
    ld a, (flags_RAM_C103_)
    and $04
    ld (_RAM_C337_), a
    ld iy, player1
    ld a, (iy + Entity.type)
    cp $01
    jr nz, +
    ld bc, $0111
    call _LABEL_28B9_
+:
    ld a, (flags_RAM_C103_)
    and $08
    rrca
    ld (_RAM_C337_), a
    ld a, (_RAM_C63B_)
    or a
    ret nz
    ld bc, $0111
    ld iy, player2
    ld a, (iy + Entity.type)
    cp $02
    ret nz
    jp _LABEL_28B9_

_LABEL_2894_:
    ld a, (_RAM_C104_)
    and $0F
    or a
    ret nz
    ld iy, _RAM_C640_
    ld bc, $0408
    jp _LABEL_28B9_

_LABEL_28A5_:
    ld a, (flags_RAM_C103_)
    bit 0, a
    ret z
    ld a, (_RAM_C104_)
    and $F0
    or a
    ret nz
    ld iy, _RAM_C6C0_
    ld bc, $0408
_LABEL_28B9_:
    push bc
    ld a, (iy+3)
    or a
    call nz, +
    ld de, $0020
    add iy, de
    pop bc
    djnz _LABEL_28B9_
    ret

+:
    ld b, c
    ld ix, _RAM_C740_
-:
    push bc
    ld a, (ix+3)
    or a
    call nz, +
    ld de, $0020
    add ix, de
    pop bc
    djnz -
    ret

+:
    ld a, (ix+21)
    or a
    ret nz
    ld a, (iy + Entity.yPos.low)
    cp $10
    ret c
    call _LABEL_2688_
    ret nc
    ld a, (iy + Entity.type)
    cp $01
    jp z, _LABEL_294A_
    cp $02
    jp z, _LABEL_294A_
    cp $05
    ret z
    ld c, (iy + Entity.type)
    ld a, (ix + Entity.type)
    cp $08
    ret c
    add a, a
    ld e, a
    ld d, $00
    ld hl, $2908
    add hl, de
    ld a, (hl)
    inc hl
    ld h, (hl)
    ld l, a
    ld a, c
    cp $03
    jp (hl)

; Unused code
    exx
    add hl, hl
    exx
    add hl, hl
    call m, $DA29	; Possibly invalid
    add hl, hl
    pop af
    add hl, hl
    ld bc, $ED2A
    add hl, hl
    exx
    add hl, hl
    ld bc, metatileAttrs39 + 1	; metatileAttrs39 + 1 = $7D2A
    ld hl, ($2A01)
    inc d
    ld hl, ($2A86)
    ld bc, $D92A
    add hl, hl
    call m, $7D29	; Possibly invalid
    ld hl, ($2A7D)
    call m, $FC29	; Possibly invalid
    add hl, hl
    ld d, l
    ld hl, ($2A5B)
    ld (hl), h
    ld hl, ($2A74)
    exx
    add hl, hl

_LABEL_294A_:
    ld a, (flags_RAM_C103_)
    rlca
    ret c
    ld a, (ix + Entity.type)
    cp $08
    ret z
    cp $22
    jr z, _LABEL_29C3_
    cp $21
    ret z
    cp $09
    ret z
    cp $0F
    jr z, _LABEL_29A5_
    cp $1C
    ret z
    cp $1D
    ret z
    cp $16
    jr z, _LABEL_29A5_
    cp $11
    jr z, _LABEL_29B9_
    cp $14
    jr z, _LABEL_29B9_
    cp $18
    jr z, _LABEL_29B9_
    cp $19
    jr z, _LABEL_29B9_
    cp $1E
    jr z, _LABEL_29B9_
    cp $1F
    jr z, _LABEL_29B9_
    cp $0E
    jr z, ++
    ld a, (_RAM_C337_)
    bit 2, a
    jr nz, +
    ld (iy + Entity.type), $05
    jp putIXEntityOffscreen

+:
    ld (ix + Entity.type), $08
    ld c, $0A
    jp addScore

++:
    ld (iy + Entity.type), $05
    ret

_LABEL_29A5_:
    ld (ix+24), $01
    ld a, (iy+5)
    ld (ix+5), a
    ld a, $89
    ld (_RAM_CD00_), a
    ld c, $09
    jp addScore

_LABEL_29B9_:
    ld a, (ix+28)
    or a
    ret nz
    ld (iy + Entity.type), $05
    ret

_LABEL_29C3_:
    call putIXEntityOffscreen
    ld a, (iy+5)
    cp $01
    jr nz, +
    ld a, $08
    ld (interruptActionSlot9), a
    ret

+:
    ld a, $09
    ld (interruptActionSlot10), a
    ret

; Unused code
    ret

    ret nz
    ld a, (iy+5)
    ld (ix+5), a
    inc (iy+24)
    ld (ix+31), $FF
    ld c, $08
    jp addScore

; Unused code
_LABEL_29ED_:
    ret nz
    jp putIYEntityOffscreen

; Unused code
_LABEL_29F1_:
    ret nz
    ld a, (ix+25)
    or a
    ret z
    ld c, $0A
    jp ++
    ld c, $07
    jp +

; Unused code
_LABEL_2A01_:	
    	ld c, $08
+:	
    	ret nz
++:	
    	ld a, (iy+5)
    	ld (ix+5), a
    	inc (iy+24)
    	ld (ix+2), $08
    	jp addScore

; Unused code
_LABEL_2A14_:	
    	ret nz
    	ld c, $0A
    	call addScore
    	ld hl, _DATA_143F_
    	ld (ix+0), l
    	ld (ix+1), h
    	ld (ix+28), $01
    	ld a, $82
    	ld (_RAM_CD00_), a
    	ld (ix+24), $01
    	ld a, (iy+8)
    	add a, $04
    	ld c, a
    	call putIYEntityOffscreen
    	ld (ix+13), $FD
    	ld (ix+14), $00
    	ld (ix+15), $00
    	ld (ix+16), $80
    	ld a, (ix+8)
    	add a, $08
    	cp c
    	ret nc
    	ld (ix+15), $FF
    	ret
    	ret z
    	ld c, $0E
    	jp +

; Unused code
_LABEL_2A5B_:	
    ret z
    ld c, $0B

+:
    	ld a, (iy+17)
    	cp $03
    	ret nz
    	call addScore
    	ld a, (iy+5)
    	ld (ix+5), a
    	ld (ix+2), $09
    	jp putIYEntityOffscreen
    	ret nz
    	ld a, (entities.12.data1e)
    	or a
    	ret nz
    	jp _LABEL_2A7E_

        ret nz

; Unused code
_LABEL_2A7E_:
    	ld a, $82
    	ld (_RAM_CD00_), a
    	jp putIYEntityOffscreen

; Unused code
_LABEL_2A86_:	
    	ret nz
    	ld a, (entities.11.data1e)
    	or a
    	jr z, _LABEL_2A7E_
    	ld hl, _RAM_C32F_
    	ld a, (hl)
    	or a
    	jr z, +
    	dec (hl)
    	jr z, +
    	call putIYEntityOffscreen

_LABEL_2A9A_:
    ld a, (_RAM_C32F_)
    ld l, a
    ld h, $00
    ld e, $0A
    call _LABEL_2D4F_
    ld (_RAM_C330_), a
    ld a, l
    ld (_RAM_C331_), a
    ret

+:
    ld hl, _RAM_C133_
    res 5, (hl)
    ld hl, unknownFlags_RAM_C151_
    set 0, (hl)
    ld a, $0E
    ld (interruptActionSlot14 + 1), a
    ld a, $01
    ld (entities.12.frame), a
    ld (entities.12.data1c), a
    ld (entities.13.data1c), a
    ld (entities.14.data1c), a
    ld (entities.15.data1c), a
    ld (entities.16.data1c), a
    ld a, (iy+5)
    ld (entities.11.data05), a
    ld a, $08
    ld (entities.11.type), a
    call _LABEL_2A9A_
    call putIYEntityOffscreen
    ld c, $0E
    jp addScore

entities_slot_6_and_10_LABEL_2AE6_:
    ld a, (entities.6.data1d)
    or a
    jr nz, +
    ld a, (entities.6.frame)
    cp $03
    jr nz, +
    ld de, entities.6.yPos.low
    ld hl, entities.6.data1d
    call ++
+:
    ld a, (entities.10.data1d)
    or a
    ret nz
    ld a, (entities.10.frame)
    cp $03
    ret nz
    ld de, entities.10.yPos.low
    ld hl, entities.10.data1d

++:
    ld a, (de)
    ld (_RAM_C332_), a
    inc de
    inc de
    ld a, (de)
    ld (_RAM_C333_), a
    ld de, _DATA_2B63_
    ld b, $04
-:
    push bc
    push hl
    ld a, (_RAM_C332_)
    ld c, a
    ld a, (de)
    add a, c
    ld l, a
    inc de
    ld a, (_RAM_C333_)
    ld c, a
    ld a, (de)
    add a, c
    ld h, a
    inc de
    push de
    call +++
    pop de
    pop hl
    cp $82
    jr z, ++
    cp $8A
    jr c, +
    cp $8E
    jr c, ++
+:
    pop bc
    djnz -
    xor a
    ld (hl), $01
    ret

++:
    ld d, b
    ld e, c
    pop bc
    ld (hl), $02
    inc hl
    ld (hl), d
    inc hl
    ld (hl), e
    cp $82
    jr nz, +
    ld a, $0B
    ld (interruptActionSlot12), a
    ret

+:
    ld (_RAM_C334_), a
    ld a, $0D
    ld (interruptActionSlot14), a
    ret

; Data from 2B63 to 2B6A (8 bytes)
_DATA_2B63_:
.db $01 $01 $01 $06 $06 $01 $06 $06

+++:
    ld a, h
    rrca
    rrca
    rrca
    and $1F
    add a, a
    ld e, a
    ld h, $00
    ld d, h
    ld b, d
    ld a, (verticalScroll)
    ld c, a
    add hl, bc
    ld a, l
    and $F8
    ld l, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, de
    ld de, $3800
    add hl, de
    ex de, hl
    ld a, d
    cp $3F
    jr c, +
    sub $3F
    add a, $38
    ld d, a
+:
    rst _LABEL_8_
    ld a, b
    ld b, d
    ld c, e
    ret

handleMapScrolling:
    ld a, (unknownFlags_RAM_C151_)
    rrca
    ret nc

    rrca
    jp c, ++

    ld a, (scrollTimer)
    inc a
    ld (scrollTimer), a

    cp $01
    jr z, +
        cp $03
        ret c

        xor a
        ld (scrollTimer), a
        jp scrollMap
    +:

    ld a, (metatileOffset)
    or a
    ret nz

    ; Loop if the end of the map was reached
    ld de, $048C
    ld a, (mapIndex.low)
    cp e
    ret nz
    ld a, (mapIndex.high)
    cp d
    ret nz

    ld hl, $0000
    ld (mapIndex), hl

    xor a
    ld (wave), a
    ld (waveTimer), a

    ld hl, flags_RAM_C103_
    res 7, (hl)
    ret

++:
    ; Reset vars
    xor a
    ld (metatileOffset), a
    ld (scrollTimer), a
    ld (verticalScroll), a
    ld (waveTimer), a

    ld a, (unknownFlags_RAM_C151_)
    bit 3, a
    jr nz, _LABEL_2C40_

    or $08
    ld (unknownFlags_RAM_C151_), a
    ld de, spriteBuffer + 1
    ld hl, spriteBuffer
    ld (hl), $00
    ld bc, $0040
    ldir

    ld de, wave_RAM_C322_ + 1
    ld hl, wave_RAM_C322_
    ld (hl), $00
    ld bc, $0007
    ldir

    call destroyEntities

    ; Reset map and wave index
    ld hl, $0000
    ld (mapIndex), hl

    xor a
    ld (wave), a

    ld hl, $3D82
    ld (nextMetatileVramPointer), hl

    ld b, $1C
    ld de, $3802
-:
    push bc
    ld hl, $0100
    ld bc, $0016
    push bc
    call fillVram
    pop bc
    ld hl, $0040
    add hl, de
    ex de, hl
    pop bc
    djnz -
    ld de, $8900
    jp writeVDPCommandWord

_LABEL_2C40_:
    call updateNextMetatileVramPointer
    ld a, l
    cp $82
    ret nz
    ld a, h
    cp $3E
    ret nz
    ld hl, $3E02
    ld (nextMetatileVramPointer), hl
    ld hl, unknownFlags_RAM_C151_
    res 1, (hl)
    set 0, (hl)
    ld de, $3E82
    call drawMetatile
    ld a, $01
    ld (wave), a
    xor a
    jr ++

scrollMap:
    ; Increment metatile offset.
    ld a, (metatileOffset)
    inc a

    ; Reset offset and draw next metatile
    ; if metatile height was reached.
    cp $10
    jr c, +
        call updateWaveTimerAndNextMetatileVramPointer
        xor a
    +:
    ld (metatileOffset), a

    ; Increment or reset vertical scroll.
    ld a, (verticalScroll)
    dec a
    cp $FF
    jr nz, ++
        ld a, $DF
    ++:
    ld (verticalScroll), a

    ; Write VDP vertical scroll register.
    ld e, a
    ld d, $89
    jp writeVDPCommandWord

drawMetatile:
    push de
    ld de, (mapIndex)
    ld hl, v_map
    add hl, de
    inc de
    ld (mapIndex), de
    ld a, (hl)
    add a, a
    ld e, a
    jr c, +
    ld d, $00
    jr ++

+:
    ld d, $01
++:
    push de

    ; Extract tile indexes
    ld hl, metatilesPointers
    call @loadPointer
    ld de, _RAM_D000_
    call extractMetatile

    ; Extract tile attributes
    pop de
    ld hl, metatilesAttributesPointers
    call @loadPointer
    ld de, _RAM_D001_
    call extractMetatile

    ; Draw tiles
    ld hl, _RAM_D000_
    pop de
    ld bc, $022C
    jp drawTileArea

@loadPointer:
    add hl, de
    ld e, (hl)
    inc hl
    ld d, (hl)
    ex de, hl
    ret

extractMetatile:
    ld a, e
    cp $58
    ret nc
    ld a, (hl)
    bit 7, a
    jr nz, +

    ld b, a
    inc hl
    ld a, (hl)
-:
    ld (de), a
    inc e
    inc e
    djnz -
    inc hl
    jp extractMetatile

+:
    and $7F
    ld b, a
-:
    inc hl
    ld a, (hl)
    ld (de), a
    inc e
    inc e
    djnz -
    inc hl
    jp extractMetatile

; Data from 2CEE to 2D00 (19 bytes)
; Unused
_LABEL_2CEE_:
    	ld de, $3D82
-:	
    	ld a, d
    	cp $37
    	ret z
    	push de
    	call drawMetatile
    	pop hl
    	ld de, -$0080
    	add hl, de
    	ex de, hl
    	jr -

updateWaveTimerAndNextMetatileVramPointer:
    ld a, (waveTimer)
    inc a
    cp $0C
    jr c, +
        ld hl, wave
        inc (hl)
        xor a
    +:

    ld (waveTimer), a

updateNextMetatileVramPointer:
    ld de, (nextMetatileVramPointer)
    push de
    call drawMetatile

    ; Incrment or reset nextMetatileVramPointer.
    pop hl
    ld de, -$0080
    add hl, de

    ld a, h
    cp $37
    jr nz, +
        ld hl, $3E82
    +:

    ld (nextMetatileVramPointer), hl

    ret

rng_LABEL_2D2A_:
    ld a, (frameCounter)
    ld b, a
    ld a, r
    add a, b
    and $07
    or $01
    ld b, a
    ld a, r
-:
    rrca
    djnz -
    ld b, a
    ld a, r
    add a, b
    ret

; Data from 2D40 to 2D4E (15 bytes)
; Unused
_LABEL_2D40_:
    ld hl, $0000
    ld b, $08
-:
    add hl, hl
    adc a, a
    jr nc, +
    add hl, de
    adc a, $00
+:
    djnz -
    ret

_LABEL_2D4F_:
    ld b, $11
    xor a
    jp +++

-:
    adc a, a
    jr c, +
    cp e
    jr c, ++
+:
    sub e
    or a
++:
    ccf
+++:
    adc hl, hl
    djnz -
    ret

_LABEL_2D63_:
    ld a, (state)

    ; Return if not demo or gameplay
    bit 2, a
    jr nz, +

    bit 3, a
    ret z
+:

    ld a, (wave)
    ld hl, wave_RAM_C322_
    cp (hl)
    jr z, +

    ; Update C322
    ld (hl), a

    ld l, a    
    ld h, $00
    add hl, hl
    ld e, a
    ld d, $00
    add hl, de
    ld de, waves
    add hl, de
    ex de, hl
    ld hl, enemySpawnTimer
    ld a, (de)
    ld (hl), a
    inc hl
    ld (hl), a ; enemySpawnTimerReset

    ld b, $02
-:
    inc de
    inc hl
    ld a, (de)
    and $E0
    rlca
    rlca
    rlca
    ld (hl), a ; Enemy flags?
    inc hl
    ld a, (de)
    and $1F
    ld (hl), a ; Enemy Type
    djnz -
    ret

+:
    inc hl
    ld a, (hl)
    or a
    jr z, +
    dec (hl)
    ret

+:
    ld a, (enemySpawnTimerReset)
    ld (hl), a
    inc hl
    inc hl
    ld a, (hl)
    or a
    jr nz, +
    inc hl
    inc hl
    ld a, (hl)
    or a
    ret z
+:
    push hl
    pop de
    inc hl
    ld a, (hl)
    cp $0D
    jp z, _LABEL_2E04_
    cp $0C
    jp z, _LABEL_2E2B_
    cp $13
    jp z, _LABEL_2E2B_
    cp $11
    jp z, _LABEL_2E36_

_LABEL_2DCC_:
    ld c, a
    push de
    call findFreeEntitySlot
    pop de
    ret nc

    ; Enemy type loaded here
    ld (hl), c
    ex de, hl
    ld a, c
    cp $0A
    ret z
    cp $1A
    ret z
    dec (hl)
    ret

findFreeEntitySlot:
    ld hl, entities.11.type
    ld b, $08
-:
    ld a, (hl)
    or a
    jr z, setCarryFlag
    ld de, $0020
    add hl, de
    djnz -
    xor a
    ret

setCarryFlag:
    scf
    ret

; Duplicated
findFreeEntitySlot_dup:
    ld hl, entities.11.type
    ld b, $08
-:
    ld a, (hl)
    or a
    jr nz, setCarryFlag
    ld de, $0020
    add hl, de
    djnz -
    xor a
    ret

; Data from 2E02 to 2E03 (2 bytes)
; Unused
_LABEL_2E02_:
    scf
    ret

_LABEL_2E04_:
    ld hl, _RAM_C307_
    ld a, (hl)
    or a
    jr z, +
    inc (hl)
    ld a, (hl)
    cp $07
    jr c, ++
    ld (hl), $00
    jp ++

+:
    push hl
    call findFreeEntitySlot_dup
    pop hl
    ret c
    inc (hl)
    ld a, (_RAM_C308_)
    cpl
    ld (_RAM_C308_), a
++:
    call findFreeEntitySlot
    ret nc
    ld (hl), $0D
    ret

_LABEL_2E2B_:
    ld c, a
    push de
    call findFreeEntitySlot_dup
    pop de
    ret c
    ld a, c
    jp _LABEL_2DCC_

_LABEL_2E36_:
    push de
    call findFreeEntitySlot_dup
    pop de
    ret c

    ld a, $14
    ld (entities.11.type), a
    ld a, $11
    ld (entities.12.type), a
    ld a, $18
    ld (entities.13.type), a
    ld a, $19
    ld (entities.14.type), a
    ld a, $1E
    ld (entities.15.type), a
    ld a, $1F
    ld (entities.16.type), a

    ex de, hl
    dec (hl)
    ld hl, _RAM_C133_
    set 5, (hl)
    ld hl, unknownFlags_RAM_C151_
    res 0, (hl)
    ret


.INCLUDE "data/waves.asm"

.db $B7 $C0

_LABEL_2F92_:
    ld b, $08
    ld hl, _RAM_C842_
-:
    ld a, (hl)
    or a
    jr z, +
    ld de, $0020
    add hl, de
    djnz -
    xor a
    ret

+:
    ld (hl), $07
    inc hl
    inc hl
    inc hl
    ld (hl), c
    inc hl
    ld a, (iy+6)
    ld (hl), a
    inc hl
    inc hl
    ld a, (iy+8)
    ld (hl), a
    scf
    ld a, $14
    ld (_RAM_C30D_), a
    ret

; Data from 2FBB to 2FD1 (23 bytes)
; Unused
_LABEL_2FBB_:
    ld ix, entities.19
    ld b, $08
    ld de, $0020
-:
    ld a, (ix+2)
    or a
    jr z, +
    add ix, de
    djnz -
    xor a
    ret
    
+:
    scf
    ret

_LABEL_2FD2_:
    ld a, (jellyFishCount)
    cp $07
    jr c, ++
    call rng_LABEL_2D2A_
    and $03
    cp $03
    jr nz, +
    dec a
+:
    ld (_RAM_C30C_), a
    xor a
    ld (jellyFishCount), a
++:
    ld hl, _RAM_C30D_
    ld a, (hl)
    or a
    jr z, +
    dec (hl)
+:
    ld hl, _RAM_C318_
    ld a, (hl)
    or a
    jr z, +
    dec (hl)
+:
    ld de, flags_RAM_C103_
    ld hl, (player1.timer_data0b)
    ld a, h
    or l
    jr z, +
    dec hl
    ld (player1.timer_data0b), hl
    call +++
    jp ++

+:
    ld a, (_RAM_C104_)
    and $0F
    or a
    jr nz, +
    ld a, (player1.data1b)
    or a
    jr nz, +
    push hl
    ld hl, player1AnimationDescriptor
    ld a, l
    ld (player1.animationDescriptorPointer.low), a
    ld a, h
    ld (player1.animationDescriptorPointer.high), a
    pop hl
+:
    ex de, hl
    res 2, (hl)
    ex de, hl
++:
    ld hl, (player2.timer_data0b)
    ld a, h
    or l
    jr z, ++++
    dec hl
    ld (player2.timer_data0b), hl
+++:
    ld a, h
    or a
    ret nz
    ld a, l
    cp $40
    ret c
    cp $80
    ret nc
    ld a, $82
    ld (_RAM_CD00_), a
    ret

++++:
    ex de, hl
    res 3, (hl)
    ld a, (_RAM_C104_)
    and $F0
    or a
    ret nz
    ld a, (player2.data1b)
    or a
    ret nz
    ld hl, player2AnimationDescriptor
    ld a, l
    ld (player2.animationDescriptorPointer.low), a
    ld a, h
    ld (player2.animationDescriptorPointer.high), a
    ret

; Related to enemy1 shoot
fire_LABEL_3063_:
    ld a, (wave)
    cp $28
    jr nc, ++

    call rng_LABEL_2D2A_
    and $0F
    ld c, a
    ld a, (wave)
    cp $04
    jr nc, +
    ld a, c
    cp $02
    jr c, ++
    ret

+:
    cp $0F
    jr nc, +
    ld a, c
    cp $04
    jr c, ++
    ret

+:
    ld a, c
    rrca
    ret c
++:
    ld a, (flags_RAM_C103_)
    rrca
    jr nc, +
    call rng_LABEL_2D2A_
    rrca
    jr nc, ++
+:
    ld c, $01
    ld a, (player1.type)
    cp c
    jp z, _LABEL_2F92_
    ld c, $02
    ld a, (_RAM_C622_)
    cp c
    ret nz
    jp _LABEL_2F92_

++:
    ld c, $02
    ld a, (_RAM_C622_)
    cp c
    jp z, _LABEL_2F92_
    ld c, $01
    ld a, (player1.type)
    cp c
    ret nz
    jp _LABEL_2F92_

_LABEL_30BC_:
    ld a, $04
    add a, d
    ld d, a

    ld a, $04
    add a, e
    ld e, a

    ld a, $04
    add a, (iy + Entity.yPos.low)
    ld l, a

    ld a, $04
    add a, (iy + Entity.xPos.low)
    ld h, a

    ld c, $00
    ld a, d
    sub l
    jr nz, +
    inc a
+:
    jr nc, +
    ld c, $01
    neg
+:
    ld l, a
    ld a, e
    sub h
    jr nz, +
    inc a
+:
    jr nc, +
    set 1, c
    neg
+:
    ld h, a
    ld a, l
    cp h
    jr nc, +
    set 2, c
    ld l, h
    ld h, a
+:
    ld e, l
    ld l, $00
    call ++
    ld h, $00
    ld a, l
    rrca
    and $7F
    ld e, a
    ld d, $00
    add hl, de
    ld de, $0180
    bit 2, c
    jr z, +
    ex de, hl
+:
    bit 0, c
    jr z, +
    ld a, e
    cpl
    ld e, a
    ld a, d
    cpl
    ld d, a
    inc de
+:
    bit 1, c
    ret z
    ld a, l
    cpl
    ld l, a
    ld a, h
    cpl
    ld h, a
    inc hl
    ret

++:
    ld b, $08
    xor a
-:
    adc hl, hl
    ld a, h
    jp c, +
    cp e
    jp c, ++
+:
    sub e
    ld h, a
    xor a
++:
    ccf
    djnz -
    rl l
    sla h
    ld a, h
    sub e
    ret c
    inc l
    ret

_LABEL_313C_:
    call +
    xor a
    ld (_RAM_C329_), a
    ld (_RAM_C32A_), a
    ld (_RAM_C32B_), a
    ld (_RAM_C32C_), a
    ret

+:
    ld (_RAM_C329_), hl
    ld (_RAM_C32B_), hl
    ld h, b
    ld l, c
    inc hl
    inc hl
--:
    ld a, (hl)
    or a
    jp z, _LABEL_31B1_
    bit 7, a
    jr nz, +
    ld b, a
    inc hl
-:
    call ++
    djnz -
    inc hl
    jp --

+:
    and $7F
    ld b, a
    inc hl
-:
    call ++
    inc hl
    djnz -
    jp --

++:
    ld a, e
    out (Port_VDPAddress), a
    ld a, d
    or $40
    out (Port_VDPAddress), a
    ld a, (hl)
    out (Port_VDPData), a
    push hl
    ld hl, (_RAM_C329_)
    dec hl
    ld a, h
    or l
    jr z, +
    ld (_RAM_C329_), hl
    inc de
    inc de
    inc de
    inc de
    pop hl
    ret

+:
    ld hl, (_RAM_C32B_)
    ld (_RAM_C329_), hl
    xor a
    rl l
    rl h
    xor a
    rl l
    rl h
    inc de
    inc de
    inc de
    inc de
    ex de, hl
    xor a
    sbc hl, de
    inc hl
    ex de, hl
    pop hl
    ret

_LABEL_31B1_:
    ret

_LABEL_31B2_:
    ld de, $3200
    ld bc, $31BE
    ld hl, (tiles_DATA_31BE_)
    jp _LABEL_313C_

; Data from 31BE to 36A0 (1251 bytes)
tiles_DATA_31BE_:
.INCBIN "graphics/baserom_DATA_31BE_.inc"

_LABEL_36A1_:
    ld de, $17A0
    ld bc, $36AD
    ld hl, (_DATA_36AD_)
    jp _LABEL_313C_

; Data from 36AD to 3893 (487 bytes)
_DATA_36AD_:
.db $D0 $00 $04 $00 $B2 $FF $FF $00 $FF $7F $FF $E0 $CF $DF $D8 $DB
.db $DB $FE $FF $07 $F3 $FB $1B $DB $C3 $FF $FF $C0 $DF $DF $D0 $D7
.db $D7 $FF $FF $80 $BF $BF $81 $FD $FD $FF $FF $C0 $DF $DF $D8 $DB
.db $DB $FF $FF $03 $FB $FB $03 $04 $FF $81 $C3 $05 $DB $90 $FF $00
.db $FF $FF $01 $01 $03 $03 $FB $3B $BB $BB $B3 $B6 $76 $66 $06 $DB
.db $82 $D8 $DF $08 $D6 $08 $0D $08 $DB $05 $00 $03 $07 $98 $06 $06
.db $0D $0D $1B $1B $37 $37 $CF $E0 $FF $7F $00 $00 $FF $FF $D7 $D7
.db $D0 $DF $DF $D0 $D7 $D7 $03 $E0 $91 $00 $01 $01 $03 $03 $6E $6E
.db $DD $DD $BB $BB $76 $76 $C0 $C0 $80 $80 $04 $00 $05 $D6 $83 $C6
.db $FE $FE $05 $0D $93 $0C $0F $0F $06 $06 $0D $0D $1B $18 $3F $3F
.db $EC $EC $D8 $D8 $B0 $30 $E0 $E0 $04 $00 $84 $FF $FF $C0 $DF $05
.db $00 $B6 $FF $00 $FF $00 $7F $60 $4F $5F $58 $5B $5A $00 $FE $06
.db $F2 $FA $1A $DA $42 $00 $7F $40 $5F $5F $50 $57 $54 $00 $FF $80
.db $BF $BF $81 $FD $05 $00 $7F $40 $5F $5F $58 $5B $5A $00 $FE $02
.db $FA $FA $02 $FE $00 $00 $7E $42 $05 $5A $83 $FF $00 $FF $03 $00
.db $8A $01 $01 $FA $3A $BA $BA $B2 $B4 $74 $64 $05 $5A $83 $5B $58
.db $5F $08 $54 $08 $05 $08 $5A $06 $00 $8D $03 $03 $02 $02 $05 $05
.db $0B $0B $17 $17 $4F $60 $7F $04 $00 $8B $7E $54 $57 $50 $5F $5F
.db $50 $57 $54 $C0 $C0 $04 $00 $8C $01 $01 $2E $2E $5D $5D $BA $BA
.db $74 $74 $80 $80 $06 $00 $05 $54 $83 $44 $7C $00 $05 $05 $92 $04
.db $07 $00 $02 $02 $05 $05 $0B $08 $1F $00 $E8 $E8 $D0 $D0 $A0 $20
.db $C0 $06 $00 $83 $7F $40 $5F $77 $00 $5F $00 $85 $FF $FF $00 $00
.db $1F $03 $3F $85 $3C $3C $00 $00 $F8 $03 $FC $84 $3C $3C $00 $00
.db $04 $3F $84 $38 $38 $00 $00 $04 $7F $84 $03 $03 $00 $00 $04 $3F
.db $84 $3C $3C $00 $00 $04 $FC $04 $00 $06 $3C $82 $FF $FF $06 $00
.db $82 $FC $FC $03 $7C $83 $78 $F8 $F8 $06 $3C $82 $3F $3F $08 $38
.db $08 $03 $08 $3C $07 $00 $03 $01 $88 $03 $03 $07 $07 $0F $0F $3F
.db $1F $06 $00 $82 $38 $38 $04 $3F $83 $38 $38 $80 $07 $00 $88 $1F
.db $1F $3E $3E $7C $7C $F8 $F8 $08 $00 $06 $38 $82 $00 $00 $06 $03
.db $90 $00 $00 $01 $01 $03 $03 $07 $07 $00 $00 $F0 $F0 $E0 $E0 $C0
.db $C0 $08 $00 $82 $3F $3F $00

.INCLUDE "audio.asm"

.INCLUDE "data.asm"
