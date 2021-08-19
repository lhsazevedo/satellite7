updateBullet:
	inc (iy + Entity.data1f)
	ld a, (iy + Entity.yPos.low)
	cp $C0
	jp nc, putIYEntityOffscreen

	ld a, (iy + Entity.xPos.low)
	cp $B8
	jp nc, putIYEntityOffscreen

	ld a, (_RAM_C31F_)
	or a
	call nz, +

	call updateEntityXY

	ld a, (iy + Entity.data18)
	or a
	ret z

	cp $02
	jp nc, putIYEntityOffscreen

	inc (iy + Entity.data19)
	ld a, (iy + Entity.data19)
	cp $06
	ret c

	jp putIYEntityOffscreen

+:
	ld a, (_RAM_C320_)
	ld d, a
	ld a, (_RAM_C321_)
	ld e, a
	call _LABEL_30BC_
	push hl

	ld h, (iy + Entity.yVel.low)
	ld l, (iy + Entity.yVel.high)
	add hl, de
	ld (iy + Entity.yVel.low), h
	ld (iy + Entity.yVel.high), l

	pop hl
	ld d, (iy + Entity.xVel.low)
	ld e, (iy + Entity.xVel.high)
	add hl, de
	ld (iy + Entity.xVel.low), h
	ld (iy + Entity.xVel.high), l

	ret
