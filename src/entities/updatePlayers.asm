updatePlayer1:
	ld a, (iy+27)
	cp $01
	jr nz, +
	ld de, $FF00
	ld a, (iy+6)
	cp $80
	jp nc, updateEntityYWith
	ld (iy+27), $02
	ld hl, _RAM_C104_
	res 0, (hl)
	set 1, (hl)
	ret

+:
	ld a, (_RAM_C12F_)
	jr ++

updatePlayer2:
	ld a, (iy+27)
	cp $01
	jr nz, +
	ld de, $FF00
	ld a, (iy+6)
	cp $80
	jp nc, updateEntityYWith
	ld (iy+27), $02
	ld hl, _RAM_C104_
	res 4, (hl)
	set 5, (hl)
	ret

+:
	ld a, (_RAM_C131_)
++:
	ld (_RAM_C12E_), a
	ld a, (iy+24)
	ld c, a
	or a
	jr nz, +
	ld a, (_RAM_C12E_)
	and $0F
	or a
	jr z, ++
	ld c, a
+:
	bit 0, c
	call nz, +++
	bit 1, c
	call nz, _LABEL_D4B_
	bit 2, c
	call nz, _LABEL_D61_
	bit 3, c
	call nz, _LABEL_D77_
++:
	ld a, (iy+25)
	or a
	ret z
	ld a, (iy+24)
	call _LABEL_1027_
	inc (iy+25)
	ld a, (iy+25)
	cp $20
	ret c
	xor a
	ld (iy+24), a
	ld (iy+25), a
	ld (iy+17), a
	ld (iy+19), a
	ret

+++:
	ld a, (iy+6)
	cp $40
	ret c
	ld de, $FF00
	ld a, (iy+4)
	or a
	jp z, updateEntityYWith
	ld de, $FE40
	jp updateEntityYWith

_LABEL_D4B_:
	ld a, (iy+6)
	cp $B0
	ret nc
	ld de, $0100
	ld a, (iy+4)
	or a
	jp z, updateEntityYWith
	ld de, $01A0
	jp updateEntityYWith

_LABEL_D61_:
	ld a, (iy+8)
	cp $08
	ret c
	ld de, $FF00
	ld a, (iy+4)
	or a
	jp z, updateEntityXWith
	ld de, $FE40
	jp updateEntityXWith

_LABEL_D77_:
	ld a, (iy+8)
	cp $A8
	ret nc
	ld de, $0100
	ld a, (iy+4)
	or a
	jp z, updateEntityXWith
	ld de, $01A0
	jp updateEntityXWith
