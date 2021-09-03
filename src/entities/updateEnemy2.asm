updateEnemy2:
	ld a, (iy + Entity.data03)
	or a
	jr nz, _LABEL_1B5A_
	ld hl, _DATA_1B2D_
	ld bc, $0015
	call memcpyIYToHL
	ld (iy + Entity.data18), $FF
	ld (iy + Entity.data19), $E8
	ld (iy + Entity.data1a), $50
	ld (iy + Entity.data1d), $20
	call rng_LABEL_2D2A_
	rrca
	jr c, +
	ld (iy + Entity.data1a), $30
+:
	call rng_LABEL_2D2A_
	rrca
	ret c
	ld (iy + Entity.data18), $00
	ld (iy + Entity.data19), $14
	ld (iy + Entity.xVel.low), $FB
	ld (iy + Entity.xPos.low), $B4
	ret

; Data from 1B2D to 1B59 (45 bytes)
_DATA_1B2D_:
.db $42 $1B $17 $01 $04 $00 $F0 $00 $00 $00 $00 $02 $02 $00 $A0 $05
.db $00 $00 $02 $00 $10 $46 $1B $53 $1B $04 $00 $00 $96 $00 $08 $97
.db $08 $00 $98 $08 $08 $99 $02 $00 $04 $9A $08 $04 $9B

_LABEL_1B5A_:
	call _LABEL_1027_
	call ++
	call +
	ld d, (iy + Entity.data18)
	ld e, (iy + Entity.data19)
	jp _LABEL_185F_

+:
	ld a, (iy + Entity.data1a)
	or a
	jr z, +
	dec (iy + Entity.data1a)
	ret

+:
	ld de, $FFE8
	ld hl, $0300
	ld a, (iy + Entity.data18)
	cp $80
	jr c, +
	ld de, $0018
	ld hl, $FD00
+:
	ld (iy + Entity.xVel.low), h
	ld (iy + Entity.xVel.high), l
	ld (iy + Entity.data18), d
	ld (iy + Entity.data19), e
	ld (iy + Entity.data1a), $38
	ret

++:
	dec (iy + Entity.data1d)
	ret nz
	ld (iy + Entity.data1d), $80
	jp fire_LABEL_3063_
