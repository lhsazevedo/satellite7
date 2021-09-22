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
    ld a, SOUND_8A
    ld (soundRequest), a
    ld hl, _RAM_C104_
    ld a, (iy + Entity.data05)
    cp $01
    jr nz, +
    set 2, (hl)
    ld hl, flags_RAM_C103_
    res 2, (hl)
    ret

+:
    set 6, (hl)
    ld hl, flags_RAM_C103_
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
    ld a, (flags_RAM_C103_)
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
    ld hl, gameplay_flags_RAM_C133_
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
    ld a, SOUND_88
    ld (soundRequest), a
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
    call getRandomByte
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
    ld iy, player1
    ld hl, player1AnimationDescriptor
    ld a, (_RAM_C104_)
    and $0F
    call +
    ld iy, player2
    ld hl, player2AnimationDescriptor
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

updateEnemyBullet:
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

.INCLUDE "entities/updateDragonfly.asm"

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
    ld a, (player1.data03)
    cp $01
    jr nz, +
    ld a, r
    rrca
    ret nc
+:
    ld a, (flags_RAM_C103_)
    bit 0, a
    ret z
    ld a, (_RAM_C622_)
    cp $02
    ret nz
    ld (iy + Entity.data05), $02
    ret

_LABEL_12F7_:
    call getRandomByte
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
    call enemyFire
    ld (iy + Entity.type), $08
    ret

_LABEL_13B0_:
    dec (iy + Entity.data19)
    ret nz
    ld (iy + Entity.data19), $38
    jp enemyRandomFire

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
    jp enemyRandomFire

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
    jp enemyRandomFire

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

updateDropStar:
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
