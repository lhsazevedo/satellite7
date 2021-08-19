; 4th entry of Jump Table from C64 (indexed by _RAM_C602_)
updateBomb:
	ld d, $00
	ld e, (iy+24)
	ld h, (iy+13)
	ld l, (iy+14)
	add hl, de
	ld (iy+13), h
	ld (iy+14), l
	ex de, hl
	ld e, $00
	call updateEntityYWith
	inc (iy+19)
	ld a, (iy+19)
	cp $08
	ret c
	ld (iy+17), $01
	cp $16
	ret c
	ld (iy+17), $02
	cp $23
	ret c
	ld (iy+17), $03
	cp $2A
	jp nc, putIYEntityOffscreen
	ld a, (_RAM_C133_)
	and $20
	ret nz
	ld de, $0055
	jp updateEntityYWith
