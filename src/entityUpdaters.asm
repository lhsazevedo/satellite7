.INCLUDE "entityUpdatersPointers.asm"

.INCLUDE "entities/updatePlayers.asm"
.INCLUDE "entities/updateBullet.asm"
.INCLUDE "entities/updateBomb.asm"

updateEntity05:
	ld a, (iy + Entity.data16)
	or a
	jr nz, _LABEL_E9B_
	ld (iy + Entity.data16), $01
	ld hl, _DATA_E75_
	ld (iy + Entity.animationDescriptorPointer.low), l
	ld (iy + Entity.animationDescriptorPointer.high), h
	ld hl, $0008
	ld (iy + Entity.yVel.low), h
	ld (iy + Entity.yVel.high), l
	ld (iy + Entity.data14), l
	ld (iy + Entity.frame), h
	ld (iy + Entity.data12), $04
	ld (iy + Entity.data1e), $60
	ld a, $8A
	ld (_RAM_CD00_), a
	ld hl, _RAM_C104_
	ld a, (iy + Entity.data05)
	cp $01
	jr nz, +
	set 2, (hl)
	ld hl, _RAM_C103_
	res 2, (hl)
	ret

+:
	set 6, (hl)
	ld hl, _RAM_C103_
	res 3, (hl)
	ret

; Data from E75 to E9A (38 bytes)
_DATA_E75_:
.dw _DATA_E7D_
.dw _DATA_E8A_
.dw _DATA_E7D_
.dw _DATA_E97_

_DATA_E7D_:
.db $04
.db $00 $00 $16
.db $00 $08 $17
.db $08 $00 $18
.db $08 $08 $19

_DATA_E8A_:
.db $04
.db $00 $00 $1A
.db $00 $08 $1B
.db $08 $00 $1C
.db $08 $08 $1D

_DATA_E97_:
.db $01
.db $00 $00 $00

_LABEL_E9B_:
	ld a, (iy + Entity.frame)
	cp $03
	call c, _LABEL_1027_
	dec (iy + Entity.data1e)
	ret nz
	ld hl, _RAM_C104_
	ld a, (iy + Entity.data05)
	push af
	call putIYEntityOffscreen
	pop af
	dec a
	jr nz, +
	set 3, (hl)
	res 2, (hl)
	ret

+:
	set 7, (hl)
	res 6, (hl)
	ret

updateEntity06:
	ld a, (iy + Entity.data03)
	or a
	jp nz, _LABEL_F48_
	ld a, (iy + Entity.data05)
	ld hl, entity06Data
	ld bc, $000E
	call memcpyIYToHL
	ld c, a
	ld a, (_RAM_C103_)
	bit 0, a
	ret z
	ld (iy + Entity.xPos.low), $70
	ld a, c
	dec a
	ret z
	ld (iy + Entity.xPos.low), $40
	ld (iy + Entity.frame), $01
	ld (iy + Entity.data05), c
	ret

; Data from EEC to F47 (92 bytes)
entity06Data:
.dw entity06AnimationDescriptor
.db $06 ; type
.db $01 ; data03
.db $0C ; data04
.db $01 ; data05
.db $C0 ; yPos.low
.db $00 ; yPos.high
.db $58 ; xPos.low
.db $00 ; xPos.high
.db $00 ; data0a
.db $03 ; data0b
.db $04 ; data0c
.db $FF ; yVel.low

entity06AnimationDescriptor:
.dw _DATA_0EFE_
.dw _DATA_0F23_

_DATA_0EFE_:
.db $0C
.db $00 $00 $50
.db $00 $08 $4C
.db $00 $10 $20
.db $00 $18 $31
.db $08 $00 $47
.db $08 $08 $41
.db $08 $10 $4D
.db $08 $18 $45
.db $10 $00 $4F
.db $10 $08 $56
.db $10 $10 $45
.db $10 $18 $52 

_DATA_0F23_:
.db $0C
.db $00 $00 $50
.db $00 $08 $4C
.db $00 $10 $20
.db $00 $18 $32
.db $08 $00 $47
.db $08 $08 $41
.db $08 $10 $4D
.db $08 $18 $45
.db $10 $00 $4F
.db $10 $08 $56
.db $10 $10 $45
.db $10 $18 $52

