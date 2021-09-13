
updateEntity10:
    ld a, (iy + Entity.data03)
    or a
    jp nz, _LABEL_1805_
    ld hl, _DATA_17B7_
    ld bc, $0009
    call memcpyIYToHL
    ld a, r
    and $03
    inc a
    ld (iy + Entity.data18), a
    dec a
    add a, a
    ld c, a
    add a, a
    add a, c
    ld e, a
    ld d, $00
    ld hl, _DATA_17ED_
    add hl, de
    ld a, (hl)
    ld (iy + Entity.yPos.low), a
    inc hl
    ld a, (hl)
    ld (iy + Entity.xPos.low), a
    inc hl
    ld a, (hl)
    ld (iy + Entity.yVel.low), a
    inc hl
    ld a, (hl)
    ld (iy + Entity.xVel.low), a
    inc hl
    ld a, (hl)
    ld (iy + Entity.data19), a
    inc hl
    ld a, (hl)
    ld (iy + Entity.data1a), a
    ld hl, $0308
    jp _LABEL_1049_

; Data from 17B7 to 17EC (54 bytes)
_DATA_17B7_:
.dW _DATA_17C0_
.db $10
.db $01
.db $04
.db $00
.db $90
.db $00
.db $B4

_DATA_17C0_:
.dW _DATA_17C6_
.dW _DATA_17D3_
.dW _DATA_17E0_

_DATA_17C6_:
.db $04
.db $00 $00 $74
.db $00 $08 $75
.db $08 $00 $76
.db $08 $08 $77

_DATA_17D3_:
.db $04
.db $00 $00 $78
.db $00 $08 $79
.db $08 $00 $7A
.db $08 $08 $7B

_DATA_17E0_:
.db $04
.db $00 $00 $7C
.db $00 $08 $7D
.db $08 $00 $7E
.db $08 $08 $7F

; Data from 17ED to 1804 (24 bytes)
_DATA_17ED_:
.db $F0 $B4 $01 $FF $00 $08 $90 $00 $FF $01 $FF $F8 $90 $B4 $FF $FF
.db $00 $08 $F0 $00 $01 $01 $FF $F8

_LABEL_1805_:
    call _LABEL_1027_
    ld a, (iy + Entity.data1b)
    or a
    jr nz, _LABEL_1859_
    ld a, (iy + Entity.data18)
    rrca
    jr nc, +
    ld a, (iy + Entity.xPos.low)
    cp $78
    jr c, +++
    jp ++

+:
    ld a, (iy + Entity.xPos.low)
    cp $E0
    jr nc, ++
    cp $38
    jr nc, +++
++:
    ld a, (player1.xPos.low)
    call _LABEL_1884_
    jp c, +
    ld a, (flags_RAM_C103_)
    bit 0, a
    jp z, updateEntityXY
    ld a, (player2.xPos.low)
    call _LABEL_1884_
    jp nc, updateEntityXY
    ld a, $02
    jp ++++

+:
    ld a, $01
    jp ++++

+++:
    ld (iy + Entity.data1b), $01
    ld a, (_RAM_C30A_)
    rrca
    ret c
    jp fire_LABEL_3063_

_LABEL_1859_:
    ld d, (iy + Entity.data19)
    ld e, (iy + Entity.data1a)
_LABEL_185F_:
    ld h, (iy + Entity.xVel.low)
    ld l, (iy + Entity.xVel.high)
    add hl, de
    ld (iy + Entity.xVel.low), h
    ld (iy + Entity.xVel.high), l
    jp updateEntityXY

++++:
    ld c, a
    ld (iy + Entity.data1b), $01
    ld (iy + Entity.data13), $00
    ld (iy + Entity.data14), $04
    ld a, (_RAM_C30A_)
    rrca
    ret c
    jp _LABEL_2F92_

_LABEL_1884_:
    ld c, (iy + Entity.xPos.low)
    jr +

_LABEL_1889_:
    ld c, (iy + Entity.yPos.low)
+:
    add a, $F0
    ld h, a
    add a, $30
    ld l, a
    ld a, c
    ld d, a
    add a, $10
    ld e, a
    jp _LABEL_26AC_

