updateExplosion:
	ld a, (iy+22)
	or a
	jr nz, _LABEL_FB0_
	ld (iy+22), $01
	ld hl, _DATA_F8C_
	ld (iy+0), l
	ld (iy+1), h
	ld (iy+17), $00
	ld (iy+18), $04
	ld (iy+19), $00
	ld (iy+20), $08
	ld a, $87
	ld (_RAM_CD00_), a
	ret

; Data from F8C to FAF (36 bytes)
_DATA_F8C_:
.db $92 $0F $9F $0F $A3 $0F $04 $00 $00 $23 $00 $08 $24 $08 $00 $25
.db $08 $08 $26 $01 $04 $04 $22 $04 $00 $00 $23 $00 $08 $24 $08 $00
.db $25 $08 $08 $26

_LABEL_FB0_:
	call _LABEL_1027_
	ld a, (iy+17)
	cp $03
	ret c
	ld (iy+17), $00
	jp putIYEntityOffscreen