_LABEL_F48_:
	ld a, (iy + Entity.yPos.low)
	cp $80
	jp nc, updateEntityY
	ld hl, _RAM_C133_
	ld a, (iy + Entity.data05)
	dec a
	jr nz, +
	res 1, (hl)
	set 6, (hl)
	ret

+:
	res 2, (hl)
	set 7, (hl)
	ret

.INCLUDE "entities/updateExplosion.asm"

updateEntity09:
	ld a, (iy + Entity.data16)
	or a
	jr nz, +
	ld (iy + Entity.yVel.low), $00
	ld (iy + Entity.yVel.high), $55
	ld hl, entity09AnimationDescriptor
	ld (iy + Entity.animationDescriptorPointer.low), l
	ld (iy + Entity.animationDescriptorPointer.high), h
	ld (iy + Entity.data16), $01
	ld (iy + Entity.frame), $00
	ld a, $88
	ld (_RAM_CD00_), a
	ret

; Data from FE5 to FF3 (15 bytes)
entity09AnimationDescriptor:
.dw _DATA_FE7_

_DATA_FE7_:
.db $04
.db $00 $00 $1A
.db $00 $08 $1B
.db $08 $00 $1C
.db $08 $08 $1D

+:
	ld a, (iy + Entity.yPos.low)
	cp $C0
	jp nc, putIYEntityOffscreen
	jp updateEntityY

updateEntityY:
	ld d, (iy + Entity.yVel.low)
	ld e, (iy + Entity.yVel.high)
updateEntityYWith:
	ld h, (iy + Entity.yPos.low)
	ld l, (iy + Entity.yPos.high)
	add hl, de
	ld (iy + Entity.yPos.low), h
	ld (iy + Entity.yPos.high), l
	ret

updateEntityX:
	ld d, (iy + Entity.xVel.low)
	ld e, (iy + Entity.xVel.high)
updateEntityXWith:
	ld h, (iy + Entity.xPos.low)
	ld l, (iy + Entity.xPos.high)
	add hl, de
	ld (iy + Entity.xPos.low), h
	ld (iy + Entity.xPos.high), l
	ret

_LABEL_1027_:
	inc (iy + Entity.data13)
	ld a, (iy + Entity.data13)
	cp (iy + Entity.data14)
	jr nz, ++
	ld (iy + Entity.data13), $00
	inc (iy + Entity.frame)
	ld a, (iy + Entity.frame)
	cp (iy + Entity.data12)
	jr nz, +
	ld (iy + Entity.frame), $00
+:
	scf
	ret

++:
	xor a
	ret

_LABEL_1049_:
	ld (iy + Entity.data12), h
	ld (iy + Entity.data14), l
	ret

memcpyIYToHL:
	push iy
	pop de
	ldir
	ret

putIYEntityOffscreen:
	ld (iy + Entity.yPos.low), $D8
	ld (iy + Entity.xPos.low), $00
	ld (iy + Entity.data15), $01
	ret

putIXEntityOffscreen:
	ld (ix + Entity.yPos.low), $D8
	ld (ix + Entity.xPos.low), $00
	ld (ix + Entity.data15), $01
	ret

_LABEL_1070_:
	ld iy, _RAM_C740_
	ld b, $11
	ld de, $0020
-:
	ld a, (iy + Entity.data03)
	or a
	jr z, _LABEL_1091_
	ld a, (iy + Entity.yPos.low)
	cp $C4
	jr c, +
	cp $E0
	jr c, ++
+:
	ld a, (iy + Entity.xPos.low)
	cp $B5
	jr nc, ++
_LABEL_1091_:
	add iy, de
	djnz -
	ret

++:
	ld a, (iy + Entity.type)
	cp $0E
	call z, ++
	ld a, (iy + Entity.type)
	cp $11
	jr z, +
	cp $18
	jr z, +
	cp $19
	jr z, +
