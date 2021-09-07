readInput:
    ld a, (flags_RAM_C103_)
    bit 6, a
    jp nz, +

    ; Read input from controller 1
    ld hl, input.player1
    in a, (Port_IOPort1)
    call saveInput

    ; Read input from controller 2
    ; Up and down buttons are stored on port1 byte
    ld hl, input.player2
    in a, (Port_IOPort1)
    and %11000000
    ld b, a
    in a, (Port_IOPort2)
    and %00111111
    add a, b
    rlca
    rlca
    jp saveInput

+:
    call _LABEL_22A2_
    ld hl, input.player1
    ld a, $07
    out (_PORT_DE_), a
    in a, (Port_IOPort1)
    ld c, a
    ld a, $04
    out (_PORT_DE_), a
    in a, (Port_IOPort1)
    bit 5, a
    jp nz, +
    res 1, c
+:
    ld a, $05
    out (_PORT_DE_), a
    in a, (Port_IOPort1)
    bit 5, a
    jp nz, +
    res 2, c
+:
    ld a, $06
    out (_PORT_DE_), a
    in a, (Port_IOPort1)
    bit 5, a
    jp nz, +
    res 3, c
+:
    bit 6, a
    jp nz, +
    res 0, c
+:
    ld a, $02
    out (_PORT_DE_), a
    in a, (Port_IOPort1)
    bit 4, a
    jp nz, +
    res 4, c
+:
    ld a, $03
    out (_PORT_DE_), a
    in a, (Port_IOPort1)
    bit 4, a
    jp nz, _LABEL_2299_
    res 5, c
_LABEL_2299_:
    ld a, c

saveInput:
    cpl
    ld c, a
    xor (hl)
    ld (hl), c
    inc hl
    and c
    ld (hl), a
    ret

_LABEL_22A2_:
    ld hl, input.player2
    ld a, $07
    out (_PORT_DE_), a
    in a, (Port_IOPort1)
    and $C0
    ld b, a
    in a, (Port_IOPort2)
    and $3F
    add a, b
    rlca
    rlca
    ld c, a
    ld a, $01
    out (_PORT_DE_), a
    in a, (Port_IOPort1)
    bit 2, a
    jp nz, +
    res 2, c
+:
    bit 3, a
    jp nz, +
    res 1, c
+:
    ld a, $02
    out (_PORT_DE_), a
    in a, (Port_IOPort1)
    bit 1, a
    jp nz, +
    res 0, c
+:
    ld a, $03
    out (_PORT_DE_), a
    in a, (Port_IOPort1)
    bit 2, a
    jp nz, +
    res 3, c
+:
    ld a, $05
    out (_PORT_DE_), a
    in a, (Port_IOPort2)
    bit 3, a
    jp nz, +
    res 5, c
+:
    ld a, $06
    out (_PORT_DE_), a
    in a, (Port_IOPort2)
    bit 2, a
    jp nz, _LABEL_2299_
    res 4, c
    jp _LABEL_2299_