updateEntity12:
    ld a, (iy + Entity.data03)
    or a
    jp nz, _LABEL_191F_
    ld hl, _DATA_18FA_
    ld bc, $0007
    call memcpyIYToHL
    ld (iy + Entity.data18), $01
    ld (iy + Entity.xPos.low), $00
    call rng_LABEL_2D2A_
    rrca
    jr c, +
    ld (iy + Entity.data18), $02
    ld (iy + Entity.xPos.low), $B4
+:
    ld (iy + Entity.data05), $01
    ld a, (player1.data03)
    or a
    jr z, +
    call rng_LABEL_2D2A_
    rrca
    jp c, ++
+:
    ld a, (_RAM_C623_)
    or a
    jp z, ++
    ld (iy + Entity.data05), $02
++:
    call _LABEL_1183_
    ld h, (iy + Entity.yVel.low)
    ld l, (iy + Entity.yVel.high)
    add hl, hl
    ld (iy + Entity.yVel.low), h
    ld (iy + Entity.yVel.high), l
    ld h, (iy + Entity.xVel.low)
    ld l, (iy + Entity.xVel.high)
    add hl, hl
    ld (iy + Entity.xVel.low), h
    ld (iy + Entity.xVel.high), l
    ret

; Data from 18FA to 191E (37 bytes)
_DATA_18FA_:
.dw _DATA_1901_
.db $12
.db $01
.db $04
.db $00
.db $00

_DATA_1901_:
.dw _DATA_1905_
.dw _DATA_1912_

_DATA_1905_:
.db $04
.db $00 $00 $AC
.db $00 $08 $AD
.db $08 $00 $AE
.db $08 $08 $AF

_DATA_1912_:
.db $04
.db $00 $00 $B0
.db $00 $08 $B1
.db $08 $00 $B2
.db $08 $08 $B3

_LABEL_191F_:
    ld (iy + Entity.frame), $00
    ld a, (iy + Entity.data13)
    or a
    jr z, +
    dec (iy + Entity.data13)
    ld (iy + Entity.frame), $01
+:
    ld a, (iy + Entity.data1a)
    or a
    jp nz, updateEntityXY
    call loadPlayer1XYPosToHL
    ld a, (iy + Entity.data05)
    cp $01
    jr z, +
    call loadPlayer2XYPosToHL
+:
    ld (iy + Entity.data19), l
    ld a, h
    call _LABEL_1884_
    jp nc, updateEntityXY
    ld a, (iy + Entity.data19)
    call _LABEL_1889_
    jp nc, updateEntityXY
    ld (iy + Entity.data1a), $01
    ld c, (iy + Entity.data05)
    call _LABEL_2F92_
    ld (iy + Entity.data13), $10
    ld hl, $00FF
    ld (iy + Entity.xVel.low), l
    ld (iy + Entity.xVel.high), h
    ld (iy + Entity.yVel.low), l
    ld (iy + Entity.yVel.high), $80
    ld a, (iy + Entity.data18)
    cp $01
    ret z
    ld (iy + Entity.xVel.low), $01
    ld (iy + Entity.xVel.high), h
    ld (iy + Entity.yVel.low), l
    ld (iy + Entity.yVel.high), $80
    ret

updateEntity13:
    ld a, (iy + Entity.data03)
    or a
    jp z, _LABEL_13D3_
    ld a, (iy + Entity.data1c)
    or a
    jp z, _LABEL_144B_
    jp _LABEL_15FE_

updateJellyfish:
    ld a, (iy + Entity.data03)
    or a
    jr nz, _LABEL_1A0B_
    ld hl, _DATA_19DF_
    ld bc, $000E
    call memcpyIYToHL
    ld hl, $020A
    call _LABEL_1049_
    ld (iy + Entity.data18), $06
    ld hl, jellyFishCount
    inc (hl)
    ld a, (_RAM_C30C_)
    inc a
    ld (iy + Entity.data19), a
    ld (iy + Entity.xPos.low), $58
    dec a
    jr z, +
    ld (iy + Entity.xPos.low), $90
    dec a
    ret z
    ld (iy + Entity.xPos.low), $18
    ret

+:
    ld (iy + Entity.data19), $02
    call rng_LABEL_2D2A_
    rrca
    ret c
    ld (iy + Entity.data19), $03
    ret

