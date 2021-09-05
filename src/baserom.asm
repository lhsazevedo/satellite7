; This disassembly was created using Emulicious (https://www.emulicious.net)
.MEMORYMAP
DEFAULTSLOT 0
SLOTSIZE $8000
SLOT 0 $0000
.ENDME

.ROMBANKMAP
BANKSTOTAL 1
BANKSIZE $8000
BANKS 1
.ENDRO

.EMPTYFILL $FF

.INCLUDE "constants.asm"
.INCLUDE "structs.asm"
.INCLUDE "variables.asm"
.INCLUDE "macros.asm"

; Ports
.define Port_PSG $7F
.define Port_VDPData $BE
.define Port_VDPAddress $BF
.define _PORT_DE_ $DE
.define _PORT_DF_ $DF

; Input Ports
.define Port_VDPStatus $BF
.define Port_IOPort1 $DC
.define Port_IOPort2 $DD

.BANK 0 SLOT 0
.ORG $0000

start:
	di
	ld sp, $C0FF
	im 1
	jr _LABEL_69_

_LABEL_8_:
	call writeVDPCommandWord
	in a, (Port_VDPData)
	ld b, a
	push af
	pop af
	in a, (Port_VDPData)
	ld c, a
	ret

_DATA_14_:
.dw _DATA_506_
.dw _DATA_513_

writeToVdpAddress:
	push af
	call setVDPWriteAddress
	pop af
	out (Port_VDPData), a
	ret

_LABEL_20_:
	call setVDPWriteAddress
	ld a, c
	or a
	jr z, +
	inc b
+:
	ld a, b
	ld b, c
	ld c, Port_VDPData
-:
	outi
	jp nz, -
	dec a
	jp nz, -
	ret

_DATA_36_:
.dw _DATA_2157_

handleInterruptEntrypoint:
	jp handleInterrupt

palette:
.db $0A $06 $05 $00 $29 $25 $3A $3F $34 $3B $03 $0F $0C $08 $0B $02
.db $00 $00 $03 $00 $3F $3F $3A $02 $0B $0C $08 $0F $34 $22 $21 $02

; Data from 5B to 65 (11 bytes)
_DATA_5B_:
.dw _DATA_14_
.db $01
.db $01
.db $00
.db $01
.db $C0
.db $00
.db $70

_DATA_64_:
.dw _DATA_21CA_

_LABEL_66_:
	jp _LABEL_21B_

_LABEL_69_:
	ld hl, _RAM_C000_
	ld de, _RAM_C000_ + 1
	ld (hl), $00
	ld bc, $1FFF
	ldir
	ld de, _RAM_D100_
	ld hl, _DATA_5F6_
	call extract
	ld (de), a
	ld de, _RAM_D300_
	ld hl, map
	call extract
	call _LABEL_14A_
	call _LABEL_BA9_
	call _LABEL_BE7_
	call _LABEL_159_
	call clearTilemap
	ld hl, (terrainTiles)
	ld bc, $58D5
	ld de, $2000
	call _LABEL_313C_

	; Bomb, explosions, player, numbers, stars
	ld hl, (baseTiles)
	ld de, $0000
	ld bc, $440E
	call _LABEL_313C_

	ld hl, characterTiles
	ld de, $0820
	ld b, $F8
	call _LABEL_16C_

	call load_some_tiles_LABEL_A90_

	ld hl, mark3Tiles
	ld de, $1C80
	ld b, $B0
	call _LABEL_16C_

	; Load title tiles
	call _LABEL_36A1_

	; Strange tiles
	call _LABEL_31B2_

	ld hl, palette
	ld de, $C000
	ld bc, $0020
	rst $20	; _LABEL_20_

	call _LABEL_BEE_
	ld de, $81E0
	ld a, e
	ld (_RAM_C101_), a
	call writeVDPCommandWord

	ld a, STATE_MARK_3_LOGO
	ld (state), a

_LABEL_EB_:
	di
	call _LABEL_13C_
	call _LABEL_3C65_
	ld a, $01 ; jumpToClearTilemap
	ld (action2_RAM_C10B_), a ; Related to _DATA_745_ jumptable
	ld a, $06 ; clearSprites
	ld (action7_RAM_C110_), a ; Related to _DATA_745_ jumptable
	xor a
	ld (_RAM_C133_), a
	ld hl, _RAM_C103_
	res 7, (hl)
	ld de, $8900
	call writeVDPCommandWord

update:
	ei
	ld a, (interruptFlag)
	or a
	jp z, update
	xor a
	ld (interruptFlag), a

	ld a, (state)

	; Mark 3 Logo
	rrca
	jp c, updateMark3LogoState

	; Push Start screen
	rrca
	jp c, updateStartScreenState

	; Demo
	rrca
	jp c, updateDemoState

	; Gameplay
	rrca
	jp c, updateGameplayState

	; Paused
	rrca
	jp c, updatePauseState

	; @TODO
	jp _LABEL_EB_

    ; Unused code 
    ld de, _RAM_C301_
    ld hl, _RAM_C300_
    ld bc, $01FF
    jr +

_LABEL_13C_:
	ld de, _RAM_C133_ + 1
	ld hl, _RAM_C133_
	ld bc, $0FCD
+:
	ld (hl), $00
	ldir
	ret

_LABEL_14A_:
	ld b, $02
--:
	push bc
	ld bc, $FFFF
-:
	dec bc
	ld a, b
	or c
	jr nz, -
	pop bc
	djnz --
	ret

_LABEL_159_:
	ld a, $92
	out (_PORT_DF_), a
	ld hl, _RAM_C103_
	set 6, (hl)
	xor a
	out (_PORT_DE_), a
	in a, (_PORT_DE_)
	or a
	ret z
	res 6, (hl)
	ret

_LABEL_16C_:
	ld a, e
	out (Port_VDPAddress), a
	ld a, d
	or $40
	out (Port_VDPAddress), a
-:
	xor a
	out (Port_VDPData), a
	push af
	pop af
	xor a
	out (Port_VDPData), a
	ld a, (hl)
	push af
	pop af
	out (Port_VDPData), a
	nop
	xor a
	out (Port_VDPData), a
	inc hl
	djnz -
	ret

; Extract RLE compressed data from HL to DE
extract:
	ld a, (hl)
	cp $FF
	ret z
	bit 7, a
	jr nz, @raw
	ld b, a
	inc hl
	ld a, (hl)
@runLoop:
	ld (de), a
	cp $FF
	ret z
	inc de
	djnz @runLoop
	inc hl
	jp extract

@raw:
	and $7F
	ld b, a
@rawLoop:
	inc hl
	ld a, (hl)
	ld (de), a
	cp $FF
	ret z
	inc de
	djnz @rawLoop
	inc hl
	jp extract

handleInterrupt:
	push af
	in a, (Port_VDPStatus)
	push bc
	push de
	push hl
	push ix
	push iy
	ld a, $FF
	ld (interruptFlag), a

	ld a, (state)
	cp STATE_PAUSED
	jr z, _LABEL_211_

	call _LABEL_B93_

	ld a, $1F
	out (Port_VDPAddress), a
	ld a, $C0
	out (Port_VDPAddress), a
	ld a, r
	and $0F
	out (Port_VDPData), a

	call _LABEL_724_
	call _LABEL_2B98_
	call _LABEL_2222_
	ld hl, _RAM_C12D_
	inc (hl)
	ld a, (hl)
	rrca
	jp c, +
	call _LABEL_2AE6_
	call _LABEL_2FD2_
	call _LABEL_2D63_
	call _LABEL_3894_
	call _LABEL_110C_
	jp _LABEL_211_

+:
	call _LABEL_170F_
	call _LABEL_1760_
	call _LABEL_25F1_
	call _LABEL_2682_
	ld hl, _RAM_C108_
	inc (hl)
	ld a, (hl)
	cp $02
	jr c, _LABEL_211_
	ld (hl), $00
_LABEL_211_:
	pop iy
	pop ix
	pop hl
	pop de
	pop bc
	pop af
	ei
	ret

_LABEL_21B_:
	push af
	ld a, (state)
	cp STATE_PAUSED
	jr z, +
	cp STATE_GAMEPLAY
	jr nz, _LABEL_22F_
	ld (statebak_RAM_C11E_), a
	ld a, STATE_PAUSED
	ld (state), a
_LABEL_22F_:
	pop af
	retn

+:
	ld a, (statebak_RAM_C11E_)
	ld (state), a
	ld a, (_RAM_C14A_)
	cp $03
	jr nz, +
	ld a, (_RAM_C14B_)
	cp $07
	jr nz, +
	ld a, (_RAM_C103_)
	or $80
	ld (_RAM_C103_), a
	jr ++

+:
	ld a, (_RAM_C103_)
	and $7F
	ld (_RAM_C103_), a
++:
	xor a
	ld (_RAM_C14A_), a
	ld (_RAM_C14B_), a
	jr _LABEL_22F_

updatePauseState:
	call _LABEL_3C65_
	ld a, (_RAM_C103_)
	rrca
	jr c, ++
	call _LABEL_2222_
	ld a, (_RAM_C130_)
	bit 4, a
	jr z, +
	ld hl, _RAM_C14A_
	inc (hl)
+:
	bit 5, a
	jr z, ++
	ld hl, _RAM_C14B_
	inc (hl)
++:
	jp update

updateGameplayState:
	ld a, (_RAM_C133_)
	bit 0, a
	jp z, _LABEL_345_
	bit 3, a
	call nz, _LABEL_369_
	call _LABEL_2301_
	call updateEntities
	ld a, (_RAM_C319_)
	cpl
	ld (_RAM_C319_), a
	or a
	call nz, _LABEL_1070_
	call _LABEL_2484_
	call _LABEL_39E_
	ld a, (_RAM_C103_)
	rrca
	jr c, ++
	ld a, (_RAM_C133_)
	bit 6, a
	jp z, update
	call _LABEL_70E_
	jr nz, +
	ld a, (_RAM_C300_)
	inc a
	ld (_RAM_C300_), a
	cp $E0
	jp c, update
+:
	ld iy, _RAM_C600_
	call putIYEntityOffscreen
	jp +++

++:
	ld a, (_RAM_C133_)
	and $C0
	jp z, update
	cp $40
	jr z, ++++
	cp $80
	jr z, _LABEL_324_
	call _LABEL_70E_
	jr nz, +
	ld a, (_RAM_C300_)
	inc a
	ld (_RAM_C300_), a
	cp $E0
	jp c, update
+:
	ld iy, _RAM_C600_
	call putIYEntityOffscreen
	ld iy, _RAM_C620_
	call putIYEntityOffscreen
	ld a, (_RAM_C133_)
	and $F9
	ld (_RAM_C133_), a
+++:
	ld a, STATE_MARK_3_LOGO
	ld (state), a

	jp _LABEL_EB_

++++:
	call +
	jp c, update
	ld hl, _RAM_C133_
	res 1, (hl)
	ld iy, _RAM_C600_
	call putIYEntityOffscreen
	jp update

_LABEL_324_:
	call +
	jp c, update
	ld hl, _RAM_C133_
	res 2, (hl)
	ld iy, _RAM_C620_
	call putIYEntityOffscreen
	jp update

+:
	ld a, (_RAM_C301_)
	inc a
	ld (_RAM_C301_), a
	cp $E0
	ret c
	xor a
	ret

_LABEL_345_:
	ld a, (state)
	cp STATE_DEMO
	jr z, +
	ld hl, _RAM_C123_
	ld (hl), $00
	ld de, _RAM_C123_ + 1
	ld bc, $0007
	ldir
+:
	call _LABEL_BFC_
	ld a, $09
	ld (_RAM_C133_), a
	ld a, $83
	ld (_RAM_CD00_), a
	jp update

_LABEL_369_:
	ld hl, _RAM_C133_
	res 3, (hl)
	ld a, (_RAM_C103_)
	rrca
	jp c, +
	ld a, (_RAM_C133_)
	bit 1, a
	ret nz
	jp _LABEL_48D_

+:
	ld a, (_RAM_C133_)
	and $06
	cp $06
	ret z
	bit 6, a
	jr nz, +
	ld a, (_RAM_C133_)
	and $42
	jp nz, +
	call _LABEL_48D_
+:
	ld a, (_RAM_C133_)
	and $84
	ret nz
	jp _LABEL_48D_

_LABEL_39E_:
	ld a, (_RAM_C133_)
	bit 6, a
	jp nz, _LABEL_3FF_
	ld a, (_RAM_C104_)
	bit 1, a
	jr z, +
	and $F0
	ld (_RAM_C104_), a
	jr _LABEL_3FF_

+:
	and $48
	cp $08
	jp nz, _LABEL_3FF_
	ld a, (_RAM_C104_)
	and $F7
	or $01
	ld (_RAM_C104_), a
	ld hl, _RAM_C133_
	set 3, (hl)
	ld a, (p1Lives)
	dec a
	jp p, +++
	ld a, (_RAM_C104_)
	and $F0
	ld (_RAM_C104_), a
	ld hl, _RAM_C133_
	set 1, (hl)
	ld a, $06
	ld (entities.1.type), a
	ld a, $01
	ld (_RAM_C605_), a
	ld a, (_RAM_C103_)
	rrca
	jr nc, +
	ld a, (_RAM_C133_)
	and $84
	jr z, ++
+:
	call _LABEL_456_
++:
	xor a
+++:
	ld (p1Lives), a
	call _LABEL_45C_
_LABEL_3FF_:
	ld a, (_RAM_C103_)
	rrca
	ret nc
	ld a, (_RAM_C104_)
	bit 5, a
	jr z, +
	and $0F
	ld (_RAM_C104_), a
	ret

+:
	bit 7, a
	ret z
	bit 2, a
	ret nz
	and $7F
	or $10
	ld (_RAM_C104_), a
	ld hl, _RAM_C133_
	bit 7, (hl)
	ret nz
	set 3, (hl)
	ld a, (_RAM_C106_)
	dec a
	jp p, ++
	ld a, (_RAM_C104_)
	and $0F
	ld (_RAM_C104_), a
	ld hl, _RAM_C133_
	set 2, (hl)
	ld a, $06
	ld (_RAM_C622_), a
	ld a, $02
	ld (_RAM_C625_), a
	ld a, (_RAM_C133_)
	and $42
	jr z, +
	call _LABEL_456_
+:
	xor a
++:
	ld (_RAM_C106_), a
	call _LABEL_46C_
	ret

_LABEL_456_:
	ld a, $84
	ld (_RAM_CD00_), a
	ret

_LABEL_45C_:
	or a
	push af
	ld a, (p1Lives)
	cp $0A
	jr c, +
	ld a, $09
	ld (p1Lives), a
	jr +

_LABEL_46C_:
	scf
	push af
	ld a, (_RAM_C106_)
	cp $0A
	jr c, +
	ld a, $09
	ld (_RAM_C106_), a
+:
	ld b, $30
	add a, b
	ld b, a
	pop af
	jr c, +
	ld de, $3D38
	jr ++

+:
	ld de, $3DB8
++:
	ld a, b
	jp writeToVdpAddress

_LABEL_48D_:
	ld a, (_RAM_C104_)
	bit 0, a
	jr z, +
	ld de, _RAM_C600_
	ld hl, _DATA_5B_
	ld bc, $0009
	ldir
	ld a, $FF
	ld (_RAM_C61A_), a
	ld a, $01
	ld (_RAM_C61B_), a
	ld a, $02
	ld (_RAM_C612_), a
	ld a, $03
	ld (_RAM_C614_), a
	ld a, $18
	ld (_RAM_C61C_), a
	ld (_RAM_C302_), a
	ld a, (_RAM_C103_)
	bit 0, a
	jr nz, +

	; Respaw position
	ld a, $58
	ld (player1.xPos.low), a
	ret

+:
	ld a, (_RAM_C104_)
	bit 4, a
	ret z
	ld de, _RAM_C620_
	ld hl, _DATA_517_
	ld bc, $0009
	ldir
	ld a, $FF
	ld (_RAM_C63A_), a
	ld a, $01
	ld (_RAM_C63B_), a
	ld a, $02
	ld (_RAM_C632_), a
	ld a, $03
	ld (_RAM_C634_), a
	ld a, $18
	ld (_RAM_C63C_), a
	ld (_RAM_C303_), a
	ret

; Data from 4F6 to 516 (33 bytes)
_DATA_4F6_:
.dw _DATA_506_
.dw _DATA_541_
.dw _DATA_541_
.dw _DATA_541_
.dw _DATA_506_
.dw _DATA_54E_
.dw _DATA_54E_
.dw _DATA_54E_

_DATA_506_:
.db $04
.db $00 $00 $10
.db $00 $08 $11
.db $08 $00 $12
.db $08 $08 $13

_DATA_513_:
.db $01
.db $04 $04 $00

; Data from 517 to 523 (13 bytes)
_DATA_517_:
.dw _DATA_520_
.db $02 ; type
.db $01 ; data03
.db $00 ; data04
.db $02 ; data05
.db $C0 ; yPos.low
.db $00 ; yPos.high
.db $40 ; xPos.low

_DATA_520_:
.dw _DATA_534_
.db $13 $05

; Data from 524 to 55A (55 bytes)
_DATA_524_:
.dw _DATA_534_
.dw _DATA_541_
.dw _DATA_541_
.dw _DATA_541_
.dw _DATA_534_
.dw _DATA_54E_
.dw _DATA_54E_
.dw _DATA_54E_

_DATA_534_:
.db $04
.db $00 $00 $10
.db $00 $08 $11
.db $08 $00 $14
.db $08 $08 $15

_DATA_541_:
.db $04
.db $00 $00 $08
.db $00 $08 $09
.db $08 $00 $0A
.db $08 $08 $0B

_DATA_54E_:
.db $04
.db $00 $00 $0C
.db $00 $08 $0D
.db $08 $00 $0E
.db $08 $08 $0F

updateDemoState:
	call _LABEL_70E_
	cp $02
	jr z, +
	ld a, (_RAM_C133_)
	bit 1, a
	jr nz, +
	bit 2, a
	jr nz, +
	ld a, (_RAM_C150_)
	or a
	jr z, ++
	ld a, $01
	ld (_RAM_C123_), a
	ld (_RAM_C127_), a
	call +++
	ld a, (_RAM_C150_)
	cp $E0
	jp nz, updateGameplayState
+:
	ld a, STATE_MARK_3_LOGO
	ld (state), a
	jp _LABEL_EB_

++:
	ld hl, _RAM_C151_
	set 1, (hl)
	ld a, (_RAM_C103_)
	or $01
	ld (_RAM_C103_), a
	ld a, $FF
	ld (_RAM_C150_), a
	jp update

+++:
	di
	ld de, $0000
	ld a, (_RAM_C14E_)
	inc a
	ld (_RAM_C14E_), a
	cp $04
	jr nz, +
	xor a
	ld (_RAM_C14E_), a
	ld de, (_RAM_C14C_)
	inc de
	ld (_RAM_C14C_), de
	ld hl, _RAM_D100_
	add hl, de
	ld a, (hl)
	cp $FF
	jr z, ++
	ld (_RAM_C14F_), a
+:
	ld a, (_RAM_C14F_)
	ld b, a
	ld a, r
	rrca
	ld a, b
	jr c, +
	or $20
+:
	ld (_RAM_C12F_), a
	xor $0C
	ld (_RAM_C131_), a
	ld a, (_RAM_C14E_)
	or a
	ret nz
	ld a, (_RAM_C12F_)
	ld (_RAM_C130_), a
	xor $0C
	ld (_RAM_C132_), a
	ret

++:
	ld a, $E0
	ld (_RAM_C150_), a
	ret

; Data from 5F6 to 619 (36 bytes)
_DATA_5F6_:
.db $2B $00 $89 $06 $04 $04 $06 $06 $04 $04 $06 $04 $06 $00 $04 $02
.db $05 $06 $82 $04 $04 $03 $00 $0F $01 $09 $08 $81 $00 $09 $04 $03
.db $05 $0B $00 $03

; 2nd entry of Pointer Table from 4058 (indexed by unknown)
; Data from 61A to 61D (4 bytes)
_DATA_61A_:
.db $01 $04 $00 $03

; 2nd entry of Pointer Table from 3F5A (indexed by unknown)
; Data from 61E to 680 (99 bytes)
_DATA_61E_:
.db $02 $04 $06 $83 $04 $06 $04 $07 $00 $07 $08 $05 $01 $84 $00 $00
.db $02 $02 $06 $06 $03 $04 $81 $06 $09 $00 $03 $04 $83 $05 $04 $00
.db $08 $0A $82 $08 $09 $08 $01 $04 $05 $06 $04 $83 $00 $02 $02 $06
.db $06 $03 $04 $87 $06 $02 $02 $06 $06 $04 $04 $0A $05 $03 $01 $81
.db $09 $03 $08 $81 $00 $07 $06 $83 $04 $05 $05 $12 $01 $81 $02 $35
.db $06 $82 $04 $04 $09 $05 $09 $04 $13 $00 $81 $01 $18 $05 $82 $04
.db $06 $01 $FF

updateStartScreenState:
	call +++
	xor a
	ld hl, (_RAM_C148_)
	cp h
	jr nz, +
	cp l
	call z, ++
+:
	inc hl
	ld (_RAM_C148_), hl
	ld a, h
	cp $03
	jp c, update
	ld a, STATE_DEMO
	ld (state), a
	xor a
	ld (action5_RAM_C10E_), a ; Related to _DATA_745_ jumptable
	jp _LABEL_EB_

++:
	di
	push hl
	call _LABEL_36A1_
	pop hl
	ld a, $01 ; jumpToClearTilemap
	ld (action2_RAM_C10B_), a ; Related to _DATA_745_ jumptable
	ld a, $02 ; drawBlueBG
	ld (action3_RAM_C10C_), a ; Related to _DATA_745_ jumptable
	ld a, $04 ; drawMenu
	ld (action5_RAM_C10E_), a ; Related to _DATA_745_ jumptable

	ld a, $81
	ld (_RAM_CD00_), a
	ret

+++:
	ld hl, _RAM_C103_
	ld a, (_RAM_C130_)
	and $30
	jr z, +
	res 0, (hl)
	jr ++

+:
	ld a, (_RAM_C132_)
	and $30
	ret z
	set 0, (hl)
++:
	ld hl, state
	ld (hl), STATE_GAMEPLAY
	ret

updateMark3LogoState:
	ld a, (_RAM_C152_)
	or a
	call z, +++

	call _LABEL_70E_
	cp $02
	jr z, ++
	ld hl, _RAM_C148_
	inc (hl)
	ld a, (hl)
	cp MARK_3_LOGO_TIMER
	jr z, +
	jp update

+:
	call ++++
++:
	xor a
	ld (action3_RAM_C10C_), a
	jp _LABEL_EB_

+++:
	ld a, $02 ; drawBlueBG
	ld (action3_RAM_C10C_), a ; Related to _DATA_745_ jumptable

	
	ld a, $05 ; drawMark3Logo
	ld (action6_RAM_C10F_), a ; Related to _DATA_745_ jumptable
	ld (_RAM_C152_), a
	ret

_LABEL_70E_:
	ld a, (_RAM_C130_)
	and $30
	or a
	jr nz, ++++
	ld a, (_RAM_C132_)
	and $30
	or a
	ret z
++++:
	ld a, STATE_START_SCREEN
	ld (state), a
	or a
	ret

_LABEL_724_:
	; Here HL is $C10A but later
	; it is incrementend to $C10B.
	; Thus, $C10B is the real index.
	ld hl, action1_RAM_C10A_
	ld b, $12
-:
	push hl
	push bc
	ld a, (hl)
	or a
	call nz, +
	pop bc
	pop hl
	inc hl
	djnz -
	ret

+:
	ld (hl), $00
	add a, a
	ld e, a
	ld d, $00
	ld hl, _DATA_745_ - 2
	add hl, de
	ld e, (hl)
	inc hl
	ld d, (hl)
	ex de, hl
	jp (hl)

; Jump Table from 745 to 76C (20 entries, indexed by action1_RAM_C10A_)
_DATA_745_:
.dw jumpToClearTilemap
.dw drawBlueBG
.dw setBGColorsToBlack
.dw drawMenu
.dw drawMark3Logo
.dw clearSprites
.dw drawInfoBar
.dw _LABEL_9BD_
.dw _LABEL_9C9_
.dw _LABEL_9D5_
.dw _LABEL_A3E_
.dw load_some_tiles_LABEL_A90_
.dw _LABEL_A9C_
.dw _LABEL_ABB_
.dw _LABEL_AC1_
.dw _LABEL_AD8_
.dw _LABEL_B0F_
.dw _LABEL_B2C_
.dw _LABEL_B2C_
.dw _LABEL_B2C_

; 1st entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
jumpToClearTilemap:
	jp clearTilemap

; 5th entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
drawMark3Logo:
	ld a, $08
	ld (_RAM_C12B_), a
	ld de, $3A4C
	ld hl, segaMark3Logo
	ld bc, $0213
	jp _LABEL_B5E_

; Data from 781 to 7A6 (38 bytes)
segaMark3Logo:
.db $46 $4A $46 $4A $46 $4A $4B $E4 $00 $E5 $E6 $4B $E4 $E7 $E8 $E9
.db $EA $EB $EC $ED $EE $EF $F0 $F1 $F2 $F3 $F4 $00 $F5 $F6 $F3 $F4
.db $F7 $F8 $F9 $57 $58 $44

; 3rd entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
setBGColorsToBlack:
	; Set PAL1 1st color to black
	ld a, $00
	ld de, $C010
	rst $18	; writeToVdpAddress

	; Set PAL0 4th color to black
	ld a, $00
	ld de, $C003
	jp writeToVdpAddress

; 4th entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
drawMenu:
	ld hl, logo
	ld de, $390A
	ld bc, $042A
	call drawTileArea

	ld hl, sevenTop
	ld de, $38EE
	ld b, $02
	ld a, $08
	ld (_RAM_C12B_), a
	call drawTiles
	ld a, $D6
	out (Port_VDPData), a
	push af
	pop af
	ld a, $0A
	out (Port_VDPData), a

	; Draw player 1 push start text
	ld de, $3B88
	ld hl, pushStartText
	ld b, $18
	call drawTiles
	ld de, $3C1A
	ld hl, orText
	ld b, $02
	call drawTiles

	; Draw player 2 push start text
	ld de, $3C88
	ld hl, pushStartText
	ld b, $18
	call drawTiles
	ld a, $32
	ld de, $3C92
	rst $18	; writeToVdpAddress

	; Draw copyright text
	ld de, $3DC8
	ld hl, copyrightText
	ld b, $18
	jp drawTiles

pushStartText:
.db $50 $55 $53 $48 $20 $31 $20 $50 $4C $41 $59 $20 $53 $54 $41 $52
.db $54 $20 $42 $55 $54 $54 $4F $4E

orText:
.db $4F $52

copyrightText:
.db $4F $52 $49 $47 $49 $4E $41 $4C $20 $47 $41 $4D $45 $20
.db $5B $5C $5D $5E $5F $20 $31 $39 $38 $35

sevenTop:
.db $D6 $BD

logo:
.db $BE $08 $BF $08 $C0 $08 $C0 $0A $C1 $08 $C1 $0A $C2 $08 $C3 $08
.db $C4 $08 $00 $08 $C4 $08 $00 $08 $C4 $08 $C1 $08 $C1 $0A $C2 $08
.db $C3 $08 $00 $08 $D6 $0C $C5 $08 $C6 $08 $C7 $08 $CD $0E $C8 $08
.db $C8 $0A $C9 $08 $C9 $0A $C7 $08 $D6 $0A $CA $08 $00 $08 $CA $08
.db $00 $08 $CA $08 $C9 $08 $C9 $0A $C7 $08 $D6 $0A $CB $08 $CB $0A
.db $CC $08 $CC $0E $CD $08 $C7 $0E $CE $08 $CE $0A $C9 $08 $C9 $0A
.db $C7 $0C $D6 $0E $CA $08 $00 $08 $CA $08 $00 $08 $CA $08 $C9 $08
.db $C9 $0A $C7 $0C $D6 $0E $CB $0C $CF $08 $D0 $08 $D1 $08 $BF $0E
.db $BE $0E $D2 $08 $D2 $0A $D3 $08 $D3 $0A $C2 $0C $C3 $08 $C2 $0C
.db $C3 $08 $C2 $0C $C3 $08 $C4 $0C $D3 $08 $D3 $0A $C2 $0C $C3 $08
.db $00 $08 $D4 $08 $D5 $08 $00 $08

; 2nd entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
drawBlueBG:
	; Set PAL1 1st color to blue
	ld a, $34
	ld de, $C010
	rst $18	; writeToVdpAddress

	; Set PAL0 4th color to blue
	ld de, $C003
	rst $18	; writeToVdpAddress

	; Fill BG with blue tile
	ld h, $08
	ld l, $20
	jp fillTilemap

; 6th entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
clearSprites:
	ld de, $3F00
	ld bc, $0020
	ld hl, $D0D0
	jp fillVram

; 7th entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
drawInfoBar:
	; @TODO
	ld de, $382E
	ld b, $1C
--:
	push bc
	ld b, $09
-:
	push bc
	ld a, $00
	rst $18	; writeToVdpAddress
	inc de
	ld a, $11
	rst $18	; writeToVdpAddress
	inc de
	pop bc
	djnz -
	ld hl, $002E
	add hl, de
	ex de, hl
	pop bc
	djnz --

	ld a, $08
	ld (_RAM_C12B_), a

	; Draw "TOP"
	ld de, $3870
	ld hl, _DATA_9A9_ + 1
	ld b, $03
	call drawTiles

	; Draw "1UP"
	ld de, $3930
	ld hl, _DATA_9AD_
	ld b, $03
	call drawTiles

	; Draw life count
	ld de, $3D36
	call _LABEL_9A1_

	; @TODO: Related to high scores
	call _LABEL_2638_

	; Draw high score
	ld hl, _DATA_9A9_
	ld de, $38BC
	ld b, $01
	call drawTiles

	; Draw P1 score
	ld hl, _DATA_9A9_
	ld de, $397C
	ld b, $01
	call drawTiles

	; Draw P1 life icon
	ld de, $3CF2
	ld hl, _DATA_9B3_ + 2
	ld bc, $0202
	ld a, $08
	ld (_RAM_C12B_), a
	call _LABEL_B5E_

	; Return if single player
	ld a, (_RAM_C103_)
	rrca
	ret nc

	; Draw P2 life icon
	ld de, $3D72
	ld hl, _DATA_9B9_
	ld bc, $0202
	ld a, $08
	ld (_RAM_C12B_), a
	call _LABEL_B5E_

	; @TODO
	ld a, $08
	ld (_RAM_C12B_), a

	; Draw "2UP"
	ld de, $39F0
	ld hl, _DATA_9B0_
	ld b, $03
	call drawTiles

	; Draw P2 score
	ld hl, _DATA_9A9_
	ld de, $3A3C
	ld b, $01
	call drawTiles

	; Draw P2 life count
	ld de, $3DB6
_LABEL_9A1_:
	ld hl, _DATA_9B3_
	ld b, $02
	jp drawTiles

; Data from 9A9 to 9AC (4 bytes)
_DATA_9A9_:
.db $30 $54 $4F $50

; Data from 9AD to 9AF (3 bytes)
_DATA_9AD_:
.db $31 $55 $50

; Data from 9B0 to 9B2 (3 bytes)
_DATA_9B0_:
.db $32 $55 $50

; Data from 9B3 to 9B8 (6 bytes)
_DATA_9B3_:
.db $5A ($30 + INITIAL_LIVES) $10 $11 $12 $13

; Data from 9B9 to 9BC (4 bytes)
_DATA_9B9_:
.db $10 $11 $14 $15

; 8th entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
_LABEL_9BD_:
	ld a, $8B
	ld (_RAM_CD00_), a
	ld hl, p1Lives
	inc (hl)
	jp _LABEL_45C_

; 9th entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
_LABEL_9C9_:
	ld a, $8B
	ld (_RAM_CD00_), a
	ld hl, _RAM_C106_
	inc (hl)
	jp _LABEL_46C_

; 10th entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
_LABEL_9D5_:
	ld a, (_RAM_C145_)
	sub $3A
	ld c, a
	call _LABEL_A08_
	ld a, c
	add a, a
	add a, c
	push de
	ld e, a
	ld d, $00
	ld hl, _RAM_C136_
	add hl, de
	pop de
	bit 7, (hl)
	ret nz
	inc (hl)
	ld a, (hl)
	push hl
	dec a
	add a, a
	ld l, a
	ld h, $00
	add hl, de
	ex de, hl
	ld a, (_RAM_C145_)
	rst $18	; writeToVdpAddress
	ld a, $08
	call writeVDPData
	pop hl
	ld a, (hl)
	cp $05
	ret c
	jp +

_LABEL_A08_:
	ld hl, _DATA_A14_
	add a, a
	ld e, a
	ld d, $00
	add hl, de
	ld e, (hl)
	inc hl
	ld d, (hl)
	ret

; Data from A14 to A1D (10 bytes)
_DATA_A14_:
.db $B0 $3A $F0 $3A $30 $3B $70 $3B $B0 $3B

+:
	set 7, (hl)
	inc hl
	ld (hl), $00
	inc hl
	ld (hl), c
	ld a, $8C
	ld (_RAM_CD00_), a
	ld a, c
	or a
	jp z, _LABEL_1688_
	dec a
	jp z, _LABEL_169A_
	dec a
	jp z, _LABEL_161A_
	dec a
	jp z, _LABEL_16A9_
	jp _LABEL_16F8_

; 11th entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
_LABEL_A3E_:
	call _LABEL_A63_
	ld d, (iy+30)
	ld e, (iy+31)
	ld a, $3F
	rst $18	; writeToVdpAddress
	ld a, $08
	out (Port_VDPData), a
	ld a, $0F
	ld (_RAM_C942_), a
	ld hl, _RAM_C32F_
	ld a, (hl)
	cp $05
	jp c, putIYEntityOffscreen
	dec (hl)
	call _LABEL_2A9A_
	jp putIYEntityOffscreen

_LABEL_A63_:
	ld iy, _RAM_C6A0_
	ld a, (iy+29)
	cp $02
	jr z, +
	ld iy, _RAM_C720_
	ld a, (iy+29)
	cp $02
	ret nz
+:
	ld a, (_RAM_C943_)
	or a
	jp nz, putIYEntityOffscreen
	ld a, (iy + Entity.xPos.low)
	sub $04
	ld (_RAM_C948_), a
	ld a, (iy + Entity.yPos.low)
	sub $04
	ld (_RAM_C946_), a
	ret

; 12th entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
load_some_tiles_LABEL_A90_:
	ld hl, (enemyTiles)
	ld de, $0C00
	ld bc, $4B08
	jp _LABEL_313C_

; 13th entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
_LABEL_A9C_:
	call _LABEL_A63_
	ld a, (iy+5)
	ld (_RAM_C945_), a
	ld a, (_RAM_C334_)
	ld (_RAM_C944_), a
	cp $8D
	jr nz, +
	ld a, $22
	ld (_RAM_C942_), a
	ret

+:
	ld a, $21
	ld (_RAM_C942_), a
	ret

; 14th entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
_LABEL_ABB_:
	ld a, $8F
	ld (_RAM_CD00_), a
	ret

; 15th entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
_LABEL_AC1_:
	ld a, $80
	ld (_RAM_C338_), a
	ld hl, _DATA_ACC_
	jp _LABEL_B12_

; Data from ACC to AD7 (12 bytes)
_DATA_ACC_:
.db $45 $51 $54 $52 $41 $20 $20 $20 $20 $20 $20 $20

; 16th entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
_LABEL_AD8_:
	ld a, $80
	ld (_RAM_C338_), a
	ld hl, _DATA_AF9_
	call _LABEL_B12_
	ld a, (_RAM_C339_)
	add a, a
	ld e, a
	xor a
	ld d, a
	ld (_RAM_C339_), a
	ld hl, _DATA_B05_
	add hl, de
	ld de, $3C72
	ld b, $02
	jp drawTiles

; Data from AF9 to B04 (12 bytes)
_DATA_AF9_:
.db $42 $4F $4E $55 $53 $20 $20 $20 $30 $30 $30 $30

; Data from B05 to B0E (10 bytes)
_DATA_B05_:
.db $20 $31 $20 $33 $20 $35 $20 $37 $31 $30

; 17th entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
_LABEL_B0F_:
	ld hl, _DATA_B20_
_LABEL_B12_:
	ld a, $08
	ld (_RAM_C12B_), a
	ld de, $3C32
	ld bc, $0206
	jp _LABEL_B5E_

; Data from B20 to B2B (12 bytes)
_DATA_B20_:
.dsb 12, $20

; 18th entry of Jump Table from 745 (indexed by action1_RAM_C10A_)
_LABEL_B2C_:
	ret

drawTiles:
	call setVDPWriteAddress
	ld c, Port_VDPData
-:
	outi
	ld a, (_RAM_C12B_)
	nop
	out (c), a
	nop
	jp nz, -
	ret

clearTilemap:
	ld hl, $0100
fillTilemap:
	; Tilemap base address
	ld de, $3800
	; 38 x 28 tiles = $380
	ld bc, $0380
fillVram:
	call setVDPWriteAddress
	ld a, c
	or a
	jr z, _LABEL_B50_
	inc b
_LABEL_B50_:
	ld a, l
	out (Port_VDPData), a
	push af
	pop af
	ld a, h
	out (Port_VDPData), a
	dec c
	jr nz, _LABEL_B50_
	djnz _LABEL_B50_
	ret

_LABEL_B5E_:
	push bc
	call setVDPWriteAddress
	ld b, c
	ld c, Port_VDPData
-:
	outi
	ld a, (_RAM_C12B_)
	nop
	out (c), a
	nop
	jp nz, -
	ex de, hl
	ld bc, $0040
	add hl, bc
	ex de, hl
	pop bc
	djnz _LABEL_B5E_
	ret

drawTileArea:
	push bc
	call setVDPWriteAddress
	ld b, c
	ld c, Port_VDPData
-:
	nop
	nop
	outi
	jp nz, -
	ex de, hl
	ld bc, $0040
	add hl, bc
	ex de, hl
	pop bc
	djnz drawTileArea
	ret

_LABEL_B93_:
	ld hl, _RAM_C500_
	ld de, $3F00
	ld bc, $0040
	rst $20	; _LABEL_20_
	ld hl, _RAM_C540_
	ld de, $3F80
	ld bc, $0080
	jp _LABEL_20_

_LABEL_BA9_:
	ld hl, _DATA_BBE_
	ld bc,  $1600 | Port_VDPAddress
	otir
	ld a, (_DATA_BBE_)
	ld (_RAM_C100_), a
	ld a, (_DATA_BBE_ + 2)
	ld (_RAM_C101_), a
	ret

; Data from BBE to BD3 (22 bytes)
_DATA_BBE_:
.db $A6 $80 $80 $81 $FF $82 $FF $83 $FF $84 $FF $85 $FB $86 $00 $87
.db $00 $88 $00 $89 $FF $8A

setVDPWriteAddress:
	ld a, e
	out (Port_VDPAddress), a
	ld a, d
	or $40
	out (Port_VDPAddress), a
	ret

writeVDPCommandWord:
	ld a, e
	out (Port_VDPAddress), a
	ld a, d
	out (Port_VDPAddress), a
	ret

writeVDPData:
	out (Port_VDPData), a
	ret

_LABEL_BE7_:
	ld a, (_RAM_C101_)
	and $BF
	jr +

_LABEL_BEE_:
	ld a, (_RAM_C101_)
	or $40
+:
	ld (_RAM_C101_), a
	ld e, a
	ld d, $81
	jp writeVDPCommandWord

_LABEL_BFC_:
	ld a, $03 ; setBGColorsToBlack
	ld (action4_RAM_C10D_), a ; Related to _DATA_745_ jumptable
	ld a, $01 ; jumpToClearTilemap
	ld (action2_RAM_C10B_), a ; Related to _DATA_745_ jumptable
	ld a, $06 ; clearSprites
	ld (action7_RAM_C110_), a ; Related to _DATA_745_ jumptable
	ld a, $07 ; drawInfoBar
	ld (action8_RAM_C111_), a ; Related to _DATA_745_ jumptable
	ld a, $0C ; load_some_tiles_LABEL_A90_
	ld (action13_RAM_C116_), a ; Related to _DATA_745_ jumptable

	ld a, $03
	ld (_RAM_C151_), a

	; Initial lives
	ld a, INITIAL_LIVES
	ld (p1Lives), a

	ld (_RAM_C106_), a
	ld a, $1E
	ld (_RAM_C32F_), a
	ld a, (_RAM_C103_)
	rrca
	jr nc, +
	ld a, $11
	jr ++

+:
	ld a, $01
++:
	ld (_RAM_C104_), a
	ld a, $FF
	ld (wave_RAM_C322_), a
	ret

updateEntities:
	ld b, ENTITY_ARRAY_SIZE
	ld iy, entities
-:
	push bc
	push iy
	ld a, (iy + Entity.type)
	or a
	call nz, +
	pop iy
	ld de, $0020
	add iy, de
	pop bc
	djnz -
	ret

+:
	add a, a
	ld e, a
	ld d, $00
	ld hl, entityUpdatersPointers - 2
	add hl, de
	ld e, (hl)
	inc hl
	ld d, (hl)
	ex de, hl
	jp (hl)

.INCLUDE "entityUpdaters.asm"

_LABEL_2222_:
	ld a, (_RAM_C103_)
	bit 6, a
	jp nz, +
	ld hl, _RAM_C12F_
	in a, (Port_IOPort1)
	call _LABEL_229A_
	ld hl, _RAM_C131_
	in a, (Port_IOPort1)
	and $C0
	ld b, a
	in a, (Port_IOPort2)
	and $3F
	add a, b
	rlca
	rlca
	jp _LABEL_229A_

+:
	call _LABEL_22A2_
	ld hl, _RAM_C12F_
	ld a, $07
	out (_PORT_DE_), a
	in a, (Port_IOPort1)
	ld c, a
	ld a, $04
	out (_PORT_DE_), a
	in a, (Port_IOPort1)
	bit 5, a
	jp nz, +
	res 1, c
+:
	ld a, $05
	out (_PORT_DE_), a
	in a, (Port_IOPort1)
	bit 5, a
	jp nz, +
	res 2, c
+:
	ld a, $06
	out (_PORT_DE_), a
	in a, (Port_IOPort1)
	bit 5, a
	jp nz, +
	res 3, c
+:
	bit 6, a
	jp nz, +
	res 0, c
+:
	ld a, $02
	out (_PORT_DE_), a
	in a, (Port_IOPort1)
	bit 4, a
	jp nz, +
	res 4, c
+:
	ld a, $03
	out (_PORT_DE_), a
	in a, (Port_IOPort1)
	bit 4, a
	jp nz, _LABEL_2299_
	res 5, c
_LABEL_2299_:
	ld a, c
_LABEL_229A_:
	cpl
	ld c, a
	xor (hl)
	ld (hl), c
	inc hl
	and c
	ld (hl), a
	ret

_LABEL_22A2_:
	ld hl, _RAM_C131_
	ld a, $07
	out (_PORT_DE_), a
	in a, (Port_IOPort1)
	and $C0
	ld b, a
	in a, (Port_IOPort2)
	and $3F
	add a, b
	rlca
	rlca
	ld c, a
	ld a, $01
	out (_PORT_DE_), a
	in a, (Port_IOPort1)
	bit 2, a
	jp nz, +
	res 2, c
+:
	bit 3, a
	jp nz, +
	res 1, c
+:
	ld a, $02
	out (_PORT_DE_), a
	in a, (Port_IOPort1)
	bit 1, a
	jp nz, +
	res 0, c
+:
	ld a, $03
	out (_PORT_DE_), a
	in a, (Port_IOPort1)
	bit 2, a
	jp nz, +
	res 3, c
+:
	ld a, $05
	out (_PORT_DE_), a
	in a, (Port_IOPort2)
	bit 3, a
	jp nz, +
	res 5, c
+:
	ld a, $06
	out (_PORT_DE_), a
	in a, (Port_IOPort2)
	bit 2, a
	jp nz, _LABEL_2299_
	res 4, c
	jp _LABEL_2299_

_LABEL_2301_:
	ld a, (_RAM_C104_)
	and $0F
	or a
	jr nz, +
	ld ix, _RAM_C600_
	ld a, (ix + Entity.type)
	cp $01
	jr nz, +
	ld iy, _RAM_C640_
	ld hl, _RAM_C12F_
	ld de, _RAM_C302_
	call _LABEL_2371_
	ld a, (ix+25)
	or a
	jr nz, +
	ld a, (_RAM_C6A3_)
	or a
	jr nz, +
	ld ix, _RAM_C600_
	ld iy, _RAM_C6A0_
	ld a, (_RAM_C12F_)
	call _LABEL_2401_
+:
	ld a, (_RAM_C104_)
	and $F0
	or a
	ret nz
	ld ix, _RAM_C620_
	ld a, (ix + Entity.type)
	cp $02
	ret nz
	ld iy, _RAM_C6C0_
	ld hl, _RAM_C131_
	ld de, _RAM_C303_
	call _LABEL_2371_
	ld a, (ix+24)
	or a
	ret nz
	ld a, (_RAM_C723_)
	or a
	ret nz
	ld ix, _RAM_C620_
	ld iy, _RAM_C720_
	ld a, (_RAM_C131_)
	jp _LABEL_2401_

_LABEL_2371_:
	ld b, (hl)
	inc hl
	ld c, (hl)
	ex de, hl
	bit 5, b
	ret z
	bit 5, c
	jr nz, +
	dec (hl)
	ret nz
+:
	ld a, (ix + Entity.data1c)
	ld (hl), a
	call _LABEL_246F_
	ret nc
	push iy
	pop de
	ld hl, _DATA_23D6_
	ld bc, $0005
	ldir

	ld a, (ix + Entity.data05)
	ld (iy + Entity.data05), a

	ld a, (ix + Entity.yPos.low)
	ld (iy + Entity.yPos.low), a

	ld a, (ix + Entity.xPos.low)
	add a, $04
	ld (iy + Entity.xPos.low), a

	call _LABEL_2456_

	ld a, (ix + Entity.frame)
	add a, a
	add a, a
	ld e, a
	ld d, $00
	ld hl, _DATA_23E1_
	add hl, de
	ld a, (hl)
	ld (iy + Entity.yVel.low), a
	inc hl
	ld a, (hl)
	ld (iy + Entity.yVel.high), a

	inc hl
	ld a, (hl)
	ld (iy + Entity.xVel.low), a
	inc hl
	ld a, (hl)
	ld (iy + Entity.xVel.high), a

	ld c, $85
	ld a, (ix + Entity.data05)
	dec a
	jr z, +
	ld c, $8E
+:
	ld a, c
	ld (_RAM_CD00_), a

	ret

; Data from 23D6 to 23E0 (11 bytes)
_DATA_23D6_:
.db $DB $23 $03 $01 $01
.db $DD $23 $01 $00 $00
.db $04

; Data from 23E1 to 2400 (32 bytes)
_DATA_23E1_:
; yVel.low / yVel.high / xVel.low / xVel.high
.db $FB $00 $00 $00
.db $FD $00 $FE $00
.db $FC $00 $FC $00
.db $FD $00 $FE $00
.db $FB $00 $00 $00
.db $FC $00 $02 $00
.db $FD $00 $03 $00
.db $FC $00 $02 $00

_LABEL_2401_:
	bit 4, a
	ret z
	ld hl, _DATA_2430_
	ld bc, $000E
	push iy
	pop de
	ldir
	ld a, (ix+5)
	ld (iy+5), a
	ld a, (ix+6)
	ld (iy + Entity.yPos.low), a
	ld a, (ix+8)
	add a, $04
	ld (iy + Entity.xPos.low), a
	ld (iy+24), $10
	call _LABEL_2456_
	ld a, $86
	ld (_RAM_CD00_), a
	ret

; Data from 2430 to 2455 (38 bytes)
_DATA_2430_:
.dw _DATA_243E_
.db $04
.db $01
.db $01
.db $00
.db $00
.db $00
.db $00
.db $00
.db $00
.db $01
.db $01
.db $FE

_DATA_243E_:
.dw _DATA_2446_
.dw _DATA_244A_
.dw _DATA_244E_
.dw _DATA_2452_

_DATA_2446_:
.db $01
.db $00 $00 $01

_DATA_244A_:
.db $01
.db $00 $00 $02

_DATA_244E_:
.db $01
.db $00 $00 $03

_DATA_2452_:
.db $01
.db $00 $00 $06

_LABEL_2456_:
	ld a, (ix+27)
	or a
	ret z
	ld (ix+27), $00
	ld hl, _DATA_4F6_
	ld a, (ix+5)
	dec a
	jp z, _LABEL_1149_
	ld hl, _DATA_524_
	jp _LABEL_1149_

_LABEL_246F_:
	ld b, $03
-:
	ld a, (iy + Entity.type)
	or a
	jr z, +
	push de
	ld de, $0020
	add iy, de
	pop de
	djnz -
	xor a
	ret

+:
	scf
	ret

_LABEL_2484_:
	xor a
	ld (_RAM_C304_), a
	call +++
	ld b, $19
	ld hl, _RAM_C305_
	ld a, (hl)
	cpl
	ld (hl), a
	or a
	jr nz, +
	call ++++
	jp ++

+:
	call _LABEL_24DD_
++:
	ld a, (_RAM_C304_)
	ld e, a
	ld d, $00
	ld hl, $C500
	add hl, de
	ld (hl), $D0
	ret

+++:
	ld iy, _RAM_C600_
	ld a, (iy + Entity.type)
	cp $05
	jr z, +
	call ++
	ld iy, _RAM_C620_
	jr ++

+:
	ld iy, _RAM_C620_
	call ++
	ld iy, _RAM_C600_
++:
	ld a, (iy+3)
	or a
	ret z
	jp +++++

++++:
	ld iy, _RAM_C640_
	ld de, $0020
	jp _LABEL_24E4_

_LABEL_24DD_:
	ld iy, _RAM_C940_
	ld de, $FFE0
_LABEL_24E4_:
	push bc
	ld a, (iy+3)
	or a
	push de
	call nz, +++++
	pop de
	add iy, de
	pop bc
	djnz _LABEL_24E4_
	ret

+++++:
	ld a, (iy + Entity.frame)
	add a, a
	ld e, a
	ld d, $00
	ld l, (iy + Entity.animationDescriptorPointer.low)
	ld h, (iy + Entity.animationDescriptorPointer.high)
	add hl, de
	ld e, (hl)
	inc hl
	ld d, (hl)
	push de
	ld hl, $C500
	ld a, (_RAM_C304_)
	ld e, a
	ld d, $00
	add hl, de
	pop de
	push de
	ld a, (de)
	ld b, a
	inc de
-:
	ld a, (de)
	add a, (iy + Entity.yPos.low)
	ld (hl), a
	inc hl
	inc de
	inc de
	inc de
	djnz -
	ld hl, $C540
	ld a, (_RAM_C304_)
	add a, a
	ld e, a
	ld d, $00
	add hl, de
	pop de
	push de
	ld a, (de)
	ld b, a
-:
	inc de
	inc de
	ld a, (de)
	add a, (iy + Entity.xPos.low)
	ld (hl), a
	inc hl
	inc de
	ld a, (de)
	ld (hl), a
	inc hl
	djnz -
	pop de
	ex de, hl
	ld a, (_RAM_C304_)
	add a, (hl)
	ld (_RAM_C304_), a
	ld a, (iy+21)
	or a
	ret z
	ld b, $20
	push iy
-:
	ld (iy + Entity.animationDescriptorPointer.low), $00
	inc iy
	djnz -
	pop iy
	ld (iy + Entity.yPos.low), $D8
	ret

_LABEL_255E_:
	ld a, (state)
	bit 2, a
	ret nz
	ld de, _RAM_C123_
	ld a, (iy+5)
	cp $01
	jr z, +
	ld de, _RAM_C127_
+:
	ld a, $01
	ld (de), a
	inc de
	ld hl, $25C4
	dec c
	ld a, c
	add a, a
	add a, c
	ld c, a
	ld b, $00
	add hl, bc
	ld a, (de)
	add a, (hl)
	daa
	ld (de), a
	inc hl
	inc de
	ld a, (de)
	adc a, (hl)
	daa
	ld (de), a
	inc hl
	inc de
	ld a, (de)
	adc a, (hl)
	daa
	ld (de), a
	and $0F
	ld c, a
	ld hl, _RAM_C335_
	ld a, (iy+5)
	dec a
	jr z, +
	ld hl, _RAM_C336_
+:
	ld a, c
	cp (hl)
	ret z
	cp $01
	jr z, +
	cp $02
	jr z, +
	cp $04
	jr z, +
	cp $08
	ret nz
+:
	ld (hl), a
	ld a, (iy+5)
	dec a
	jr nz, +
	ld a, $08
	ld (action9_RAM_C112_), a
	ret

+:
	ld a, $09
	ld (action10_RAM_C113_), a
	ret


    ; Unused code
    ld bc, $0000
    nop
    djnz +
+:
    nop
    jr nc, +

+:
    nop
    ld d,b
    nop
    nop
    ld (hl),b
    nop
    nop
    nop
    ld bc, $0020
    nop
    jr nc, +

+:
    nop
    ld d,b
    nop
    nop
    djnz +

+:
    nop
    nop
    ld bc, $5000
    ld bc, $0000
    inc bc
    nop
    nop
    dec b
    nop
    nop
    dec d
    nop

_LABEL_25F1_:
	ld de, _RAM_C123_
	ld a, (de)
	or a
	jr z, +
	xor a
	ld (de), a
	inc de
	call ++
	ld hl, p1ScoreByte3
	ld de, $3970
	ld b, $06
	call +++
+:
	ld de, _RAM_C127_
	ld a, (de)
	or a
	ret z
	xor a
	ld (de), a
	inc de
	call ++
	ld hl, _RAM_C12A_
	ld de, $3A30
	ld b, $06
	jp +++

++:
	ld hl, _RAM_C11F_
	ld b, $03
	and a
	push de
-:
	ld a, (de)
	sbc a, (hl)
	inc hl
	inc de
	djnz -
	pop de
	ret c
	ld hl, _RAM_C11F_
	ex de, hl
	ld bc, $0003
	ldir
_LABEL_2638_:
	ld hl, highScoreByte3
	ld de, $38B0
	ld b, $06
+++:
	xor a
	ex af, af'
	ex de, hl
	srl b
	jr nc, _LABEL_264A_
	inc b
	jr +

_LABEL_264A_:
	ld a, (de)
	rrca
	rrca
	rrca
	rrca
	call ++
+:
	ld a, (de)
	call ++
	dec de
	djnz _LABEL_264A_
	ex af, af'
	ret

++:
	and $0F
	push bc
	ld c, a
	ex af, af'
	or c
	pop bc
	jr z, +
	ex af, af'
	add a, $30
	ex de, hl
	rst $18	; writeToVdpAddress
	ld a, $18
	call writeVDPData
	ex de, hl
	inc hl
	inc hl
	ret

+:
	ex af, af'
	push af
	ld a, $20
	ex de, hl
	rst $18	; writeToVdpAddress
	ld a, $18
	call writeVDPData
	ex de, hl
	inc hl
	inc hl
	pop af
	ret

_LABEL_2682_:
	call _LABEL_284B_
	jp _LABEL_2760_

_LABEL_2688_:
	ld a, (_RAM_C133_)
	and $20
	jp nz, _LABEL_2717_
	ld l, (iy + Entity.xPos.low)
	call _LABEL_26B6_
	ld c, (ix+8)
	call _LABEL_26E4_
	call _LABEL_26AC_
	ret nc
	ld l, (iy + Entity.yPos.low)
	call _LABEL_26CA_
	ld c, (ix+6)
	call _LABEL_26FC_
_LABEL_26AC_:
	ld a, h
	cp d
	jr nc, +
	ld a, l
	cp d
	ccf
	ret

+:
	cp e
	ret

_LABEL_26B6_:
	ld de, $0007
	ld a, (iy + Entity.type)
	cp $03
	jr z, +
	cp $04
	jr z, +
	ld de, $040B
	jp +

_LABEL_26CA_:
	ld de, $F810
	ld a, (iy + Entity.type)
	cp $03
	jr z, +
	ld de, $0007
	cp $04
	jr z, +
	ld de, $040C
+:
	ld a, l
	add a, d
	ld h, a
	add a, e
	ld l, a
	ret

_LABEL_26E4_:
	ld de, $0206
	ld a, (ix + Entity.type)
	cp $07
	jr z, _LABEL_2711_
	cp $16
	jr z, _LABEL_2711_
	cp $1B
	jr z, _LABEL_2711_
	ld de, $010E
	jp _LABEL_2711_

_LABEL_26FC_:
	ld de, $0206
	ld a, (ix + Entity.type)
	cp $07
	jr z, _LABEL_2711_
	cp $16
	jr z, _LABEL_2711_
	cp $1B
	jr z, _LABEL_2711_
	ld de, $010E
_LABEL_2711_:
	ld a, c
	add a, d
	ld d, a
	add a, e
	ld e, a
	ret

_LABEL_2717_:
	ld l, (iy + Entity.xPos.low)
	call _LABEL_26B6_
	ld c, (ix+8)
	call +
	call _LABEL_26AC_
	ret nc
	ld l, (iy + Entity.yPos.low)
	call _LABEL_26CA_
	ld c, (ix+6)
	call ++
	jp _LABEL_26AC_

+:
	ld de, $F810
	ld a, (ix + Entity.type)
	cp $11
	jp z, _LABEL_2711_
	ld de, $001F
	cp $14
	jp z, _LABEL_2711_
	ld de, $0304
	jp _LABEL_2711_

++:
	ld de, $0018
	ld a, (ix + Entity.type)
	cp $14
	jp z, _LABEL_2711_
	ld de, $000C
	jp _LABEL_2711_

_LABEL_2760_:
	ld a, (_RAM_C108_)
	or a
	ret nz
	ld a, (_RAM_C103_)
	bit 0, a
	ret z
	ld a, (entities.1.type)
	cp $01
	ret nz
	ld a, (_RAM_C622_)
	cp $02
	ret nz
	ld a, (_RAM_C61B_)
	or a
	ret nz
	ld a, (_RAM_C63B_)
	or a
	ret nz
	ld c, $00
	ld a, (player1.xPos.low)
	add a, $02
	call _LABEL_282B_
	jr nc, +
	ld a, (player1.yPos.low)
	add a, $02
	call _LABEL_283B_
	jr nc, +
	set 0, c
+:
	ld a, (player1.xPos.low)
	add a, $0A
	call _LABEL_282B_
	jr nc, +
	ld a, (player1.yPos.low)
	add a, $02
	call _LABEL_283B_
	jr nc, +
	set 1, c
+:
	ld a, (player1.xPos.low)
	add a, $02
	call _LABEL_282B_
	jr nc, +
	ld a, (player1.yPos.low)
	add a, $0A
	call _LABEL_283B_
	jr nc, +
	set 2, c
+:
	ld a, (player1.xPos.low)
	add a, $0A
	call _LABEL_282B_
	jr nc, +
	ld a, (player1.yPos.low)
	add a, $0A
	call _LABEL_283B_
	jr nc, +
	set 3, c
+:
	ld a, c
	ld c, $00
	ld bc, $0102
	cp $0C
	jr z, +
	ld bc, $0201
	cp $03
	jr z, +
	ld bc, $0408
	cp $0A
	jr z, +
	ld bc, $0804
	cp $05
	jr z, +
	ld bc, $0A05
	cp $01
	jr z, +
	ld bc, $0609
	cp $02
	jr z, +
	ld bc, $0906
	cp $04
	jr z, +
	ld bc, $050A
	cp $08
	ret nz
+:
	ld a, $01
	ld (_RAM_C619_), a
	ld (_RAM_C639_), a
	ld a, b
	ld (_RAM_C618_), a
	ld a, c
	ld (_RAM_C638_), a
	ld a, $8D
	ld (_RAM_CD00_), a
	ret

_LABEL_282B_:
	ld h, a
	add a, $03
	ld l, a
	ld a, (player2.xPos.low)
	add a, $02
	ld d, a
	add a, $0B
	ld e, a
	jp _LABEL_26AC_

_LABEL_283B_:
	ld h, a
	add a, $03
	ld l, a
	ld a, (player2.yPos.low)
	add a, $02
	ld d, a
	add a, $0B
	ld e, a
	jp _LABEL_26AC_

_LABEL_284B_:
	ld a, (_RAM_C108_)
	or a
	jr z, +
	call _LABEL_2894_
	jp _LABEL_28A5_

+:
	ld a, (_RAM_C61B_)
	or a
	jr nz, +
	ld a, (_RAM_C103_)
	and $04
	ld (_RAM_C337_), a
	ld iy, _RAM_C600_
	ld a, (iy + Entity.type)
	cp $01
	jr nz, +
	ld bc, $0111
	call _LABEL_28B9_
+:
	ld a, (_RAM_C103_)
	and $08
	rrca
	ld (_RAM_C337_), a
	ld a, (_RAM_C63B_)
	or a
	ret nz
	ld bc, $0111
	ld iy, _RAM_C620_
	ld a, (iy + Entity.type)
	cp $02
	ret nz
	jp _LABEL_28B9_

_LABEL_2894_:
	ld a, (_RAM_C104_)
	and $0F
	or a
	ret nz
	ld iy, _RAM_C640_
	ld bc, $0408
	jp _LABEL_28B9_

_LABEL_28A5_:
	ld a, (_RAM_C103_)
	bit 0, a
	ret z
	ld a, (_RAM_C104_)
	and $F0
	or a
	ret nz
	ld iy, _RAM_C6C0_
	ld bc, $0408
_LABEL_28B9_:
	push bc
	ld a, (iy+3)
	or a
	call nz, +
	ld de, $0020
	add iy, de
	pop bc
	djnz _LABEL_28B9_
	ret

+:
	ld b, c
	ld ix, _RAM_C740_
-:
	push bc
	ld a, (ix+3)
	or a
	call nz, +
	ld de, $0020
	add ix, de
	pop bc
	djnz -
	ret

+:
	ld a, (ix+21)
	or a
	ret nz
	ld a, (iy + Entity.yPos.low)
	cp $10
	ret c
	call _LABEL_2688_
	ret nc
	ld a, (iy + Entity.type)
	cp $01
	jp z, _LABEL_294A_
	cp $02
	jp z, _LABEL_294A_
	cp $05
	ret z
	ld c, (iy + Entity.type)
	ld a, (ix + Entity.type)
	cp $08
	ret c
	add a, a
	ld e, a
	ld d, $00
	ld hl, $2908
	add hl, de
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld a, c
	cp $03
	jp (hl)

; Unused code
    exx
    add hl, hl
    exx
    add hl, hl
    call m, $DA29	; Possibly invalid
    add hl, hl
    pop af
    add hl, hl
    ld bc, $ED2A
    add hl, hl
    exx
    add hl, hl
    ld bc, metatileAttrs39 + 1	; metatileAttrs39 + 1 = $7D2A
    ld hl, ($2A01)
    inc d
    ld hl, ($2A86)
    ld bc, $D92A
    add hl, hl
    call m, $7D29	; Possibly invalid
    ld hl, ($2A7D)
    call m, $FC29	; Possibly invalid
    add hl, hl
    ld d, l
    ld hl, ($2A5B)
    ld (hl), h
    ld hl, ($2A74)
    exx
    add hl, hl

_LABEL_294A_:
	ld a, (_RAM_C103_)
	rlca
	ret c
	ld a, (ix + Entity.type)
	cp $08
	ret z
	cp $22
	jr z, _LABEL_29C3_
	cp $21
	ret z
	cp $09
	ret z
	cp $0F
	jr z, _LABEL_29A5_
	cp $1C
	ret z
	cp $1D
	ret z
	cp $16
	jr z, _LABEL_29A5_
	cp $11
	jr z, _LABEL_29B9_
	cp $14
	jr z, _LABEL_29B9_
	cp $18
	jr z, _LABEL_29B9_
	cp $19
	jr z, _LABEL_29B9_
	cp $1E
	jr z, _LABEL_29B9_
	cp $1F
	jr z, _LABEL_29B9_
	cp $0E
	jr z, ++
	ld a, (_RAM_C337_)
	bit 2, a
	jr nz, +
	ld (iy + Entity.type), $05
	jp _LABEL_1063_

+:
	ld (ix + Entity.type), $08
	ld c, $0A
	jp _LABEL_255E_

++:
	ld (iy + Entity.type), $05
	ret

_LABEL_29A5_:
	ld (ix+24), $01
	ld a, (iy+5)
	ld (ix+5), a
	ld a, $89
	ld (_RAM_CD00_), a
	ld c, $09
	jp _LABEL_255E_

_LABEL_29B9_:
	ld a, (ix+28)
	or a
	ret nz
	ld (iy + Entity.type), $05
	ret

_LABEL_29C3_:
	call _LABEL_1063_
	ld a, (iy+5)
	cp $01
	jr nz, +
	ld a, $08
	ld (action9_RAM_C112_), a
	ret

+:
	ld a, $09
	ld (action10_RAM_C113_), a
	ret

; Unused code
    ret

    ret nz
    ld a, (iy+5)
    ld (ix+5), a
    inc (iy+24)
    ld (ix+31), $FF
    ld c, $08
    jp _LABEL_255E_

; Unused code
_LABEL_29ED_:
    ret nz
    jp putIYEntityOffscreen

; Unused code
_LABEL_29F1_:
    ret nz
    ld a, (ix+25)
    or a
    ret z
    ld c, $0A
    jp ++
    ld c, $07
    jp +

; Unused code
_LABEL_2A01_:	
		ld c, $08
+:	
		ret nz
++:	
		ld a, (iy+5)
		ld (ix+5), a
		inc (iy+24)
		ld (ix+2), $08
		jp _LABEL_255E_

; Unused code
_LABEL_2A14_:	
		ret nz
		ld c, $0A
		call _LABEL_255E_
		ld hl, _DATA_143F_
		ld (ix+0), l
		ld (ix+1), h
		ld (ix+28), $01
		ld a, $82
		ld (_RAM_CD00_), a
		ld (ix+24), $01
		ld a, (iy+8)
		add a, $04
		ld c, a
		call putIYEntityOffscreen
		ld (ix+13), $FD
		ld (ix+14), $00
		ld (ix+15), $00
		ld (ix+16), $80
		ld a, (ix+8)
		add a, $08
		cp c
		ret nc
		ld (ix+15), $FF
		ret
		ret z
		ld c, $0E
		jp +

; Unused code
_LABEL_2A5B_:	
    ret z
    ld c, $0B

+:
		ld a, (iy+17)
		cp $03
		ret nz
		call _LABEL_255E_
		ld a, (iy+5)
		ld (ix+5), a
		ld (ix+2), $09
		jp putIYEntityOffscreen
		ret nz
		ld a, (entities.12.data1e)
		or a
		ret nz
		jp _LABEL_2A7E_

        ret nz

; Unused code
_LABEL_2A7E_:
		ld a, $82
		ld (_RAM_CD00_), a
		jp putIYEntityOffscreen

; Unused code
_LABEL_2A86_:	
		ret nz
		ld a, (entities.11.data1e)
		or a
		jr z, _LABEL_2A7E_
		ld hl, _RAM_C32F_
		ld a, (hl)
		or a
		jr z, +
		dec (hl)
		jr z, +
		call putIYEntityOffscreen

_LABEL_2A9A_:
	ld a, (_RAM_C32F_)
	ld l, a
	ld h, $00
	ld e, $0A
	call _LABEL_2D4F_
	ld (_RAM_C330_), a
	ld a, l
	ld (_RAM_C331_), a
	ret

+:	
    ld hl, _RAM_C133_
    res 5, (hl)
    ld hl, _RAM_C151_
    set 0, (hl)
    ld a, $0E
    ld (action14_RAM_C117_ + 1), a
    ld a, $01
    ld (entities.12.frame), a
    ld (entities.12.data1c), a
    ld (entities.13.data1c), a
    ld (entities.14.data1c), a
    ld (entities.15.data1c), a
    ld (entities.16.data1c), a
    ld a, (iy+5)
    ld (entities.11.data05), a
    ld a, $08
    ld (entities.11.type), a
    call _LABEL_2A9A_
    call putIYEntityOffscreen
    ld c, $0E
    jp _LABEL_255E_

_LABEL_2AE6_:
	ld a, (_RAM_C6BD_)
	or a
	jr nz, +
	ld a, (_RAM_C6B1_)
	cp $03
	jr nz, +
	ld de, _RAM_C6A6_
	ld hl, _RAM_C6BD_
	call ++
+:
	ld a, (_RAM_C73D_)
	or a
	ret nz
	ld a, (_RAM_C731_)
	cp $03
	ret nz
	ld de, _RAM_C726_
	ld hl, _RAM_C73D_
++:
	ld a, (de)
	ld (_RAM_C332_), a
	inc de
	inc de
	ld a, (de)
	ld (_RAM_C333_), a
	ld de, _DATA_2B63_
	ld b, $04
-:
	push bc
	push hl
	ld a, (_RAM_C332_)
	ld c, a
	ld a, (de)
	add a, c
	ld l, a
	inc de
	ld a, (_RAM_C333_)
	ld c, a
	ld a, (de)
	add a, c
	ld h, a
	inc de
	push de
	call +++
	pop de
	pop hl
	cp $82
	jr z, ++
	cp $8A
	jr c, +
	cp $8E
	jr c, ++
+:
	pop bc
	djnz -
	xor a
	ld (hl), $01
	ret

++:
	ld d, b
	ld e, c
	pop bc
	ld (hl), $02
	inc hl
	ld (hl), d
	inc hl
	ld (hl), e
	cp $82
	jr nz, +
	ld a, $0B
	ld (action12_RAM_C115_), a
	ret

+:
	ld (_RAM_C334_), a
	ld a, $0D
	ld (action14_RAM_C117_), a
	ret

; Data from 2B63 to 2B6A (8 bytes)
_DATA_2B63_:
.db $01 $01 $01 $06 $06 $01 $06 $06

+++:
	ld a, h
	rrca
	rrca
	rrca
	and $1F
	add a, a
	ld e, a
	ld h, $00
	ld d, h
	ld b, d
	ld a, (_RAM_C310_)
	ld c, a
	add hl, bc
	ld a, l
	and $F8
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld de, $3800
	add hl, de
	ex de, hl
	ld a, d
	cp $3F
	jr c, +
	sub $3F
	add a, $38
	ld d, a
+:
	rst $08	; _LABEL_8_
	ld a, b
	ld b, d
	ld c, e
	ret

_LABEL_2B98_:
	ld a, (_RAM_C151_)
	rrca
	ret nc
	rrca
	jp c, ++

	ld a, (frame_parity_RAM_C311_)
	inc a
	ld (frame_parity_RAM_C311_), a

	cp $01
	jr z, +

	cp $03
	ret c
	xor a
	ld (frame_parity_RAM_C311_), a
	jp _LABEL_2C66_

+:
	ld a, (timer_RAM_C312_)
	or a
	ret nz
	ld de, $048C
	ld a, (_RAM_C134_)
	cp e
	ret nz
	ld a, (_RAM_C135_)
	cp d
	ret nz
	ld hl, $0000
	ld (_RAM_C134_), hl
	xor a
	ld (wave), a
	ld (waveTimer), a
	ld hl, _RAM_C103_
	res 7, (hl)
	ret

++:
	xor a
	ld (timer_RAM_C312_), a
	ld (frame_parity_RAM_C311_), a
	ld (_RAM_C310_), a
	ld (waveTimer), a
	ld a, (_RAM_C151_)
	bit 3, a
	jr nz, _LABEL_2C40_
	or $08
	ld (_RAM_C151_), a
	ld de, _RAM_C500_ + 1
	ld hl, _RAM_C500_
	ld (hl), $00
	ld bc, $0040
	ldir
	ld de, wave_RAM_C322_ + 1
	ld hl, wave_RAM_C322_
	ld (hl), $00
	ld bc, $0007
	ldir

	call destroyEntities

	ld hl, $0000
	ld (_RAM_C134_), hl
	xor a
	ld (wave), a
	ld hl, $3D82
	ld (half_timer_15_RAM_C313_), hl
	ld b, $1C
	ld de, $3802
-:
	push bc
	ld hl, $0100
	ld bc, $0016
	push bc
	call fillVram
	pop bc
	ld hl, $0040
	add hl, de
	ex de, hl
	pop bc
	djnz -
	ld de, $8900
	jp writeVDPCommandWord

_LABEL_2C40_:
	call _LABEL_2D11_
	ld a, l
	cp $82
	ret nz
	ld a, h
	cp $3E
	ret nz
	ld hl, $3E02
	ld (half_timer_15_RAM_C313_), hl
	ld hl, _RAM_C151_
	res 1, (hl)
	set 0, (hl)
	ld de, $3E82
	call _LABEL_2C88_
	ld a, $01
	ld (wave), a
	xor a
	jr ++

_LABEL_2C66_:
	ld a, (timer_RAM_C312_)
	inc a
	cp $10
	jr c, +
	call _LABEL_2D01_
	xor a
+:
	ld (timer_RAM_C312_), a
	ld a, (_RAM_C310_)
	dec a
	cp $FF
	jr nz, ++
	ld a, $DF
++:
	ld (_RAM_C310_), a
	ld e, a
	ld d, $89
	jp writeVDPCommandWord

_LABEL_2C88_:
	push de
	ld de, (_RAM_C134_)
	ld hl, _RAM_D300_
	add hl, de
	inc de
	ld (_RAM_C134_), de
	ld a, (hl)
	add a, a
	ld e, a
	jr c, +
	ld d, $00
	jr ++

+:
	ld d, $01
++:
	push de

	; Extract tile indexes
	ld hl, metatilesPointers
	call @loadPointer
	ld de, _RAM_D000_
	call extractMetatile

	; Extract tile attributes
	pop de
	ld hl, metatilesAttributesPointers
	call @loadPointer
	ld de, _RAM_D001_
	call extractMetatile

	; Draw tiles
	ld hl, _RAM_D000_
	pop de
	ld bc, $022C
	jp drawTileArea

@loadPointer:
	add hl, de
	ld e, (hl)
	inc hl
	ld d, (hl)
	ex de, hl
	ret

extractMetatile:
	ld a, e
	cp $58
	ret nc
	ld a, (hl)
	bit 7, a
	jr nz, +

	ld b, a
	inc hl
	ld a, (hl)
-:
	ld (de), a
	inc e
	inc e
	djnz -
	inc hl
	jp extractMetatile

+:
	and $7F
	ld b, a
-:
	inc hl
	ld a, (hl)
	ld (de), a
	inc e
	inc e
	djnz -
	inc hl
	jp extractMetatile

; Data from 2CEE to 2D00 (19 bytes)
; Unused
_LABEL_2CEE_:
		ld de, $3D82
-:	
		ld a, d
		cp $37
		ret z
		push de
		call _LABEL_2C88_
		pop hl
		ld de, $FF80
		add hl, de
		ex de, hl
		jr -

_LABEL_2D01_:
	ld a, (waveTimer)
	inc a
	cp $0C
	jr c, +
	ld hl, wave
	inc (hl)
	xor a
+:
	ld (waveTimer), a

_LABEL_2D11_:
	ld de, (half_timer_15_RAM_C313_)
	push de
	call _LABEL_2C88_
	pop hl
	ld de, $FF80
	add hl, de
	ld a, h
	cp $37
	jr nz, +
	ld hl, $3E82
+:
	ld (half_timer_15_RAM_C313_), hl
	ret

rng_LABEL_2D2A_:
	ld a, (_RAM_C12D_)
	ld b, a
	ld a, r
	add a, b
	and $07
	or $01
	ld b, a
	ld a, r
-:
	rrca
	djnz -
	ld b, a
	ld a, r
	add a, b
	ret

; Data from 2D40 to 2D4E (15 bytes)
; Unused
_LABEL_2D40_:
	ld hl, $0000
	ld b, $08
-:
	add hl, hl
	adc a, a
	jr nc, +
	add hl, de
	adc a, $00
+:
	djnz -
	ret

_LABEL_2D4F_:
	ld b, $11
	xor a
	jp +++

-:
	adc a, a
	jr c, +
	cp e
	jr c, ++
+:
	sub e
	or a
++:
	ccf
+++:
	adc hl, hl
	djnz -
	ret

_LABEL_2D63_:
	ld a, (state)

    ; Return if not demo or gameplay
	bit 2, a
	jr nz, +

	bit 3, a
	ret z
+:

	ld a, (wave)
	ld hl, wave_RAM_C322_
	cp (hl)
	jr z, +

    ; Update C322
	ld (hl), a

	ld l, a    
	ld h, $00
	add hl, hl
	ld e, a
	ld d, $00
	add hl, de
	ld de, waves
	add hl, de
	ex de, hl
	ld hl, enemySpawnTimer
	ld a, (de)
	ld (hl), a
	inc hl
	ld (hl), a ; enemySpawnTimerReset

	ld b, $02
-:
	inc de
	inc hl
	ld a, (de)
	and $E0
	rlca
	rlca
	rlca
	ld (hl), a ; Enemy flags?
	inc hl
	ld a, (de)
	and $1F
	ld (hl), a ; Enemy Type
	djnz -
	ret

+:
	inc hl
	ld a, (hl)
	or a
	jr z, +
	dec (hl)
	ret

+:
	ld a, (enemySpawnTimerReset)
	ld (hl), a
	inc hl
	inc hl
	ld a, (hl)
	or a
	jr nz, +
	inc hl
	inc hl
	ld a, (hl)
	or a
	ret z
+:
	push hl
	pop de
	inc hl
	ld a, (hl)
	cp $0D
	jp z, _LABEL_2E04_
	cp $0C
	jp z, _LABEL_2E2B_
	cp $13
	jp z, _LABEL_2E2B_
	cp $11
	jp z, _LABEL_2E36_

_LABEL_2DCC_:
	ld c, a
	push de
	call findFreeEntitySlot
	pop de
	ret nc

	; Enemy type loaded here
	ld (hl), c
	ex de, hl
	ld a, c
	cp $0A
	ret z
	cp $1A
	ret z
	dec (hl)
	ret

findFreeEntitySlot:
	ld hl, entities.11.type
	ld b, $08
-:
	ld a, (hl)
	or a
	jr z, setCarryFlag
	ld de, $0020
	add hl, de
	djnz -
	xor a
	ret

setCarryFlag:
	scf
	ret

; Duplicated
findFreeEntitySlot_dup:
	ld hl, entities.11.type
	ld b, $08
-:
	ld a, (hl)
	or a
	jr nz, setCarryFlag
	ld de, $0020
	add hl, de
	djnz -
	xor a
	ret

; Data from 2E02 to 2E03 (2 bytes)
; Unused
_LABEL_2E02_:
	scf
	ret

_LABEL_2E04_:
	ld hl, _RAM_C307_
	ld a, (hl)
	or a
	jr z, +
	inc (hl)
	ld a, (hl)
	cp $07
	jr c, ++
	ld (hl), $00
	jp ++

+:
	push hl
	call findFreeEntitySlot_dup
	pop hl
	ret c
	inc (hl)
	ld a, (_RAM_C308_)
	cpl
	ld (_RAM_C308_), a
++:
	call findFreeEntitySlot
	ret nc
	ld (hl), $0D
	ret

_LABEL_2E2B_:
	ld c, a
	push de
	call findFreeEntitySlot_dup
	pop de
	ret c
	ld a, c
	jp _LABEL_2DCC_

_LABEL_2E36_:
	push de
	call findFreeEntitySlot_dup
	pop de
	ret c
	ld a, $14
	ld (_RAM_C742_), a
	ld a, $11
	ld (_RAM_C762_), a
	ld a, $18
	ld (_RAM_C782_), a
	ld a, $19
	ld (_RAM_C7A2_), a
	ld a, $1E
	ld (_RAM_C7C2_), a
	ld a, $1F
	ld (_RAM_C7E2_), a
	ex de, hl
	dec (hl)
	ld hl, _RAM_C133_
	set 5, (hl)
	ld hl, _RAM_C151_
	res 0, (hl)
	ret


.INCLUDE "data/waves.asm"

.db $B7 $C0

_LABEL_2F92_:
	ld b, $08
	ld hl, _RAM_C842_
-:
	ld a, (hl)
	or a
	jr z, +
	ld de, $0020
	add hl, de
	djnz -
	xor a
	ret

+:
	ld (hl), $07
	inc hl
	inc hl
	inc hl
	ld (hl), c
	inc hl
	ld a, (iy+6)
	ld (hl), a
	inc hl
	inc hl
	ld a, (iy+8)
	ld (hl), a
	scf
	ld a, $14
	ld (_RAM_C30D_), a
	ret

; Data from 2FBB to 2FD1 (23 bytes)
; Unused
_LABEL_2FBB_:
	ld ix, entities.19
	ld b, $08
	ld de, $0020
-:
	ld a, (ix+2)
	or a
	jr z, +
	add ix, de
	djnz -
	xor a
	ret
	
+:
	scf
	ret

_LABEL_2FD2_:
	ld a, (_RAM_C30B_)
	cp $07
	jr c, ++
	call rng_LABEL_2D2A_
	and $03
	cp $03
	jr nz, +
	dec a
+:
	ld (_RAM_C30C_), a
	xor a
	ld (_RAM_C30B_), a
++:
	ld hl, _RAM_C30D_
	ld a, (hl)
	or a
	jr z, +
	dec (hl)
+:
	ld hl, _RAM_C318_
	ld a, (hl)
	or a
	jr z, +
	dec (hl)
+:
	ld de, _RAM_C103_
	ld hl, (_RAM_C60B_)
	ld a, h
	or l
	jr z, +
	dec hl
	ld (_RAM_C60B_), hl
	call +++
	jp ++

+:
	ld a, (_RAM_C104_)
	and $0F
	or a
	jr nz, +
	ld a, (_RAM_C61B_)
	or a
	jr nz, +
	push hl
	ld hl, _DATA_4F6_
	ld a, l
	ld (_RAM_C600_), a
	ld a, h
	ld (_RAM_C601_), a
	pop hl
+:
	ex de, hl
	res 2, (hl)
	ex de, hl
++:
	ld hl, (_RAM_C62B_)
	ld a, h
	or l
	jr z, ++++
	dec hl
	ld (_RAM_C62B_), hl
+++:
	ld a, h
	or a
	ret nz
	ld a, l
	cp $40
	ret c
	cp $80
	ret nc
	ld a, $82
	ld (_RAM_CD00_), a
	ret

++++:
	ex de, hl
	res 3, (hl)
	ld a, (_RAM_C104_)
	and $F0
	or a
	ret nz
	ld a, (_RAM_C63B_)
	or a
	ret nz
	ld hl, _DATA_524_
	ld a, l
	ld (_RAM_C620_), a
	ld a, h
	ld (_RAM_C621_), a
	ret

; Related to enemy1 shoot
fire_LABEL_3063_:
	ld a, (wave)
	cp $28
	jr nc, ++

	call rng_LABEL_2D2A_
	and $0F
	ld c, a
	ld a, (wave)
	cp $04
	jr nc, +
	ld a, c
	cp $02
	jr c, ++
	ret

+:
	cp $0F
	jr nc, +
	ld a, c
	cp $04
	jr c, ++
	ret

+:
	ld a, c
	rrca
	ret c
++:
	ld a, (_RAM_C103_)
	rrca
	jr nc, +
	call rng_LABEL_2D2A_
	rrca
	jr nc, ++
+:
	ld c, $01
	ld a, (entities.1.type)
	cp c
	jp z, _LABEL_2F92_
	ld c, $02
	ld a, (_RAM_C622_)
	cp c
	ret nz
	jp _LABEL_2F92_

++:
	ld c, $02
	ld a, (_RAM_C622_)
	cp c
	jp z, _LABEL_2F92_
	ld c, $01
	ld a, (entities.1.type)
	cp c
	ret nz
	jp _LABEL_2F92_

_LABEL_30BC_:
	ld a, $04
	add a, d
	ld d, a

	ld a, $04
	add a, e
	ld e, a

	ld a, $04
	add a, (iy + Entity.yPos.low)
	ld l, a

	ld a, $04
	add a, (iy + Entity.xPos.low)
	ld h, a

	ld c, $00
	ld a, d
	sub l
	jr nz, +
	inc a
+:
	jr nc, +
	ld c, $01
	neg
+:
	ld l, a
	ld a, e
	sub h
	jr nz, +
	inc a
+:
	jr nc, +
	set 1, c
	neg
+:
	ld h, a
	ld a, l
	cp h
	jr nc, +
	set 2, c
	ld l, h
	ld h, a
+:
	ld e, l
	ld l, $00
	call ++
	ld h, $00
	ld a, l
	rrca
	and $7F
	ld e, a
	ld d, $00
	add hl, de
	ld de, $0180
	bit 2, c
	jr z, +
	ex de, hl
+:
	bit 0, c
	jr z, +
	ld a, e
	cpl
	ld e, a
	ld a, d
	cpl
	ld d, a
	inc de
+:
	bit 1, c
	ret z
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	ret

++:
	ld b, $08
	xor a
-:
	adc hl, hl
	ld a, h
	jp c, +
	cp e
	jp c, ++
+:
	sub e
	ld h, a
	xor a
++:
	ccf
	djnz -
	rl l
	sla h
	ld a, h
	sub e
	ret c
	inc l
	ret

_LABEL_313C_:
	call +
	xor a
	ld (_RAM_C329_), a
	ld (_RAM_C32A_), a
	ld (_RAM_C32B_), a
	ld (_RAM_C32C_), a
	ret

+:
	ld (_RAM_C329_), hl
	ld (_RAM_C32B_), hl
	ld h, b
	ld l, c
	inc hl
	inc hl
--:
	ld a, (hl)
	or a
	jp z, _LABEL_31B1_
	bit 7, a
	jr nz, +
	ld b, a
	inc hl
-:
	call ++
	djnz -
	inc hl
	jp --

+:
	and $7F
	ld b, a
	inc hl
-:
	call ++
	inc hl
	djnz -
	jp --

++:
	ld a, e
	out (Port_VDPAddress), a
	ld a, d
	or $40
	out (Port_VDPAddress), a
	ld a, (hl)
	out (Port_VDPData), a
	push hl
	ld hl, (_RAM_C329_)
	dec hl
	ld a, h
	or l
	jr z, +
	ld (_RAM_C329_), hl
	inc de
	inc de
	inc de
	inc de
	pop hl
	ret

+:
	ld hl, (_RAM_C32B_)
	ld (_RAM_C329_), hl
	xor a
	rl l
	rl h
	xor a
	rl l
	rl h
	inc de
	inc de
	inc de
	inc de
	ex de, hl
	xor a
	sbc hl, de
	inc hl
	ex de, hl
	pop hl
	ret

_LABEL_31B1_:
	ret

_LABEL_31B2_:
	ld de, $3200
	ld bc, $31BE
	ld hl, (tiles_DATA_31BE_)
	jp _LABEL_313C_

; Data from 31BE to 36A0 (1251 bytes)
tiles_DATA_31BE_:
.INCBIN "graphics/baserom_DATA_31BE_.inc"

_LABEL_36A1_:
	ld de, $17A0
	ld bc, $36AD
	ld hl, (_DATA_36AD_)
	jp _LABEL_313C_

; Data from 36AD to 3893 (487 bytes)
_DATA_36AD_:
.db $D0 $00 $04 $00 $B2 $FF $FF $00 $FF $7F $FF $E0 $CF $DF $D8 $DB
.db $DB $FE $FF $07 $F3 $FB $1B $DB $C3 $FF $FF $C0 $DF $DF $D0 $D7
.db $D7 $FF $FF $80 $BF $BF $81 $FD $FD $FF $FF $C0 $DF $DF $D8 $DB
.db $DB $FF $FF $03 $FB $FB $03 $04 $FF $81 $C3 $05 $DB $90 $FF $00
.db $FF $FF $01 $01 $03 $03 $FB $3B $BB $BB $B3 $B6 $76 $66 $06 $DB
.db $82 $D8 $DF $08 $D6 $08 $0D $08 $DB $05 $00 $03 $07 $98 $06 $06
.db $0D $0D $1B $1B $37 $37 $CF $E0 $FF $7F $00 $00 $FF $FF $D7 $D7
.db $D0 $DF $DF $D0 $D7 $D7 $03 $E0 $91 $00 $01 $01 $03 $03 $6E $6E
.db $DD $DD $BB $BB $76 $76 $C0 $C0 $80 $80 $04 $00 $05 $D6 $83 $C6
.db $FE $FE $05 $0D $93 $0C $0F $0F $06 $06 $0D $0D $1B $18 $3F $3F
.db $EC $EC $D8 $D8 $B0 $30 $E0 $E0 $04 $00 $84 $FF $FF $C0 $DF $05
.db $00 $B6 $FF $00 $FF $00 $7F $60 $4F $5F $58 $5B $5A $00 $FE $06
.db $F2 $FA $1A $DA $42 $00 $7F $40 $5F $5F $50 $57 $54 $00 $FF $80
.db $BF $BF $81 $FD $05 $00 $7F $40 $5F $5F $58 $5B $5A $00 $FE $02
.db $FA $FA $02 $FE $00 $00 $7E $42 $05 $5A $83 $FF $00 $FF $03 $00
.db $8A $01 $01 $FA $3A $BA $BA $B2 $B4 $74 $64 $05 $5A $83 $5B $58
.db $5F $08 $54 $08 $05 $08 $5A $06 $00 $8D $03 $03 $02 $02 $05 $05
.db $0B $0B $17 $17 $4F $60 $7F $04 $00 $8B $7E $54 $57 $50 $5F $5F
.db $50 $57 $54 $C0 $C0 $04 $00 $8C $01 $01 $2E $2E $5D $5D $BA $BA
.db $74 $74 $80 $80 $06 $00 $05 $54 $83 $44 $7C $00 $05 $05 $92 $04
.db $07 $00 $02 $02 $05 $05 $0B $08 $1F $00 $E8 $E8 $D0 $D0 $A0 $20
.db $C0 $06 $00 $83 $7F $40 $5F $77 $00 $5F $00 $85 $FF $FF $00 $00
.db $1F $03 $3F $85 $3C $3C $00 $00 $F8 $03 $FC $84 $3C $3C $00 $00
.db $04 $3F $84 $38 $38 $00 $00 $04 $7F $84 $03 $03 $00 $00 $04 $3F
.db $84 $3C $3C $00 $00 $04 $FC $04 $00 $06 $3C $82 $FF $FF $06 $00
.db $82 $FC $FC $03 $7C $83 $78 $F8 $F8 $06 $3C $82 $3F $3F $08 $38
.db $08 $03 $08 $3C $07 $00 $03 $01 $88 $03 $03 $07 $07 $0F $0F $3F
.db $1F $06 $00 $82 $38 $38 $04 $3F $83 $38 $38 $80 $07 $00 $88 $1F
.db $1F $3E $3E $7C $7C $F8 $F8 $08 $00 $06 $38 $82 $00 $00 $06 $03
.db $90 $00 $00 $01 $01 $03 $03 $07 $07 $00 $00 $F0 $F0 $E0 $E0 $C0
.db $C0 $08 $00 $82 $3F $3F $00

_LABEL_3894_:
	call ++
	call +
	ld ix, _RAM_CD05_
	ld b, $06
-:
	push bc
	bit 7, (ix+0)
	call nz, _LABEL_39C3_
	ld de, $0020
	add ix, de
	pop bc
	djnz -
	ret

+:
	ld hl, _RAM_CD05_
	ld de, $0020
	exx
	ld hl, _RAM_CD65_
	ld de, $0020
	ld b, $03
-:
	bit 7, (hl)
	exx
	set 2, (hl)
	jp nz, +
	res 2, (hl)
+:
	add hl, de
	exx
	add hl, de
	djnz -
	exx
	ret

++:
	ld a, (_RAM_CD00_)
	bit 7, a
	jp z, _LABEL_3C56_
	cp $91
	jp nc, _LABEL_3C56_
	sub $80
	ret z
	dec a
	ld c, a
	ld b, $00
	ld hl, _DATA_38FA_
	add hl, bc
	add hl, bc
	ld c, (hl)
	inc hl
	ld b, (hl)
	ld de, $001D
	add hl, de
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld a, (_RAM_CD01_)
	ld e, a
	jp (hl)

.INCLUDE "audio.asm"

.INCLUDE "data.asm"