-:
	call putIYEntityOffscreen
	jr _LABEL_1091_

+:
	ld a, (iy + Entity.data1c)
	or a
	ret z
	ld a, $1E
	ld (_RAM_C32F_), a
	jp -

++:
	xor a
	ld (curvedBullet_RAM_C31F_), a
	ld (_RAM_C320_), a
	ld (_RAM_C321_), a
	ret

destroyEntities:
	ld hl, _RAM_C640_
	ld de, _RAM_C640_ + 1
	ld bc, $0320
	ld (hl), $00
	ldir
	ret

updateEntityXY:
	call updateEntityX
	jp updateEntityY

    ; Unused code
    call rng_LABEL_2D2A_
    and $0F
    cp $05
    ret c

    ld (iy + Entity.xPos.low), $30
    cp $0A
    ret c

    ld (iy + Entity.xPos.low), $80
    ret

    ; Unused code
    inc b
    nop
    nop
    ld e, $00
    ex af,af'
    rlca
    ex af,af'
    nop
    and l
    ex af,af'
    ex af,af'
    and (hl)
    inc b
    nop
    nop
    ld l,b
    nop
    ex af,af'
    ld l,c
    ex af,af'
    nop
    ld l,d
    ex af,af'
    ex af,af'
    ld l,e

_LABEL_110C_:
	ld iy, _RAM_C600_
	ld hl, _DATA_4F6_
	ld a, (_RAM_C104_)
	and $0F
	call +
	ld iy, _RAM_C620_
	ld hl, _DATA_524_
	ld a, (_RAM_C104_)
	and $F0
+:
	or a
	ret nz
	ld a, (iy + Entity.data1b)
	or a
	ret z
	dec (iy + Entity.data1a)
	jp nz, _LABEL_1027_
-:
	xor a
	ld (iy + Entity.data1b), a
	ld (iy + Entity.animationDescriptorPointer.low), l
	ld (iy + Entity.animationDescriptorPointer.high), h
	ld (iy + Entity.frame), a
	ld (iy + Entity.data12), $08
	ld (iy + Entity.data13), a
	ret

_LABEL_1149_:
	push iy
	push ix
	pop iy
	call -
	pop iy
	ret

updateEntity07:
	ld a, (iy + Entity.data03)
	or a
	jp nz, updateEntityXY
	ld hl, _DATA_11A2_
_LABEL_115F_:
	push hl
	call _LABEL_1183_
	pop hl
	ld a, $01
	ld (iy + Entity.data03), a
	ld (iy + Entity.data04), a
	ld (iy + Entity.animationDescriptorPointer.low), l
	ld (iy + Entity.animationDescriptorPointer.high), h
	ld a, $04
	add a, (iy + Entity.yPos.low)
	ld (iy + Entity.yPos.low), a
	ld a, $04
	add a, (iy + Entity.xPos.low)
	ld (iy + Entity.xPos.low), a
	ret

_LABEL_1183_:
	call loadPlayer1XYPosToHL
	ld a, (iy + Entity.data05)
	cp $01
	jr z, +
	call loadPlayer2XYPosToHL
+:
	ld d, l
	ld e, h
	call _LABEL_30BC_
	ld (iy + Entity.yVel.low), d
	ld (iy + Entity.yVel.high), e
	ld (iy + Entity.xVel.low), h
	ld (iy + Entity.xVel.high), l
	ret

_DATA_11A2_:
.dw _DATA_11A4_

_DATA_11A4_:
.db $01 $00 $00 $05

updateEntity20:
	ld a, (iy + Entity.data03)
	or a
	jr nz, +
	ld hl, _DATA_11C8_
	jp _LABEL_115F_

+:
	inc (iy + Entity.data1d)
	ld a, (iy + Entity.data1d)
	cp $40
	call c, _LABEL_1183_
	ld de, $0100
	call updateEntityYWith
	jp updateEntityX

_DATA_11C8_:
.dw _DATA_11CA_

_DATA_11CA_:
.db $01 $00 $00 $40

.INCLUDE "entities/updateEnemy1.asm"