; Data from 19DF to 1A0A (44 bytes)
_DATA_19DF_:
.dw _DATA_19ED_
.db $15
.db $01
.db $04
.db $00
.db $F0
.db $00
.db $60
.db $00
.db $00
.db $02
.db $02
.db $03

_DATA_19ED_:
.dW _DATA_19F1_
.dW _DATA_19FE_

_DATA_19F1_:
.db $04
.db $00 $00 $8E
.db $00 $08 $8F
.db $08 $00 $90
.db $08 $08 $91

_DATA_19FE_:
.db $04
.db $00 $00 $92
.db $00 $08 $93
.db $08 $00 $94
.db $08 $08 $95

_LABEL_1A0B_:
    call _LABEL_1027_
    ld a, (iy + Entity.data1a)
    or a
    call z, +
    call subData18FromYVel
    ld a, (iy + Entity.data19)
    dec a
    ret z
    ld de, $FFC0
    dec a
    jp z, updateEntityXWith
    ld de, $0040
    jp updateEntityXWith

subData18FromYVel:
    ld e, (iy + Entity.data18)
    ld d, $00
    ld h, (iy + Entity.yVel.low)
    ld l, (iy + Entity.yVel.high)
    xor a
    sbc hl, de
    ld (iy + Entity.yVel.low), h
    ld (iy + Entity.yVel.high), l
    ex de, hl
    jp updateEntityYWith

+:
    ld a, (iy + Entity.yPos.low)
    sub $10
    ld h, a
    add a, $30
    ld l, a
    ld a, (player1.yPos.low)
    ld c, $01
    cp h
    jr c, +
    cp l
    call c, ++
+:
    ld a, (player2.yPos.low)
    ld c, $02
    cp h
    ret c
    cp l
    ret nc
++:
    push hl
    call _LABEL_2F92_
    pop hl
    ret nc
    ld (iy + Entity.data1a), $01
    ret

.INCLUDE "entities/updateStar.asm"
.INCLUDE "entities/updateEnemy2.asm"

updateEntity1A:
    ld a, (iy + Entity.data03)
    or a
    jr nz, _LABEL_1C00_
    ld (iy + Entity.data1a), $18
    ld hl, _DATA_1BDB_
    ld bc, $0007
    call memcpyIYToHL
    ld c, $03
    call rng_LABEL_2D2A_
    and $0F
    cp $05
    jr c, +
    ld c, $02
    cp $0A
    jr c, +
    ld c, $01
    ld (iy + Entity.yVel.high), $80
+:
    ld (iy + Entity.yVel.low), c
    call _LABEL_12F7_
    ld hl, $0208
    jp _LABEL_1049_

; Data from 1BDB to 1BFF (37 bytes)
_DATA_1BDB_:
.dW _DATA_1BE2_
.db $1A
.db $01
.db $00
.db $00
.db $FC

_DATA_1BE2_:
.dW _DATA_1BE6_
.dW _DATA_1BF3_

_DATA_1BE6_:
.db $04
.db $00 $00 $9C
.db $00 $08 $9D
.db $08 $00 $9E
.db $08 $08 $9F

_DATA_1BF3_:
.db $04
.db $00 $00 $A0
.db $00 $08 $A1
.db $08 $00 $A2
.db $08 $08 $A3

_LABEL_1C00_:
    call updateEntityY
    call _LABEL_1027_
    dec (iy + Entity.data1a)
    ret nz
    ld (iy + Entity.data1a), $50
    jp fire_LABEL_3063_

updateEntity1B:
    ld a, (iy + Entity.data03)
    or a
    jp nz, _LABEL_1C69_
    ld hl, _DATA_1D64_
    ld bc, $000E
    call memcpyIYToHL
    ld hl, $0206
    call _LABEL_1049_
    ld a, (flags_RAM_C103_)
    rrca
    jr c, ++
--:
    ld a, (player1.type)
    cp $01
    jr z, +
-:
    ld (iy + Entity.data03), $00
    ret

+:
    ld (iy + Entity.data18), $01
    ret

