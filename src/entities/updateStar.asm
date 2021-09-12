updateStar:
    ld a, (iy + Entity.data03)
    or a
    jr nz, _LABEL_1ACC_
    ld hl, _DATA_1A9F_
    ld bc, $000F
    call memcpyIYToHL
    call _LABEL_1A80_
    jp _LABEL_12F7_

_LABEL_1A80_:
    call rng_LABEL_2D2A_
    and $0F
    ld c, $00
    cp $05
    jr c, +
    inc c
    cp $09
    jr c, +
    inc c
    cp $0D
    jr c, +
    inc c
    cp $0F
    jr c, +
    inc c
+:
    ld (iy + Entity.frame), c
    ret

; Data from 1A9F to 1AAD (15 bytes)
_DATA_1A9F_:
.dw _DATA_1AAE_
.db $16
.db $01
.db $01
.db $00
.db $00
.db $00
.db $50
.db $00
.db $00
.db $01
.db $01
.db $00
.db $80

; Data from 1AAE to 1ACB (30 bytes)
_DATA_1AAE_:
.dw _DATA_1AB8_
.dw _DATA_1ABC_
.dw _DATA_1AC0_
.dw _DATA_1AC4_
.dw _DATA_1ACB_

_DATA_1AB8_:
.db $01
.db $00 $00 $3A

_DATA_1ABC_:
.db $01
.db $00 $00 $3B

_DATA_1AC0_:
.db $01
.db $00 $00 $3C

_DATA_1AC4_:
.db $01
.db $00 $00 $3D

_DATA_1ACB_:
.db $01
.db $00 $00 $3E

_LABEL_1ACC_:
    call updateEntityY
    ld a, (iy + Entity.data18)
    or a
    ret z

_LABEL_1AD4_:
    ld (iy + Entity.data18), $00
    ld a, (iy + Entity.frame)
    add a, $3A
    ld (lastStarTileIndex), a
    ld a, $0A
    ld (interruptActionSlot11), a
    ld a, (iy + Player.playerNumber)
    ld (playerThatCollectedTheLastStar), a
    jp putIYEntityOffscreen