updateEntity0B:
	ld a, (iy + Entity.data03)
	or a
	jp nz, _LABEL_1362_
	ld hl, _DATA_1316_
	ld bc, $0010
	call memcpyIYToHL
	call _LABEL_12F7_
	ld hl, $0210
	call _LABEL_1049_
	ld (iy + Entity.data05), $01
	ld (iy + Entity.data19), $38
	ld a, (_RAM_C603_)
	cp $01
	jr nz, +
	ld a, r
	rrca
	ret nc
+:
	ld a, (_RAM_C103_)
	bit 0, a
	ret z
	ld a, (_RAM_C622_)
	cp $02
	ret nz
	ld (iy + Entity.data05), $02
	ret

_LABEL_12F7_:
	call rng_LABEL_2D2A_
	ld c, a
	and $37
	ld b, a
	cp $08
	jr nc, +
	ld b, $08
+:
	ld a, c
	rrca
	jr c, +
	ld a, b
	add a, $50
	ld (iy + Entity.xPos.low), a
	ret

+:
	ld a, $55
	sub b
	ld (iy + Entity.xPos.low), a
	ret

_DATA_1316_:
.dw _DATA_1326_
.db $0B ; type
.db $01 ; data03
.db $04 ; data04
.db $00 ; data05
.db $00 ; yPos.low
.db $00 ; yPos.high
.db $00 ; xPos.low
.db $00 ; xPos.high
.db $00 ; data0a
.db $02 ; data0b
.db $02 ; data0c
.db $03 ; yVel.low
.db $00 ; yVel.high
.db $FF ; xVel.low

_DATA_1326_:
.dw _DATA_132A_
.dw _DATA_1337_

_DATA_132A_:
.db $04
.db $00 $00 $C4
.db $00 $08 $C5
.db $08 $00 $C6
.db $08 $08 $C7

_DATA_1337_:
.db $04
.db $00 $00 $C8
.db $00 $08 $C9
.db $08 $00 $CA
.db $08 $08 $CB

_DATA_1344_:
.dw _DATA_1348_
.dw _DATA_1355_

_DATA_1348_:
.db $04
.db $00 $00 $A4
.db $00 $08 $A5
.db $08 $00 $A6
.db $08 $08 $A7

_DATA_1355_:
.db $04
.db $00 $00 $A8
.db $00 $08 $A9
.db $08 $00 $AA
.db $08 $08 $AB

_LABEL_1362_:
	call _LABEL_13B0_
	ld a, (iy + Entity.data1f)
	or a
	jr nz, +++
	ld a, (iy + Entity.data18)
	or a
	jr nz, ++
	call updateEntityY
	call loadPlayer1XYPosToHL
	ld a, (iy + Entity.data05)
	dec a
	jr z, +
	call loadPlayer2XYPosToHL
+:
	ld a, l
	sub $30
	cp (iy + Entity.yPos.low)
	ret nc
	ld (iy + Entity.data18), $01
	ld a, (iy + Entity.xPos.low)
	cp h
	ret nc
	ld (iy + Entity.xVel.low), $01
	ld hl, _DATA_1344_
	ld (iy + Entity.animationDescriptorPointer.low), l
	ld (iy + Entity.animationDescriptorPointer.high), h
	ret

++:
	call _LABEL_1027_
	jp updateEntityX

+++:
	ld a, (iy + Entity.data05)
	ld c, a
	call _LABEL_2F92_
	ld (iy + Entity.type), $08
	ret

_LABEL_13B0_:
	dec (iy + Entity.data19)
	ret nz
	ld (iy + Entity.data19), $38
	jp fire_LABEL_3063_

loadPlayer1XYPosToHL:
	ld a, (player1.xPos.low)
	ld h, a
	ld a, (player1.yPos.low)
	ld l, a
	ret

loadPlayer2XYPosToHL:
	ld a, (player2.xPos.low)
	ld h, a
	ld a, (player2.yPos.low)
	ld l, a
	ret

updateEntity0C:
	ld a, (iy + Entity.data03)
	or a
	jr nz, _LABEL_144B_