++:
    ld a, (player1.data03)
    or a
    jr z, _LABEL_1C56_
    ld a, (_RAM_C623_)
    or a
    jr z, --
    ld a, (player1.yPos.low)
    ld b, a
    ld a, (player2.yPos.low)
    cp b
    jr z, +
    jr nc, --
_LABEL_1C56_:
    ld a, (_RAM_C622_)
    cp $02
    jr nz, -
    ld (iy + Entity.data18), $02
    ret

+:
    ld a, r
    rrca
    jr c, --
    jr _LABEL_1C56_

_LABEL_1C69_:
    call _LABEL_1027_
    ld a, (iy + Entity.data18)
    ld (iy + Entity.data05), a
    cp $01
    jr nz, +
    ld a, (player1.yPos.low)
    add a, $02
    ld (iy + Entity.data19), a
    ld a, (player1.xPos.low)
    add a, $02
    ld (iy + Entity.data1a), a
    jr ++

+:
    ld a, (player2.yPos.low)
    add a, $02
    ld (iy + Entity.data19), a
    ld a, (player2.xPos.low)
    add a, $02
    ld (iy + Entity.data1a), a
++:
    ld a, (iy + Entity.data1b)
    add a, a
    ld e, a
    ld d, $00
    ld hl, _DATA_1CA8_
    add hl, de
    ld e, (hl)
    inc hl
    ld d, (hl)
    ex de, hl
    jp (hl)

; Jump Table from 1CA8 to 1CAD (3 entries, indexed by _RAM_C61B_)
_DATA_1CA8_:
.dw _LABEL_1CAE_ _LABEL_1CCA_ _LABEL_1D56_

; 1st entry of Jump Table from 1CA8 (indexed by _RAM_C61B_)
_LABEL_1CAE_:
    ld a, (iy + Entity.data1a)
    add a, $14
    ld (iy + Entity.xPos.low), a
    ld a, (iy + Entity.yPos.low)
    add a, $08
    ld (iy + Entity.yPos.low), a
    sub (iy + Entity.data19)
    ret c
    cp $08
    ret nc
    ld (iy + Entity.data1b), $01
    ret

; 2nd entry of Jump Table from 1CA8 (indexed by _RAM_C61B_)
_LABEL_1CCA_:
    ld a, (iy + Entity.data1c)
    inc (iy + Entity.data1c)
    cp $04
    jr c, ++
    ld (iy + Entity.data1c), $00
    inc (iy + Entity.data1e)
    ld a, (iy + Entity.data1e)
    cp $04
    jr z, +
    cp $02
    ret nz
    inc (iy + Entity.data1d)
    ld a, (iy + Entity.data1d)
    cp $06
    ret c
    ld (iy + Entity.data1b), $02
    ret

+:
    ld (iy + Entity.data1e), $00
    ret

++:
    add a, a
    ld c, a
    ld b, $00
    ld hl, _DATA_1D4E_
    add hl, bc
    ld a, (iy + Entity.data1e)
    or a
    jr z, +
    dec a
    jr z, ++
    dec a
    jr z, +++
    jr ++++

+:
    ld a, (hl)
    add a, (iy + Entity.data1a)
    ld (iy + Entity.xPos.low), a
    inc hl
    ld a, (hl)
    add a, (iy + Entity.data19)
    ld (iy + Entity.yPos.low), a
    ret

++:
    ld a, (hl)
    add a, (iy + Entity.data19)
    ld (iy + Entity.yPos.low), a
    inc hl
    ld a, (iy + Entity.data1a)
    sub (hl)
    ld (iy + Entity.xPos.low), a
    ret

+++:
    ld a, (iy + Entity.data1a)
    sub (hl)
    ld (iy + Entity.xPos.low), a
    ld a, (iy + Entity.data19)
    inc hl
    sub (hl)
    ld (iy + Entity.yPos.low), a
    ret

++++:
    ld a, (iy + Entity.data19)
    sub (hl)
    ld (iy + Entity.yPos.low), a
    inc hl
    ld a, (hl)
    add a, (iy + Entity.data1a)
    ld (iy + Entity.xPos.low), a
    ret

; Data from 1D4E to 1D55 (8 bytes)
_DATA_1D4E_:
.db $14 $00 $12 $08 $0E $0E $08 $12

