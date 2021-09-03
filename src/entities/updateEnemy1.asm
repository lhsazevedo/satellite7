

updateEnemy1:
	ld a, (iy + Entity.data03)
	or a
	jp nz, realUpdateEnemy1

	ld (iy + Entity.data1b), $00
	ld hl, enemy1Data
	ld bc, $0011
	call memcpyIYToHL

	ld (iy + Entity.data1d), $08

	; X velocity and position when spawing on left.
    ; ld de, $VVPP
	ld de, (ENTITY_ENEMY_1_X_VELOCITY << 8) + ENTITY_ENEMY_1_X_POS

    ; Velocity used when turning
	ld (iy + Entity.data18), e

    ; Flip the spaw side every 10 entities.
    ; This is done using a counter and a flag.
	ld hl, enemy1Counter
	inc (hl)
	ld a, (hl)
	cp $09
	jr c, @doNotFlipSides
	ld (hl), $01
	inc hl
	ld a, (hl)
	cpl
	ld (hl), a
	dec hl
    @doNotFlipSides:

	inc hl
	ld a, (hl)
	or a
	ret z

	; Starting on left
	ld (iy + Entity.data1b), $01
	ld (iy + Entity.xPos.low), e
	ld (iy + Entity.xVel.low), d
	ld hl, enemy1AnimationDescriptor2
	ld (iy + Entity.animationDescriptorPointer.low), l
	ld (iy + Entity.animationDescriptorPointer.high), h
	ret

enemy1Data:
.dw enemy1AnimationDescriptor1
.db ENTITY_ENEMY_1				; type
.db $01                         ; data03
.db $04                         ; data04
.db $00                         ; data05
.db ENTITY_ENEMY_1_Y_POS        ; yPos.low
.db $00                         ; yPos.high
.db $A8 - ENTITY_ENEMY_1_X_POS  ; xPos.low
.db $00                         ; xPos.high
.db $00                         ; data0a
.db $02                         ; data0b
.db $02                         ; data0c
.db ENTITY_ENEMY_1_Y_VEL        ; yVel.low
.db $00                         ; yVel.high
.db -ENTITY_ENEMY_1_X_VELOCITY  ; xVel.low
.db $00                         ; xVel.high

enemy1AnimationDescriptor1:
.dw _DATA_1258_
.dw _DATA_124B_
.dw _DATA_1231_

enemy1AnimationDescriptor2:
.dw _DATA_1231_
.dw _DATA_123E_
.dw _DATA_1258_

_DATA_1231_:
.db $04
.db $00 $00 $64
.db $00 $08 $65
.db $08 $00 $66
.db $08 $08 $67

_DATA_123E_:
.db $04
.db $00 $00 $68
.db $00 $08 $69
.db $08 $00 $6A
.db $08 $08 $6B

_DATA_124B_:
.db $04
.db $00 $00 $6C
.db $00 $08 $6D
.db $08 $00 $6E
.db $08 $08 $6F

_DATA_1258_:
.db $04
.db $00 $00 $70
.db $00 $08 $71
.db $08 $00 $72
.db $08 $08 $73

realUpdateEnemy1:
	dec (iy + Entity.data1d)
	call z, fire_LABEL_3063_

	ld a, (iy + Entity.data1a)
	or a
	jr nz, @turned

	inc (iy + Entity.data19)
	ld a, (iy + Entity.data19)
	cp ENTITY_ENEMY_1_STATE1_TIMER
	jr c, @turn

    ; First state, accelerate upwards and sideways?
	ld (iy + Entity.data13), ENTITY_ENEMY_1_ANIMATION_TIMER
	ld hl, $0001
	ld (iy + Entity.data1a), l
	ld (iy + Entity.yVel.low), l
	ld (iy + Entity.yVel.high), h
	ld (iy + Entity.xVel.low), l
	ld (iy + Entity.xVel.high), h
	ld a, (iy + Entity.data1b)
	or a
	jp z, fire_LABEL_3063_
	ld (iy + Entity.xVel.low), $FF
	jp fire_LABEL_3063_

; Turn
; Second state, change in horizontal velocity
@turn:
	call subData18FromYVel
	jp updateEntityX

; Turned
; Third state, already turned. Use data13 to update frame.
@turned:
	ld (iy + Entity.frame), $02
	ld a, (iy + Entity.data13)
	or a
	jp z, updateEntityXY

	ld (iy + Entity.frame), $01
	dec (iy + Entity.data13)
	jp updateEntityXY