_LABEL_13D3_:
	ld de, _RAM_C740_
	ld hl, $FF00
	ld bc, $0100
	call +
	ld de, _RAM_C760_
	ld hl, $0080
	call +
	ld de, _RAM_C780_
	ld bc, $FF00
	call +
	ld de, _RAM_C7A0_
	push bc
	pop hl
+:
	push hl
	push bc
	ld hl, _DATA_1416_
	ld a, (iy + Entity.type)
	cp $0C
	jr z, +
	ld hl, _DATA_1423_
+:
	ld bc, $000D
	ldir
	pop bc
	pop hl
	ex de, hl
	ld (hl), d
	inc hl
	ld (hl), e
	inc hl
	ld (hl), b
	inc hl
	ld (hl), c
	ex de, hl
	ret

; Data from 1416 to 1422 (13 bytes)
_DATA_1416_:
.dw _DATA_1430_
.db $0C
.db $01
.db $04
.db $00
.db $00
.db $00
.db $58
.db $00
.db $00
.db $00
.db $00

; Data from 1423 to 143E (28 bytes)
_DATA_1423_:
.dw _DATA_1430_
.db $13
.db $01
.db $04
.db $00
.db $00
.db $00
.db $58
.db $00
.db $00
.db $00
.db $00

_DATA_1430_:
.dw _DATA_1432_

_DATA_1432_:
.db $04
.db $00 $00 $88
.db $00 $08 $89
.db $08 $00 $8A
.db $08 $08 $8B

; Data from 143F to 144A (12 bytes)
_DATA_143F_:
.dw _DATA_1443_
.dw _DATA_1447_

_DATA_1443_:
.db $01
.db $04 $04 $8C

_DATA_1447_:
.db $01
.db $04 $04 $8D

_LABEL_144B_:
	ld a, (iy + Entity.data19)
	or a
	jr nz, +
	ld de, $0400
	ld a, (iy + Entity.yPos.low)
	cp $40
	jp c, updateEntityYWith
	ld (iy + Entity.data18), $30
	ld (iy + Entity.data19), $01
	ld (iy + Entity.data1a), $01
	ld de, _DATA_143F_
	ld (iy + Entity.animationDescriptorPointer.low), e
	ld (iy + Entity.animationDescriptorPointer.high), d
	ld hl, $0206
	jp _LABEL_1049_

+:
	call _LABEL_1027_
	ld a, (iy + Entity.data18)
	or a
	jr z, +
	dec (iy + Entity.data18)
	jp updateEntityXY

+:
	ld de, $0100
	call updateEntityYWith
	dec (iy + Entity.data1a)
	ret nz
	ld (iy + Entity.data1a), $20
	ld a, (iy + Entity.type)
	cp $13
	ret z
	jp fire_LABEL_3063_

updateEntity0D:
	ld a, (iy + Entity.data03)
	or a
	jp nz, _LABEL_1511_
	ld (iy + Entity.data18), $10
	ld (iy + Entity.data1c), $08
	ld hl, _DATA_14C7_
	ld bc, $0011
	call memcpyIYToHL
	ld a, (_RAM_C308_)
	or a
	ret z
	ld (iy + Entity.xPos.low), $00
	ld (iy + Entity.xVel.low), $05
	ld (iy + Entity.xVel.high), $00
	ret

; Data from 14C7 to 1510 (74 bytes)
_DATA_14C7_:
.dw _DATA_14D8_
.db $0D
.db $01
.db $04
.db $00
.db $20
.db $00
.db $A8
.db $00
.db $00
.db $02
.db $02
.db $00
.db $80
.db $FC
.db $00

_DATA_14D8_:
.dw entity0DSpriteDescriptor3
.dw entity0DSpriteDescriptor2
.dw entity0DSpriteDescriptor1
.dw entity0DSpriteDescriptor4
.dw entity0DSpriteDescriptor5

entity0DSpriteDescriptor1:
.db $02
.db $00 $04 $07
.db $08 $04 $27

entity0DSpriteDescriptor2:
.db $02
.db $04 $00 $2A
.db $04 $08 $2B