; 3rd entry of Jump Table from 1CA8 (indexed by _RAM_C61B_)
_LABEL_1D56_:
    ld (iy + Entity.yVel.low), $FD
    ld (iy + Entity.xVel.low), $FE
    call updateEntityY
    jp updateEntityX

; Data from 1D64 to 1D71 (14 bytes)
_DATA_1D64_:
.dw _DATA_143F_
.db $1B
.db $01
.db $01
.db $00
.db $F0
.db $00
.db $58
.db $00
.db $19
.db $01
.db $01
.db $01

updateEntity1C:
    ld a, (iy + Entity.data03)
    or a
    jr nz, ++
    ld hl, _DATA_1DA4_
    ld bc, $0009
    call memcpyIYToHL
    ld (iy + Entity.yVel.high), $55
    ld hl, $0308
    call _LABEL_1049_
    ld (iy + Entity.data18), $20
    call rng_LABEL_2D2A_
    ld bc, $FE80
    rrca
    jr c, +
    ld b, $01
    ld (iy + Entity.xPos.low), b
+:
    ld (iy + Entity.xVel.low), b
    ld (iy + Entity.xVel.high), c
    ret

; Data from 1DA4 to 1DAC (9 bytes)
_DATA_1DA4_:
.dw _DATA_1E0B_
.db $1C
.db $01
.db $04
.db $00
.db $08
.db $00
.db $B4

++:
    call _LABEL_1027_
    call updateEntityXY
    dec (iy + Entity.data18)
    ret nz
    ld (iy + Entity.data18), $40
    jp fire_LABEL_3063_

updateEntity1D:
    ld a, (iy + Entity.data03)
    or a
    jp nz, _LABEL_1E38_
    ld (iy + Entity.data18), $01
    ld (iy + Entity.data19), $20
    ld (iy + Entity.data1a), $10
    ld hl, $0306
    call _LABEL_1049_
    ld hl, _DATA_1E02_
    ld bc, $0009
    call memcpyIYToHL
    ld (iy + Entity.yVel.high), $55
    ld a, (wave)
    cp $07
    ret z
    cp $0F
    ret z
    cp $42
    ret z
    ld (iy + Entity.xPos.low), $98
    cp $23
    ret z
    cp $28
    ret z
    cp $4B
    ret z
    ld (iy + Entity.xPos.low), $30
    ret

; Data from 1E02 to 1E37 (54 bytes)
_DATA_1E02_:
.dw _DATA_1E0B_
.db $1D
.db $01
.db $04
.db $00
.db $F8
.db $00
.db $58

_DATA_1E0B_:
.dw _DATA_1E11_
.dw _DATA_1E1E_
.dw _DATA_1E2B_

_DATA_1E11_:
.db $04
.db $00 $00 $D7
.db $00 $08 $D8
.db $08 $00 $D9
.db $08 $08 $DA

_DATA_1E1E_:
.db $04
.db $00 $00 $DB
.db $00 $08 $DC
.db $08 $00 $DD
.db $08 $08 $DE

_DATA_1E2B_:
.db $04
.db $00 $00 $DF
.db $00 $08 $E0
.db $08 $00 $E1
.db $08 $08 $E2

_LABEL_1E38_:
    call _LABEL_1027_
    ld b, (iy + Entity.data18)
    dec b
    call z, ++
    dec b
    ld de, $FF80
    call z, +
    dec b
    ld de, $0080
    ret nz
+:
    call updateEntityXWith
++:
    call updateEntityY
    dec (iy + Entity.data1a)
    jr nz, +
    ld (iy + Entity.data1a), $48
    call fire_LABEL_3063_
+:
    dec (iy + Entity.data19)
    ret nz
    ld (iy + Entity.data19), $38
    inc (iy + Entity.data1d)
    ld a, (iy + Entity.data1d)
    cp $04
    jr c, +
    xor a
    ld (iy + Entity.data1d), a
+:
    ld e, a
    ld d, $00
    ld hl, _DATA_1E82_
    add hl, de
    ld a, (hl)
    ld (iy + Entity.data18), a
    ret

; Data from 1E82 to 1E85 (4 bytes)
_DATA_1E82_:
.db $03 $01 $02 $01

