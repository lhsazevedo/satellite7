updateExplosion:
    ld a, (iy + Entity.data16)
    or a
    jr nz, _LABEL_FB0_
    ld (iy + Entity.data16), $01
    ld hl, _DATA_F8C_
    ld (iy + Entity.animationDescriptorPointer.low), l
    ld (iy + Entity.animationDescriptorPointer.high), h
    ld (iy + Entity.frame), $00
    ld (iy + Entity.data12), $04
    ld (iy + Entity.data13), $00
    ld (iy + Entity.data14), $08
    ld a, $87
    ld (_RAM_CD00_), a
    ret

; Data from F8C to FAF (36 bytes)
_DATA_F8C_:
.dw _DATA_0F92_
.dw _DATA_0F9F_
.dw _DATA_0FA3_ 

_DATA_0F92_:
.db $04
.db $00 $00 $23
.db $00 $08 $24
.db $08 $00 $25
.db $08 $08 $26

_DATA_0F9F_:
.db $01
.db $04 $04 $22

_DATA_0FA3_:
.db $04
.db $00 $00 $23
.db $00 $08 $24
.db $08 $00 $25
.db $08 $08 $26

_LABEL_FB0_:
    call _LABEL_1027_
    ld a, (iy + Entity.frame)
    cp $03
    ret c
    ld (iy + Entity.frame), $00
    jp putIYEntityOffscreen