entity0DSpriteDescriptor3:
.db $02
.db $00 $04 $28
.db $08 $04 $29

entity0DSpriteDescriptor4:
.db $04
.db $00 $00 $2C
.db $00 $08 $2D
.db $08 $00 $2E
.db $08 $08 $2F

entity0DSpriteDescriptor5:
.db $04
.db $00 $00 $60
.db $00 $08 $61
.db $08 $00 $62
.db $08 $08 $63

_LABEL_1511_:
	dec (iy + Entity.data1c)
	call z, +++
	call ++++
	call updateEntityY
	ld h, (iy + Entity.xVel.low)
	ld l, (iy + Entity.xVel.high)
	ld e, (iy + Entity.data18)
	ld d, $00
	ld a, (_RAM_C308_)
	or a
	jr nz, +
	add hl, de
	jp ++

+:
	xor a
	sbc hl, de
++:
	ld (iy + Entity.xVel.low), h
	ld (iy + Entity.xVel.high), l
	ex de, hl
	ld e, $00
	jp updateEntityXWith

+++:
	ld (iy + Entity.data1c), $38
	jp fire_LABEL_3063_

++++:
	ld (iy + Entity.frame), $01
	ld a, (iy + Entity.xVel.low)
	or a
	ret z
	ld (iy + Entity.frame), $04
	cp $03
	ret c
	ld (iy + Entity.frame), $03
	cp $FE
	ret nc
	ld (iy + Entity.frame), $00
	rlca
	ret nc
	ld (iy + Entity.frame), $02
	ret

updateEntity0E:
	ld a, (iy + Entity.data03)
	or a
	jr nz, _LABEL_15B5_
	ld a, $01
	ld (curvedBullet_RAM_C31F_), a
	ld a, $FC
	ld (_RAM_C320_), a
	ld a, $50
	ld (_RAM_C321_), a
	ld hl, entity0EData
	ld bc, $0009
	call memcpyIYToHL
	ld hl, $0210
	jp _LABEL_1049_

; Data from 158E to 15B4 (39 bytes)
entity0EData:
.dw entity0EAnimationDescriptor
.db $0E
.db $01
.db $04
.db $00
.db $FC
.db $00
.db $50

entity0EAnimationDescriptor:
.dw _DATA_159B_
.dw _DATA_15A8_

_DATA_159B_:
.db $04
.db $00 $00 $80
.db $00 $08 $81
.db $08 $00 $82
.db $08 $08 $83

_DATA_15A8_:
.db $04
.db $00 $00 $84
.db $00 $08 $85
.db $08 $00 $86
.db $08 $08 $87

_LABEL_15B5_:
	ld de, $0040
	call updateEntityYWith
	ld a, (iy + Entity.yPos.low)
	ld (_RAM_C320_), a
	jp _LABEL_1027_

updateEntity0F:
	ld a, (iy + Entity.data03)
	or a
	jp nz, +
	ld hl, _DATA_1AAE_
	call _LABEL_15E0_
	ld a, (iy + Entity.xPos.low)
	cp $58
	jp c, _LABEL_1A80_
	ld (iy + Entity.xVel.low), $FF
	jp _LABEL_1A80_

_LABEL_15E0_:
	ld (iy + Entity.data03), $01
	ld (iy + Entity.animationDescriptorPointer.low), l
	ld (iy + Entity.animationDescriptorPointer.high), h
	ld (iy + Entity.yVel.low), $FE
	ld (iy + Entity.yVel.high), $00
	ld (iy + Entity.xVel.high), $80
	ret

+:
	ld a, (iy + Entity.data18)
	or a
	jp nz, _LABEL_1AD4_
_LABEL_15FE_:
	ld de, $0020
	ld h, (iy + Entity.yVel.low)
	ld l, (iy + Entity.yVel.high)
	ld a, h
	cp $02
	jr z, +
	add hl, de
	ld (iy + Entity.yVel.low), h
	ld (iy + Entity.yVel.high), l
+:
	ex de, hl
	call updateEntityYWith
	jp updateEntityX