updateEntity22:
    ld a, (iy + Entity.data03)
    or a
    jp nz, _LABEL_15FE_
    ld hl, _DATA_1E93_
    jp ++

; Data from 1E93 to 1E98 (6 bytes)
_DATA_1E93_:
.db $95 $1E $01 $04 $04 $21

updateEntity21:
    ld a, (iy + Entity.data03)
    or a
    jp nz, _LABEL_15FE_
    ld a, (iy + Entity.data04)
    ld (iy + Entity.data04), $00
    ld c, $0D
    cp $8C
    jp nz, +
    ld (iy + Entity.frame), $01
    ld c, $0F
+:
    call addScore
    ld hl, _DATA_1EC8_
++:
    call _LABEL_15E0_
    ld a, (iy + Entity.xPos.low)
    cp $58
    ret c
    ld (iy + Entity.xVel.low), $FF
    ret

; Data from 1EC8 to 1EE8 (33 bytes)
_DATA_1EC8_:
.dw _DATA_1ECC_
.dw _DATA_1ED6_

_DATA_1ECC_:
.db $03
.db $00 $00 $CC
.db $08 $00 $CD
.db $08 $08 $CE

_DATA_1ED6_:
.db $06
.db $00 $00 $CF
.db $00 $08 $D0
.db $00 $10 $D1
.db $08 $00 $D2
.db $08 $08 $D3
.db $08 $10 $D4

updateEntity11:
    ld a, (iy + Entity.data03)
    or a
    jp nz, _LABEL_1F85_
    ld hl, _DATA_1F16_
    ld bc, $0009
    call memcpyIYToHL
    ld (iy + Entity.data18), $02
_LABEL_1EFD_:
    ld (iy + Entity.yVel.low), $FF
    ld (iy + Entity.yVel.high), $00
    ld (iy + Entity.data1e), $00
    ld (iy + Entity.data1f), $08
    ld (iy + Entity.xVel.high), $80
    ld (iy + Entity.data1b), $00
    ret

; Data from 1F16 to 1F84 (111 bytes)
_DATA_1F16_:
.dw _DATA_1F1F_
.db $11
.db $01
.db $00
.db $00
.db $D8
.db $00
.db $50

_DATA_1F1F_:
.dw _DATA_1F23_
.dw _DATA_1F54_

_DATA_1F23_:
.db $10
.db $00 $00 $B4
.db $00 $08 $B5
.db $00 $10 $B6
.db $00 $18 $B7
.db $08 $00 $B8
.db $08 $08 $E3
.db $08 $10 $E3
.db $08 $18 $B9
.db $10 $00 $BA
.db $10 $08 $BB
.db $10 $10 $BC
.db $10 $18 $BD
.db $18 $00 $BE
.db $18 $08 $BF
.db $18 $10 $C0
.db $18 $18 $C1

_DATA_1F54_:
.db $10
.db $00 $00 $B4
.db $00 $08 $B5
.db $00 $10 $B6
.db $00 $18 $B7
.db $08 $00 $B8
.db $08 $08 $E3
.db $08 $10 $E3
.db $08 $18 $B9
.db $10 $00 $BA
.db $10 $08 $BB
.db $10 $10 $BC
.db $10 $18 $BD
.db $18 $00 $BE
.db $18 $08 $D5
.db $18 $10 $D6
.db $18 $18 $C1

_LABEL_1F85_:
    ld a, (iy + Entity.data1c)
    or a
    jr nz, _LABEL_1FA9_
    ld a, (iy + Entity.data19)
    or a
    jr nz, ++
    ld a, (iy + Entity.yPos.low)
    cp $30
    jp c, +
    cp $D0
    jp nc, +
    ld (iy + Entity.data19), $01
    ret

+:
    ld de, $0080
    jp updateEntityYWith

_LABEL_1FA9_:
    ld a, (_RAM_C743_)
    or a
    ret nz
    ld de, $FF00
    jp updateEntityYWith

