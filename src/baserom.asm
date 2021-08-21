; This disassembly was created using Emulicious (https://www.emulicious.net)
.MEMORYMAP
SLOTSIZE $4000
SLOT 0 $0000
SLOT 1 $4000
SLOT 2 $8000
DEFAULTSLOT 2
.ENDME
.ROMBANKMAP
BANKSTOTAL 2
BANKSIZE $4000
BANKS 2
.ENDRO

.INCLUDE "constants.asm"
.INCLUDE "structs.asm"
.INCLUDE "variables.asm"

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

; Data from 14 to 17 (4 bytes)
.db $06 $05 $13 $05

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

; Data from 36 to 37 (2 bytes)
.db $57 $21

handleInterruptEntrypoint:
	jp handleInterrupt

; Data from 3B to 5A (32 bytes)
palette:
.db $0A $06 $05 $00 $29 $25 $3A $3F $34 $3B $03 $0F $0C $08 $0B $02
.db $00 $00 $03 $00 $3F $3F $3A $02 $0B $0C $08 $0F $34 $22 $21 $02

; Data from 5B to 65 (11 bytes)
_DATA_5B_:
.db $14 $00 $01 $01 $00 $01 $C0 $00 $70 $CA $21

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
	call _LABEL_189_
	ld (de), a
	ld de, _RAM_D300_
	ld hl, _DATA_40C9_
	call _LABEL_189_
	call _LABEL_14A_
	call _LABEL_BA9_
	call _LABEL_BE7_
	call _LABEL_159_
	call clearTilemap
	ld hl, (_DATA_58D5_)
	ld bc, $58D5
	ld de, $2000
	call _LABEL_313C_
	ld hl, (_DATA_440E_)
	ld de, $0000
	ld bc, $440E
	call _LABEL_313C_
	ld hl, _DATA_4A10_
	ld de, $0820
	ld b, $F8
	call _LABEL_16C_
	call _LABEL_A90_
	ld hl, _DATA_5825_
	ld de, $1C80
	ld b, $B0
	call _LABEL_16C_
	call _LABEL_36A1_
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
	ld a, $01
	ld (_RAM_C102_), a
_LABEL_EB_:
	di
	call _LABEL_13C_
	call _LABEL_3C65_
	ld a, $01
	ld (_RAM_C10B_), a
	ld a, $06
	ld (_RAM_C110_), a
	xor a
	ld (_RAM_C133_), a
	ld hl, _RAM_C103_
	res 7, (hl)
	ld de, $8900
	call writeVDPCommandWord
_LABEL_10B_:
	ei
	ld a, (_RAM_C107_)
	or a
	jp z, _LABEL_10B_
	xor a
	ld (_RAM_C107_), a
	ld a, (_RAM_C102_)
	rrca
	jp c, _LABEL_6DC_
	rrca
	jp c, _LABEL_681_
	rrca
	jp c, _LABEL_55B_
	rrca
	jp c, _LABEL_283_
	rrca
	jp c, _LABEL_261_
	jp _LABEL_EB_

; Data from 131 to 13B (11 bytes)
.db $11 $01 $C3 $21 $00 $C3 $01 $FF $01 $18 $09

_LABEL_13C_:
	ld de, _RAM_C133_ + 1
	ld hl, _RAM_C133_
	ld bc, $0FCD
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

_LABEL_189_:
	ld a, (hl)
	cp $FF
	ret z
	bit 7, a
	jr nz, +
	ld b, a
	inc hl
	ld a, (hl)
-:
	ld (de), a
	cp $FF
	ret z
	inc de
	djnz -
	inc hl
	jp _LABEL_189_

+:
	and $7F
	ld b, a
-:
	inc hl
	ld a, (hl)
	ld (de), a
	cp $FF
	ret z
	inc de
	djnz -
	inc hl
	jp _LABEL_189_

handleInterrupt:
	push af
	in a, (Port_VDPStatus)
	push bc
	push de
	push hl
	push ix
	push iy
	ld a, $FF
	ld (_RAM_C107_), a
	ld a, (_RAM_C102_)
	cp $10
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
	ld a, (_RAM_C102_)
	cp $10
	jr z, +
	cp $08
	jr nz, _LABEL_22F_
	ld (_RAM_C11E_), a
	ld a, $10
	ld (_RAM_C102_), a
_LABEL_22F_:
	pop af
	retn

+:
	ld a, (_RAM_C11E_)
	ld (_RAM_C102_), a
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

_LABEL_261_:
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
	jp _LABEL_10B_

_LABEL_283_:
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
	jp z, _LABEL_10B_
	call _LABEL_70E_
	jr nz, +
	ld a, (_RAM_C300_)
	inc a
	ld (_RAM_C300_), a
	cp $E0
	jp c, _LABEL_10B_
+:
	ld iy, _RAM_C600_
	call putIYEntityOffscreen
	jp +++

++:
	ld a, (_RAM_C133_)
	and $C0
	jp z, _LABEL_10B_
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
	jp c, _LABEL_10B_
+:
	ld iy, _RAM_C600_
	call putIYEntityOffscreen
	ld iy, _RAM_C620_
	call putIYEntityOffscreen
	ld a, (_RAM_C133_)
	and $F9
	ld (_RAM_C133_), a
+++:
	ld a, $01
	ld (_RAM_C102_), a
	jp _LABEL_EB_

++++:
	call +
	jp c, _LABEL_10B_
	ld hl, _RAM_C133_
	res 1, (hl)
	ld iy, _RAM_C600_
	call putIYEntityOffscreen
	jp _LABEL_10B_

_LABEL_324_:
	call +
	jp c, _LABEL_10B_
	ld hl, _RAM_C133_
	res 2, (hl)
	ld iy, _RAM_C620_
	call putIYEntityOffscreen
	jp _LABEL_10B_

+:
	ld a, (_RAM_C301_)
	inc a
	ld (_RAM_C301_), a
	cp $E0
	ret c
	xor a
	ret

_LABEL_345_:
	ld a, (_RAM_C102_)
	cp $04
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
	jp _LABEL_10B_

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
	ld (_RAM_C602_), a
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
.db $06 $05 $41 $05 $41 $05 $41 $05 $06 $05 $4E $05 $4E $05 $4E $05
.db $04 $00 $00 $10 $00 $08 $11 $08 $00 $12 $08 $08 $13 $01 $04 $04
.db $00

; Data from 517 to 523 (13 bytes)
_DATA_517_:
.db $20 $05 $02 $01 $00 $02 $C0 $00 $40 $34 $05 $13 $05

; Data from 524 to 55A (55 bytes)
_DATA_524_:
.db $34 $05 $41 $05 $41 $05 $41 $05 $34 $05 $4E $05 $4E $05 $4E $05
.db $04 $00 $00 $10 $00 $08 $11 $08 $00 $14 $08 $08 $15 $04 $00 $00
.db $08 $00 $08 $09 $08 $00 $0A $08 $08 $0B $04 $00 $00 $0C $00 $08
.db $0D $08 $00 $0E $08 $08 $0F

_LABEL_55B_:
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
	jp nz, _LABEL_283_
+:
	ld a, $01
	ld (_RAM_C102_), a
	jp _LABEL_EB_

++:
	ld hl, _RAM_C151_
	set 1, (hl)
	ld a, (_RAM_C103_)
	or $01
	ld (_RAM_C103_), a
	ld a, $FF
	ld (_RAM_C150_), a
	jp _LABEL_10B_

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

_LABEL_681_:
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
	jp c, _LABEL_10B_
	ld a, $04
	ld (_RAM_C102_), a
	xor a
	ld (_RAM_C10E_), a
	jp _LABEL_EB_

++:
	di
	push hl
	call _LABEL_36A1_
	pop hl
	ld a, $01
	ld (_RAM_C10B_), a
	ld a, $02
	ld (_RAM_C10C_), a
	ld a, $04
	ld (_RAM_C10E_), a
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
	ld hl, _RAM_C102_
	ld (hl), $08
	ret

_LABEL_6DC_:
	ld a, (_RAM_C152_)
	or a
	call z, +++
	call _LABEL_70E_
	cp $02
	jr z, ++
	ld hl, _RAM_C148_
	inc (hl)
	ld a, (hl)
	cp $A0
	jr z, +
	jp _LABEL_10B_

+:
	call ++++
++:
	xor a
	ld (_RAM_C10C_), a
	jp _LABEL_EB_

+++:
	ld a, $02
	ld (_RAM_C10C_), a
	ld a, $05
	ld (_RAM_C10F_), a
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
	ld a, $02
	ld (_RAM_C102_), a
	or a
	ret

_LABEL_724_:
	ld hl, _RAM_C10A_
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

; Jump Table from 745 to 76C (20 entries, indexed by _RAM_C10A_)
_DATA_745_:
.dw jumpToClearTilemap
.dw drawBlueBG
.dw setBGColorsToBlack
.dw drawMenu
.dw drawMark3Logo
.dw clearSprites
.dw _LABEL_906_
.dw _LABEL_9BD_
.dw _LABEL_9C9_
.dw _LABEL_9D5_
.dw _LABEL_A3E_
.dw _LABEL_A90_
.dw _LABEL_A9C_
.dw _LABEL_ABB_
.dw _LABEL_AC1_
.dw _LABEL_AD8_
.dw _LABEL_B0F_
.dw _LABEL_B2C_
.dw _LABEL_B2C_
.dw _LABEL_B2C_

; 1st entry of Jump Table from 745 (indexed by _RAM_C10A_)
jumpToClearTilemap:
	jp clearTilemap

; 5th entry of Jump Table from 745 (indexed by _RAM_C10A_)
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

; 3rd entry of Jump Table from 745 (indexed by _RAM_C10A_)
setBGColorsToBlack:
	; Set PAL1 1st color to black
	ld a, $00
	ld de, $C010
	rst $18	; writeToVdpAddress

	; Set PAL0 4th color to black
	ld a, $00
	ld de, $C003
	jp writeToVdpAddress

; 4th entry of Jump Table from 745 (indexed by _RAM_C10A_)
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

; 2nd entry of Jump Table from 745 (indexed by _RAM_C10A_)
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

; 6th entry of Jump Table from 745 (indexed by _RAM_C10A_)
clearSprites:
	ld de, $3F00
	ld bc, $0020
	ld hl, $D0D0
	jp fillVram

; 7th entry of Jump Table from 745 (indexed by _RAM_C10A_)
_LABEL_906_:
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

; 8th entry of Jump Table from 745 (indexed by _RAM_C10A_)
_LABEL_9BD_:
	ld a, $8B
	ld (_RAM_CD00_), a
	ld hl, p1Lives
	inc (hl)
	jp _LABEL_45C_

; 9th entry of Jump Table from 745 (indexed by _RAM_C10A_)
_LABEL_9C9_:
	ld a, $8B
	ld (_RAM_CD00_), a
	ld hl, _RAM_C106_
	inc (hl)
	jp _LABEL_46C_

; 10th entry of Jump Table from 745 (indexed by _RAM_C10A_)
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

; 11th entry of Jump Table from 745 (indexed by _RAM_C10A_)
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

; 12th entry of Jump Table from 745 (indexed by _RAM_C10A_)
_LABEL_A90_:
	ld hl, (_DATA_4B08_)
	ld de, $0C00
	ld bc, $4B08
	jp _LABEL_313C_

; 13th entry of Jump Table from 745 (indexed by _RAM_C10A_)
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

; 14th entry of Jump Table from 745 (indexed by _RAM_C10A_)
_LABEL_ABB_:
	ld a, $8F
	ld (_RAM_CD00_), a
	ret

; 15th entry of Jump Table from 745 (indexed by _RAM_C10A_)
_LABEL_AC1_:
	ld a, $80
	ld (_RAM_C338_), a
	ld hl, _DATA_ACC_
	jp _LABEL_B12_

; Data from ACC to AD7 (12 bytes)
_DATA_ACC_:
.db $45 $51 $54 $52 $41 $20 $20 $20 $20 $20 $20 $20

; 16th entry of Jump Table from 745 (indexed by _RAM_C10A_)
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

; 17th entry of Jump Table from 745 (indexed by _RAM_C10A_)
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

; 18th entry of Jump Table from 745 (indexed by _RAM_C10A_)
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
	ld a, $03
	ld (_RAM_C10D_), a
	ld a, $01
	ld (_RAM_C10B_), a
	ld a, $06
	ld (_RAM_C110_), a
	ld a, $07
	ld (_RAM_C111_), a
	ld a, $0C
	ld (_RAM_C116_), a
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
	ld (_RAM_C322_), a
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

; Jump Table from C64 to CA7 (34 entries, indexed by _RAM_C602_)
entityUpdatersPointers:
.dw updatePlayer1
.dw updatePlayer2
.dw updateBullet
.dw updateBomb
.dw _LABEL_E2C_
.dw _LABEL_EBF_
.dw _LABEL_1155_
.dw updateExplosion
.dw _LABEL_FC0_
.dw updateEnemy1
.dw _LABEL_12BA_
.dw _LABEL_13CD_
.dw _LABEL_149D_
.dw _LABEL_156A_
.dw _LABEL_15C4_
.dw _LABEL_1770_
.dw _LABEL_1EE9_
.dw _LABEL_189A_
.dw _LABEL_198A_
.dw _LABEL_2011_
.dw _LABEL_199B_
.dw _LABEL_1A6B_
.dw updateEnemy2
.dw _LABEL_20AA_
.dw _LABEL_2114_
.dw _LABEL_1BA5_
.dw _LABEL_1C11_
.dw _LABEL_1D72_
.dw _LABEL_1DBE_
.dw _LABEL_213F_
.dw _LABEL_21AE_
.dw _LABEL_11A8_
.dw _LABEL_1E99_
.dw _LABEL_1E86_

.INCLUDE "entities/updatePlayers.asm"
.INCLUDE "entities/updateBullet.asm"
.INCLUDE "entities/updateBomb.asm"

; 5th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_E2C_:
	ld a, (iy+22)
	or a
	jr nz, _LABEL_E9B_
	ld (iy+22), $01
	ld hl, _DATA_E75_
	ld (iy + Entity.animationDescriptorPointer.low), l
	ld (iy + Entity.animationDescriptorPointer.high), h
	ld hl, $0008
	ld (iy + Entity.yVel.low), h
	ld (iy + Entity.yVel.high), l
	ld (iy+20), l
	ld (iy+17), h
	ld (iy+18), $04
	ld (iy+30), $60
	ld a, $8A
	ld (_RAM_CD00_), a
	ld hl, _RAM_C104_
	ld a, (iy+5)
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
.db $7D $0E $8A $0E $7D $0E $97 $0E $04 $00 $00 $16 $00 $08 $17 $08
.db $00 $18 $08 $08 $19 $04 $00 $00 $1A $00 $08 $1B $08 $00 $1C $08
.db $08 $1D $01 $00 $00 $00

_LABEL_E9B_:
	ld a, (iy+17)
	cp $03
	call c, _LABEL_1027_
	dec (iy+30)
	ret nz
	ld hl, _RAM_C104_
	ld a, (iy+5)
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

; 6th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_EBF_:
	ld a, (iy+3)
	or a
	jp nz, _LABEL_F48_
	ld a, (iy+5)
	ld hl, _DATA_EEC_
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
	ld (iy+17), $01
	ld (iy+5), c
	ret

; Data from EEC to F47 (92 bytes)
_DATA_EEC_:
.db $FA $0E $06 $01 $0C $01 $C0 $00 $58 $00 $00 $03 $04 $FF $FE $0E
.db $23 $0F $0C $00 $00 $50 $00 $08 $4C $00 $10 $20 $00 $18 $31 $08
.db $00 $47 $08 $08 $41 $08 $10 $4D $08 $18 $45 $10 $00 $4F $10 $08
.db $56 $10 $10 $45 $10 $18 $52 $0C $00 $00 $50 $00 $08 $4C $00 $10
.db $20 $00 $18 $32 $08 $00 $47 $08 $08 $41 $08 $10 $4D $08 $18 $45
.db $10 $00 $4F $10 $08 $56 $10 $10 $45 $10 $18 $52

_LABEL_F48_:
	ld a, (iy + Entity.yPos.low)
	cp $80
	jp nc, updateEntityY
	ld hl, _RAM_C133_
	ld a, (iy+5)
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

; 9th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_FC0_:
	ld a, (iy+22)
	or a
	jr nz, +
	ld (iy + Entity.yVel.low), $00
	ld (iy + Entity.yVel.high), $55
	ld hl, _DATA_FE5_
	ld (iy + Entity.animationDescriptorPointer.low), l
	ld (iy + Entity.animationDescriptorPointer.high), h
	ld (iy+22), $01
	ld (iy+17), $00
	ld a, $88
	ld (_RAM_CD00_), a
	ret

; Data from FE5 to FF3 (15 bytes)
_DATA_FE5_:
.db $E7 $0F $04 $00 $00 $1A $00 $08 $1B $08 $00 $1C $08 $08 $1D

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
	inc (iy+19)
	ld a, (iy+19)
	cp (iy+20)
	jr nz, ++
	ld (iy+19), $00
	inc (iy+17)
	ld a, (iy+17)
	cp (iy+18)
	jr nz, +
	ld (iy+17), $00
+:
	scf
	ret

++:
	xor a
	ret

_LABEL_1049_:
	ld (iy+18), h
	ld (iy+20), l
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

_LABEL_1063_:
	ld (ix + Entity.yPos.low), $D8
	ld (ix + Entity.xPos.low), $00
	ld (ix + Entity.data15), $01
	ret

_LABEL_1070_:
	ld iy, _RAM_C740_
	ld b, $11
	ld de, $0020
-:
	ld a, (iy+3)
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
	ld a, (iy+28)
	or a
	ret z
	ld a, $1E
	ld (_RAM_C32F_), a
	jp -

++:
	xor a
	ld (_RAM_C31F_), a
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

; Data from 10DE to 110B (46 bytes)
.db $CD $2A $2D $E6 $0F $FE $05 $D8 $FD $36 $08 $30 $FE $0A $D8 $FD
.db $36 $08 $80 $C9 $04 $00 $00 $1E $00 $08 $07 $08 $00 $A5 $08 $08
.db $A6 $04 $00 $00 $68 $00 $08 $69 $08 $00 $6A $08 $08 $6B

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
	ld a, (iy+27)
	or a
	ret z
	dec (iy+26)
	jp nz, _LABEL_1027_
-:
	xor a
	ld (iy+27), a
	ld (iy + Entity.animationDescriptorPointer.low), l
	ld (iy + Entity.animationDescriptorPointer.high), h
	ld (iy+17), a
	ld (iy+18), $08
	ld (iy+19), a
	ret

_LABEL_1149_:
	push iy
	push ix
	pop iy
	call -
	pop iy
	ret

; 7th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_1155_:
	ld a, (iy+3)
	or a
	jp nz, updateEntityXY
	ld hl, _DATA_11A2_
_LABEL_115F_:
	push hl
	call _LABEL_1183_
	pop hl
	ld a, $01
	ld (iy+3), a
	ld (iy+4), a
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
	ld a, (iy+5)
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

; Data from 11A2 to 11A7 (6 bytes)
_DATA_11A2_:
.db $A4 $11 $01 $00 $00 $05

; 32nd entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_11A8_:
	ld a, (iy+3)
	or a
	jr nz, +
	ld hl, _DATA_11C8_
	jp _LABEL_115F_

+:
	inc (iy+29)
	ld a, (iy+29)
	cp $40
	call c, _LABEL_1183_
	ld de, $0100
	call updateEntityYWith
	jp updateEntityX

; Data from 11C8 to 11CD (6 bytes)
_DATA_11C8_:
.db $CA $11 $01 $00 $00 $40

; 10th entry of Jump Table from C64 (indexed by _RAM_C602_)
updateEnemy1:
	ld a, (iy+3)
	or a
	jp nz, _LABEL_1265_

	ld (iy+27), $00
	ld hl, enemy1Data
	ld bc, $0011
	call memcpyIYToHL

	ld (iy+29), $08

	; X velocity and postion
	ld de, $0208

	ld (iy+24), e
	ld hl, _RAM_C30E_
	inc (hl)
	ld a, (hl)
	cp $09
	jr c, +
	ld (hl), $01
	inc hl
	ld a, (hl)
	cpl
	ld (hl), a
	dec hl
+:
	inc hl
	ld a, (hl)
	or a
	ret z
	ld (iy+27), $01
	ld (iy + Entity.xPos.low), e
	ld (iy + Entity.xVel.low), d
	ld hl, enemy1AnimationDescriptor2
	ld (iy + Entity.animationDescriptorPointer.low), l
	ld (iy + Entity.animationDescriptorPointer.high), h
	ret

enemy1Data:
.dw enemy1AnimationDescriptor1
.db $0A ; type
.db $01 ; data03
.db $04 ; data04
.db $00 ; data05
.db $F8 ; yPos.low
.db $00 ; yPos.high
.db $A0 ; xPos.low
.db $00 ; xPos.high
.db $00 ; data0a
.db $02 ; data0b
.db $02 ; data0c
.db $02 ; yVel.low
.db $00 ; yVel.high
.db $FE ; xVel.low
.db $00 ; xVel.high

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

_LABEL_1265_:
	dec (iy+29)
	call z, _LABEL_3063_
	ld a, (iy+26)
	or a
	jr nz, ++
	inc (iy+25)
	ld a, (iy+25)
	cp $48
	jr c, +
	ld (iy+19), $0C
	ld hl, $0001
	ld (iy+26), l
	ld (iy + Entity.yVel.low), l
	ld (iy + Entity.yVel.high), h
	ld (iy + Entity.xVel.low), l
	ld (iy + Entity.xVel.high), h
	ld a, (iy+27)
	or a
	jp z, _LABEL_3063_
	ld (iy + Entity.xVel.low), $FF
	jp _LABEL_3063_

+:
	call _LABEL_1A2A_
	jp updateEntityX

++:
	ld (iy+17), $02
	ld a, (iy+19)
	or a
	jp z, updateEntityXY
	ld (iy+17), $01
	dec (iy+19)
	jp updateEntityXY

; 11th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_12BA_:
	ld a, (iy+3)
	or a
	jp nz, _LABEL_1362_
	ld hl, _DATA_1316_
	ld bc, $0010
	call memcpyIYToHL
	call _LABEL_12F7_
	ld hl, $0210
	call _LABEL_1049_
	ld (iy+5), $01
	ld (iy+25), $38
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
	ld (iy+5), $02
	ret

_LABEL_12F7_:
	call _LABEL_2D2A_
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

; Data from 1316 to 1343 (46 bytes)
_DATA_1316_:
.db $26 $13 $0B $01 $04 $00 $00 $00 $00 $00 $00 $02 $02 $03 $00 $FF
.db $2A $13 $37 $13 $04 $00 $00 $C4 $00 $08 $C5 $08 $00 $C6 $08 $08
.db $C7 $04 $00 $00 $C8 $00 $08 $C9 $08 $00 $CA $08 $08 $CB

; Data from 1344 to 1361 (30 bytes)
_DATA_1344_:
.db $48 $13 $55 $13 $04 $00 $00 $A4 $00 $08 $A5 $08 $00 $A6 $08 $08
.db $A7 $04 $00 $00 $A8 $00 $08 $A9 $08 $00 $AA $08 $08 $AB

_LABEL_1362_:
	call _LABEL_13B0_
	ld a, (iy+31)
	or a
	jr nz, +++
	ld a, (iy+24)
	or a
	jr nz, ++
	call updateEntityY
	call loadPlayer1XYPosToHL
	ld a, (iy+5)
	dec a
	jr z, +
	call loadPlayer2XYPosToHL
+:
	ld a, l
	sub $30
	cp (iy + Entity.yPos.low)
	ret nc
	ld (iy+24), $01
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
	ld a, (iy+5)
	ld c, a
	call _LABEL_2F92_
	ld (iy + Entity.type), $08
	ret

_LABEL_13B0_:
	dec (iy+25)
	ret nz
	ld (iy+25), $38
	jp _LABEL_3063_

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

; 12th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_13CD_:
	ld a, (iy+3)
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
.db $30 $14 $0C $01 $04 $00 $00 $00 $58 $00 $00 $00 $00

; Data from 1423 to 143E (28 bytes)
_DATA_1423_:
.db $30 $14 $13 $01 $04 $00 $00 $00 $58 $00 $00 $00 $00 $32 $14 $04
.db $00 $00 $88 $00 $08 $89 $08 $00 $8A $08 $08 $8B

; Data from 143F to 144A (12 bytes)
_DATA_143F_:
.db $43 $14 $47 $14 $01 $04 $04 $8C $01 $04 $04 $8D

_LABEL_144B_:
	ld a, (iy+25)
	or a
	jr nz, +
	ld de, $0400
	ld a, (iy + Entity.yPos.low)
	cp $40
	jp c, updateEntityYWith
	ld (iy+24), $30
	ld (iy+25), $01
	ld (iy+26), $01
	ld de, _DATA_143F_
	ld (iy + Entity.animationDescriptorPointer.low), e
	ld (iy + Entity.animationDescriptorPointer.high), d
	ld hl, $0206
	jp _LABEL_1049_

+:
	call _LABEL_1027_
	ld a, (iy+24)
	or a
	jr z, +
	dec (iy+24)
	jp updateEntityXY

+:
	ld de, $0100
	call updateEntityYWith
	dec (iy+26)
	ret nz
	ld (iy+26), $20
	ld a, (iy + Entity.type)
	cp $13
	ret z
	jp _LABEL_3063_

; 13th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_149D_:
	ld a, (iy+3)
	or a
	jp nz, _LABEL_1511_
	ld (iy+24), $10
	ld (iy+28), $08
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
.db $D8 $14 $0D $01 $04 $00 $20 $00 $A8 $00 $00 $02 $02 $00 $80 $FC
.db $00 $F0 $14 $E9 $14 $E2 $14 $F7 $14 $04 $15 $02 $00 $04 $07 $08
.db $04 $27 $02 $04 $00 $2A $04 $08 $2B $02 $00 $04 $28 $08 $04 $29
.db $04 $00 $00 $2C $00 $08 $2D $08 $00 $2E $08 $08 $2F $04 $00 $00
.db $60 $00 $08 $61 $08 $00 $62 $08 $08 $63

_LABEL_1511_:
	dec (iy+28)
	call z, +++
	call ++++
	call updateEntityY
	ld h, (iy + Entity.xVel.low)
	ld l, (iy + Entity.xVel.high)
	ld e, (iy+24)
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
	ld (iy+28), $38
	jp _LABEL_3063_

++++:
	ld (iy+17), $01
	ld a, (iy + Entity.xVel.low)
	or a
	ret z
	ld (iy+17), $04
	cp $03
	ret c
	ld (iy+17), $03
	cp $FE
	ret nc
	ld (iy+17), $00
	rlca
	ret nc
	ld (iy+17), $02
	ret

; 14th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_156A_:
	ld a, (iy+3)
	or a
	jr nz, _LABEL_15B5_
	ld a, $01
	ld (_RAM_C31F_), a
	ld a, $FC
	ld (_RAM_C320_), a
	ld a, $50
	ld (_RAM_C321_), a
	ld hl, _DATA_158E_
	ld bc, $0009
	call memcpyIYToHL
	ld hl, $0210
	jp _LABEL_1049_

; Data from 158E to 15B4 (39 bytes)
_DATA_158E_:
.db $97 $15 $0E $01 $04 $00 $FC $00 $50 $9B $15 $A8 $15 $04 $00 $00
.db $80 $00 $08 $81 $08 $00 $82 $08 $08 $83 $04 $00 $00 $84 $00 $08
.db $85 $08 $00 $86 $08 $08 $87

_LABEL_15B5_:
	ld de, $0040
	call updateEntityYWith
	ld a, (iy + Entity.yPos.low)
	ld (_RAM_C320_), a
	jp _LABEL_1027_

; 15th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_15C4_:
	ld a, (iy+3)
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
	ld (iy+3), $01
	ld (iy + Entity.animationDescriptorPointer.low), l
	ld (iy + Entity.animationDescriptorPointer.high), h
	ld (iy + Entity.yVel.low), $FE
	ld (iy + Entity.yVel.high), $00
	ld (iy + Entity.xVel.high), $80
	ret

+:
	ld a, (iy+24)
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
	ld (_RAM_C600_), a
	ld a, h
	ld (_RAM_C601_), a
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
.db $6E $16 $41 $05 $41 $05 $41 $05 $6E $16 $4E $05 $4E $05 $4E $05

; Data from 165E to 1687 (42 bytes)
_DATA_165E_:
.db $7B $16 $41 $05 $41 $05 $41 $05 $7B $16 $4E $05 $4E $05 $4E $05
.db $04 $00 $00 $1E $00 $08 $1F $08 $00 $12 $08 $08 $13 $04 $00 $00
.db $1E $00 $08 $1F $08 $00 $14 $08 $08 $15

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
	ld (_RAM_C112_), a
	ret

+:
	ld a, $09
	ld (_RAM_C113_), a
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
	ld (_RAM_C11B_), a
	ret

; 16th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_1770_:
	ld a, (iy+3)
	or a
	jp nz, _LABEL_1805_
	ld hl, _DATA_17B7_
	ld bc, $0009
	call memcpyIYToHL
	ld a, r
	and $03
	inc a
	ld (iy+24), a
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
	ld (iy+25), a
	inc hl
	ld a, (hl)
	ld (iy+26), a
	ld hl, $0308
	jp _LABEL_1049_

; Data from 17B7 to 17EC (54 bytes)
_DATA_17B7_:
.db $C0 $17 $10 $01 $04 $00 $90 $00 $B4 $C6 $17 $D3 $17 $E0 $17 $04
.db $00 $00 $74 $00 $08 $75 $08 $00 $76 $08 $08 $77 $04 $00 $00 $78
.db $00 $08 $79 $08 $00 $7A $08 $08 $7B $04 $00 $00 $7C $00 $08 $7D
.db $08 $00 $7E $08 $08 $7F

; Data from 17ED to 1804 (24 bytes)
_DATA_17ED_:
.db $F0 $B4 $01 $FF $00 $08 $90 $00 $FF $01 $FF $F8 $90 $B4 $FF $FF
.db $00 $08 $F0 $00 $01 $01 $FF $F8

_LABEL_1805_:
	call _LABEL_1027_
	ld a, (iy+27)
	or a
	jr nz, _LABEL_1859_
	ld a, (iy+24)
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
	ld (iy+27), $01
	ld a, (_RAM_C30A_)
	rrca
	ret c
	jp _LABEL_3063_

_LABEL_1859_:
	ld d, (iy+25)
	ld e, (iy+26)
_LABEL_185F_:
	ld h, (iy + Entity.xVel.low)
	ld l, (iy + Entity.xVel.high)
	add hl, de
	ld (iy + Entity.xVel.low), h
	ld (iy + Entity.xVel.high), l
	jp updateEntityXY

++++:
	ld c, a
	ld (iy+27), $01
	ld (iy+19), $00
	ld (iy+20), $04
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

; 18th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_189A_:
	ld a, (iy+3)
	or a
	jp nz, _LABEL_191F_
	ld hl, _DATA_18FA_
	ld bc, $0007
	call memcpyIYToHL
	ld (iy+24), $01
	ld (iy + Entity.xPos.low), $00
	call _LABEL_2D2A_
	rrca
	jr c, +
	ld (iy+24), $02
	ld (iy + Entity.xPos.low), $B4
+:
	ld (iy+5), $01
	ld a, (_RAM_C603_)
	or a
	jr z, +
	call _LABEL_2D2A_
	rrca
	jp c, ++
+:
	ld a, (_RAM_C623_)
	or a
	jp z, ++
	ld (iy+5), $02
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
.db $01 $19 $12 $01 $04 $00 $00 $05 $19 $12 $19 $04 $00 $00 $AC $00
.db $08 $AD $08 $00 $AE $08 $08 $AF $04 $00 $00 $B0 $00 $08 $B1 $08
.db $00 $B2 $08 $08 $B3

_LABEL_191F_:
	ld (iy+17), $00
	ld a, (iy+19)
	or a
	jr z, +
	dec (iy+19)
	ld (iy+17), $01
+:
	ld a, (iy+26)
	or a
	jp nz, updateEntityXY
	call loadPlayer1XYPosToHL
	ld a, (iy+5)
	cp $01
	jr z, +
	call loadPlayer2XYPosToHL
+:
	ld (iy+25), l
	ld a, h
	call _LABEL_1884_
	jp nc, updateEntityXY
	ld a, (iy+25)
	call _LABEL_1889_
	jp nc, updateEntityXY
	ld (iy+26), $01
	ld c, (iy+5)
	call _LABEL_2F92_
	ld (iy+19), $10
	ld hl, $00FF
	ld (iy + Entity.xVel.low), l
	ld (iy + Entity.xVel.high), h
	ld (iy + Entity.yVel.low), l
	ld (iy + Entity.yVel.high), $80
	ld a, (iy+24)
	cp $01
	ret z
	ld (iy + Entity.xVel.low), $01
	ld (iy + Entity.xVel.high), h
	ld (iy + Entity.yVel.low), l
	ld (iy + Entity.yVel.high), $80
	ret

; 19th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_198A_:
	ld a, (iy+3)
	or a
	jp z, _LABEL_13D3_
	ld a, (iy+28)
	or a
	jp z, _LABEL_144B_
	jp _LABEL_15FE_

; 21st entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_199B_:
	ld a, (iy+3)
	or a
	jr nz, _LABEL_1A0B_
	ld hl, _DATA_19DF_
	ld bc, $000E
	call memcpyIYToHL
	ld hl, $020A
	call _LABEL_1049_
	ld (iy+24), $06
	ld hl, _RAM_C30B_
	inc (hl)
	ld a, (_RAM_C30C_)
	inc a
	ld (iy+25), a
	ld (iy + Entity.xPos.low), $58
	dec a
	jr z, +
	ld (iy + Entity.xPos.low), $90
	dec a
	ret z
	ld (iy + Entity.xPos.low), $18
	ret

+:
	ld (iy+25), $02
	call _LABEL_2D2A_
	rrca
	ret c
	ld (iy+25), $03
	ret

; Data from 19DF to 1A0A (44 bytes)
_DATA_19DF_:
.db $ED $19 $15 $01 $04 $00 $F0 $00 $60 $00 $00 $02 $02 $03 $F1 $19
.db $FE $19 $04 $00 $00 $8E $00 $08 $8F $08 $00 $90 $08 $08 $91 $04
.db $00 $00 $92 $00 $08 $93 $08 $00 $94 $08 $08 $95

_LABEL_1A0B_:
	call _LABEL_1027_
	ld a, (iy+26)
	or a
	call z, +
	call _LABEL_1A2A_
	ld a, (iy+25)
	dec a
	ret z
	ld de, $FFC0
	dec a
	jp z, updateEntityXWith
	ld de, $0040
	jp updateEntityXWith

_LABEL_1A2A_:
	ld e, (iy+24)
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
	ld (iy+26), $01
	ret

; 22nd entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_1A6B_:
	ld a, (iy+3)
	or a
	jr nz, _LABEL_1ACC_
	ld hl, _DATA_1A9F_
	ld bc, $000F
	call memcpyIYToHL
	call _LABEL_1A80_
	jp _LABEL_12F7_

_LABEL_1A80_:
	call _LABEL_2D2A_
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
	ld (iy+17), c
	ret

; Data from 1A9F to 1AAD (15 bytes)
_DATA_1A9F_:
.db $AE $1A $16 $01 $01 $00 $00 $00 $50 $00 $00 $01 $01 $00 $80

; Data from 1AAE to 1ACB (30 bytes)
_DATA_1AAE_:
.db $B8 $1A $BC $1A $C0 $1A $C4 $1A $C8 $1A $01 $00 $00 $3A $01 $00
.db $00 $3B $01 $00 $00 $3C $01 $00 $00 $3D $01 $00 $00 $3E

_LABEL_1ACC_:
	call updateEntityY
	ld a, (iy+24)
	or a
	ret z
_LABEL_1AD4_:
	ld (iy+24), $00
	ld a, (iy+17)
	add a, $3A
	ld (_RAM_C145_), a
	ld a, $0A
	ld (_RAM_C114_), a
	ld a, (iy+5)
	ld (_RAM_C146_), a
	jp putIYEntityOffscreen

; 23rd entry of Jump Table from C64 (indexed by _RAM_C602_)
updateEnemy2:
	ld a, (iy+3)
	or a
	jr nz, _LABEL_1B5A_
	ld hl, _DATA_1B2D_
	ld bc, $0015
	call memcpyIYToHL
	ld (iy+24), $FF
	ld (iy+25), $E8
	ld (iy+26), $50
	ld (iy+29), $20
	call _LABEL_2D2A_
	rrca
	jr c, +
	ld (iy+26), $30
+:
	call _LABEL_2D2A_
	rrca
	ret c
	ld (iy+24), $00
	ld (iy+25), $14
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
	ld d, (iy+24)
	ld e, (iy+25)
	jp _LABEL_185F_

+:
	ld a, (iy+26)
	or a
	jr z, +
	dec (iy+26)
	ret

+:
	ld de, $FFE8
	ld hl, $0300
	ld a, (iy+24)
	cp $80
	jr c, +
	ld de, $0018
	ld hl, $FD00
+:
	ld (iy + Entity.xVel.low), h
	ld (iy + Entity.xVel.high), l
	ld (iy+24), d
	ld (iy+25), e
	ld (iy+26), $38
	ret

++:
	dec (iy+29)
	ret nz
	ld (iy+29), $80
	jp _LABEL_3063_

; 26th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_1BA5_:
	ld a, (iy+3)
	or a
	jr nz, _LABEL_1C00_
	ld (iy+26), $18
	ld hl, _DATA_1BDB_
	ld bc, $0007
	call memcpyIYToHL
	ld c, $03
	call _LABEL_2D2A_
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
.db $E2 $1B $1A $01 $00 $00 $FC $E6 $1B $F3 $1B $04 $00 $00 $9C $00
.db $08 $9D $08 $00 $9E $08 $08 $9F $04 $00 $00 $A0 $00 $08 $A1 $08
.db $00 $A2 $08 $08 $A3

_LABEL_1C00_:
	call updateEntityY
	call _LABEL_1027_
	dec (iy+26)
	ret nz
	ld (iy+26), $50
	jp _LABEL_3063_

; 27th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_1C11_:
	ld a, (iy+3)
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
	ld a, (_RAM_C602_)
	cp $01
	jr z, +
-:
	ld (iy+3), $00
	ret

+:
	ld (iy+24), $01
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
	ld (iy+24), $02
	ret

+:
	ld a, r
	rrca
	jr c, --
	jr _LABEL_1C56_

_LABEL_1C69_:
	call _LABEL_1027_
	ld a, (iy+24)
	ld (iy+5), a
	cp $01
	jr nz, +
	ld a, (player1.yPos.low)
	add a, $02
	ld (iy+25), a
	ld a, (player1.xPos.low)
	add a, $02
	ld (iy+26), a
	jr ++

+:
	ld a, (player2.yPos.low)
	add a, $02
	ld (iy+25), a
	ld a, (player2.xPos.low)
	add a, $02
	ld (iy+26), a
++:
	ld a, (iy+27)
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
	ld a, (iy+26)
	add a, $14
	ld (iy + Entity.xPos.low), a
	ld a, (iy + Entity.yPos.low)
	add a, $08
	ld (iy + Entity.yPos.low), a
	sub (iy+25)
	ret c
	cp $08
	ret nc
	ld (iy+27), $01
	ret

; 2nd entry of Jump Table from 1CA8 (indexed by _RAM_C61B_)
_LABEL_1CCA_:
	ld a, (iy+28)
	inc (iy+28)
	cp $04
	jr c, ++
	ld (iy+28), $00
	inc (iy+30)
	ld a, (iy+30)
	cp $04
	jr z, +
	cp $02
	ret nz
	inc (iy+29)
	ld a, (iy+29)
	cp $06
	ret c
	ld (iy+27), $02
	ret

+:
	ld (iy+30), $00
	ret

++:
	add a, a
	ld c, a
	ld b, $00
	ld hl, _DATA_1D4E_
	add hl, bc
	ld a, (iy+30)
	or a
	jr z, +
	dec a
	jr z, ++
	dec a
	jr z, +++
	jr ++++

+:
	ld a, (hl)
	add a, (iy+26)
	ld (iy + Entity.xPos.low), a
	inc hl
	ld a, (hl)
	add a, (iy+25)
	ld (iy + Entity.yPos.low), a
	ret

++:
	ld a, (hl)
	add a, (iy+25)
	ld (iy + Entity.yPos.low), a
	inc hl
	ld a, (iy+26)
	sub (hl)
	ld (iy + Entity.xPos.low), a
	ret

+++:
	ld a, (iy+26)
	sub (hl)
	ld (iy + Entity.xPos.low), a
	ld a, (iy+25)
	inc hl
	sub (hl)
	ld (iy + Entity.yPos.low), a
	ret

++++:
	ld a, (iy+25)
	sub (hl)
	ld (iy + Entity.yPos.low), a
	inc hl
	ld a, (hl)
	add a, (iy+26)
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
.db $3F $14 $1B $01 $01 $00 $F0 $00 $58 $00 $19 $01 $01 $01

; 28th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_1D72_:
	ld a, (iy+3)
	or a
	jr nz, ++
	ld hl, _DATA_1DA4_
	ld bc, $0009
	call memcpyIYToHL
	ld (iy + Entity.yVel.high), $55
	ld hl, $0308
	call _LABEL_1049_
	ld (iy+24), $20
	call _LABEL_2D2A_
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
.db $0B $1E $1C $01 $04 $00 $08 $00 $B4

++:
	call _LABEL_1027_
	call updateEntityXY
	dec (iy+24)
	ret nz
	ld (iy+24), $40
	jp _LABEL_3063_

; 29th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_1DBE_:
	ld a, (iy+3)
	or a
	jp nz, _LABEL_1E38_
	ld (iy+24), $01
	ld (iy+25), $20
	ld (iy+26), $10
	ld hl, $0306
	call _LABEL_1049_
	ld hl, _DATA_1E02_
	ld bc, $0009
	call memcpyIYToHL
	ld (iy + Entity.yVel.high), $55
	ld a, (_RAM_C316_)
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
.db $0B $1E $1D $01 $04 $00 $F8 $00 $58 $11 $1E $1E $1E $2B $1E $04
.db $00 $00 $D7 $00 $08 $D8 $08 $00 $D9 $08 $08 $DA $04 $00 $00 $DB
.db $00 $08 $DC $08 $00 $DD $08 $08 $DE $04 $00 $00 $DF $00 $08 $E0
.db $08 $00 $E1 $08 $08 $E2

_LABEL_1E38_:
	call _LABEL_1027_
	ld b, (iy+24)
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
	dec (iy+26)
	jr nz, +
	ld (iy+26), $48
	call _LABEL_3063_
+:
	dec (iy+25)
	ret nz
	ld (iy+25), $38
	inc (iy+29)
	ld a, (iy+29)
	cp $04
	jr c, +
	xor a
	ld (iy+29), a
+:
	ld e, a
	ld d, $00
	ld hl, _DATA_1E82_
	add hl, de
	ld a, (hl)
	ld (iy+24), a
	ret

; Data from 1E82 to 1E85 (4 bytes)
_DATA_1E82_:
.db $03 $01 $02 $01

; 34th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_1E86_:
	ld a, (iy+3)
	or a
	jp nz, _LABEL_15FE_
	ld hl, _DATA_1E93_
	jp ++

; Data from 1E93 to 1E98 (6 bytes)
_DATA_1E93_:
.db $95 $1E $01 $04 $04 $21

; 33rd entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_1E99_:
	ld a, (iy+3)
	or a
	jp nz, _LABEL_15FE_
	ld a, (iy+4)
	ld (iy+4), $00
	ld c, $0D
	cp $8C
	jp nz, +
	ld (iy+17), $01
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
.db $CC $1E $D6 $1E $03 $00 $00 $CC $08 $00 $CD $08 $08 $CE $06 $00
.db $00 $CF $00 $08 $D0 $00 $10 $D1 $08 $00 $D2 $08 $08 $D3 $08 $10
.db $D4

; 17th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_1EE9_:
	ld a, (iy+3)
	or a
	jp nz, _LABEL_1F85_
	ld hl, _DATA_1F16_
	ld bc, $0009
	call memcpyIYToHL
	ld (iy+24), $02
_LABEL_1EFD_:
	ld (iy + Entity.yVel.low), $FF
	ld (iy + Entity.yVel.high), $00
	ld (iy+30), $00
	ld (iy+31), $08
	ld (iy + Entity.xVel.high), $80
	ld (iy+27), $00
	ret

; Data from 1F16 to 1F84 (111 bytes)
_DATA_1F16_:
.db $1F $1F $11 $01 $00 $00 $D8 $00 $50 $23 $1F $54 $1F $10 $00 $00
.db $B4 $00 $08 $B5 $00 $10 $B6 $00 $18 $B7 $08 $00 $B8 $08 $08 $E3
.db $08 $10 $E3 $08 $18 $B9 $10 $00 $BA $10 $08 $BB $10 $10 $BC $10
.db $18 $BD $18 $00 $BE $18 $08 $BF $18 $10 $C0 $18 $18 $C1 $10 $00
.db $00 $B4 $00 $08 $B5 $00 $10 $B6 $00 $18 $B7 $08 $00 $B8 $08 $08
.db $E3 $08 $10 $E3 $08 $18 $B9 $10 $00 $BA $10 $08 $BB $10 $10 $BC
.db $10 $18 $BD $18 $00 $BE $18 $08 $D5 $18 $10 $D6 $18 $18 $C1

_LABEL_1F85_:
	ld a, (iy+28)
	or a
	jr nz, _LABEL_1FA9_
	ld a, (iy+25)
	or a
	jr nz, ++
	ld a, (iy + Entity.yPos.low)
	cp $30
	jp c, +
	cp $D0
	jp nc, +
	ld (iy+25), $01
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
	ld d, (iy+30)
	ld e, (iy+31)
	ld h, (iy + Entity.yVel.low)
	ld l, (iy + Entity.yVel.high)
	add hl, de
	ld (iy + Entity.yVel.low), h
	ld (iy + Entity.yVel.high), l
	call updateEntityY
	inc (iy+26)
	ld a, (iy+26)
	cp $3F
	ret nz
	ld (iy+26), $00
	dec (iy+24)
	jr nz, +
	ld (iy+24), $04
	ld (iy + Entity.xVel.low), $00
	ld a, (iy+29)
	cpl
	ld (iy+29), a
	or a
	jr z, +
	ld (iy + Entity.xVel.low), $FF
+:
	ld a, (iy+27)
	or a
	jp nz, _LABEL_1EFD_
	ld (iy + Entity.yVel.low), $01
	ld (iy + Entity.yVel.high), $00
	ld (iy+30), $FF
	ld (iy+31), $F8
	ld (iy+27), $01
	ret

; 20th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_2011_:
	ld a, (iy+3)
	or a
	jr nz, +
	ld (iy+31), $80
	ld hl, _DATA_2024_
	ld bc, $0009
	jp memcpyIYToHL

; Data from 2024 to 2032 (15 bytes)
_DATA_2024_:
.db $2D $20 $14 $01 $00 $00 $F0 $00 $5C $2F $20 $01 $00 $00 $00

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
	dec (iy+31)
	jr nz, +
	ld (iy+31), $20
	call _LABEL_3063_
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
	ld a, (ix+3)
	or a
	ret nz
	ld (ix + Entity.type), $20
	ld (ix+5), c
	ld a, (iy + Entity.yPos.low)
	ld (ix+6), a
	ld a, (iy + Entity.xPos.low)
	ld (ix+8), a
++++:
	ld (hl), b
	ret

; 24th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_20AA_:
	ld a, (iy+3)
	or a
	jr nz, _LABEL_2101_
	ld hl, _DATA_20BC_
	ld bc, $0009
	call memcpyIYToHL
	jp _LABEL_2A9A_

; Data from 20BC to 2100 (69 bytes)
_DATA_20BC_:
.db $C5 $20 $18 $01 $00 $00 $E0 $00 $58 $D9 $20 $DD $20 $E1 $20 $E5
.db $20 $E9 $20 $ED $20 $F1 $20 $F5 $20 $F9 $20 $FD $20 $01 $00 $00
.db $30 $01 $00 $00 $31 $01 $00 $00 $32 $01 $00 $00 $33 $01 $00 $00
.db $34 $01 $00 $00 $35 $01 $00 $00 $36 $01 $00 $00 $37 $01 $00 $00
.db $38 $01 $00 $00 $39

_LABEL_2101_:
	ld a, (_RAM_C331_)
	ld (iy+17), a
	ld a, (iy+28)
	or a
	jp nz, _LABEL_1FA9_
	ld hl, $0808
	jp _LABEL_2039_

; 25th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_2114_:
	ld a, (iy+3)
	or a
	jr nz, +
	ld hl, _DATA_2123_
	ld bc, $0009
	jp memcpyIYToHL

; Data from 2123 to 212B (9 bytes)
_DATA_2123_:
.db $C5 $20 $19 $01 $00 $00 $E0 $00 $60

+:
	ld a, (_RAM_C330_)
	ld (iy+17), a
	ld a, (iy+28)
	or a
	jp nz, _LABEL_1FA9_
	ld hl, $0810
	jp _LABEL_2039_

; 30th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_213F_:
	ld a, (iy+3)
	or a
	jr nz, +
	ld hl, _DATA_214E_
	ld bc, $0009
	jp memcpyIYToHL

; Data from 214E to 215A (13 bytes)
_DATA_214E_:
.db $36 $00 $1E $01 $00 $00 $F8 $00 $58 $01 $00 $00 $C2

+:
	ld a, (iy+28)
	or a
	jp nz, _LABEL_2217_
	ld hl, $2008
	ld a, (_RAM_C779_)
	or a
	jp z, _LABEL_2039_
	ld a, (iy+26)
	or a
	jr z, +
	dec (iy+26)
	jp +++

+:
	ld a, (iy+24)
	or a
	jr nz, +
	inc (iy+25)
	ld a, (iy+25)
	cp $08
	jp c, +++
	ld a, $01
	ld (iy+24), a
	ld (_RAM_C75E_), a
	jp ++

+:
	xor a
	ld (_RAM_C75E_), a
	dec (iy+25)
	jp nz, +++
	ld (iy+24), $00
++:
	ld (iy+26), $18
+++:
	ld a, l
	sub (iy+25)
	ld l, a
	jp _LABEL_2039_

; 31st entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_21AE_:
	ld a, (iy+3)
	or a
	jr nz, +
	ld (iy+24), $01
	ld hl, _DATA_21C1_
	ld bc, $0009
	jp memcpyIYToHL

; Data from 21C1 to 21CD (13 bytes)
_DATA_21C1_:
.db $64 $00 $1F $01 $00 $00 $F8 $00 $60 $01 $00 $00 $C3

+:
	ld a, (iy+28)
	or a
	jp nz, _LABEL_2217_
	ld hl, $2010
	ld a, (_RAM_C779_)
	or a
	jp z, _LABEL_2039_
	ld a, (iy+26)
	or a
	jr z, +
	dec (iy+26)
	jp +++

+:
	ld a, (iy+24)
	or a
	jr nz, +
	dec (iy+25)
	jr nz, +++
	ld (iy+24), $01
	jp ++

+:
	inc (iy+25)
	ld a, (iy+25)
	cp $08
	jr c, +++
	ld (iy+24), $00
++:
	ld (iy+26), $18
+++:
	ld a, (iy+25)
	add a, l
	ld l, a
	jp _LABEL_2039_

_LABEL_2217_:
	ld a, (_RAM_C743_)
	or a
	ret nz
	ld de, $0200
	jp updateEntityYWith

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

	ld a, (ix + Entity.data11)
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
.db $3E $24 $04 $01 $01 $00 $00 $00 $00 $00 $00 $01 $01 $FE $46 $24
.db $4A $24 $4E $24 $52 $24 $01 $00 $00 $01 $01 $00 $00 $02 $01 $00
.db $00 $03 $01 $00 $00 $06

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
	ld a, (iy+17)
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
	ld a, (_RAM_C102_)
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
	ld (_RAM_C112_), a
	ret

+:
	ld a, $09
	ld (_RAM_C113_), a
	ret

; Data from 25C4 to 25F0 (45 bytes)
.db $01 $00 $00 $00 $10 $00 $00 $30 $00 $00 $50 $00 $00 $70 $00 $00
.db $00 $01 $20 $00 $00 $30 $00 $00 $50 $00 $00 $10 $00 $00 $00 $01
.db $00 $50 $01 $00 $00 $03 $00 $00 $05 $00 $00 $15 $00

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
	ld a, (_RAM_C602_)
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

; Data from 2918 to 2949 (50 bytes)
.db $D9 $29 $D9 $29 $FC $29 $DA $29 $F1 $29 $01 $2A $ED $29 $D9 $29
.db $01 $2A $7D $2A $01 $2A $14 $2A $86 $2A $01 $2A $D9 $29 $FC $29
.db $7D $2A $7D $2A $FC $29 $FC $29 $55 $2A $5B $2A $74 $2A $74 $2A
.db $D9 $29

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
	ld (_RAM_C112_), a
	ret

+:
	ld a, $09
	ld (_RAM_C113_), a
	ret

; Data from 29D9 to 2A99 (193 bytes)
.db $C9 $C0 $FD $7E $05 $DD $77 $05 $FD $34 $18 $DD $36 $1F $FF $0E
.db $08 $C3 $5E $25 $C0 $C3 $56 $10 $C0 $DD $7E $19 $B7 $C8 $0E $0A
.db $C3 $04 $2A $0E $07 $C3 $03 $2A $0E $08 $C0 $FD $7E $05 $DD $77
.db $05 $FD $34 $18 $DD $36 $02 $08 $C3 $5E $25 $C0 $0E $0A $CD $5E
.db $25 $21 $3F $14 $DD $75 $00 $DD $74 $01 $DD $36 $1C $01 $3E $82
.db $32 $00 $CD $DD $36 $18 $01 $FD $7E $08 $C6 $04 $4F $CD $56 $10
.db $DD $36 $0D $FD $DD $36 $0E $00 $DD $36 $0F $00 $DD $36 $10 $80
.db $DD $7E $08 $C6 $08 $B9 $D0 $DD $36 $0F $FF $C9 $C8 $0E $0E $C3
.db $5E $2A $C8 $0E $0B $FD $7E $11 $FE $03 $C0 $CD $5E $25 $FD $7E
.db $05 $DD $77 $05 $DD $36 $02 $09 $C3 $56 $10 $C0 $3A $7E $C7 $B7
.db $C0 $C3 $7E $2A $C0 $3E $82 $32 $00 $CD $C3 $56 $10 $C0 $3A $5E
.db $C7 $B7 $28 $F1 $21 $2F $C3 $7E $B7 $28 $19 $35 $28 $16 $CD $56
.db $10

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

; Data from 2AAD to 2AE5 (57 bytes)
.db $21 $33 $C1 $CB $AE $21 $51 $C1 $CB $C6 $3E $0E $32 $18 $C1 $3E
.db $01 $32 $71 $C7 $32 $7C $C7 $32 $9C $C7 $32 $BC $C7 $32 $DC $C7
.db $32 $FC $C7 $FD $7E $05 $32 $45 $C7 $3E $08 $32 $42 $C7 $CD $9A
.db $2A $CD $56 $10 $0E $0E $C3 $5E $25

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
	ld (_RAM_C115_), a
	ret

+:
	ld (_RAM_C334_), a
	ld a, $0D
	ld (_RAM_C117_), a
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
	ld a, (_RAM_C311_)
	inc a
	ld (_RAM_C311_), a
	cp $01
	jr z, +
	cp $03
	ret c
	xor a
	ld (_RAM_C311_), a
	jp _LABEL_2C66_

+:
	ld a, (_RAM_C312_)
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
	ld (_RAM_C316_), a
	ld (_RAM_C315_), a
	ld hl, _RAM_C103_
	res 7, (hl)
	ret

++:
	xor a
	ld (_RAM_C312_), a
	ld (_RAM_C311_), a
	ld (_RAM_C310_), a
	ld (_RAM_C315_), a
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
	ld de, _RAM_C322_ + 1
	ld hl, _RAM_C322_
	ld (hl), $00
	ld bc, $0007
	ldir

	call destroyEntities

	ld hl, $0000
	ld (_RAM_C134_), hl
	xor a
	ld (_RAM_C316_), a
	ld hl, $3D82
	ld (_RAM_C313_), hl
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
	ld (_RAM_C313_), hl
	ld hl, _RAM_C151_
	res 1, (hl)
	set 0, (hl)
	ld de, $3E82
	call _LABEL_2C88_
	ld a, $01
	ld (_RAM_C316_), a
	xor a
	jr ++

_LABEL_2C66_:
	ld a, (_RAM_C312_)
	inc a
	cp $10
	jr c, +
	call _LABEL_2D01_
	xor a
+:
	ld (_RAM_C312_), a
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
	ld hl, level1BlocksPointers
	call +
	ld de, _RAM_D000_
	call extractMapBlock

	; Extract tile attributes
	pop de
	ld hl, _DATA_6655_
	call +
	ld de, _RAM_D001_
	call extractMapBlock

	; Draw tiles
	ld hl, _RAM_D000_
	pop de
	ld bc, $022C
	jp drawTileArea

+:
	add hl, de
	ld e, (hl)
	inc hl
	ld d, (hl)
	ex de, hl
	ret

; Related to map reading
extractMapBlock:
	ld a, e
	cp $58
	ret nc
	ld a, (hl)
	bit 7, a
	jr nz, +

	; Repetição
	ld b, a
	inc hl
	ld a, (hl)
-:
	ld (de), a
	inc e
	inc e
	djnz -
	inc hl
	jp extractMapBlock

+:
	; Se for 1, segue aqui.
	; Sequencial
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
	jp extractMapBlock

; Data from 2CEE to 2D00 (19 bytes)
.db $11 $82 $3D $7A $FE $37 $C8 $D5 $CD $88 $2C $E1 $11 $80 $FF $19
.db $EB $18 $F0

_LABEL_2D01_:
	ld a, (_RAM_C315_)
	inc a
	cp $0C
	jr c, +
	ld hl, _RAM_C316_
	inc (hl)
	xor a
+:
	ld (_RAM_C315_), a
_LABEL_2D11_:
	ld de, (_RAM_C313_)
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
	ld (_RAM_C313_), hl
	ret

_LABEL_2D2A_:
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
.db $21 $00 $00 $06 $08 $29 $8F $30 $03 $19 $CE $00 $10 $F7 $C9

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
	ld a, (_RAM_C102_)
	bit 2, a
	jr nz, +
	bit 3, a
	ret z
+:
	ld a, (_RAM_C316_)
	ld hl, _RAM_C322_
	cp (hl)
	jr z, +
	ld (hl), a
	ld l, a
	ld h, $00
	add hl, hl
	ld e, a
	ld d, $00
	add hl, de
	ld de, _DATA_2E67_
	add hl, de
	ex de, hl
	ld hl, _RAM_C323_
	ld a, (de)
	ld (hl), a
	inc hl
	ld (hl), a
	ld b, $02
-:
	inc de
	inc hl
	ld a, (de)
	and $E0
	rlca
	rlca
	rlca
	ld (hl), a
	inc hl
	ld a, (de)
	and $1F
	ld (hl), a
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
	ld a, (_RAM_C324_)
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
	call _LABEL_2DDE_
	pop de
	ret nc
	ld (hl), c
	ex de, hl
	ld a, c
	cp $0A
	ret z
	cp $1A
	ret z
	dec (hl)
	ret

_LABEL_2DDE_:
	ld hl, _RAM_C742_
	ld b, $08
-:
	ld a, (hl)
	or a
	jr z, _LABEL_2DEF_
	ld de, $0020
	add hl, de
	djnz -
	xor a
	ret

_LABEL_2DEF_:
	scf
	ret

_LABEL_2DF1_:
	ld hl, _RAM_C742_
	ld b, $08
-:
	ld a, (hl)
	or a
	jr nz, _LABEL_2DEF_
	ld de, $0020
	add hl, de
	djnz -
	xor a
	ret

; Data from 2E02 to 2E03 (2 bytes)
.db $37 $C9

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
	call _LABEL_2DF1_
	pop hl
	ret c
	inc (hl)
	ld a, (_RAM_C308_)
	cpl
	ld (_RAM_C308_), a
++:
	call _LABEL_2DDE_
	ret nc
	ld (hl), $0D
	ret

_LABEL_2E2B_:
	ld c, a
	push de
	call _LABEL_2DF1_
	pop de
	ret c
	ld a, c
	jp _LABEL_2DCC_

_LABEL_2E36_:
	push de
	call _LABEL_2DF1_
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

; Data from 2E67 to 2F91 (299 bytes)
_DATA_2E67_:
.db $00 $00 $00 $30 $EA $00 $08 $EA $00 $14 $F7 $00 $14 $56 $EA $14
.db $36 $F7 $20 $56 $EB $22 $5D $EA $20 $3D $EB $14 $56 $F0 $14 $56
.db $F7 $05 $ED $00 $05 $ED $00 $10 $56 $FA $08 $56 $FA $20 $3D $F7
.db $10 $D0 $EA $0C $56 $FA $16 $36 $EA $20 $3C $FB $14 $F2 $F2 $30
.db $31 $00 $14 $56 $F2 $00 $EC $00 $00 $EC $00 $10 $76 $F5 $10 $56
.db $FA $05 $ED $00 $14 $F7 $F7 $10 $3C $FA $05 $ED $00 $20 $7D $F7
.db $18 $2E $EA $18 $56 $EB $20 $5D $F2 $20 $5D $F5 $00 $F3 $00 $0C
.db $EA $00 $08 $FB $FA $12 $96 $F0 $05 $ED $00 $00 $EC $00 $10 $F5
.db $F5 $0C $56 $EA $14 $F2 $F2 $30 $31 $00 $00 $F3 $00 $12 $2E $FA
.db $0C $FA $00 $08 $56 $FA $14 $F2 $F7 $12 $F2 $EB $18 $9C $F5 $00
.db $F3 $00 $10 $76 $FA $40 $3D $FA $40 $3D $F2 $08 $FA $00 $07 $76
.db $FA $10 $F5 $F5 $05 $ED $00 $10 $56 $EA $05 $ED $00 $1C $9D $F2
.db $40 $31 $00 $12 $56 $F0 $1C $9D $F0 $40 $31 $00 $12 $76 $F0 $18
.db $3C $F5 $22 $F6 $36 $08 $FA $00 $0C $FA $00 $0C $F5 $00 $28 $3D
.db $FA $24 $3D $F7 $10 $F5 $F5 $10 $F0 $EA $0C $F0 $EA $10 $2E $FA
.db $14 $9C $EB $10 $FB $F2 $12 $F0 $F2 $10 $F7 $F2 $0C $F7 $F2 $00
.db $EC $00 $10 $FB $F0 $05 $ED $00 $0C $F7 $F7 $0C $EB $EA $18 $9C
.db $76 $0C $F2 $FA $08 $FA $00 $00 $EC $00 $10 $F2 $00 $00 $31 $00
.db $20 $5C $F6 $00 $00 $00 $3A $0D $C3 $B7 $C0

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
.db $DD $21 $40 $C8 $06 $08 $11 $20 $00 $DD $7E $02 $B7 $28 $06 $DD
.db $19 $10 $F6 $AF $C9 $37 $C9

_LABEL_2FD2_:
	ld a, (_RAM_C30B_)
	cp $07
	jr c, ++
	call _LABEL_2D2A_
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

_LABEL_3063_:
	ld a, (_RAM_C316_)
	cp $28
	jr nc, ++
	call _LABEL_2D2A_
	and $0F
	ld c, a
	ld a, (_RAM_C316_)
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
	call _LABEL_2D2A_
	rrca
	jr nc, ++
+:
	ld c, $01
	ld a, (_RAM_C602_)
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
	ld a, (_RAM_C602_)
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
	ld hl, (_DATA_31BE_)
	jp _LABEL_313C_

; Data from 31BE to 36A0 (1251 bytes)
_DATA_31BE_:
.incbin "baserom_DATA_31BE_.inc"

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

; Pointer Table from 38FA to 3917 (15 entries, indexed by _RAM_CD00_)
_DATA_38FA_:
.dw _DATA_3D2D_ _DATA_403B_ _DATA_3DD6_ _DATA_3EF9_ _DATA_3F56_ _DATA_3F69_ _DATA_3F77_ _DATA_3F92_
.dw _DATA_3FBE_ _DATA_3FA8_ _DATA_3FCC_ _DATA_3FEF_ _DATA_4016_ _DATA_4054_ _DATA_405E_

; Jump Table from 3918 to 3935 (15 entries, indexed by _RAM_CD00_)
_DATA_3918_:
.dw _LABEL_3936_ _LABEL_3972_ _LABEL_3941_ _LABEL_3936_ _LABEL_395C_ _LABEL_394E_ _LABEL_3954_ _LABEL_3954_
.dw _LABEL_397A_ _LABEL_394A_ _LABEL_3982_ _LABEL_3972_ _LABEL_398A_ _LABEL_395C_ _LABEL_394A_

; 1st entry of Jump Table from 3918 (indexed by _RAM_CD00_)
_LABEL_3936_:
	call _LABEL_3C56_
	ld a, $80
	ld (_RAM_CD01_), a
	jp +

; 3rd entry of Jump Table from 3918 (indexed by _RAM_CD00_)
_LABEL_3941_:
	call _LABEL_3C56_
+:
	ld de, _RAM_CD05_
	jp _LABEL_399A_

; 10th entry of Jump Table from 3918 (indexed by _RAM_CD00_)
_LABEL_394A_:
	ld a, $40
	jr ++

; 6th entry of Jump Table from 3918 (indexed by _RAM_CD00_)
_LABEL_394E_:
	or a
	jp nz, _LABEL_39BD_
	jr +

; 7th entry of Jump Table from 3918 (indexed by _RAM_CD00_)
_LABEL_3954_:
	ld a, $01
	cp e
	jp c, _LABEL_39BD_
	jr +

; 5th entry of Jump Table from 3918 (indexed by _RAM_CD00_)
_LABEL_395C_:
	or a
	jr nz, _LABEL_39BD_
+:
	ex af, af'
	ld a, $FF
	out (Port_PSG), a
	ex af, af'
++:
	ld (_RAM_CD01_), a
	ld a, $DF
	out (Port_PSG), a
	ld de, _RAM_CDA5_
	jp _LABEL_399A_

; 2nd entry of Jump Table from 3918 (indexed by _RAM_CD00_)
_LABEL_3972_:
	ld a, $08
	cp e
	jp c, _LABEL_39BD_
	jr +

; 9th entry of Jump Table from 3918 (indexed by _RAM_CD00_)
_LABEL_397A_:
	ld a, $04
	cp e
	jp c, _LABEL_39BD_
	jr ++

; 11th entry of Jump Table from 3918 (indexed by _RAM_CD00_)
_LABEL_3982_:
	ld a, $10
	cp e
	jp c, _LABEL_39BD_
	jr ++

; 13th entry of Jump Table from 3918 (indexed by _RAM_CD00_)
_LABEL_398A_:
	ld a, $20
	cp e
	jp c, _LABEL_39BD_
+:
	ld (_RAM_CD01_), a
	ld a, $FF
	out (Port_PSG), a
++:
	ld de, _RAM_CD85_
_LABEL_399A_:
	ld h, b
	ld l, c
	ld b, (hl)
	inc hl
-:
	push bc
	ld bc, $0009
	ldir
	ld a, $20
	ld (de), a
	inc de
	ld a, $01
	ld (de), a
	inc de
	xor a
	ld (de), a
	inc de
	ld (de), a
	inc de
	ld (de), a
	push hl
	ld hl, $0012
	add hl, de
	ex de, hl
	pop hl
	inc de
	pop bc
	djnz -
_LABEL_39BD_:
	ld a, $80
	ld (_RAM_CD00_), a
	ret

_LABEL_39C3_:
	ld e, (ix+12)
	ld d, (ix+13)
	inc de
	ld (ix+12), e
	ld (ix+13), d
	ld l, (ix+10)
	ld h, (ix+11)
	or a
	sbc hl, de
	call z, _LABEL_3AD6_
	ld e, (ix+16)
	ld d, (ix+17)
	ld a, e
	or d
	jr nz, +
	ld (ix+22), $0F
	jp _LABEL_3A81_

+:
	bit 5, (ix+0)
	jr nz, +
	ld (ix+18), e
	ld (ix+19), d
	jp _LABEL_3A3C_

_LABEL_39FC_:
	dec a
	ld c, a
	ld b, $00
	add hl, bc
	add hl, bc
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ret

+:
	push de
	ld l, (ix+20)
	ld h, (ix+21)
	or a
	sbc hl, de
	push af
	ld a, l
	jp p, +
	neg
+:
	ld h, a
	ld e, (ix+12)
	call _LABEL_3D0E_
	ld e, (ix+10)
	call _LABEL_3D1A_
	ld e, a
	ld d, $00
	pop af
	ld a, e
	jp p, +
	neg
	jr z, +
	dec d
	ld e, a
+:
	pop hl
	add hl, de
	ex de, hl
	ld (ix+18), e
	ld (ix+19), d
_LABEL_3A3C_:
	ld a, (ix+7)
	or a
	jr nz, +
	ld a, (ix+8)
	cpl
	and $0F
	ld (ix+22), a
	jr ++

+:
	ld hl, _DATA_4075_
	call _LABEL_39FC_
	call _LABEL_3A9F_
++:
	bit 6, (ix+0)
	jr nz, _LABEL_3A81_
	ld a, (ix+1)
	and $0F
	ld c, a
	ld b, $00
	ld hl, _DATA_3A94_
	add hl, bc
	ld c, (hl)
	ld a, (ix+18)
	and $0F
	or c
	call _LABEL_3C4E_
	ld a, (ix+18)
	and $F0
	or (ix+19)
	rrca
	rrca
	rrca
	rrca
	call _LABEL_3C4E_
_LABEL_3A81_:
	ld a, (ix+1)
	and $0F
	ld c, a
	ld b, $00
	ld hl, _DATA_3A98_
	add hl, bc
	ld a, (hl)
	or (ix+22)
	jp _LABEL_3C4E_

; Data from 3A94 to 3A97 (4 bytes)
_DATA_3A94_:
.db $80 $A0 $C0 $C0

; Data from 3A98 to 3A9B (4 bytes)
_DATA_3A98_:
.db $90 $B0 $D0 $F0

-:
	ld (ix+14), a
_LABEL_3A9F_:
	push hl
	ld a, (ix+14)
	srl a
	push af
	ld c, a
	ld b, $00
	add hl, bc
	pop af
	ld a, (hl)
	pop hl
	jr c, ++
	rrca
	rrca
	rrca
	rrca
	or a
	jr z, -
	cp $10
	jr nz, +
	dec (ix+14)
	jr _LABEL_3A9F_

+:
	cp $20
	jr z, +++
++:
	inc (ix+14)
	or $F0
	add a, (ix+8)
	inc a
	jr c, ++++
+++:
	xor a
++++:
	cpl
	and $0F
	ld (ix+22), a
	ret

_LABEL_3AD6_:
	ld e, (ix+3)
	ld d, (ix+4)
_LABEL_3ADC_:
	ld a, (de)
	inc de
	cp $E0
	jp nc, _LABEL_3B6A_
	bit 3, (ix+0)
	jr nz, _LABEL_3B49_
	or a
	jp p, ++
	sub $80
	jr z, +
	add a, (ix+5)
+:
	ld hl, _DATA_3C7C_
	ld c, a
	ld b, $00
	add hl, bc
	add hl, bc
	ld a, (hl)
	ld (ix+16), a
	inc hl
	ld a, (hl)
	ld (ix+17), a
	bit 5, (ix+0)
	jr z, _LABEL_3B63_
	ld a, (de)
	inc de
	sub $80
	add a, (ix+5)
	ld hl, _DATA_3C7C_
	ld c, a
	ld b, $00
	add hl, bc
	add hl, bc
	ld a, (hl)
	ld (ix+20), a
	inc hl
	ld a, (hl)
	ld (ix+21), a
--:
	ld a, (de)
_LABEL_3B24_:
	inc de
++:
	push de
	ld h, a
	ld e, (ix+2)
	call _LABEL_3D0E_
	pop de
	ld (ix+10), l
	ld (ix+11), h
-:
	xor a
	ld (ix+14), a
	ld (ix+15), a
	ld (ix+3), e
	ld (ix+4), d
	xor a
	ld (ix+12), a
	ld (ix+13), a
	ret

_LABEL_3B49_:
	ld (ix+17), a
	ld a, (de)
	inc de
	ld (ix+16), a
	bit 5, (ix+0)
	jr z, --
	ld a, (de)
	inc de
	ld (ix+21), a
	ld a, (de)
	inc de
	ld (ix+20), a
	jr --

_LABEL_3B63_:
	ld a, (de)
	or a
	jp p, _LABEL_3B24_
	jr -

_LABEL_3B6A_:
	ld hl, +	; Overriding return address
	push hl
	and $1F
	ld hl, _DATA_3B81_
	ld c, a
	ld b, $00
	add hl, bc
	add hl, bc
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	jp (hl)

+:
	inc de
	jp _LABEL_3ADC_

; Jump Table from 3B81 to 3B9E (15 entries, indexed by unknown)
_DATA_3B81_:
.dw _LABEL_3BA7_ _LABEL_3BAC_ _LABEL_3BEF_ _LABEL_3BB1_ _LABEL_3BC8_ _LABEL_3BCD_ _LABEL_3BD3_ _LABEL_3BD9_
.dw _LABEL_3BDF_ _LABEL_3BE5_ _LABEL_3BF9_ _LABEL_3C14_ _LABEL_3C27_ _LABEL_3B9F_ _LABEL_3BEB_

; 14th entry of Jump Table from 3B81 (indexed by unknown)
_LABEL_3B9F_:
	ld a, (de)
	add a, (ix+5)
	ld (ix+5), a
	ret

; 1st entry of Jump Table from 3B81 (indexed by unknown)
_LABEL_3BA7_:
	ld a, (de)
	ld (ix+2), a
	ret

; 2nd entry of Jump Table from 3B81 (indexed by unknown)
_LABEL_3BAC_:
	ld a, (de)
	ld (ix+8), a
	ret

; 4th entry of Jump Table from 3B81 (indexed by unknown)
_LABEL_3BB1_:
	ld a, (de)
	or $E0
	push af
	call _LABEL_3C4E_
	pop af
	or $FC
	inc a
	jr nz, +
	res 6, (ix+0)
	ret

+:
	set 6, (ix+0)
	ret

; 5th entry of Jump Table from 3B81 (indexed by unknown)
_LABEL_3BC8_:
	ld a, (de)
	ld (ix+7), a
	ret

; 6th entry of Jump Table from 3B81 (indexed by unknown)
_LABEL_3BCD_:
	ex de, hl
	ld e, (hl)
	inc hl
	ld d, (hl)
	dec de
	ret

; 7th entry of Jump Table from 3B81 (indexed by unknown)
_LABEL_3BD3_:
	set 5, (ix+0)
	dec de
	ret

; 8th entry of Jump Table from 3B81 (indexed by unknown)
_LABEL_3BD9_:
	res 5, (ix+0)
	dec de
	ret

; 9th entry of Jump Table from 3B81 (indexed by unknown)
_LABEL_3BDF_:
	set 3, (ix+0)
	dec de
	ret

; 10th entry of Jump Table from 3B81 (indexed by unknown)
_LABEL_3BE5_:
	res 3, (ix+0)
	dec de
	ret

; 15th entry of Jump Table from 3B81 (indexed by unknown)
_LABEL_3BEB_:
	xor a
	ld (_RAM_CD01_), a
; 3rd entry of Jump Table from 3B81 (indexed by unknown)
_LABEL_3BEF_:
	xor a
	ld (ix+0), a
	call _LABEL_3C3F_
	pop hl
	pop hl
	ret

; 11th entry of Jump Table from 3B81 (indexed by unknown)
_LABEL_3BF9_:
	ld a, (de)
	ld c, a
	inc de
	ld a, (de)
	ld b, a
	push bc
	push ix
	pop hl
	dec (ix+9)
	ld c, (ix+9)
	dec (ix+9)
	ld b, $00
	add hl, bc
	ld (hl), d
	dec hl
	ld (hl), e
	pop de
	dec de
	ret

; 12th entry of Jump Table from 3B81 (indexed by unknown)
_LABEL_3C14_:
	push ix
	pop hl
	ld c, (ix+9)
	ld b, $00
	add hl, bc
	ld e, (hl)
	inc hl
	ld d, (hl)
	inc (ix+9)
	inc (ix+9)
	ret

; 13th entry of Jump Table from 3B81 (indexed by unknown)
_LABEL_3C27_:
	ld a, (de)
	inc de
	add a, $17
	ld c, a
	ld b, $00
	push ix
	pop hl
	add hl, bc
	ld a, (hl)
	or a
	jr nz, +
	ld a, (de)
	ld (hl), a
+:
	inc de
	dec (hl)
	jp nz, _LABEL_3BCD_
	inc de
	ret

_LABEL_3C3F_:
	ld a, (ix+1)
	and $0F
	ld c, a
	ld b, $00
	ld hl, _DATA_3A98_
	add hl, bc
	ld a, (hl)
	or $0F
_LABEL_3C4E_:
	bit 2, (ix+0)
	ret nz
	out (Port_PSG), a
	ret

_LABEL_3C56_:
	exx
	ld hl, _RAM_CD05_
	ld de, _RAM_CD05_ + 1
	ld bc, $00BF
	ld (hl), $00
	ldir
	exx
_LABEL_3C65_:
	exx
	ld hl, _DATA_3C78_
	ld c, Port_PSG
	ld b, $04
	otir
	xor a
	ld (_RAM_CD01_), a
	ld (_RAM_CD02_), a
	exx
	ret

; Data from 3C78 to 3C7B (4 bytes)
_DATA_3C78_:
.db $9F $BF $DF $FF

; Data from 3C7C to 3D0D (146 bytes)
_DATA_3C7C_:
.db $00 $00 $FF $03 $C7 $03 $90 $03 $5D $03 $2D $03 $FF $02 $D4 $02
.db $AB $02 $85 $02 $61 $02 $3F $02 $1E $02 $00 $02 $E3 $01 $C8 $01
.db $AF $01 $96 $01 $80 $01 $6A $01 $56 $01 $43 $01 $30 $01 $1F $01
.db $0F $01 $00 $01 $F2 $00 $E4 $00 $D7 $00 $CB $00 $C0 $00 $B5 $00
.db $AB $00 $A1 $00 $98 $00 $90 $00 $88 $00 $80 $00 $79 $00 $72 $00
.db $6C $00 $66 $00 $60 $00 $5B $00 $55 $00 $51 $00 $4C $00 $48 $00
.db $44 $00 $40 $00 $3C $00 $39 $00 $36 $00 $33 $00 $30 $00 $2D $00
.db $2B $00 $28 $00 $26 $00 $24 $00 $22 $00 $20 $00 $1E $00 $1C $00
.db $1B $00 $19 $00 $18 $00 $16 $00 $15 $00 $14 $00 $13 $00 $12 $00
.db $11 $00

_LABEL_3D0E_:
	ld d, $00
	ld l, d
	ld b, $08
-:
	add hl, hl
	jr nc, +
	add hl, de
+:
	djnz -
	ret

_LABEL_3D1A_:
	ld b, $08
-:
	adc hl, hl
	ld a, h
	jr c, +
	cp e
	jr c, ++
+:
	sub e
	ld h, a
	or a
++:
	djnz -
	ld a, l
	rla
	cpl
	ret

.INCLUDE "data.asm"