_LABEL_161A_:
	ld de, $0280
	ld hl, _RAM_C103_
	ld a, (_RAM_C146_)
	dec a
	jr nz, +
	push hl
	ld hl, _DATA_164E_
	ld a, l
	ld (entities.1.animationDescriptorPointer.low), a
	ld a, h
	ld (entities.1.animationDescriptorPointer.high), a
	pop hl
	set 2, (hl)
	ex de, hl
	ld (_RAM_C60B_), hl
	ret

+:
	push hl
	ld hl, _DATA_165E_
	ld a, l
	ld (_RAM_C620_), a
	ld a, h
	ld (_RAM_C621_), a
	pop hl
	set 3, (hl)
	ex de, hl
	ld (_RAM_C62B_), hl
	ret

; Data from 164E to 165D (16 bytes)
_DATA_164E_:
.dw _DATA_166E_
.dw _DATA_541_
.dw _DATA_541_
.dw _DATA_541_
.dw _DATA_166E_
.dw _DATA_54E_
.dw _DATA_54E_
.dw _DATA_54E_

; Data from 165E to 1687 (42 bytes)
_DATA_165E_:
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

_LABEL_1688_:
	ld c, $08
	ld a, (_RAM_C146_)
	dec a
	jr nz, +
	ld a, c
	ld (_RAM_C61C_), a
	ret

+:
	ld a, c
	ld (_RAM_C63C_), a
	ret

_LABEL_169A_:
	ld hl, _RAM_C604_
	ld a, (_RAM_C146_)
	dec a
	jr z, +
	ld hl, _RAM_C624_
+:
	ld (hl), $01
	ret

_LABEL_16A9_:
	ld iy, _RAM_C600_
	ld a, (p1ScoreByte1)
	ld c, a
	ld a, (_RAM_C146_)
	dec a
	jr z, +
	ld iy, _RAM_C620_
	ld a, (_RAM_C128_)
	ld c, a
+:
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
	call _LABEL_255E_
	pop bc
	ld a, $10
	ld (_RAM_C11A_), a
	ld a, b
	ld (_RAM_C339_), a
	ret

_LABEL_16F8_:
	ld a, $0F
	ld (_RAM_C119_), a
	ld a, (_RAM_C146_)
	dec a
	jr nz, +
	ld a, $08
	ld (action9_RAM_C112_), a
	ret

+:
	ld a, $09
	ld (action10_RAM_C113_), a
	ret

_LABEL_170F_:
	ld hl, _RAM_C136_
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
	call _LABEL_A08_
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

_LABEL_1760_:
	ld a, (_RAM_C338_)
	or a
	ret z
	dec a
	ld (_RAM_C338_), a
	ret nz
	ld a, $11
	ld (_RAM_C11B_), a ; Related to _DATA_745_ jumptable
	ret

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
	ld a, (_RAM_C103_)
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
	ld a, (_RAM_C603_)
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

updateEntity15:
	ld a, (iy + Entity.data03)
	or a
	jr nz, _LABEL_1A0B_
	ld hl, _DATA_19DF_
	ld bc, $000E
	call memcpyIYToHL
	ld hl, $020A
	call _LABEL_1049_
	ld (iy + Entity.data18), $06
	ld hl, _RAM_C30B_
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

updateEntity16:
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
	ld (_RAM_C145_), a
	ld a, $0A
	ld (action11_RAM_C114_), a
	ld a, (iy + Entity.data05)
	ld (_RAM_C146_), a
	jp putIYEntityOffscreen

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
	ld a, (_RAM_C103_)
	rrca
	jr c, ++
--:
	ld a, (entities.1.type)
	cp $01
	jr z, +
-:
	ld (iy + Entity.data03), $00
	ret

+:
	ld (iy + Entity.data18), $01
	ret

++:
	ld a, (_RAM_C603_)
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
	call _LABEL_255E_
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
	ld a, (_RAM_C103_)
	rrca
	jr nc, +
	ld a, (hl)
	or a
	jr nz, ++
+:
	ld b, $01
	ld a, (_RAM_C603_)
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