++:
    call updateEntityX
    ld d, (iy + Entity.data1e)
    ld e, (iy + Entity.data1f)
    ld h, (iy + Entity.yVel.low)
    ld l, (iy + Entity.yVel.high)
    add hl, de
    ld (iy + Entity.yVel.low), h
    ld (iy + Entity.yVel.high), l
    call updateEntityY
    inc (iy + Entity.data1a)
    ld a, (iy + Entity.data1a)
    cp $3F
    ret nz
    ld (iy + Entity.data1a), $00
    dec (iy + Entity.data18)
    jr nz, +
    ld (iy + Entity.data18), $04
    ld (iy + Entity.xVel.low), $00
    ld a, (iy + Entity.data1d)
    cpl
    ld (iy + Entity.data1d), a
    or a
    jr z, +
    ld (iy + Entity.xVel.low), $FF
+:
    ld a, (iy + Entity.data1b)
    or a
    jp nz, _LABEL_1EFD_
    ld (iy + Entity.yVel.low), $01
    ld (iy + Entity.yVel.high), $00
    ld (iy + Entity.data1e), $FF
    ld (iy + Entity.data1f), $F8
    ld (iy + Entity.data1b), $01
    ret

updateEntity14:
    ld a, (iy + Entity.data03)
    or a
    jr nz, +
    ld (iy + Entity.data1f), $80
    ld hl, _DATA_2024_
    ld bc, $0009
    jp memcpyIYToHL

; Data from 2024 to 2032 (15 bytes)
_DATA_2024_:
.dw _DATA_202D_
.db $14
.db $01
.db $00
.db $00
.db $F0
.db $00
.db $5C

_DATA_202D_:
.dw _DATA_202F_

_DATA_202F_:
.db $01
.db $00 $00 $00

+:
    call ++
    ld hl, $180C
_LABEL_2039_:
    ld a, (_RAM_C779_)
    or a
    jr nz, +
    ld de, $0080
    jp updateEntityYWith

+:
    ld a, (_RAM_C766_)
    add a, h
    ld (iy + Entity.yPos.low), a
    ld a, (_RAM_C768_)
    add a, l
    ld (iy + Entity.xPos.low), a
    ret

++:
    dec (iy + Entity.data1f)
    jr nz, +
    ld (iy + Entity.data1f), $20
    call fire_LABEL_3063_
+:
    ld hl, _RAM_C75E_
    ld a, (hl)
    or a
    ret z
    dec hl
    ld a, (flags_RAM_C103_)
    rrca
    jr nc, +
    ld a, (hl)
    or a
    jr nz, ++
+:
    ld b, $01
    ld a, (player1.data03)
    or a
    jr z, ++++
    ld ix, _RAM_C900_
    ld c, $01
    jp +++

++:
    ld b, $00
    ld a, (_RAM_C623_)
    or a
    jr z, ++++
    ld ix, _RAM_C900_
    ld c, $02
+++:
    ld a, (ix + Entity.data03)
    or a
    ret nz
    ld (ix + Entity.type), $20
    ld (ix + Entity.data05), c
    ld a, (iy + Entity.yPos.low)
    ld (ix + Entity.yPos.low), a
    ld a, (iy + Entity.xPos.low)
    ld (ix + Entity.xPos.low), a
++++:
    ld (hl), b
    ret

updateEntity18:
    ld a, (iy + Entity.data03)
    or a
    jr nz, _LABEL_2101_
    ld hl, _DATA_20BC_
    ld bc, $0009
    call memcpyIYToHL
    jp _LABEL_2A9A_

; Data from 20BC to 2100 (69 bytes)
_DATA_20BC_:
.dw _DATA_20C5_
.db $18 $01 $00 $00 $E0 $00 $58

_DATA_20C5_:
.dw _DATA_20D9_
.dw _DATA_20DD_
.dw _DATA_20E1_
.dw _DATA_20E5_
.dw _DATA_20E9_
.dw _DATA_20ED_
.dw _DATA_20F1_
.dw _DATA_20F5_
.dw _DATA_20F9_
.dw _DATA_20FD_

_DATA_20D9_:
.db $01
.db $00 $00 $30

_DATA_20DD_:
.db $01
.db $00 $00 $31

_DATA_20E1_:
.db $01
.db $00 $00 $32

_DATA_20E5_:
.db $01
.db $00 $00 $33

_DATA_20E9_:
.db $01
.db $00 $00 $34

