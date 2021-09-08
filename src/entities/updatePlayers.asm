player1.timer_data0b = player1.data0b
player2.timer_data0b = player2.data0b

Player.speedUp = Entity.data04
Player.playerNumber = Entity.data05

Player.autofireRate = Entity.data1c
player1.autofireRate = player1.data1c

updatePlayer1:
    ld a, (iy + Entity.data1b)
    cp $01
    jr nz, +
    ld de, $FF00
    ld a, (iy + Entity.yPos.low)
    cp $80
    jp nc, updateEntityYWith
    ld (iy + Entity.data1b), $02
    ld hl, _RAM_C104_
    res 0, (hl)
    set 1, (hl)
    ret

+:
    ld a, (input.player1)
    jr ++

updatePlayer2:
    ld a, (iy + Entity.data1b)
    cp $01
    jr nz, +
    ld de, $FF00
    ld a, (iy + Entity.yPos.low)
    cp $80
    jp nc, updateEntityYWith
    ld (iy + Entity.data1b), $02
    ld hl, _RAM_C104_
    res 4, (hl)
    set 5, (hl)
    ret

+:
    ld a, (input.player2)
++:
    ld (_RAM_C12E_), a
    ld a, (iy + Entity.data18)
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
    call nz, moveUp
    bit 1, c
    call nz, moveDown
    bit 2, c
    call nz, moveLeft
    bit 3, c
    call nz, moveRight
++:
    ld a, (iy + Entity.data19)
    or a
    ret z
    ld a, (iy + Entity.data18)
    call _LABEL_1027_
    inc (iy + Entity.data19)
    ld a, (iy + Entity.data19)
    cp $20
    ret c
    xor a
    ld (iy + Entity.data18), a
    ld (iy + Entity.data19), a
    ld (iy + Entity.frame), a
    ld (iy + Entity.data13), a
    ret

moveUp:
    ld a, (iy + Entity.yPos.low)
    cp $40
    ret c
    ld de, -$0100
    ld a, (iy + Player.speedUp)
    or a
    jp z, updateEntityYWith
    ld de, -$01C0
    jp updateEntityYWith

moveDown:
    ld a, (iy + Entity.yPos.low)
    cp $B0
    ret nc
    ld de, $0100
    ld a, (iy + Player.speedUp)
    or a
    jp z, updateEntityYWith
    ld de, $01A0
    jp updateEntityYWith

moveLeft:
    ld a, (iy + Entity.xPos.low)
    cp $08
    ret c
    ld de, -$0100
    ld a, (iy + Player.speedUp)
    or a
    jp z, updateEntityXWith
    ld de, -$01C0
    jp updateEntityXWith

moveRight:
    ld a, (iy + Entity.xPos.low)
    cp $A8
    ret nc
    ld de, $0100
    ld a, (iy + Player.speedUp)
    or a
    jp z, updateEntityXWith
    ld de, $01A0
    jp updateEntityXWith