_DATA_20ED_:
.db $01
.db $00 $00 $35

_DATA_20F1_:
.db $01
.db $00 $00 $36

_DATA_20F5_:
.db $01
.db $00 $00 $37

_DATA_20F9_:
.db $01
.db $00 $00 $38

_DATA_20FD_:
.db $01
.db $00 $00 $39

_LABEL_2101_:
    ld a, (_RAM_C331_)
    ld (iy + Entity.frame), a
    ld a, (iy + Entity.data1c)
    or a
    jp nz, _LABEL_1FA9_
    ld hl, $0808
    jp _LABEL_2039_

updateEntity19:
    ld a, (iy + Entity.data03)
    or a
    jr nz, +
    ld hl, _DATA_2123_
    ld bc, $0009
    jp memcpyIYToHL

; Data from 2123 to 212B (9 bytes)
_DATA_2123_:
.dw _DATA_20C5_
.db $19 $01 $00 $00 $E0 $00 $60

+:
    ld a, (_RAM_C330_)
    ld (iy + Entity.frame), a
    ld a, (iy + Entity.data1c)
    or a
    jp nz, _LABEL_1FA9_
    ld hl, $0810
    jp _LABEL_2039_

updateEntity1E:
    ld a, (iy + Entity.data03)
    or a
    jr nz, +
    ld hl, _DATA_214E_
    ld bc, $0009
    jp memcpyIYToHL

; Data from 214E to 215A (13 bytes)
_DATA_214E_:
.dw _DATA_36_
.db $1E
.db $01
.db $00
.db $00
.db $F8
.db $00
.db $58

_DATA_2157_:
.db $01
.db $00 $00 $C2

+:
    ld a, (iy + Entity.data1c)
    or a
    jp nz, _LABEL_2217_
    ld hl, $2008
    ld a, (_RAM_C779_)
    or a
    jp z, _LABEL_2039_
    ld a, (iy + Entity.data1a)
    or a
    jr z, +
    dec (iy + Entity.data1a)
    jp +++

+:
    ld a, (iy + Entity.data18)
    or a
    jr nz, +
    inc (iy + Entity.data19)
    ld a, (iy + Entity.data19)
    cp $08
    jp c, +++
    ld a, $01
    ld (iy + Entity.data18), a
    ld (_RAM_C75E_), a
    jp ++

+:
    xor a
    ld (_RAM_C75E_), a
    dec (iy + Entity.data19)
    jp nz, +++
    ld (iy + Entity.data18), $00
++:
    ld (iy + Entity.data1a), $18
+++:
    ld a, l
    sub (iy + Entity.data19)
    ld l, a
    jp _LABEL_2039_

updateEntity1F:
    ld a, (iy + Entity.data03)
    or a
    jr nz, +
    ld (iy + Entity.data18), $01
    ld hl, _DATA_21C1_
    ld bc, $0009
    jp memcpyIYToHL

; Data from 21C1 to 21CD (13 bytes)
_DATA_21C1_:
.dw _DATA_64_
.db $1F
.db $01
.db $00
.db $00
.db $F8
.db $00
.db $60

_DATA_21CA_:
.db $01
.db $00 $00 $C3

+:
    ld a, (iy + Entity.data1c)
    or a
    jp nz, _LABEL_2217_
    ld hl, $2010
    ld a, (_RAM_C779_)
    or a
    jp z, _LABEL_2039_
    ld a, (iy + Entity.data1a)
    or a
    jr z, +
    dec (iy + Entity.data1a)
    jp +++

+:
    ld a, (iy + Entity.data18)
    or a
    jr nz, +
    dec (iy + Entity.data19)
    jr nz, +++
    ld (iy + Entity.data18), $01
    jp ++

+:
    inc (iy + Entity.data19)
    ld a, (iy + Entity.data19)
    cp $08
    jr c, +++
    ld (iy + Entity.data18), $00
++:
    ld (iy + Entity.data1a), $18
+++:
    ld a, (iy + Entity.data19)
    add a, l
    ld l, a
    jp _LABEL_2039_

_LABEL_2217_:
    ld a, (_RAM_C743_)
    or a
    ret nz
    ld de, $0200
    jp updateEntityYWith
