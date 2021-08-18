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

.enum $C000 export
_RAM_C000_ dsb $100
_RAM_C100_ db
_RAM_C101_ db
_RAM_C102_ db
_RAM_C103_ db
_RAM_C104_ db
_RAM_C105_ db
_RAM_C106_ db
_RAM_C107_ db
_RAM_C108_ db
.ende

.enum $C10A export
_RAM_C10A_ db
_RAM_C10B_ db
_RAM_C10C_ db
_RAM_C10D_ db
_RAM_C10E_ db
_RAM_C10F_ db
_RAM_C110_ db
_RAM_C111_ db
_RAM_C112_ db
_RAM_C113_ db
_RAM_C114_ db
_RAM_C115_ db
_RAM_C116_ db
_RAM_C117_ db
.ende

.enum $C119 export
_RAM_C119_ db
_RAM_C11A_ db
_RAM_C11B_ db
.ende

.enum $C11E export
_RAM_C11E_ db
_RAM_C11F_ dw
_RAM_C121_ db
.ende

.enum $C123 export
_RAM_C123_ db
_RAM_C124_ dw
_RAM_C126_ db
_RAM_C127_ db
_RAM_C128_ dw
_RAM_C12A_ db
_RAM_C12B_ db
.ende

.enum $C12D export
_RAM_C12D_ db
_RAM_C12E_ db
_RAM_C12F_ db
_RAM_C130_ db
_RAM_C131_ db
_RAM_C132_ db
_RAM_C133_ db
_RAM_C134_ db
_RAM_C135_ db
_RAM_C136_ db
.ende

.enum $C145 export
_RAM_C145_ db
_RAM_C146_ db
_RAM_C147_ db
_RAM_C148_ dw
_RAM_C14A_ db
_RAM_C14B_ db
_RAM_C14C_ dw
_RAM_C14E_ db
_RAM_C14F_ db
_RAM_C150_ db
_RAM_C151_ db
_RAM_C152_ db
.ende

.enum $C300 export
_RAM_C300_ db
_RAM_C301_ db
_RAM_C302_ db
_RAM_C303_ db
_RAM_C304_ db
_RAM_C305_ db
.ende

.enum $C307 export
_RAM_C307_ db
_RAM_C308_ db
.ende

.enum $C30A export
_RAM_C30A_ db
_RAM_C30B_ db
_RAM_C30C_ db
_RAM_C30D_ db
_RAM_C30E_ db
.ende

.enum $C310 export
_RAM_C310_ db
_RAM_C311_ db
_RAM_C312_ db
_RAM_C313_ dw
_RAM_C315_ db
_RAM_C316_ db
.ende

.enum $C318 export
_RAM_C318_ db
_RAM_C319_ db
.ende

.enum $C31F export
_RAM_C31F_ db
_RAM_C320_ db
_RAM_C321_ db
_RAM_C322_ db
_RAM_C323_ db
_RAM_C324_ db
.ende

.enum $C329 export
_RAM_C329_ db
_RAM_C32A_ db
_RAM_C32B_ db
_RAM_C32C_ db
.ende

.enum $C32F export
_RAM_C32F_ db
_RAM_C330_ db
_RAM_C331_ db
_RAM_C332_ db
_RAM_C333_ db
_RAM_C334_ db
_RAM_C335_ db
_RAM_C336_ db
_RAM_C337_ db
_RAM_C338_ db
_RAM_C339_ db
.ende

.enum $C500 export
_RAM_C500_ dsb $40
_RAM_C540_ db
.ende

.enum $C600 export
_RAM_C600_ db
_RAM_C601_ db
_RAM_C602_ db
_RAM_C603_ db
_RAM_C604_ db
_RAM_C605_ db
_RAM_C606_ db
.ende

.enum $C608 export
player1XPos db
.ende

.enum $C60B export
_RAM_C60B_ dw
.ende

.enum $C612 export
_RAM_C612_ db
.ende

.enum $C614 export
_RAM_C614_ db
.ende

.enum $C618 export
_RAM_C618_ db
_RAM_C619_ db
_RAM_C61A_ db
_RAM_C61B_ db
_RAM_C61C_ db
.ende

.enum $C620 export
_RAM_C620_ db
_RAM_C621_ db
_RAM_C622_ db
_RAM_C623_ db
_RAM_C624_ db
_RAM_C625_ db
_RAM_C626_ db
.ende

.enum $C628 export
_RAM_C628_ db
.ende

.enum $C62B export
_RAM_C62B_ dw
.ende

.enum $C632 export
_RAM_C632_ db
.ende

.enum $C634 export
_RAM_C634_ db
.ende

.enum $C638 export
_RAM_C638_ db
_RAM_C639_ db
_RAM_C63A_ db
_RAM_C63B_ db
_RAM_C63C_ db
.ende

.enum $C640 export
_RAM_C640_ dsb $20
_RAM_C660_ dsb $5
.ende

.enum $C6A0 export
_RAM_C6A0_ dsb $3
_RAM_C6A3_ db
.ende

.enum $C6A6 export
_RAM_C6A6_ db
.ende

.enum $C6B1 export
_RAM_C6B1_ db
.ende

.enum $C6BD export
_RAM_C6BD_ db
.ende

.enum $C6C0 export
_RAM_C6C0_ db
.ende

.enum $C6E0 export
_RAM_C6E0_ dsb $5
.ende

.enum $C720 export
_RAM_C720_ dsb $3
_RAM_C723_ db
.ende

.enum $C726 export
_RAM_C726_ db
.ende

.enum $C731 export
_RAM_C731_ db
.ende

.enum $C73D export
_RAM_C73D_ db
.ende

.enum $C740 export
_RAM_C740_ dw
_RAM_C742_ db
_RAM_C743_ db
.ende

.enum $C75E export
_RAM_C75E_ db
.ende

.enum $C760 export
_RAM_C760_ dw
_RAM_C762_ db
.ende

.enum $C766 export
_RAM_C766_ db
.ende

.enum $C768 export
_RAM_C768_ db
.ende

.enum $C779 export
_RAM_C779_ db
.ende

.enum $C780 export
_RAM_C780_ dw
_RAM_C782_ db
.ende

.enum $C7A0 export
_RAM_C7A0_ dw
_RAM_C7A2_ db
.ende

.enum $C7C2 export
_RAM_C7C2_ db
.ende

.enum $C7E2 export
_RAM_C7E2_ db
.ende

.enum $C842 export
_RAM_C842_ db
.ende

.enum $C900 export
_RAM_C900_ db
.ende

.enum $C940 export
_RAM_C940_ db
.ende

.enum $C942 export
_RAM_C942_ db
_RAM_C943_ db
_RAM_C944_ db
_RAM_C945_ db
_RAM_C946_ db
.ende

.enum $C948 export
_RAM_C948_ db
.ende

.enum $CD00 export
_RAM_CD00_ db
_RAM_CD01_ db
_RAM_CD02_ db
.ende

.enum $CD05 export
_RAM_CD05_ dsb $20
_RAM_CD25_ dsb $9
.ende

.enum $CD65 export
_RAM_CD65_ db
.ende

.enum $CD85 export
_RAM_CD85_ dsb $9
.ende

.enum $CDA5 export
_RAM_CDA5_ dsb $9
.ende

.enum $D000 export
_RAM_D000_ db
_RAM_D001_ db
.ende

.enum $D100 export
_RAM_D100_ db
.ende

.enum $D300 export
_RAM_D300_ db
.ende

.enum $E801 export
_RAM_E801_ db
.ende

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

_LABEL_0_:
	di
	ld sp, $C0FF
	im 1
	jr _LABEL_69_

_LABEL_8_:
	call _LABEL_BDD_
	in a, (Port_VDPData)
	ld b, a
	push af
	pop af
	in a, (Port_VDPData)
	ld c, a
	ret

; Data from 14 to 17 (4 bytes)
.db $06 $05 $13 $05

_LABEL_18_:
	push af
	call _LABEL_BD4_
	pop af
	out (Port_VDPData), a
	ret

_LABEL_20_:
	call _LABEL_BD4_
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

_LABEL_38_:
	jp _LABEL_1AF_

; Data from 3B to 5A (32 bytes)
_DATA_3B_:
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
	call _LABEL_B3F_
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
	ld hl, _DATA_3B_
	ld de, $C000
	ld bc, $0020
	rst $20	; _LABEL_20_
	call _LABEL_BEE_
	ld de, $81E0
	ld a, e
	ld (_RAM_C101_), a
	call _LABEL_BDD_
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
	call _LABEL_BDD_
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

_LABEL_1AF_:
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
	call _LABEL_C3C_
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
	call _LABEL_1056_
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
	call _LABEL_1056_
	ld iy, _RAM_C620_
	call _LABEL_1056_
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
	call _LABEL_1056_
	jp _LABEL_10B_

_LABEL_324_:
	call +
	jp c, _LABEL_10B_
	ld hl, _RAM_C133_
	res 2, (hl)
	ld iy, _RAM_C620_
	call _LABEL_1056_
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
	ld a, (_RAM_C105_)
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
	ld (_RAM_C105_), a
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
	ld a, (_RAM_C105_)
	cp $0A
	jr c, +
	ld a, $09
	ld (_RAM_C105_), a
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
	jp _LABEL_18_

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
	ld (player1XPos), a
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
.dw _LABEL_76D_ _LABEL_8E9_ _LABEL_7A7_ _LABEL_7B5_ _LABEL_770_ _LABEL_8FA_ _LABEL_906_ _LABEL_9BD_
.dw _LABEL_9C9_ _LABEL_9D5_ _LABEL_A3E_ _LABEL_A90_ _LABEL_A9C_ _LABEL_ABB_ _LABEL_AC1_ _LABEL_AD8_
.dw _LABEL_B0F_ _LABEL_B2C_ _LABEL_B2C_ _LABEL_B2C_

; 1st entry of Jump Table from 745 (indexed by _RAM_C10A_)
_LABEL_76D_:
	jp _LABEL_B3F_

; 5th entry of Jump Table from 745 (indexed by _RAM_C10A_)
_LABEL_770_:
	ld a, $08
	ld (_RAM_C12B_), a
	ld de, $3A4C
	ld hl, _DATA_781_
	ld bc, $0213
	jp _LABEL_B5E_

; Data from 781 to 7A6 (38 bytes)
_DATA_781_:
.db $46 $4A $46 $4A $46 $4A $4B $E4 $00 $E5 $E6 $4B $E4 $E7 $E8 $E9
.db $EA $EB $EC $ED $EE $EF $F0 $F1 $F2 $F3 $F4 $00 $F5 $F6 $F3 $F4
.db $F7 $F8 $F9 $57 $58 $44

; 3rd entry of Jump Table from 745 (indexed by _RAM_C10A_)
_LABEL_7A7_:
	ld a, $00
	ld de, $C010
	rst $18	; _LABEL_18_
	ld a, $00
	ld de, $C003
	jp _LABEL_18_

; 4th entry of Jump Table from 745 (indexed by _RAM_C10A_)
_LABEL_7B5_:
	ld hl, _DATA_841_
	ld de, $390A
	ld bc, $042A
	call _LABEL_B7B_
	ld hl, _DATA_841_ - 2
	ld de, $38EE
	ld b, $02
	ld a, $08
	ld (_RAM_C12B_), a
	call _LABEL_B2D_
	ld a, $D6
	out (Port_VDPData), a
	push af
	pop af
	ld a, $0A
	out (Port_VDPData), a
	ld de, $3B88
	ld hl, _DATA_80D_
	ld b, $18
	call _LABEL_B2D_
	ld de, $3C1A
	ld hl, _DATA_825_
	ld b, $02
	call _LABEL_B2D_
	ld de, $3C88
	ld hl, _DATA_80D_
	ld b, $18
	call _LABEL_B2D_
	ld a, $32
	ld de, $3C92
	rst $18	; _LABEL_18_
	ld de, $3DC8
	ld hl, _DATA_825_ + 2
	ld b, $18
	jp _LABEL_B2D_

; Data from 80D to 824 (24 bytes)
_DATA_80D_:
.db $50 $55 $53 $48 $20 $31 $20 $50 $4C $41 $59 $20 $53 $54 $41 $52
.db $54 $20 $42 $55 $54 $54 $4F $4E

; Data from 825 to 840 (28 bytes)
_DATA_825_:
.db $4F $52 $4F $52 $49 $47 $49 $4E $41 $4C $20 $47 $41 $4D $45 $20
.db $5B $5C $5D $5E $5F $20 $31 $39 $38 $35 $D6 $BD

; Data from 841 to 8E8 (168 bytes)
_DATA_841_:
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
_LABEL_8E9_:
	ld a, $34
	ld de, $C010
	rst $18	; _LABEL_18_
	ld de, $C003
	rst $18	; _LABEL_18_
	ld h, $08
	ld l, $20
	jp _LABEL_B42_

; 6th entry of Jump Table from 745 (indexed by _RAM_C10A_)
_LABEL_8FA_:
	ld de, $3F00
	ld bc, $0020
	ld hl, $D0D0
	jp _LABEL_B48_

; 7th entry of Jump Table from 745 (indexed by _RAM_C10A_)
_LABEL_906_:
	ld de, $382E
	ld b, $1C
--:
	push bc
	ld b, $09
-:
	push bc
	ld a, $00
	rst $18	; _LABEL_18_
	inc de
	ld a, $11
	rst $18	; _LABEL_18_
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
	ld de, $3870
	ld hl, _DATA_9A9_ + 1
	ld b, $03
	call _LABEL_B2D_
	ld de, $3930
	ld hl, _DATA_9AD_
	ld b, $03
	call _LABEL_B2D_
	ld de, $3D36
	call _LABEL_9A1_
	call _LABEL_2638_
	ld hl, _DATA_9A9_
	ld de, $38BC
	ld b, $01
	call _LABEL_B2D_
	ld hl, _DATA_9A9_
	ld de, $397C
	ld b, $01
	call _LABEL_B2D_
	ld de, $3CF2
	ld hl, _DATA_9B3_ + 2
	ld bc, $0202
	ld a, $08
	ld (_RAM_C12B_), a
	call _LABEL_B5E_
	ld a, (_RAM_C103_)
	rrca
	ret nc
	ld de, $3D72
	ld hl, _DATA_9B9_
	ld bc, $0202
	ld a, $08
	ld (_RAM_C12B_), a
	call _LABEL_B5E_
	ld a, $08
	ld (_RAM_C12B_), a
	ld de, $39F0
	ld hl, _DATA_9B0_
	ld b, $03
	call _LABEL_B2D_
	ld hl, _DATA_9A9_
	ld de, $3A3C
	ld b, $01
	call _LABEL_B2D_
	ld de, $3DB6
_LABEL_9A1_:
	ld hl, _DATA_9B3_
	ld b, $02
	jp _LABEL_B2D_

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
.db $5A $32 $10 $11 $12 $13

; Data from 9B9 to 9BC (4 bytes)
_DATA_9B9_:
.db $10 $11 $14 $15

; 8th entry of Jump Table from 745 (indexed by _RAM_C10A_)
_LABEL_9BD_:
	ld a, $8B
	ld (_RAM_CD00_), a
	ld hl, _RAM_C105_
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
	rst $18	; _LABEL_18_
	ld a, $08
	call _LABEL_BE4_
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
	rst $18	; _LABEL_18_
	ld a, $08
	out (Port_VDPData), a
	ld a, $0F
	ld (_RAM_C942_), a
	ld hl, _RAM_C32F_
	ld a, (hl)
	cp $05
	jp c, _LABEL_1056_
	dec (hl)
	call _LABEL_2A9A_
	jp _LABEL_1056_

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
	jp nz, _LABEL_1056_
	ld a, (iy+8)
	sub $04
	ld (_RAM_C948_), a
	ld a, (iy+6)
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
	jp _LABEL_B2D_

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

_LABEL_B2D_:
	call _LABEL_BD4_
	ld c, Port_VDPData
-:
	outi
	ld a, (_RAM_C12B_)
	nop
	out (c), a
	nop
	jp nz, -
	ret

_LABEL_B3F_:
	ld hl, $0100
_LABEL_B42_:
	ld de, $3800
	ld bc, $0380
_LABEL_B48_:
	call _LABEL_BD4_
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
	call _LABEL_BD4_
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

_LABEL_B7B_:
	push bc
	call _LABEL_BD4_
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
	djnz _LABEL_B7B_
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

_LABEL_BD4_:
	ld a, e
	out (Port_VDPAddress), a
	ld a, d
	or $40
	out (Port_VDPAddress), a
	ret

_LABEL_BDD_:
	ld a, e
	out (Port_VDPAddress), a
	ld a, d
	out (Port_VDPAddress), a
	ret

_LABEL_BE4_:
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
	jp _LABEL_BDD_

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
	ld a, $02
	ld (_RAM_C105_), a
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

_LABEL_C3C_:
	ld b, $1B
	ld iy, _RAM_C600_
-:
	push bc
	push iy
	ld a, (iy+2)
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
	ld hl, _DATA_C64_ - 2
	add hl, de
	ld e, (hl)
	inc hl
	ld d, (hl)
	ex de, hl
	jp (hl)

; Jump Table from C64 to CA7 (34 entries, indexed by _RAM_C602_)
_DATA_C64_:
.dw _LABEL_CA8_ _LABEL_CCB_ _LABEL_D8D_ _LABEL_DE8_ _LABEL_E2C_ _LABEL_EBF_ _LABEL_1155_ _LABEL_F63_
.dw _LABEL_FC0_ _LABEL_11CE_ _LABEL_12BA_ _LABEL_13CD_ _LABEL_149D_ _LABEL_156A_ _LABEL_15C4_ _LABEL_1770_
.dw _LABEL_1EE9_ _LABEL_189A_ _LABEL_198A_ _LABEL_2011_ _LABEL_199B_ _LABEL_1A6B_ _LABEL_1AEE_ _LABEL_20AA_
.dw _LABEL_2114_ _LABEL_1BA5_ _LABEL_1C11_ _LABEL_1D72_ _LABEL_1DBE_ _LABEL_213F_ _LABEL_21AE_ _LABEL_11A8_
.dw _LABEL_1E99_ _LABEL_1E86_

; 1st entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_CA8_:
	ld a, (iy+27)
	cp $01
	jr nz, +
	ld de, $FF00
	ld a, (iy+6)
	cp $80
	jp nc, _LABEL_1005_
	ld (iy+27), $02
	ld hl, _RAM_C104_
	res 0, (hl)
	set 1, (hl)
	ret

+:
	ld a, (_RAM_C12F_)
	jr ++

; 2nd entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_CCB_:
	ld a, (iy+27)
	cp $01
	jr nz, +
	ld de, $FF00
	ld a, (iy+6)
	cp $80
	jp nc, _LABEL_1005_
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
	jp z, _LABEL_1005_
	ld de, $FE40
	jp _LABEL_1005_

_LABEL_D4B_:
	ld a, (iy+6)
	cp $B0
	ret nc
	ld de, $0100
	ld a, (iy+4)
	or a
	jp z, _LABEL_1005_
	ld de, $01A0
	jp _LABEL_1005_

_LABEL_D61_:
	ld a, (iy+8)
	cp $08
	ret c
	ld de, $FF00
	ld a, (iy+4)
	or a
	jp z, _LABEL_1019_
	ld de, $FE40
	jp _LABEL_1019_

_LABEL_D77_:
	ld a, (iy+8)
	cp $A8
	ret nc
	ld de, $0100
	ld a, (iy+4)
	or a
	jp z, _LABEL_1019_
	ld de, $01A0
	jp _LABEL_1019_

; 3rd entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_D8D_:
	inc (iy+31)
	ld a, (iy+6)
	cp $C0
	jp nc, _LABEL_1056_
	ld a, (iy+8)
	cp $B8
	jp nc, _LABEL_1056_
	ld a, (_RAM_C31F_)
	or a
	call nz, +
	call _LABEL_10D8_
	ld a, (iy+24)
	or a
	ret z
	cp $02
	jp nc, _LABEL_1056_
	inc (iy+25)
	ld a, (iy+25)
	cp $06
	ret c
	jp _LABEL_1056_

+:
	ld a, (_RAM_C320_)
	ld d, a
	ld a, (_RAM_C321_)
	ld e, a
	call _LABEL_30BC_
	push hl
	ld h, (iy+13)
	ld l, (iy+14)
	add hl, de
	ld (iy+13), h
	ld (iy+14), l
	pop hl
	ld d, (iy+15)
	ld e, (iy+16)
	add hl, de
	ld (iy+15), h
	ld (iy+16), l
	ret

; 4th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_DE8_:
	ld d, $00
	ld e, (iy+24)
	ld h, (iy+13)
	ld l, (iy+14)
	add hl, de
	ld (iy+13), h
	ld (iy+14), l
	ex de, hl
	ld e, $00
	call _LABEL_1005_
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
	jp nc, _LABEL_1056_
	ld a, (_RAM_C133_)
	and $20
	ret nz
	ld de, $0055
	jp _LABEL_1005_

; 5th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_E2C_:
	ld a, (iy+22)
	or a
	jr nz, _LABEL_E9B_
	ld (iy+22), $01
	ld hl, _DATA_E75_
	ld (iy+0), l
	ld (iy+1), h
	ld hl, $0008
	ld (iy+13), h
	ld (iy+14), l
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
	call _LABEL_1056_
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
	call _LABEL_1050_
	ld c, a
	ld a, (_RAM_C103_)
	bit 0, a
	ret z
	ld (iy+8), $70
	ld a, c
	dec a
	ret z
	ld (iy+8), $40
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
	ld a, (iy+6)
	cp $80
	jp nc, _LABEL_FFF_
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

; 8th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_F63_:
	ld a, (iy+22)
	or a
	jr nz, _LABEL_FB0_
	ld (iy+22), $01
	ld hl, _DATA_F8C_
	ld (iy+0), l
	ld (iy+1), h
	ld (iy+17), $00
	ld (iy+18), $04
	ld (iy+19), $00
	ld (iy+20), $08
	ld a, $87
	ld (_RAM_CD00_), a
	ret

; Data from F8C to FAF (36 bytes)
_DATA_F8C_:
.db $92 $0F $9F $0F $A3 $0F $04 $00 $00 $23 $00 $08 $24 $08 $00 $25
.db $08 $08 $26 $01 $04 $04 $22 $04 $00 $00 $23 $00 $08 $24 $08 $00
.db $25 $08 $08 $26

_LABEL_FB0_:
	call _LABEL_1027_
	ld a, (iy+17)
	cp $03
	ret c
	ld (iy+17), $00
	jp _LABEL_1056_

; 9th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_FC0_:
	ld a, (iy+22)
	or a
	jr nz, +
	ld (iy+13), $00
	ld (iy+14), $55
	ld hl, _DATA_FE5_
	ld (iy+0), l
	ld (iy+1), h
	ld (iy+22), $01
	ld (iy+17), $00
	ld a, $88
	ld (_RAM_CD00_), a
	ret

; Data from FE5 to FF3 (15 bytes)
_DATA_FE5_:
.db $E7 $0F $04 $00 $00 $1A $00 $08 $1B $08 $00 $1C $08 $08 $1D

+:
	ld a, (iy+6)
	cp $C0
	jp nc, _LABEL_1056_
	jp _LABEL_FFF_

_LABEL_FFF_:
	ld d, (iy+13)
	ld e, (iy+14)
_LABEL_1005_:
	ld h, (iy+6)
	ld l, (iy+7)
	add hl, de
	ld (iy+6), h
	ld (iy+7), l
	ret

_LABEL_1013_:
	ld d, (iy+15)
	ld e, (iy+16)
_LABEL_1019_:
	ld h, (iy+8)
	ld l, (iy+9)
	add hl, de
	ld (iy+8), h
	ld (iy+9), l
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

_LABEL_1050_:
	push iy
	pop de
	ldir
	ret

_LABEL_1056_:
	ld (iy+6), $D8
	ld (iy+8), $00
	ld (iy+21), $01
	ret

_LABEL_1063_:
	ld (ix+6), $D8
	ld (ix+8), $00
	ld (ix+21), $01
	ret

_LABEL_1070_:
	ld iy, _RAM_C740_
	ld b, $11
	ld de, $0020
-:
	ld a, (iy+3)
	or a
	jr z, _LABEL_1091_
	ld a, (iy+6)
	cp $C4
	jr c, +
	cp $E0
	jr c, ++
+:
	ld a, (iy+8)
	cp $B5
	jr nc, ++
_LABEL_1091_:
	add iy, de
	djnz -
	ret

++:
	ld a, (iy+2)
	cp $0E
	call z, ++
	ld a, (iy+2)
	cp $11
	jr z, +
	cp $18
	jr z, +
	cp $19
	jr z, +
-:
	call _LABEL_1056_
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

_LABEL_10CA_:
	ld hl, _RAM_C640_
	ld de, _RAM_C640_ + 1
	ld bc, $0320
	ld (hl), $00
	ldir
	ret

_LABEL_10D8_:
	call _LABEL_1013_
	jp _LABEL_FFF_

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
	ld (iy+0), l
	ld (iy+1), h
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
	jp nz, _LABEL_10D8_
	ld hl, _DATA_11A2_
_LABEL_115F_:
	push hl
	call _LABEL_1183_
	pop hl
	ld a, $01
	ld (iy+3), a
	ld (iy+4), a
	ld (iy+0), l
	ld (iy+1), h
	ld a, $04
	add a, (iy+6)
	ld (iy+6), a
	ld a, $04
	add a, (iy+8)
	ld (iy+8), a
	ret

_LABEL_1183_:
	call _LABEL_13BB_
	ld a, (iy+5)
	cp $01
	jr z, +
	call _LABEL_13C4_
+:
	ld d, l
	ld e, h
	call _LABEL_30BC_
	ld (iy+13), d
	ld (iy+14), e
	ld (iy+15), h
	ld (iy+16), l
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
	call _LABEL_1005_
	jp _LABEL_1013_

; Data from 11C8 to 11CD (6 bytes)
_DATA_11C8_:
.db $CA $11 $01 $00 $00 $40

; 10th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_11CE_:
	ld a, (iy+3)
	or a
	jp nz, _LABEL_1265_
	ld (iy+27), $00
	ld hl, _DATA_1214_
	ld bc, $0011
	call _LABEL_1050_
	ld (iy+29), $08
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
	ld (iy+8), e
	ld (iy+15), d
	ld hl, _DATA_122B_
	ld (iy+0), l
	ld (iy+1), h
	ret

; Data from 1214 to 122A (23 bytes)
_DATA_1214_:
.db $25 $12 $0A $01 $04 $00 $F8 $00 $A0 $00 $00 $02 $02 $02 $00 $FE
.db $00 $58 $12 $4B $12 $31 $12

; Data from 122B to 1264 (58 bytes)
_DATA_122B_:
.db $31 $12 $3E $12 $58 $12 $04 $00 $00 $64 $00 $08 $65 $08 $00 $66
.db $08 $08 $67 $04 $00 $00 $68 $00 $08 $69 $08 $00 $6A $08 $08 $6B
.db $04 $00 $00 $6C $00 $08 $6D $08 $00 $6E $08 $08 $6F $04 $00 $00
.db $70 $00 $08 $71 $08 $00 $72 $08 $08 $73

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
	ld (iy+13), l
	ld (iy+14), h
	ld (iy+15), l
	ld (iy+16), h
	ld a, (iy+27)
	or a
	jp z, _LABEL_3063_
	ld (iy+15), $FF
	jp _LABEL_3063_

+:
	call _LABEL_1A2A_
	jp _LABEL_1013_

++:
	ld (iy+17), $02
	ld a, (iy+19)
	or a
	jp z, _LABEL_10D8_
	ld (iy+17), $01
	dec (iy+19)
	jp _LABEL_10D8_

; 11th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_12BA_:
	ld a, (iy+3)
	or a
	jp nz, _LABEL_1362_
	ld hl, _DATA_1316_
	ld bc, $0010
	call _LABEL_1050_
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
	ld (iy+8), a
	ret

+:
	ld a, $55
	sub b
	ld (iy+8), a
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
	call _LABEL_FFF_
	call _LABEL_13BB_
	ld a, (iy+5)
	dec a
	jr z, +
	call _LABEL_13C4_
+:
	ld a, l
	sub $30
	cp (iy+6)
	ret nc
	ld (iy+24), $01
	ld a, (iy+8)
	cp h
	ret nc
	ld (iy+15), $01
	ld hl, _DATA_1344_
	ld (iy+0), l
	ld (iy+1), h
	ret

++:
	call _LABEL_1027_
	jp _LABEL_1013_

+++:
	ld a, (iy+5)
	ld c, a
	call _LABEL_2F92_
	ld (iy+2), $08
	ret

_LABEL_13B0_:
	dec (iy+25)
	ret nz
	ld (iy+25), $38
	jp _LABEL_3063_

_LABEL_13BB_:
	ld a, (player1XPos)
	ld h, a
	ld a, (_RAM_C606_)
	ld l, a
	ret

_LABEL_13C4_:
	ld a, (_RAM_C628_)
	ld h, a
	ld a, (_RAM_C626_)
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
	ld a, (iy+2)
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
	ld a, (iy+6)
	cp $40
	jp c, _LABEL_1005_
	ld (iy+24), $30
	ld (iy+25), $01
	ld (iy+26), $01
	ld de, _DATA_143F_
	ld (iy+0), e
	ld (iy+1), d
	ld hl, $0206
	jp _LABEL_1049_

+:
	call _LABEL_1027_
	ld a, (iy+24)
	or a
	jr z, +
	dec (iy+24)
	jp _LABEL_10D8_

+:
	ld de, $0100
	call _LABEL_1005_
	dec (iy+26)
	ret nz
	ld (iy+26), $20
	ld a, (iy+2)
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
	call _LABEL_1050_
	ld a, (_RAM_C308_)
	or a
	ret z
	ld (iy+8), $00
	ld (iy+15), $05
	ld (iy+16), $00
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
	call _LABEL_FFF_
	ld h, (iy+15)
	ld l, (iy+16)
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
	ld (iy+15), h
	ld (iy+16), l
	ex de, hl
	ld e, $00
	jp _LABEL_1019_

+++:
	ld (iy+28), $38
	jp _LABEL_3063_

++++:
	ld (iy+17), $01
	ld a, (iy+15)
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
	call _LABEL_1050_
	ld hl, $0210
	jp _LABEL_1049_

; Data from 158E to 15B4 (39 bytes)
_DATA_158E_:
.db $97 $15 $0E $01 $04 $00 $FC $00 $50 $9B $15 $A8 $15 $04 $00 $00
.db $80 $00 $08 $81 $08 $00 $82 $08 $08 $83 $04 $00 $00 $84 $00 $08
.db $85 $08 $00 $86 $08 $08 $87

_LABEL_15B5_:
	ld de, $0040
	call _LABEL_1005_
	ld a, (iy+6)
	ld (_RAM_C320_), a
	jp _LABEL_1027_

; 15th entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_15C4_:
	ld a, (iy+3)
	or a
	jp nz, +
	ld hl, _DATA_1AAE_
	call _LABEL_15E0_
	ld a, (iy+8)
	cp $58
	jp c, _LABEL_1A80_
	ld (iy+15), $FF
	jp _LABEL_1A80_

_LABEL_15E0_:
	ld (iy+3), $01
	ld (iy+0), l
	ld (iy+1), h
	ld (iy+13), $FE
	ld (iy+14), $00
	ld (iy+16), $80
	ret

+:
	ld a, (iy+24)
	or a
	jp nz, _LABEL_1AD4_
_LABEL_15FE_:
	ld de, $0020
	ld h, (iy+13)
	ld l, (iy+14)
	ld a, h
	cp $02
	jr z, +
	add hl, de
	ld (iy+13), h
	ld (iy+14), l
+:
	ex de, hl
	call _LABEL_1005_
	jp _LABEL_1013_

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
	ld a, (_RAM_C124_)
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
	jp _LABEL_B48_

+:
	ld hl, $0800
	ld bc, $0005
	jp _LABEL_B48_

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
	call _LABEL_1050_
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
	ld (iy+6), a
	inc hl
	ld a, (hl)
	ld (iy+8), a
	inc hl
	ld a, (hl)
	ld (iy+13), a
	inc hl
	ld a, (hl)
	ld (iy+15), a
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
	ld a, (iy+8)
	cp $78
	jr c, +++
	jp ++

+:
	ld a, (iy+8)
	cp $E0
	jr nc, ++
	cp $38
	jr nc, +++
++:
	ld a, (player1XPos)
	call _LABEL_1884_
	jp c, +
	ld a, (_RAM_C103_)
	bit 0, a
	jp z, _LABEL_10D8_
	ld a, (_RAM_C628_)
	call _LABEL_1884_
	jp nc, _LABEL_10D8_
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
	ld h, (iy+15)
	ld l, (iy+16)
	add hl, de
	ld (iy+15), h
	ld (iy+16), l
	jp _LABEL_10D8_

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
	ld c, (iy+8)
	jr +

_LABEL_1889_:
	ld c, (iy+6)
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
	call _LABEL_1050_
	ld (iy+24), $01
	ld (iy+8), $00
	call _LABEL_2D2A_
	rrca
	jr c, +
	ld (iy+24), $02
	ld (iy+8), $B4
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
	ld h, (iy+13)
	ld l, (iy+14)
	add hl, hl
	ld (iy+13), h
	ld (iy+14), l
	ld h, (iy+15)
	ld l, (iy+16)
	add hl, hl
	ld (iy+15), h
	ld (iy+16), l
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
	jp nz, _LABEL_10D8_
	call _LABEL_13BB_
	ld a, (iy+5)
	cp $01
	jr z, +
	call _LABEL_13C4_
+:
	ld (iy+25), l
	ld a, h
	call _LABEL_1884_
	jp nc, _LABEL_10D8_
	ld a, (iy+25)
	call _LABEL_1889_
	jp nc, _LABEL_10D8_
	ld (iy+26), $01
	ld c, (iy+5)
	call _LABEL_2F92_
	ld (iy+19), $10
	ld hl, $00FF
	ld (iy+15), l
	ld (iy+16), h
	ld (iy+13), l
	ld (iy+14), $80
	ld a, (iy+24)
	cp $01
	ret z
	ld (iy+15), $01
	ld (iy+16), h
	ld (iy+13), l
	ld (iy+14), $80
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
	call _LABEL_1050_
	ld hl, $020A
	call _LABEL_1049_
	ld (iy+24), $06
	ld hl, _RAM_C30B_
	inc (hl)
	ld a, (_RAM_C30C_)
	inc a
	ld (iy+25), a
	ld (iy+8), $58
	dec a
	jr z, +
	ld (iy+8), $90
	dec a
	ret z
	ld (iy+8), $18
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
	jp z, _LABEL_1019_
	ld de, $0040
	jp _LABEL_1019_

_LABEL_1A2A_:
	ld e, (iy+24)
	ld d, $00
	ld h, (iy+13)
	ld l, (iy+14)
	xor a
	sbc hl, de
	ld (iy+13), h
	ld (iy+14), l
	ex de, hl
	jp _LABEL_1005_

+:
	ld a, (iy+6)
	sub $10
	ld h, a
	add a, $30
	ld l, a
	ld a, (_RAM_C606_)
	ld c, $01
	cp h
	jr c, +
	cp l
	call c, ++
+:
	ld a, (_RAM_C626_)
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
	call _LABEL_1050_
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
	call _LABEL_FFF_
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
	jp _LABEL_1056_

; 23rd entry of Jump Table from C64 (indexed by _RAM_C602_)
_LABEL_1AEE_:
	ld a, (iy+3)
	or a
	jr nz, _LABEL_1B5A_
	ld hl, _DATA_1B2D_
	ld bc, $0015
	call _LABEL_1050_
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
	ld (iy+15), $FB
	ld (iy+8), $B4
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
	ld (iy+15), h
	ld (iy+16), l
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
	call _LABEL_1050_
	ld c, $03
	call _LABEL_2D2A_
	and $0F
	cp $05
	jr c, +
	ld c, $02
	cp $0A
	jr c, +
	ld c, $01
	ld (iy+14), $80
+:
	ld (iy+13), c
	call _LABEL_12F7_
	ld hl, $0208
	jp _LABEL_1049_

; Data from 1BDB to 1BFF (37 bytes)
_DATA_1BDB_:
.db $E2 $1B $1A $01 $00 $00 $FC $E6 $1B $F3 $1B $04 $00 $00 $9C $00
.db $08 $9D $08 $00 $9E $08 $08 $9F $04 $00 $00 $A0 $00 $08 $A1 $08
.db $00 $A2 $08 $08 $A3

_LABEL_1C00_:
	call _LABEL_FFF_
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
	call _LABEL_1050_
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
	ld a, (_RAM_C606_)
	ld b, a
	ld a, (_RAM_C626_)
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
	ld a, (_RAM_C606_)
	add a, $02
	ld (iy+25), a
	ld a, (player1XPos)
	add a, $02
	ld (iy+26), a
	jr ++

+:
	ld a, (_RAM_C626_)
	add a, $02
	ld (iy+25), a
	ld a, (_RAM_C628_)
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
	ld (iy+8), a
	ld a, (iy+6)
	add a, $08
	ld (iy+6), a
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
	ld (iy+8), a
	inc hl
	ld a, (hl)
	add a, (iy+25)
	ld (iy+6), a
	ret

++:
	ld a, (hl)
	add a, (iy+25)
	ld (iy+6), a
	inc hl
	ld a, (iy+26)
	sub (hl)
	ld (iy+8), a
	ret

+++:
	ld a, (iy+26)
	sub (hl)
	ld (iy+8), a
	ld a, (iy+25)
	inc hl
	sub (hl)
	ld (iy+6), a
	ret

++++:
	ld a, (iy+25)
	sub (hl)
	ld (iy+6), a
	inc hl
	ld a, (hl)
	add a, (iy+26)
	ld (iy+8), a
	ret

; Data from 1D4E to 1D55 (8 bytes)
_DATA_1D4E_:
.db $14 $00 $12 $08 $0E $0E $08 $12

; 3rd entry of Jump Table from 1CA8 (indexed by _RAM_C61B_)
_LABEL_1D56_:
	ld (iy+13), $FD
	ld (iy+15), $FE
	call _LABEL_FFF_
	jp _LABEL_1013_

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
	call _LABEL_1050_
	ld (iy+14), $55
	ld hl, $0308
	call _LABEL_1049_
	ld (iy+24), $20
	call _LABEL_2D2A_
	ld bc, $FE80
	rrca
	jr c, +
	ld b, $01
	ld (iy+8), b
+:
	ld (iy+15), b
	ld (iy+16), c
	ret

; Data from 1DA4 to 1DAC (9 bytes)
_DATA_1DA4_:
.db $0B $1E $1C $01 $04 $00 $08 $00 $B4

++:
	call _LABEL_1027_
	call _LABEL_10D8_
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
	call _LABEL_1050_
	ld (iy+14), $55
	ld a, (_RAM_C316_)
	cp $07
	ret z
	cp $0F
	ret z
	cp $42
	ret z
	ld (iy+8), $98
	cp $23
	ret z
	cp $28
	ret z
	cp $4B
	ret z
	ld (iy+8), $30
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
	call _LABEL_1019_
++:
	call _LABEL_FFF_
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
	ld a, (iy+8)
	cp $58
	ret c
	ld (iy+15), $FF
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
	call _LABEL_1050_
	ld (iy+24), $02
_LABEL_1EFD_:
	ld (iy+13), $FF
	ld (iy+14), $00
	ld (iy+30), $00
	ld (iy+31), $08
	ld (iy+16), $80
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
	ld a, (iy+6)
	cp $30
	jp c, +
	cp $D0
	jp nc, +
	ld (iy+25), $01
	ret

+:
	ld de, $0080
	jp _LABEL_1005_

_LABEL_1FA9_:
	ld a, (_RAM_C743_)
	or a
	ret nz
	ld de, $FF00
	jp _LABEL_1005_

++:
	call _LABEL_1013_
	ld d, (iy+30)
	ld e, (iy+31)
	ld h, (iy+13)
	ld l, (iy+14)
	add hl, de
	ld (iy+13), h
	ld (iy+14), l
	call _LABEL_FFF_
	inc (iy+26)
	ld a, (iy+26)
	cp $3F
	ret nz
	ld (iy+26), $00
	dec (iy+24)
	jr nz, +
	ld (iy+24), $04
	ld (iy+15), $00
	ld a, (iy+29)
	cpl
	ld (iy+29), a
	or a
	jr z, +
	ld (iy+15), $FF
+:
	ld a, (iy+27)
	or a
	jp nz, _LABEL_1EFD_
	ld (iy+13), $01
	ld (iy+14), $00
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
	jp _LABEL_1050_

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
	jp _LABEL_1005_

+:
	ld a, (_RAM_C766_)
	add a, h
	ld (iy+6), a
	ld a, (_RAM_C768_)
	add a, l
	ld (iy+8), a
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
	ld (ix+2), $20
	ld (ix+5), c
	ld a, (iy+6)
	ld (ix+6), a
	ld a, (iy+8)
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
	call _LABEL_1050_
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
	jp _LABEL_1050_

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
	jp _LABEL_1050_

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
	jp _LABEL_1050_

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
	jp _LABEL_1005_

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
	ld a, (ix+2)
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
	ld a, (ix+2)
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
	ld a, (ix+28)
	ld (hl), a
	call _LABEL_246F_
	ret nc
	push iy
	pop de
	ld hl, _DATA_23D6_
	ld bc, $0005
	ldir
	ld a, (ix+5)
	ld (iy+5), a
	ld a, (ix+6)
	ld (iy+6), a
	ld a, (ix+8)
	add a, $04
	ld (iy+8), a
	call _LABEL_2456_
	ld a, (ix+17)
	add a, a
	add a, a
	ld e, a
	ld d, $00
	ld hl, _DATA_23E1_
	add hl, de
	ld a, (hl)
	ld (iy+13), a
	inc hl
	ld a, (hl)
	ld (iy+14), a
	inc hl
	ld a, (hl)
	ld (iy+15), a
	inc hl
	ld a, (hl)
	ld (iy+16), a
	ld c, $85
	ld a, (ix+5)
	dec a
	jr z, +
	ld c, $8E
+:
	ld a, c
	ld (_RAM_CD00_), a
	ret

; Data from 23D6 to 23E0 (11 bytes)
_DATA_23D6_:
.db $DB $23 $03 $01 $01 $DD $23 $01 $00 $00 $04

; Data from 23E1 to 2400 (32 bytes)
_DATA_23E1_:
.db $FB $00 $00 $00 $FD $00 $FE $00 $FC $00 $FC $00 $FD $00 $FE $00
.db $FB $00 $00 $00 $FC $00 $02 $00 $FD $00 $03 $00 $FC $00 $02 $00

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
	ld (iy+6), a
	ld a, (ix+8)
	add a, $04
	ld (iy+8), a
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
	ld a, (iy+2)
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
	ld a, (iy+2)
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
	ld l, (iy+0)
	ld h, (iy+1)
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
	add a, (iy+6)
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
	add a, (iy+8)
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
	ld (iy+0), $00
	inc iy
	djnz -
	pop iy
	ld (iy+6), $D8
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
	ld hl, _RAM_C126_
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
	ld hl, _RAM_C121_
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
	rst $18	; _LABEL_18_
	ld a, $18
	call _LABEL_BE4_
	ex de, hl
	inc hl
	inc hl
	ret

+:
	ex af, af'
	push af
	ld a, $20
	ex de, hl
	rst $18	; _LABEL_18_
	ld a, $18
	call _LABEL_BE4_
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
	ld l, (iy+8)
	call _LABEL_26B6_
	ld c, (ix+8)
	call _LABEL_26E4_
	call _LABEL_26AC_
	ret nc
	ld l, (iy+6)
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
	ld a, (iy+2)
	cp $03
	jr z, +
	cp $04
	jr z, +
	ld de, $040B
	jp +

_LABEL_26CA_:
	ld de, $F810
	ld a, (iy+2)
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
	ld a, (ix+2)
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
	ld a, (ix+2)
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
	ld l, (iy+8)
	call _LABEL_26B6_
	ld c, (ix+8)
	call +
	call _LABEL_26AC_
	ret nc
	ld l, (iy+6)
	call _LABEL_26CA_
	ld c, (ix+6)
	call ++
	jp _LABEL_26AC_

+:
	ld de, $F810
	ld a, (ix+2)
	cp $11
	jp z, _LABEL_2711_
	ld de, $001F
	cp $14
	jp z, _LABEL_2711_
	ld de, $0304
	jp _LABEL_2711_

++:
	ld de, $0018
	ld a, (ix+2)
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
	ld a, (player1XPos)
	add a, $02
	call _LABEL_282B_
	jr nc, +
	ld a, (_RAM_C606_)
	add a, $02
	call _LABEL_283B_
	jr nc, +
	set 0, c
+:
	ld a, (player1XPos)
	add a, $0A
	call _LABEL_282B_
	jr nc, +
	ld a, (_RAM_C606_)
	add a, $02
	call _LABEL_283B_
	jr nc, +
	set 1, c
+:
	ld a, (player1XPos)
	add a, $02
	call _LABEL_282B_
	jr nc, +
	ld a, (_RAM_C606_)
	add a, $0A
	call _LABEL_283B_
	jr nc, +
	set 2, c
+:
	ld a, (player1XPos)
	add a, $0A
	call _LABEL_282B_
	jr nc, +
	ld a, (_RAM_C606_)
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
	ld a, (_RAM_C628_)
	add a, $02
	ld d, a
	add a, $0B
	ld e, a
	jp _LABEL_26AC_

_LABEL_283B_:
	ld h, a
	add a, $03
	ld l, a
	ld a, (_RAM_C626_)
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
	ld a, (iy+2)
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
	ld a, (iy+2)
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
	ld a, (iy+6)
	cp $10
	ret c
	call _LABEL_2688_
	ret nc
	ld a, (iy+2)
	cp $01
	jp z, _LABEL_294A_
	cp $02
	jp z, _LABEL_294A_
	cp $05
	ret z
	ld c, (iy+2)
	ld a, (ix+2)
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
	ld a, (ix+2)
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
	ld (iy+2), $05
	jp _LABEL_1063_

+:
	ld (ix+2), $08
	ld c, $0A
	jp _LABEL_255E_

++:
	ld (iy+2), $05
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
	ld (iy+2), $05
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
	call _LABEL_10CA_
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
	call _LABEL_B48_
	pop bc
	ld hl, $0040
	add hl, de
	ex de, hl
	pop bc
	djnz -
	ld de, $8900
	jp _LABEL_BDD_

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
	jp _LABEL_BDD_

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
	ld hl, _DATA_6469_
	call +
	ld de, _RAM_D000_
	call _LABEL_2CCB_
	pop de
	ld hl, _DATA_6655_
	call +
	ld de, _RAM_D001_
	call _LABEL_2CCB_
	ld hl, _RAM_D000_
	pop de
	ld bc, $022C
	jp _LABEL_B7B_

+:
	add hl, de
	ld e, (hl)
	inc hl
	ld d, (hl)
	ex de, hl
	ret

_LABEL_2CCB_:
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
	jp _LABEL_2CCB_

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
	jp _LABEL_2CCB_

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
	add a, (iy+6)
	ld l, a
	ld a, $04
	add a, (iy+8)
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

; 1st entry of Pointer Table from 38FA (indexed by _RAM_CD00_)
; Data from 3D2D to 3D30 (4 bytes)
_DATA_3D2D_:
.db $03 $80 $20 $02

; Pointer Table from 3D31 to 3D32 (1 entries, indexed by unknown)
.dw _DATA_3D49_

; Data from 3D33 to 3D39 (7 bytes)
.db $03 $01 $01 $0B $80 $21 $02

; Pointer Table from 3D3A to 3D3B (1 entries, indexed by unknown)
.dw _DATA_3D75_

; Data from 3D3C to 3D48 (13 bytes)
.db $03 $01 $03 $0B $80 $22 $02 $AA $3D $03 $01 $01 $0B

; 1st entry of Pointer Table from 3D31 (indexed by unknown)
; Data from 3D49 to 3D74 (44 bytes)
_DATA_3D49_:
.db $EA $67 $3D $ED $05 $EA $67 $3D $ED $FB $80 $02 $EA $67 $3D $AA
.db $02 $AA $AA $AA $AA $A9 $A7 $A5 $10 $80 $06 $A5 $0A $E2 $80 $02
.db $A5 $A4 $A5 $A4 $A5 $A4 $A5 $A0 $04 $80 $0C $EB

; 1st entry of Pointer Table from 3D3A (indexed by unknown)
; Data from 3D75 to 3DD5 (97 bytes)
_DATA_3D75_:
.db $80 $02 $A0 $EC $00 $07 $77 $3D $EA $99 $3D $ED $05 $EA $99 $3D
.db $ED $FB $EA $99 $3D $A0 $04 $99 $02 $99 $99 $99 $99 $99 $A5 $A0
.db $99 $A0 $0A $E2 $99 $99 $99 $99 $9D $9D $9D $9D $99 $A5 $A5 $A5
.db $A5 $A5 $A4 $A2 $EB $80 $10 $EA $C8 $3D $ED $05 $EA $C8 $3D $ED
.db $FB $EA $C8 $3D $8D $02 $8D $91 $91 $92 $92 $94 $94 $91 $8D $8D
.db $99 $0A $E2 $8D $02 $8D $91 $91 $94 $94 $96 $94 $8D $04 $80 $0C
.db $EB

; 3rd entry of Pointer Table from 38FA (indexed by _RAM_CD00_)
; Data from 3DD6 to 3DD9 (4 bytes)
_DATA_3DD6_:
.db $03 $80 $20 $01

; Pointer Table from 3DDA to 3DDB (1 entries, indexed by unknown)
.dw _DATA_3DF2_

; Data from 3DDC to 3DE2 (7 bytes)
.db $03 $01 $01 $09 $80 $21 $01

; Pointer Table from 3DE3 to 3DE4 (1 entries, indexed by unknown)
.dw _DATA_3EF3_

; Data from 3DE5 to 3DF1 (13 bytes)
.db $03 $01 $01 $08 $80 $22 $01 $8D $3E $03 $01 $01 $08

; 1st entry of Pointer Table from 3DDA (indexed by unknown)
; Data from 3DF2 to 3EF2 (257 bytes)
_DATA_3DF2_:
.db $EA $73 $3E $80 $08 $A5 $04 $A5 $04 $80 $10 $EC $00 $02 $F2 $3D
.db $A0 $06 $02 $A2 $04 $80 $A3 $80 $A2 $A0 $8D $04 $A0 $04 $A2 $8D
.db $A3 $8D $A2 $A0 $EC $00 $02 $0C $3E $8D $04 $A0 $9E $8D $9D $8D
.db $9B $8D $EA $73 $3E $EA $83 $3E $EC $00 $02 $24 $3E $ED $07 $EA
.db $73 $3E $EA $83 $3E $ED $F9 $EA $73 $3E $EA $83 $3E $94 $04 $80
.db $A7 $08 $94 $04 $A7 $A7 $A7 $A8 $02 $9C $A8 $9C $94 $04 $A8 $94
.db $A8 $A7 $08 $92 $04 $80 $92 $08 $A4 $02 $A5 $02 $04 $04 $04 $A7
.db $02 $9B $A7 $9B $92 $04 $A6 $02 $A7 $06 $04 $A5 $08 $E5 $02 $3E
.db $E2 $9E $01 $A0 $03 $8D $04 $A2 $8D $A3 $8D $A2 $9E $01 $A0 $03
.db $EB $8D $04 $A0 $A2 $8D $A3 $8D $A2 $8D $EB $99 $04 $99 $80 $20
.db $99 $04 $99 $80 $10 $EC $00 $02 $8D $3E $99 $06 $02 $04 $80 $99
.db $80 $99 $99 $80 $99 $99 $80 $99 $80 $99 $99 $EC $00 $03 $A5 $3E
.db $EA $E1 $3E $EC $00 $02 $B2 $3E $ED $07 $EA $E1 $3E $ED $F9 $EC
.db $01 $02 $BC $3E $ED $07 $80 $08 $A0 $80 $04 $A0 $A0 $A0 $EC $00
.db $02 $C8 $3E $ED $FE $EC $01 $02 $C8 $3E $ED $04 $E5 $9C $3E $8D
.db $04 $80 $8D $80 $8D $80 $8D $8D $80 $8D $8D $80 $8D $80 $8D $80
.db $EB

; 1st entry of Pointer Table from 3DE3 (indexed by unknown)
; Data from 3EF3 to 3EF8 (6 bytes)
_DATA_3EF3_:
.db $ED $04 $E5 $8D $3E $E2

; 4th entry of Pointer Table from 38FA (indexed by _RAM_CD00_)
; Data from 3EF9 to 3EFC (4 bytes)
_DATA_3EF9_:
.db $03 $80 $20 $01

; Pointer Table from 3EFD to 3EFE (1 entries, indexed by unknown)
.dw _DATA_3F15_

; Data from 3EFF to 3F05 (7 bytes)
.db $03 $01 $01 $09 $80 $21 $01

; Pointer Table from 3F06 to 3F07 (1 entries, indexed by unknown)
.dw _DATA_3F2B_

; Data from 3F08 to 3F14 (13 bytes)
.db $03 $01 $01 $08 $80 $22 $01 $3F $3F $03 $01 $01 $08

; 1st entry of Pointer Table from 3EFD (indexed by unknown)
; Data from 3F15 to 3F2A (22 bytes)
_DATA_3F15_:
.db $A0 $08 $9E $9D $9B $04 $A0 $80 $A0 $9E $08 $9D $9B $A4 $04 $A5
.db $24 $80 $04 $99 $99 $E2

; 1st entry of Pointer Table from 3F06 (indexed by unknown)
; Data from 3F2B to 3F55 (43 bytes)
_DATA_3F2B_:
.db $99 $08 $08 $08 $98 $04 $98 $80 $8D $8D $08 $08 $08 $A0 $28 $80
.db $04 $94 $94 $E2 $9D $08 $96 $94 $94 $04 $9D $80 $9D $96 $08 $94
.db $94 $A5 $A2 $A0 $9D $99 $80 $04 $91 $91 $E2

; 5th entry of Pointer Table from 38FA (indexed by _RAM_CD00_)
; Data from 3F56 to 3F59 (4 bytes)
_DATA_3F56_:
.db $01 $A0 $23 $01

; Pointer Table from 3F5A to 3F5D (2 entries, indexed by unknown)
.dw _DATA_3F60_ _DATA_61E_

; Data from 3F5E to 3F5F (2 bytes)
.db $06 $0C

; 1st entry of Pointer Table from 3F5A (indexed by unknown)
; Data from 3F60 to 3F68 (9 bytes)
_DATA_3F60_:
.db $E3 $07 $AF $A5 $02 $99 $9B $02 $E2

; 6th entry of Pointer Table from 38FA (indexed by _RAM_CD00_)
; Data from 3F69 to 3F6C (4 bytes)
_DATA_3F69_:
.db $01 $A0 $22 $01

; Pointer Table from 3F6D to 3F6E (1 entries, indexed by unknown)
.dw _DATA_3F73_

; Data from 3F6F to 3F72 (4 bytes)
.db $03 $01 $04 $0E

; 1st entry of Pointer Table from 3F6D (indexed by unknown)
; Data from 3F73 to 3F76 (4 bytes)
_DATA_3F73_:
.db $AA $9E $06 $E2

; 7th entry of Pointer Table from 38FA (indexed by _RAM_CD00_)
; Data from 3F77 to 3F7A (4 bytes)
_DATA_3F77_:
.db $01 $80 $23 $02

; Pointer Table from 3F7B to 3F7C (1 entries, indexed by unknown)
.dw _DATA_3F81_

; Data from 3F7D to 3F80 (4 bytes)
.db $09 $01 $07 $0E

; 1st entry of Pointer Table from 3F7B (indexed by unknown)
; Data from 3F81 to 3F83 (3 bytes)
_DATA_3F81_:
.db $E3 $07 $A0

; Pointer Table from 3F84 to 3F85 (1 entries, indexed by unknown)
.dw _RAM_E801_

; Data from 3F86 to 3F91 (12 bytes)
.db $00 $04 $01 $E1 $0B $E6 $00 $04 $00 $F0 $02 $EE

; 8th entry of Pointer Table from 38FA (indexed by _RAM_CD00_)
; Data from 3F92 to 3F95 (4 bytes)
_DATA_3F92_:
.db $01 $A0 $23 $01

; Pointer Table from 3F96 to 3F97 (1 entries, indexed by unknown)
.dw _DATA_3F9C_

; Data from 3F98 to 3F9B (4 bytes)
.db $03 $00 $08 $0F

; 1st entry of Pointer Table from 3F96 (indexed by unknown)
; Data from 3F9C to 3FA7 (12 bytes)
_DATA_3F9C_:
.db $E3 $07 $99 $B1 $01 $80 $80 $01 $B1 $81 $08 $EE

; 10th entry of Pointer Table from 38FA (indexed by _RAM_CD00_)
; Data from 3FA8 to 3FAB (4 bytes)
_DATA_3FA8_:
.db $01 $A0 $23 $02

; Pointer Table from 3FAC to 3FAD (1 entries, indexed by unknown)
.dw _DATA_3FB2_

; Data from 3FAE to 3FB1 (4 bytes)
.db $03 $01 $08 $0F

; 1st entry of Pointer Table from 3FAC (indexed by unknown)
; Data from 3FB2 to 3FBD (12 bytes)
_DATA_3FB2_:
.db $E3 $07 $B1 $99 $04 $99 $B1 $0A $80 $80 $01 $EE

; 9th entry of Pointer Table from 38FA (indexed by _RAM_CD00_)
; Data from 3FBE to 3FC1 (4 bytes)
_DATA_3FBE_:
.db $01 $80 $21 $02

; Pointer Table from 3FC2 to 3FC3 (1 entries, indexed by unknown)
.dw _DATA_3FC8_

; Data from 3FC4 to 3FC7 (4 bytes)
.db $03 $01 $05 $0F

; 1st entry of Pointer Table from 3FC2 (indexed by unknown)
; Data from 3FC8 to 3FCB (4 bytes)
_DATA_3FC8_:
.db $B1 $01 $AC $EE

; 11th entry of Pointer Table from 38FA (indexed by _RAM_CD00_)
; Data from 3FCC to 3FCF (4 bytes)
_DATA_3FCC_:
.db $02 $80 $21 $01

; Pointer Table from 3FD0 to 3FD1 (1 entries, indexed by unknown)
.dw _DATA_3FDF_

; Data from 3FD2 to 3FD8 (7 bytes)
.db $FB $00 $05 $0F $80 $22 $01

; Pointer Table from 3FD9 to 3FDA (1 entries, indexed by unknown)
.dw _DATA_3FE7_

; Data from 3FDB to 3FDE (4 bytes)
.db $FB $01 $03 $0E

; 1st entry of Pointer Table from 3FD0 (indexed by unknown)
; Data from 3FDF to 3FE6 (8 bytes)
_DATA_3FDF_:
.db $A2 $02 $A5 $A9 $AC $A9 $0C $E2

; 1st entry of Pointer Table from 3FD9 (indexed by unknown)
; Data from 3FE7 to 3FEE (8 bytes)
_DATA_3FE7_:
.db $92 $02 $96 $99 $9D $99 $0C $EE

; 12th entry of Pointer Table from 38FA (indexed by _RAM_CD00_)
; Data from 3FEF to 3FF2 (4 bytes)
_DATA_3FEF_:
.db $02 $80 $21 $02

; Pointer Table from 3FF3 to 3FF4 (1 entries, indexed by unknown)
.dw _DATA_4002_

; Data from 3FF5 to 3FFB (7 bytes)
.db $FB $01 $03 $0E $80 $22 $02

; Pointer Table from 3FFC to 3FFD (1 entries, indexed by unknown)
.dw _DATA_400C_

; Data from 3FFE to 3FFF (2 bytes)
.db $FB $01

.BANK 1 SLOT 1
.ORG $0000

; Data from 4000 to 4001 (2 bytes)
.db $03 $0E

; 1st entry of Pointer Table from 3FF3 (indexed by unknown)
; Data from 4002 to 400B (10 bytes)
_DATA_4002_:
.db $A5 $02 $80 $A5 $94 $A5 $94 $AC $08 $E2

; 1st entry of Pointer Table from 3FFC (indexed by unknown)
; Data from 400C to 4015 (10 bytes)
_DATA_400C_:
.db $A0 $02 $80 $A0 $8D $A0 $8D $A5 $08 $EE

; 13th entry of Pointer Table from 38FA (indexed by _RAM_CD00_)
; Data from 4016 to 4019 (4 bytes)
_DATA_4016_:
.db $02 $A0 $21 $01

; Pointer Table from 401A to 401B (1 entries, indexed by unknown)
.dw _DATA_4029_

; Data from 401C to 4022 (7 bytes)
.db $03 $00 $05 $0E $A0 $22 $01

; Pointer Table from 4023 to 4024 (1 entries, indexed by unknown)
.dw _DATA_4032_

; Data from 4025 to 4028 (4 bytes)
.db $FE $01 $03 $0E

; 1st entry of Pointer Table from 401A (indexed by unknown)
; Data from 4029 to 4031 (9 bytes)
_DATA_4029_:
.db $A4 $9E $04 $EC $00 $03 $29 $40 $E2

; 1st entry of Pointer Table from 4023 (indexed by unknown)
; Data from 4032 to 403A (9 bytes)
_DATA_4032_:
.db $A4 $9E $04 $EC $00 $03 $32 $40 $EE

; 2nd entry of Pointer Table from 38FA (indexed by _RAM_CD00_)
; Data from 403B to 403E (4 bytes)
_DATA_403B_:
.db $02 $80 $22 $01

; Pointer Table from 403F to 4040 (1 entries, indexed by unknown)
.dw _DATA_404E_

; Data from 4041 to 4047 (7 bytes)
.db $03 $00 $07 $0F $80 $21 $01

; Pointer Table from 4048 to 4049 (1 entries, indexed by unknown)
.dw _DATA_4051_

; Data from 404A to 404D (4 bytes)
.db $02 $01 $07 $0F

; 1st entry of Pointer Table from 403F (indexed by unknown)
; Data from 404E to 4050 (3 bytes)
_DATA_404E_:
.db $BD $07 $E2

; 1st entry of Pointer Table from 4048 (indexed by unknown)
; Data from 4051 to 4053 (3 bytes)
_DATA_4051_:
.db $BD $07 $EE

; 14th entry of Pointer Table from 38FA (indexed by _RAM_CD00_)
; Data from 4054 to 4057 (4 bytes)
_DATA_4054_:
.db $01 $A0 $23 $01

; Pointer Table from 4058 to 405B (2 entries, indexed by unknown)
.dw _DATA_3F60_ _DATA_61A_

; Data from 405C to 405D (2 bytes)
.db $06 $0C

; 15th entry of Pointer Table from 38FA (indexed by _RAM_CD00_)
; Data from 405E to 4061 (4 bytes)
_DATA_405E_:
.db $01 $80 $23 $01

; Pointer Table from 4062 to 4063 (1 entries, indexed by unknown)
.dw _DATA_4068_

; Data from 4064 to 4067 (4 bytes)
.db $03 $00 $08 $0F

; 1st entry of Pointer Table from 4062 (indexed by unknown)
; Data from 4068 to 406A (3 bytes)
_DATA_4068_:
.db $E3 $07 $8D

; Pointer Table from 406B to 406E (2 entries, indexed by unknown)
.dw $8301 $B1E6

; Data from 406F to 4074 (6 bytes)
.db $9B $03 $B3 $83 $20 $EE

; Pointer Table from 4075 to 4086 (9 entries, indexed by _RAM_CD0C_)
_DATA_4075_:
.dw _DATA_4087_ _DATA_408E_ _DATA_4097_ _DATA_409C_ _DATA_40A3_ _DATA_40AB_ _DATA_40B2_ _DATA_40B8_
.dw _DATA_40C2_

; 1st entry of Pointer Table from 4075 (indexed by _RAM_CD0C_)
; Data from 4087 to 408D (7 bytes)
_DATA_4087_:
.db $FF $EE $DD $CC $BB $AA $01

; 2nd entry of Pointer Table from 4075 (indexed by _RAM_CD0C_)
; Data from 408E to 4096 (9 bytes)
_DATA_408E_:
.db $DE $FF $EE $DD $DC $BB $AA $99 $01

; 3rd entry of Pointer Table from 4075 (indexed by _RAM_CD0C_)
; Data from 4097 to 409B (5 bytes)
_DATA_4097_:
.db $FD $DD $DC $CC $01

; 4th entry of Pointer Table from 4075 (indexed by _RAM_CD0C_)
; Data from 409C to 40A2 (7 bytes)
_DATA_409C_:
.db $CD $DE $EF $FF $EE $DD $01

; 5th entry of Pointer Table from 4075 (indexed by _RAM_CD0C_)
; Data from 40A3 to 40AA (8 bytes)
_DATA_40A3_:
.db $FF $EE $DC $BA $A9 $87 $76 $01

; 6th entry of Pointer Table from 4075 (indexed by _RAM_CD0C_)
; Data from 40AB to 40B1 (7 bytes)
_DATA_40AB_:
.db $FF $FF $EE $8D $7D $7C $00

; 7th entry of Pointer Table from 4075 (indexed by _RAM_CD0C_)
; Data from 40B2 to 40B7 (6 bytes)
_DATA_40B2_:
.db $FE $DC $BA $98 $76 $01

; 8th entry of Pointer Table from 4075 (indexed by _RAM_CD0C_)
; Data from 40B8 to 40C1 (10 bytes)
_DATA_40B8_:
.db $FF $FD $DD $FF $FF $EE $DD $CC $BB $01

; 9th entry of Pointer Table from 4075 (indexed by _RAM_CD0C_)
; Data from 40C2 to 40C8 (7 bytes)
_DATA_40C2_:
.db $FD $CB $A9 $87 $65 $01 $FF

; Data from 40C9 to 440D (837 bytes)
_DATA_40C9_:
.db $29 $00 $82 $01 $02 $06 $03 $95 $04 $05 $03 $03 $06 $07 $08 $09
.db $0A $09 $0B $0C $0D $0E $0F $10 $11 $12 $11 $12 $13 $03 $14 $8A
.db $E8 $E9 $E8 $E9 $EA $EB $EA $EB $E8 $E9 $06 $14 $82 $15 $16 $07
.db $14 $A5 $13 $14 $11 $14 $12 $14 $11 $14 $13 $14 $13 $14 $12 $14
.db $11 $14 $13 $14 $11 $14 $13 $14 $11 $14 $AB $AC $AD $AE $06 $07
.db $08 $09 $07 $08 $09 $23 $24 $04 $25 $83 $26 $27 $28 $03 $29 $84
.db $2A $2B $2C $2D $0D $2E $83 $2F $30 $31 $04 $32 $87 $33 $34 $35
.db $36 $37 $38 $39 $06 $3A $86 $E0 $E1 $3A $3B $3C $3D $05 $29 $87
.db $3E $3F $3F $40 $41 $42 $43 $0E $2E $8A $44 $45 $46 $48 $49 $4A
.db $4C $4D $4E $4F $05 $03 $DA $04 $50 $51 $52 $53 $54 $55 $56 $57
.db $55 $56 $55 $54 $57 $58 $59 $5A $5B $5C $55 $54 $55 $57 $55 $56
.db $54 $55 $56 $56 $5D $5E $55 $56 $55 $57 $55 $54 $57 $55 $57 $56
.db $54 $55 $5F $60 $61 $62 $06 $08 $07 $09 $07 $08 $07 $0A $09 $06
.db $0B $08 $06 $08 $07 $09 $07 $08 $07 $0A $09 $06 $0B $08 $06 $98
.db $99 $9A $1F $1F $1E $1D $1F $1E $1D $1F $1C $1B $1F $1F $E2 $E3
.db $E4 $08 $03 $8E $6C $6D $6E $6F $70 $71 $70 $71 $72 $72 $70 $71
.db $73 $74 $0A $03 $8F $04 $8C $0E $0F $10 $11 $12 $11 $12 $13 $14
.db $11 $14 $14 $12 $03 $14 $81 $13 $0F $14 $93 $E8 $E9 $E8 $E9 $EA
.db $EB $EA $EB $E8 $E9 $14 $14 $8D $8E $8F $90 $91 $92 $93 $0A $14
.db $82 $F4 $F5 $06 $14 $8E $E8 $E9 $E8 $E9 $E8 $E9 $EA $EB $EA $EB
.db $E8 $E9 $EA $EB $0A $14 $BA $EA $EB $EC $ED $14 $8D $8E $8F $90
.db $91 $92 $93 $14 $14 $11 $14 $14 $12 $14 $11 $14 $13 $12 $14 $13
.db $11 $12 $14 $13 $11 $12 $11 $12 $13 $11 $12 $13 $11 $AB $AC $AD
.db $AE $06 $07 $08 $09 $07 $23 $24 $25 $26 $27 $28 $29 $2A $2B $2C
.db $2D $07 $2E $86 $44 $45 $46 $48 $49 $4A $03 $4B $84 $4C $4D $4E
.db $4F $04 $03 $96 $06 $07 $08 $09 $0B $0C $0D $0E $0F $10 $11 $12
.db $14 $14 $11 $14 $13 $F4 $F5 $12 $14 $11 $06 $14 $87 $8D $8E $8F
.db $90 $91 $92 $93 $07 $14 $82 $B8 $B8 $05 $B9 $81 $BA $05 $B9 $82
.db $BA $B8 $04 $BB $8A $BC $BD $BE $BF $C0 $C1 $C2 $C3 $BC $C4 $06
.db $C5 $83 $C3 $BC $C4 $08 $C5 $83 $C3 $BC $C4 $12 $03 $82 $C6 $C7
.db $0B $00 $82 $22 $21 $04 $00 $82 $22 $21 $04 $00 $82 $22 $21 $04
.db $00 $82 $22 $21 $04 $00 $82 $22 $CA $04 $CB $82 $C9 $21 $04 $00
.db $82 $22 $CA $04 $CB $82 $C9 $21 $13 $00 $82 $01 $02 $05 $03 $A2
.db $06 $03 $03 $07 $03 $03 $08 $03 $06 $03 $07 $03 $08 $09 $06 $07
.db $0A $0B $09 $08 $0A $07 $0B $09 $0C $0D $0E $0F $10 $11 $12 $11
.db $12 $13 $0F $14 $8B $12 $14 $14 $13 $14 $11 $14 $14 $13 $14 $12
.db $06 $14 $82 $15 $16 $0B $14 $95 $13 $14 $11 $12 $14 $11 $12 $13
.db $11 $AB $AC $AD $AE $06 $07 $08 $09 $07 $06 $03 $07 $09 $03 $85
.db $75 $70 $71 $72 $76 $14 $00 $82 $22 $CA $0B $CB $8A $C9 $CA $CB
.db $CB $C9 $CA $CB $CB $C9 $CA $0C $CB $99 $C9 $CA $CB $C9 $CA $CB
.db $C9 $CA $CB $C9 $CA $CB $C9 $CA $CB $C9 $CA $CB $CB $CC $CD $CE
.db $CF $D0 $D1 $04 $CF $85 $D0 $D1 $D2 $D3 $D4 $0D $00 $85 $77 $78
.db $71 $73 $74 $09 $03 $82 $04 $05 $15 $03 $92 $EE $EF $F0 $F1 $F2
.db $F3 $F0 $F1 $EE $EF $F0 $F1 $F2 $F3 $EE $EF $F2 $F3 $05 $03 $83
.db $98 $99 $9A $04 $1F $8A $1C $1B $1E $1D $1F $1F $1E $1D $1E $1D
.db $03 $1F $92 $E2 $E3 $E4 $03 $03 $04 $8C $0E $0F $10 $11 $12 $13
.db $12 $11 $13 $14 $13 $05 $14 $A8 $13 $14 $11 $12 $14 $12 $14 $13
.db $11 $12 $14 $13 $11 $12 $11 $12 $13 $11 $12 $13 $11 $AB $AC $AD
.db $AE $06 $07 $08 $09 $0B $0A $09 $0B $08 $09 $0A $09 $08 $07 $06
.db $10 $03 $9A $04 $50 $51 $52 $53 $54 $55 $56 $54 $55 $57 $54 $56
.db $5D $5E $55 $54 $57 $56 $55 $57 $56 $54 $57 $55 $B8 $06 $B9 $89
.db $BA $B8 $BB $BB $DB $D7 $D8 $D9 $DA $14 $03 $89 $04 $05 $03 $DC
.db $DD $00 $00 $00 $FF

; Data from 440E to 4A0F (1538 bytes)
_DATA_440E_:
.incbin "baserom_DATA_440E_.inc"

; Data from 4A10 to 4B07 (248 bytes)
_DATA_4A10_:
.db $38 $28 $28 $7C $64 $64 $64 $00 $78 $48 $48 $7C $64 $64 $7C $00
.db $7C $44 $40 $60 $60 $64 $7C $00 $98 $98 $98 $B8 $30 $30 $30 $FC
.db $7C $40 $40 $7C $60 $60 $7C $00 $00 $00 $00 $00 $00 $00 $1F $3F
.db $7C $40 $40 $6C $64 $64 $7C $00 $44 $44 $44 $7C $64 $64 $64 $00
.db $10 $10 $10 $18 $18 $18 $18 $00 $00 $00 $00 $00 $00 $00 $FF $FE
.db $00 $00 $00 $00 $00 $00 $00 $01 $40 $40 $40 $60 $60 $60 $7C $00
.db $7E $4A $4A $6A $6A $6A $6A $00 $7C $44 $44 $64 $64 $64 $64 $00
.db $7C $4C $4C $44 $44 $44 $7C $00 $7C $44 $44 $7C $60 $60 $60 $00
.db $44 $44 $44 $38 $64 $64 $64 $00 $78 $48 $48 $7C $64 $64 $64 $00
.db $7C $44 $40 $7C $0C $4C $7C $00 $7C $10 $10 $18 $18 $18 $18 $00
.db $44 $44 $44 $64 $64 $64 $7C $00 $64 $64 $64 $6C $28 $28 $38 $00
.db $70 $C0 $00 $80 $C0 $E0 $78 $1C $19 $19 $19 $3B $33 $33 $33 $FF
.db $44 $44 $44 $7C $18 $18 $18 $00 $00 $3C $3C $00 $00 $3C $3C $00
.db $38 $44 $BA $A2 $BA $44 $38 $00 $7C $C6 $C0 $7C $06 $C6 $7C $00
.db $7E $C0 $C0 $FC $C0 $C0 $7E $00 $7C $C6 $C0 $DE $C6 $C6 $7E $00
.db $10 $38 $38 $6C $6C $C6 $DE $00

; Data from 4B08 to 5824 (3357 bytes)
_DATA_4B08_:
.incbin "baserom_DATA_4B08_.inc"

; Data from 5825 to 58D4 (176 bytes)
_DATA_5825_:
.db $00 $00 $00 $00 $00 $00 $E0 $E0 $00 $00 $00 $00 $00 $00 $38 $38
.db $00 $00 $00 $00 $00 $00 $07 $0F $00 $00 $00 $00 $00 $00 $3F $3F
.db $00 $00 $00 $00 $00 $00 $FE $FF $00 $00 $00 $00 $00 $00 $38 $38
.db $00 $00 $00 $00 $00 $00 $07 $1C $00 $00 $3F $0C $0C $0C $0C $1D
.db $00 $00 $FF $CC $CC $CC $CC $DC $38 $70 $7F $3F $00 $00 $7F $FF
.db $00 $00 $FC $FE $0E $1C $FC $F8 $38 $70 $7F $7F $F0 $E0 $FF $7F
.db $00 $00 $FE $FC $00 $00 $FC $F8 $38 $70 $70 $70 $E0 $E0 $FF $7F
.db $00 $00 $7E $FC $1C $38 $F8 $F0 $03 $07 $0E $1D $3B $70 $E0 $C0
.db $F0 $30 $38 $F8 $FC $1C $0E $0E $7C $7C $7C $76 $F7 $E7 $E3 $E3
.db $1E $3E $7E $EE $DE $DC $9C $1C $70 $70 $77 $73 $F1 $E0 $E0 $E0
.db $07 $0E $FE $FC $C0 $E0 $70 $38 $78 $71 $77 $73 $F1 $E0 $E0 $E0

; Data from 58D5 to 6468 (2964 bytes)
_DATA_58D5_:
.incbin "baserom_DATA_58D5_.inc"

; Pointer Table from 6469 to 6600 (204 entries, indexed by _RAM_D300_)
_DATA_6469_:
.dw _DATA_6841_ _DATA_6843_ _DATA_6858_ _DATA_6875_ _DATA_6877_ _DATA_6890_ _DATA_68BD_ _DATA_68DF_
.dw _DATA_6904_ _DATA_692B_ _DATA_6958_ _DATA_6985_ _DATA_69B2_ _DATA_69D7_ _DATA_6A03_ _DATA_6A28_
.dw _DATA_6A4C_ _DATA_6A79_ _DATA_6AA2_ _DATA_6ACB_ _DATA_6AF0_ _DATA_6AFE_ _DATA_6B1D_ _DATA_6B4A_
.dw _DATA_6B64_ _DATA_6B8E_ _DATA_6BB8_ _DATA_6BC4_ _DATA_6BDE_ _DATA_6BEC_ _DATA_6C06_ _DATA_6C14_
.dw _DATA_6C16_ _DATA_6C26_ _DATA_6C43_ _DATA_6C60_ _DATA_6C88_ _DATA_6CAA_ _DATA_6CB6_ _DATA_6CC8_
.dw _DATA_6CDB_ _DATA_6CED_ _DATA_6CFF_ _DATA_6D14_ _DATA_6D26_ _DATA_6D37_ _DATA_6D45_ _DATA_6D47_
.dw _DATA_6D55_ _DATA_6D65_ _DATA_6D77_ _DATA_6D89_ _DATA_6D9B_ _DATA_6DAD_ _DATA_6DBF_ _DATA_6DD1_
.dw _DATA_6DE3_ _DATA_6DF7_ _DATA_6E07_ _DATA_6E13_ _DATA_6E23_ _DATA_6E38_ _DATA_6E4A_ _DATA_6E5C_
.dw _DATA_6E6E_ _DATA_6E82_ _DATA_6E94_ _DATA_6EA5_ _DATA_6EB3_ _DATA_6EBF_ _DATA_6ECB_ _DATA_6EDC_
.dw _DATA_6EEE_ _DATA_6F00_ _DATA_6F12_ _DATA_6F26_ _DATA_6F38_ _DATA_6F4A_ _DATA_6F5C_ _DATA_6F6D_
.dw _DATA_6F7B_ _DATA_6FA7_ _DATA_6FB8_ _DATA_6FD3_ _DATA_6FE1_ _DATA_6FFF_ _DATA_7011_ _DATA_702D_
.dw _DATA_7043_ _DATA_7062_ _DATA_708E_ _DATA_70A1_ _DATA_70BF_ _DATA_70DB_ _DATA_7101_ _DATA_711B_
.dw _DATA_713A_ _DATA_7150_ _DATA_7167_ _DATA_7183_ _DATA_71A4_ _DATA_71BD_ _DATA_71DB_ _DATA_71F1_
.dw _DATA_71FF_ _DATA_720E_ _DATA_721C_ _DATA_722D_ _DATA_723D_ _DATA_7249_ _DATA_7256_ _DATA_7262_
.dw _DATA_7272_ _DATA_727E_ _DATA_728A_ _DATA_7296_ _DATA_72B1_ _DATA_72C0_ _DATA_72DF_ _DATA_72F7_
.dw _DATA_7306_ _DATA_7317_ _DATA_7317_ _DATA_7317_ _DATA_7317_ _DATA_7317_ _DATA_7317_ _DATA_7317_
.dw _DATA_7317_ _DATA_7317_ _DATA_7317_ _DATA_7317_ _DATA_7317_ _DATA_7317_ _DATA_7317_ _DATA_7317_
.dw _DATA_7317_ _DATA_7317_ _DATA_7317_ _DATA_7317_ _DATA_7317_ _DATA_7343_ _DATA_7352_ _DATA_7363_
.dw _DATA_7385_ _DATA_73B1_ _DATA_73C4_ _DATA_73D2_ _DATA_73E0_ _DATA_73E0_ _DATA_73E0_ _DATA_73E0_
.dw _DATA_73E0_ _DATA_73EE_ _DATA_7411_ _DATA_741F_ _DATA_741F_ _DATA_741F_ _DATA_741F_ _DATA_741F_
.dw _DATA_741F_ _DATA_741F_ _DATA_741F_ _DATA_7433_ _DATA_7433_ _DATA_7433_ _DATA_7456_ _DATA_746E_
.dw _DATA_7488_ _DATA_6C14_ _DATA_749E_ _DATA_749E_ _DATA_74C6_ _DATA_74F3_ _DATA_750A_ _DATA_752C_
.dw _DATA_752C_ _DATA_752C_ _DATA_752C_ _DATA_752C_ _DATA_752C_ _DATA_752C_ _DATA_752C_ _DATA_752C_
.dw _DATA_752C_ _DATA_7536_ _DATA_755F_ _DATA_7579_ _DATA_7583_ _DATA_7585_ _DATA_759B_ _DATA_75B5_
.dw _DATA_75CF_ _DATA_75E9_ _DATA_75FD_ _DATA_760B_ _DATA_7623_ _DATA_763C_ _DATA_764B_ _DATA_766C_
.dw _DATA_7686_ _DATA_7692_ _DATA_76B1_ _DATA_76D0_

; Data from 6601 to 6654 (84 bytes)
.db $E6 $76 $FD $76 $1E $77 $37 $77 $48 $77 $75 $77 $94 $77 $BD $77
.db $DA $77 $E4 $77 $F0 $77 $05 $78 $21 $78 $41 $78 $61 $78 $7A $78
.db $84 $78 $9F $78 $B2 $78 $CC $78 $E0 $78 $00 $79 $16 $79 $24 $79
.db $44 $79 $55 $79 $55 $79 $55 $79 $55 $79 $6F $79 $83 $79 $9B $79
.db $AE $79 $CC $79 $E9 $79 $F7 $79 $FF $79 $0D $7A $15 $7A $23 $7A
.db $2B $7A $47 $7A

; Pointer Table from 6655 to 6800 (214 entries, indexed by _RAM_D300_)
_DATA_6655_:
.dw _DATA_7A5D_ _DATA_7A5F_ _DATA_7A71_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_
.dw _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_
.dw _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_
.dw _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A89_
.dw _DATA_7A5D_ _DATA_7A9F_ _DATA_7A89_ _DATA_7AAD_ _DATA_7AB3_ _DATA_7A5D_ _DATA_7AB9_ _DATA_7AC3_
.dw _DATA_7ACE_ _DATA_7AD8_ _DATA_7AE2_ _DATA_7AF4_ _DATA_7AFE_ _DATA_7B0C_ _DATA_7A5D_ _DATA_7B19_
.dw _DATA_7B24_ _DATA_7B2E_ _DATA_7B3C_ _DATA_7B46_ _DATA_7B4C_ _DATA_7B5A_ _DATA_7B64_ _DATA_7B72_
.dw _DATA_7B80_ _DATA_7B93_ _DATA_7A5D_ _DATA_7B9D_ _DATA_7BAD_ _DATA_7BBA_ _DATA_7BC4_ _DATA_7BD2_
.dw _DATA_7BDC_ _DATA_7BEE_ _DATA_7BFC_ _DATA_7C05_ _DATA_7C12_ _DATA_7C1A_ _DATA_7C20_ _DATA_7C30_
.dw _DATA_7C3A_ _DATA_7C48_ _DATA_7C56_ _DATA_7C66_ _DATA_7C70_ _DATA_7C7E_ _DATA_7C84_ _DATA_7C8A_
.dw _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_
.dw _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_
.dw _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_
.dw _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7C97_ _DATA_7CA1_ _DATA_7CAC_ _DATA_7CB6_
.dw _DATA_7D03_ _DATA_7CC5_ _DATA_7CB6_ _DATA_7CCB_ _DATA_7CDF_ _DATA_7CE8_ _DATA_7D03_ _DATA_7D1A_
.dw _DATA_7D29_ _DATA_7D33_ _DATA_7D33_ _DATA_7D33_ _DATA_7D33_ _DATA_7D33_ _DATA_7D33_ _DATA_7D33_
.dw _DATA_7D33_ _DATA_7D33_ _DATA_7D33_ _DATA_7D33_ _DATA_7D33_ _DATA_7D33_ _DATA_7D33_ _DATA_7D33_
.dw _DATA_7D33_ _DATA_7D33_ _DATA_7D33_ _DATA_7D33_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_
.dw _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_
.dw _DATA_7E28_ _DATA_7E33_ _DATA_7E4F_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_
.dw _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_
.dw _DATA_7A5D_ _DATA_7A89_ _DATA_7D33_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_
.dw _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_
.dw _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_
.dw _DATA_7A5D_ _DATA_7A5D_ _DATA_7A5D_ _DATA_7D33_ _DATA_7A5D_ _DATA_7D4B_ _DATA_7D51_ _DATA_7D6D_
.dw _DATA_7D6D_ _DATA_7D84_ _DATA_7DA0_ _DATA_7DAE_ _DATA_7DC2_ _DATA_7DD6_ _DATA_7DD6_ _DATA_7DD6_
.dw _DATA_7DD6_ _DATA_7DD6_ _DATA_7DD6_ _DATA_7DD6_ _DATA_7DE0_ _DATA_7DE6_

; Data from 6801 to 6840 (64 bytes)
.db $EE $7D $5D $7A $5D $7A $5D $7A $5D $7A $5D $7A $FF $7D $18 $7E
.db $5D $7A $5D $7A $5D $7A $5D $7A $5C $7E $67 $7E $85 $7E $5D $7A
.db $5D $7A $5D $7A $5D $7A $5D $7A $5D $7A $5D $7A $5D $7A $5D $7A
.db $5D $7A $5D $7A $5D $7A $5D $7A $5D $7A $5D $7A $5D $7A $5D $7A

; 1st entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6841 to 6842 (2 bytes)
_DATA_6841_:
.db $2C $02

; 2nd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6843 to 6857 (21 bytes)
_DATA_6843_:
.db $06 $02 $83 $06 $04 $06 $07 $02 $86 $06 $04 $05 $09 $09 $05 $13
.db $02 $83 $06 $06 $02

; 3rd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6858 to 6874 (29 bytes)
_DATA_6858_:
.db $82 $04 $05 $0A $09 $82 $05 $05 $08 $09 $86 $02 $02 $06 $04 $04
.db $05 $03 $09 $87 $05 $04 $06 $02 $02 $06 $05 $06 $09

; 4th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6875 to 6876 (2 bytes)
_DATA_6875_:
.db $2C $09

; 5th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6877 to 688F (25 bytes)
_DATA_6877_:
.db $96 $0E $0F $0E $0E $0F $0E $0E $0F $0E $0E $0F $0E $0E $0F $0E
.db $0E $0F $0E $0E $0F $0E $0E $16 $09

; 6th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6890 to 68BC (45 bytes)
_DATA_6890_:
.db $AC $8A $0B $0A $0B $0A $0B $0A $0B $0A $0B $0A $0B $0A $0B $0A
.db $0B $0A $0B $0A $0B $0A $0B $0C $0D $0C $0D $0C $0D $0C $0D $0C
.db $0D $0C $0D $0C $0D $0C $0D $0C $0D $0C $0D $0C $0D

; 7th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 68BD to 68DE (34 bytes)
_DATA_68BD_:
.db $83 $09 $09 $10 $03 $09 $81 $10 $05 $09 $81 $10 $05 $09 $81 $10
.db $05 $09 $81 $11 $03 $09 $81 $11 $05 $09 $81 $11 $05 $09 $81 $11
.db $03 $09

; 8th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 68DF to 6903 (37 bytes)
_DATA_68DF_:
.db $81 $10 $04 $09 $81 $10 $04 $09 $81 $10 $05 $09 $87 $10 $09 $09
.db $10 $09 $09 $11 $04 $09 $81 $11 $04 $09 $81 $11 $05 $09 $84 $11
.db $09 $09 $11 $02 $09

; 9th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6904 to 692A (39 bytes)
_DATA_6904_:
.db $82 $09 $10 $04 $09 $84 $10 $09 $09 $10 $03 $09 $81 $10 $05 $09
.db $85 $10 $09 $10 $09 $11 $04 $09 $84 $11 $09 $09 $11 $03 $09 $81
.db $11 $05 $09 $83 $11 $09 $11

; 10th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 692B to 6957 (45 bytes)
_DATA_692B_:
.db $8C $09 $09 $10 $09 $09 $10 $09 $09 $10 $09 $09 $10 $03 $09 $86
.db $10 $09 $10 $09 $09 $10 $03 $09 $8A $11 $09 $09 $11 $09 $09 $11
.db $09 $09 $11 $03 $09 $87 $11 $09 $11 $09 $09 $11 $09

; 11th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6958 to 6984 (45 bytes)
_DATA_6958_:
.db $AC $10 $09 $09 $10 $09 $09 $10 $09 $09 $10 $09 $10 $09 $10 $09
.db $09 $10 $09 $09 $10 $09 $09 $11 $09 $09 $11 $09 $09 $11 $09 $09
.db $11 $09 $11 $09 $11 $09 $09 $11 $09 $09 $11 $09 $09

; 12th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6985 to 69B1 (45 bytes)
_DATA_6985_:
.db $AC $10 $09 $10 $09 $10 $09 $10 $09 $10 $09 $10 $09 $10 $09 $10
.db $09 $10 $09 $09 $10 $09 $09 $11 $09 $11 $09 $11 $09 $11 $09 $11
.db $09 $11 $09 $11 $09 $11 $09 $11 $09 $09 $11 $09 $09

; 13th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 69B2 to 69D6 (37 bytes)
_DATA_69B2_:
.db $8D $10 $09 $10 $09 $10 $09 $10 $09 $09 $10 $09 $09 $10 $04 $09
.db $82 $32 $33 $03 $0E $8D $11 $09 $11 $09 $11 $09 $11 $09 $09 $11
.db $09 $09 $11 $09 $09

; 14th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 69D7 to 6A02 (44 bytes)
_DATA_69D7_:
.db $84 $09 $10 $09 $10 $03 $09 $84 $10 $09 $09 $10 $03 $09 $85 $27
.db $28 $29 $2A $2B $03 $2C $84 $09 $11 $09 $11 $03 $09 $84 $11 $09
.db $09 $11 $04 $09 $87 $2D $2E $2F $30 $31 $0D $31

; 15th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6A03 to 6A27 (37 bytes)
_DATA_6A03_:
.db $89 $09 $09 $10 $09 $10 $09 $10 $09 $10 $04 $09 $83 $1E $1F $20
.db $08 $09 $87 $11 $09 $11 $09 $11 $09 $11 $04 $09 $86 $21 $22 $23
.db $24 $25 $26 $03 $09

; 16th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6A28 to 6A4B (36 bytes)
_DATA_6A28_:
.db $89 $10 $09 $09 $10 $09 $10 $09 $09 $10 $03 $09 $83 $18 $19 $1A
.db $07 $09 $89 $11 $09 $09 $11 $09 $11 $09 $09 $11 $03 $09 $83 $1B
.db $1C $1D $07 $09

; 17th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6A4C to 6A78 (45 bytes)
_DATA_6A4C_:
.db $AC $10 $09 $10 $09 $10 $09 $10 $09 $09 $10 $09 $09 $12 $13 $14
.db $09 $09 $10 $09 $09 $10 $09 $11 $09 $11 $09 $11 $09 $11 $09 $09
.db $11 $09 $09 $15 $16 $17 $09 $09 $11 $09 $09 $11 $09

; 18th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6A79 to 6AA1 (41 bytes)
_DATA_6A79_:
.db $84 $09 $10 $09 $10 $03 $09 $81 $10 $04 $09 $87 $34 $13 $36 $10
.db $09 $09 $10 $04 $09 $83 $11 $09 $11 $03 $09 $81 $11 $04 $09 $87
.db $12 $35 $36 $11 $09 $09 $11 $03 $09

; 19th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6AA2 to 6ACA (41 bytes)
_DATA_6AA2_:
.db $87 $09 $09 $10 $09 $10 $09 $10 $05 $09 $86 $34 $13 $36 $09 $09
.db $10 $03 $09 $88 $10 $09 $09 $11 $09 $11 $09 $11 $05 $09 $86 $12
.db $35 $36 $09 $09 $11 $03 $09 $01 $11

; 20th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6ACB to 6AEF (37 bytes)
_DATA_6ACB_:
.db $82 $09 $10 $03 $09 $81 $10 $06 $09 $83 $34 $13 $36 $04 $09 $81
.db $10 $03 $09 $81 $11 $03 $09 $81 $11 $06 $09 $83 $12 $35 $36 $04
.db $09 $81 $11 $02 $09

; 21st entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6AF0 to 6AFD (14 bytes)
_DATA_6AF0_:
.db $0C $09 $83 $34 $13 $36 $13 $09 $83 $12 $35 $36 $07 $09

; 22nd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6AFE to 6B1C (31 bytes)
_DATA_6AFE_:
.db $96 $0E $0F $0E $0F $0E $0F $0E $0F $0E $0F $0E $0F $34 $13 $7D
.db $0F $0E $0F $0E $0F $0E $0F $0C $09 $83 $12 $35 $36 $07 $09

; 23rd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6B1D to 6B49 (45 bytes)
_DATA_6B1D_:
.db $AC $0A $0B $0A $0B $0A $0B $0A $0B $0A $0B $0A $0B $34 $13 $7B
.db $0A $0B $0A $0B $0A $0B $0A $0C $0D $0C $0D $0C $0D $0C $0D $0C
.db $0D $0C $0D $12 $35 $7C $0C $0D $0C $0D $0C $0D $0C

; 24th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6B4A to 6B63 (26 bytes)
_DATA_6B4A_:
.db $03 $09 $91 $37 $3A $3B $37 $3A $3B $37 $3A $3B $37 $37 $3A $3B
.db $37 $3A $3B $37 $05 $09 $11 $37 $02 $09

; 25th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6B64 to 6B8D (42 bytes)
_DATA_6B64_:
.db $03 $09 $91 $37 $3A $3B $37 $3A $3B $37 $3A $3B $37 $37 $3A $3B
.db $37 $3A $3B $37 $05 $09 $91 $37 $3A $3B $37 $3A $3B $37 $3A $3B
.db $37 $37 $3A $3B $37 $3A $3B $37 $02 $09

; 26th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6B8E to 6BB7 (42 bytes)
_DATA_6B8E_:
.db $03 $09 $91 $37 $56 $39 $37 $56 $39 $37 $56 $39 $37 $37 $56 $39
.db $37 $56 $39 $37 $05 $09 $91 $37 $3A $3B $37 $3A $3B $37 $3A $3B
.db $37 $37 $3A $3B $37 $3A $3B $37 $02 $09

; 27th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6BB8 to 6BC3 (12 bytes)
_DATA_6BB8_:
.db $05 $09 $82 $37 $37 $14 $09 $82 $37 $37 $0F $09

; 28th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6BC4 to 6BDD (26 bytes)
_DATA_6BC4_:
.db $03 $54 $83 $7E $7F $80 $06 $54 $83 $7E $7F $80 $0A $54 $83 $81
.db $82 $83 $06 $54 $83 $81 $82 $83 $07 $54

; 29th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6BDE to 6BEB (14 bytes)
_DATA_6BDE_:
.db $03 $54 $83 $84 $85 $86 $06 $54 $83 $84 $85 $86 $1D $54

; 30th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6BEC to 6C05 (26 bytes)
_DATA_6BEC_:
.db $07 $54 $83 $7E $7F $80 $06 $54 $83 $7E $7F $80 $0A $54 $83 $81
.db $82 $83 $06 $54 $83 $81 $82 $83 $03 $54

; 31st entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6C06 to 6C13 (14 bytes)
_DATA_6C06_:
.db $07 $54 $83 $84 $85 $86 $06 $54 $83 $84 $85 $86 $19 $54

; 32nd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6C14 to 6C15 (2 bytes)
_DATA_6C14_:
.db $2C $54

; 33rd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6C16 to 6C25 (16 bytes)
_DATA_6C16_:
.db $0B $09 $8B $32 $33 $0F $0E $0F $0E $0F $0E $0F $0E $0F $16 $09

; 34th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6C26 to 6C42 (29 bytes)
_DATA_6C26_:
.db $82 $02 $57 $04 $38 $81 $57 $07 $02 $81 $57 $04 $38 $81 $57 $03
.db $02 $81 $58 $05 $37 $07 $38 $05 $37 $81 $58 $02 $02

; 35th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6C43 to 6C5F (29 bytes)
_DATA_6C43_:
.db $82 $02 $58 $05 $37 $07 $59 $05 $37 $81 $58 $03 $02 $81 $57 $04
.db $38 $81 $57 $07 $02 $81 $57 $04 $38 $83 $57 $02 $02

; 36th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6C60 to 6C87 (40 bytes)
_DATA_6C60_:
.db $03 $01 $84 $40 $09 $09 $10 $03 $09 $81 $10 $04 $09 $81 $10 $04
.db $09 $85 $10 $09 $3D $3D $3E $03 $09 $81 $11 $03 $09 $81 $11 $04
.db $09 $81 $11 $04 $09 $82 $11 $09

; 37th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6C88 to 6CA9 (34 bytes)
_DATA_6C88_:
.db $04 $01 $81 $40 $04 $09 $81 $10 $06 $09 $86 $10 $09 $09 $10 $09
.db $09 $03 $01 $81 $41 $05 $09 $81 $11 $06 $09 $86 $11 $09 $09 $11
.db $09 $09

; 38th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6CAA to 6CB5 (12 bytes)
_DATA_6CAA_:
.db $04 $01 $81 $3C $11 $09 $04 $01 $81 $3C $11 $09

; 39th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6CB6 to 6CC7 (18 bytes)
_DATA_6CB6_:
.db $04 $01 $81 $3C $0D $09 $81 $40 $07 $01 $81 $3C $0E $09 $83 $3E
.db $3D $3D

; 40th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6CC8 to 6CDA (19 bytes)
_DATA_6CC8_:
.db $04 $01 $81 $3C $0B $09 $82 $3E $3F $08 $01 $81 $3C $0D $09 $81
.db $41 $03 $01

; 41st entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6CDB to 6CEC (18 bytes)
_DATA_6CDB_:
.db $04 $01 $81 $3C $0A $09 $81 $3C $0A $01 $81 $3C $0A $09 $81 $40
.db $06 $01

; 42nd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6CED to 6CFE (18 bytes)
_DATA_6CED_:
.db $04 $01 $81 $3C $0A $09 $81 $3C $0A $01 $81 $3C $0A $09 $81 $3C
.db $06 $01

; 43rd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6CFF to 6D13 (21 bytes)
_DATA_6CFF_:
.db $05 $01 $84 $3F $3D $3D $3E $06 $09 $81 $41 $0A $01 $81 $41 $0A
.db $09 $81 $3C $06 $01

; 44th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6D14 to 6D25 (18 bytes)
_DATA_6D14_:
.db $09 $01 $81 $3C $04 $09 $81 $41 $10 $01 $81 $40 $04 $09 $81 $40
.db $07 $01

; 45th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6D26 to 6D36 (17 bytes)
_DATA_6D26_:
.db $0A $01 $84 $40 $09 $09 $3C $11 $01 $81 $41 $03 $09 $81 $40 $08
.db $01

; 46th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6D37 to 6D44 (14 bytes)
_DATA_6D37_:
.db $0B $01 $82 $3F $3F $13 $01 $84 $41 $09 $09 $41 $08 $01

; 47th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6D45 to 6D46 (2 bytes)
_DATA_6D45_:
.db $2C $01

; 48th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6D47 to 6D54 (14 bytes)
_DATA_6D47_:
.db $0A $01 $84 $41 $09 $09 $41 $13 $01 $82 $3F $3F $09 $01

; 49th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6D55 to 6D64 (16 bytes)
_DATA_6D55_:
.db $0A $01 $84 $3C $09 $09 $40 $12 $01 $84 $3C $09 $09 $3C $08 $01

; 50th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6D65 to 6D76 (18 bytes)
_DATA_6D65_:
.db $09 $01 $81 $41 $04 $09 $81 $3C $11 $01 $81 $40 $03 $09 $81 $41
.db $07 $01

; 51st entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6D77 to 6D88 (18 bytes)
_DATA_6D77_:
.db $09 $01 $81 $3C $04 $09 $81 $3C $10 $01 $81 $3C $04 $09 $81 $3C
.db $07 $01

; 52nd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6D89 to 6D9A (18 bytes)
_DATA_6D89_:
.db $09 $01 $81 $3C $05 $09 $81 $41 $0F $01 $81 $3C $04 $09 $81 $40
.db $07 $01

; 53rd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6D9B to 6DAC (18 bytes)
_DATA_6D9B_:
.db $08 $01 $81 $41 $07 $09 $81 $41 $0E $01 $81 $40 $05 $09 $81 $40
.db $06 $01

; 54th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6DAD to 6DBE (18 bytes)
_DATA_6DAD_:
.db $08 $01 $81 $3C $07 $09 $81 $3C $0D $01 $81 $3C $07 $09 $81 $3C
.db $05 $01

; 55th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6DBF to 6DD0 (18 bytes)
_DATA_6DBF_:
.db $07 $01 $81 $41 $09 $09 $81 $41 $0C $01 $81 $40 $07 $09 $81 $40
.db $05 $01

; 56th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6DD1 to 6DE2 (18 bytes)
_DATA_6DD1_:
.db $07 $01 $81 $40 $09 $09 $81 $3C $0B $01 $81 $3C $09 $09 $81 $3C
.db $04 $01

; 57th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6DE3 to 6DF6 (20 bytes)
_DATA_6DE3_:
.db $06 $01 $81 $40 $0B $09 $83 $3E $3D $3F $07 $01 $81 $41 $0A $09
.db $81 $40 $04 $01

; 58th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6DF7 to 6E06 (16 bytes)
_DATA_6DF7_:
.db $05 $01 $81 $3C $0F $09 $81 $40 $05 $01 $81 $41 $0F $09 $01 $41

; 59th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6E07 to 6E12 (12 bytes)
_DATA_6E07_:
.db $05 $01 $81 $3C $10 $09 $05 $01 $81 $3C $10 $09

; 60th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6E13 to 6E22 (16 bytes)
_DATA_6E13_:
.db $04 $01 $81 $41 $0F $09 $81 $40 $06 $01 $81 $40 $0F $09 $01 $3E

; 61st entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6E23 to 6E37 (21 bytes)
_DATA_6E23_:
.db $04 $01 $81 $3C $0B $09 $84 $3E $3D $3D $3F $06 $01 $81 $3C $0F
.db $09 $81 $41 $01 $01

; 62nd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6E38 to 6E49 (18 bytes)
_DATA_6E38_:
.db $04 $01 $81 $3C $0A $09 $81 $3C $0A $01 $81 $3C $0A $09 $81 $40
.db $06 $01

; 63rd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6E4A to 6E5B (18 bytes)
_DATA_6E4A_:
.db $05 $01 $81 $40 $09 $09 $81 $3C $0A $01 $81 $41 $0A $09 $81 $3C
.db $06 $01

; 64th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6E5C to 6E6D (18 bytes)
_DATA_6E5C_:
.db $05 $01 $81 $3C $09 $09 $81 $3C $0B $01 $81 $3C $09 $09 $81 $3C
.db $06 $01

; 65th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6E6E to 6E81 (20 bytes)
_DATA_6E6E_:
.db $06 $01 $83 $3F $3D $3E $05 $09 $81 $40 $0C $01 $81 $41 $09 $09
.db $81 $41 $06 $01

; 66th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6E82 to 6E93 (18 bytes)
_DATA_6E82_:
.db $09 $01 $81 $41 $04 $09 $81 $3C $10 $01 $81 $40 $04 $09 $81 $3C
.db $07 $01

; 67th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6E94 to 6EA4 (17 bytes)
_DATA_6E94_:
.db $0C $01 $84 $40 $09 $09 $41 $10 $01 $85 $3F $3E $09 $09 $40 $07
.db $01

; 68th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6EA5 to 6EB2 (14 bytes)
_DATA_6EA5_:
.db $0D $01 $82 $3F $3F $13 $01 $84 $41 $09 $09 $41 $06 $01

; 69th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6EB3 to 6EBE (12 bytes)
_DATA_6EB3_:
.db $04 $09 $81 $41 $11 $01 $03 $3D $81 $3F $12 $01

; 70th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6EBF to 6ECA (12 bytes)
_DATA_6EBF_:
.db $05 $09 $81 $41 $10 $01 $04 $09 $81 $40 $11 $01

; 71st entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6ECB to 6EDB (17 bytes)
_DATA_6ECB_:
.db $05 $09 $81 $3C $0D $01 $81 $41 $07 $09 $81 $3C $0E $01 $82 $3F
.db $3D

; 72nd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6EDC to 6EED (18 bytes)
_DATA_6EDC_:
.db $05 $09 $81 $3C $0D $01 $81 $3C $07 $09 $81 $3C $0D $01 $81 $3C
.db $02 $09

; 73rd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6EEE to 6EFF (18 bytes)
_DATA_6EEE_:
.db $06 $09 $81 $41 $0B $01 $81 $41 $08 $09 $81 $40 $0D $01 $81 $40
.db $02 $09

; 74th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6F00 to 6F11 (18 bytes)
_DATA_6F00_:
.db $06 $09 $81 $40 $0B $01 $81 $40 $09 $09 $81 $3C $0B $01 $81 $3C
.db $03 $09

; 75th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6F12 to 6F25 (20 bytes)
_DATA_6F12_:
.db $07 $09 $81 $3C $06 $01 $81 $41 $0E $09 $81 $41 $07 $01 $83 $3F
.db $3D $3E $04 $09

; 76th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6F26 to 6F37 (18 bytes)
_DATA_6F26_:
.db $07 $09 $81 $3C $06 $01 $81 $3C $0E $09 $81 $3C $06 $01 $81 $3C
.db $07 $09

; 77th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6F38 to 6F49 (18 bytes)
_DATA_6F38_:
.db $08 $09 $81 $41 $04 $01 $81 $41 $0F $09 $81 $40 $06 $01 $81 $40
.db $07 $09

; 78th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6F4A to 6F5B (18 bytes)
_DATA_6F4A_:
.db $09 $09 $81 $41 $03 $01 $81 $3C $10 $09 $81 $40 $04 $01 $81 $3C
.db $08 $09

; 79th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6F5C to 6F6C (17 bytes)
_DATA_6F5C_:
.db $0A $09 $84 $41 $01 $01 $3C $11 $09 $81 $40 $03 $01 $81 $3C $08
.db $09

; 80th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6F6D to 6F7A (14 bytes)
_DATA_6F6D_:
.db $0B $09 $82 $3E $3E $13 $09 $84 $40 $01 $01 $40 $08 $09

; 81st entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6F7B to 6FA6 (44 bytes)
_DATA_6F7B_:
.db $87 $0A $0B $0A $0B $0A $0B $0A $04 $87 $A1 $0B $0A $0B $0A $0B
.db $0A $0B $0A $0B $0A $0B $0C $0D $0C $0D $0C $0D $0C $0D $0C $0D
.db $0C $0D $0C $0D $0C $0D $0C $0D $0C $0D $0C $0D

; 82nd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6FA7 to 6FB7 (17 bytes)
_DATA_6FA7_:
.db $05 $09 $83 $1E $1F $20 $13 $09 $86 $21 $22 $23 $24 $25 $26 $0B
.db $09

; 83rd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6FB8 to 6FD2 (27 bytes)
_DATA_6FB8_:
.db $87 $09 $10 $09 $09 $18 $19 $1A $09 $09 $81 $10 $06 $09 $86 $11
.db $09 $09 $1B $1C $1D $09 $09 $81 $11 $05 $09

; 84th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6FD3 to 6FE0 (14 bytes)
_DATA_6FD3_:
.db $04 $09 $83 $12 $13 $14 $13 $09 $83 $15 $16 $17 $0F $09

; 85th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6FE1 to 6FFE (30 bytes)
_DATA_6FE1_:
.db $04 $09 $83 $34 $13 $36 $06 $09 $81 $10 $06 $09 $81 $10 $05 $09
.db $83 $12 $35 $36 $06 $09 $81 $11 $06 $09 $81 $11 $01 $09

; 86th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 6FFF to 7010 (18 bytes)
_DATA_6FFF_:
.db $87 $09 $09 $10 $09 $34 $13 $36 $11 $09 $85 $11 $09 $12 $35 $36
.db $0F $09

; 87th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7011 to 702C (28 bytes)
_DATA_7011_:
.db $81 $10 $03 $09 $83 $34 $13 $36 $09 $09 $81 $10 $05 $09 $81 $11
.db $03 $09 $83 $12 $35 $36 $09 $09 $81 $11 $05 $09

; 88th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 702D to 7042 (22 bytes)
_DATA_702D_:
.db $04 $09 $83 $34 $13 $36 $04 $09 $81 $10 $0E $09 $83 $12 $35 $36
.db $04 $09 $81 $11 $0A $09

; 89th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7043 to 7061 (31 bytes)
_DATA_7043_:
.db $96 $0E $0F $0E $0F $34 $13 $7D $0E $0F $0E $0F $0E $0F $0E $0F
.db $0E $0F $0E $0F $0E $0F $0E $04 $09 $83 $12 $35 $36 $0F $09

; 90th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7062 to 708D (44 bytes)
_DATA_7062_:
.db $87 $0A $0B $0A $0B $34 $13 $7B $04 $87 $A1 $0A $0B $0A $0B $0A
.db $0B $0A $0B $0A $0B $0A $0C $0D $0C $0D $12 $35 $7C $0C $0D $0C
.db $0D $0C $0D $0C $0D $0C $0D $0C $0D $0C $0D $0C

; 91st entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 708E to 70A0 (19 bytes)
_DATA_708E_:
.db $04 $09 $84 $34 $88 $1F $20 $12 $09 $87 $12 $35 $22 $23 $24 $25
.db $26 $0B $09

; 92nd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 70A1 to 70BE (30 bytes)
_DATA_70A1_:
.db $04 $09 $83 $34 $88 $1A $04 $09 $81 $10 $06 $09 $81 $10 $07 $09
.db $83 $12 $87 $1D $04 $09 $81 $11 $06 $09 $81 $11 $03 $09

; 93rd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 70BF to 70DA (28 bytes)
_DATA_70BF_:
.db $81 $10 $03 $09 $83 $34 $13 $36 $09 $09 $81 $10 $05 $09 $81 $11
.db $03 $09 $83 $12 $35 $36 $09 $09 $81 $11 $05 $09

; 94th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 70DB to 7100 (38 bytes)
_DATA_70DB_:
.db $04 $09 $83 $34 $13 $36 $03 $09 $8A $46 $47 $48 $49 $09 $09 $11
.db $09 $09 $10 $06 $09 $83 $12 $35 $36 $03 $09 $84 $4A $4B $4C $4D
.db $05 $09 $81 $11 $02 $09

; 95th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7101 to 711A (26 bytes)
_DATA_7101_:
.db $04 $09 $85 $34 $13 $36 $09 $8B $11 $09 $8D $12 $35 $36 $09 $11
.db $09 $42 $43 $44 $45 $09 $09 $10 $05 $09

; 96th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 711B to 7139 (31 bytes)
_DATA_711B_:
.db $89 $09 $10 $09 $72 $73 $74 $75 $09 $10 $07 $09 $81 $10 $06 $09
.db $88 $11 $09 $09 $76 $77 $78 $09 $11 $07 $09 $81 $11 $05 $09

; 97th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 713A to 714F (22 bytes)
_DATA_713A_:
.db $86 $09 $09 $6B $6C $6D $6E $0E $09 $81 $10 $04 $09 $83 $6F $70
.db $71 $0E $09 $82 $11 $09

; 98th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7150 to 7166 (23 bytes)
_DATA_7150_:
.db $85 $62 $63 $64 $65 $66 $08 $09 $81 $10 $09 $09 $84 $67 $68 $69
.db $6A $08 $09 $81 $11 $08 $09

; 99th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7167 to 7182 (28 bytes)
_DATA_7167_:
.db $82 $5B $5C $06 $09 $81 $10 $08 $09 $81 $10 $04 $09 $84 $87 $5E
.db $5F $60 $04 $09 $81 $11 $08 $09 $81 $10 $04 $09

; 100th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7183 to 71A3 (33 bytes)
_DATA_7183_:
.db $08 $09 $8E $27 $28 $29 $2A $2B $2C $0B $0A $0B $0A $0B $0A $0B
.db $0A $09 $09 $8D $2D $2E $2F $30 $31 $0D $0C $0D $0C $0D $0C $0D
.db $0C

; 101st entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 71A4 to 71BC (25 bytes)
_DATA_71A4_:
.db $03 $09 $81 $10 $03 $09 $83 $1E $1F $20 $0F $09 $81 $11 $03 $09
.db $86 $21 $22 $23 $24 $25 $26 $09 $09

; 102nd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 71BD to 71DA (30 bytes)
_DATA_71BD_:
.db $06 $09 $83 $18 $19 $1A $03 $09 $81 $10 $03 $09 $81 $10 $0B $09
.db $83 $1B $1C $1D $03 $09 $81 $11 $03 $09 $81 $11 $05 $09

; 103rd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 71DB to 71F0 (22 bytes)
_DATA_71DB_:
.db $06 $09 $83 $12 $13 $14 $08 $09 $81 $10 $0A $09 $83 $15 $16 $17
.db $08 $09 $81 $11 $04 $09

; 104th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 71F1 to 71FE (14 bytes)
_DATA_71F1_:
.db $06 $09 $83 $34 $13 $36 $13 $09 $83 $12 $35 $36 $0D $09

; 105th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 71FF to 720D (15 bytes)
_DATA_71FF_:
.db $05 $09 $84 $72 $73 $74 $75 $13 $09 $83 $76 $77 $78 $0D $09

; 106th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 720E to 721B (14 bytes)
_DATA_720E_:
.db $04 $09 $83 $6B $6C $6D $14 $09 $83 $6F $70 $71 $0E $09

; 107th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 721C to 722C (17 bytes)
_DATA_721C_:
.db $87 $0E $61 $62 $63 $64 $65 $66 $12 $09 $84 $67 $68 $69 $6A $0F
.db $09

; 108th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 722D to 723C (16 bytes)
_DATA_722D_:
.db $84 $0B $5A $5B $5C $12 $09 $86 $0D $5D $87 $5E $5F $60 $10 $09

; 109th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 723D to 7248 (12 bytes)
_DATA_723D_:
.db $12 $09 $81 $07 $03 $02 $13 $09 $83 $05 $04 $06

; 110th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7249 to 7255 (13 bytes)
_DATA_7249_:
.db $10 $09 $82 $05 $06 $04 $02 $12 $09 $81 $08 $03 $02

; 111th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7256 to 7261 (12 bytes)
_DATA_7256_:
.db $0F $09 $81 $08 $06 $02 $0F $09 $81 $07 $06 $02

; 112th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7262 to 7271 (16 bytes)
_DATA_7262_:
.db $09 $09 $81 $07 $0C $02 $0A $09 $81 $05 $03 $04 $81 $06 $07 $02

; 113th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7272 to 727D (12 bytes)
_DATA_7272_:
.db $08 $09 $81 $07 $0D $02 $09 $09 $81 $08 $0C $02

; 114th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 727E to 7289 (12 bytes)
_DATA_727E_:
.db $09 $09 $81 $08 $0C $02 $08 $09 $81 $07 $0D $02

; 115th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 728A to 7295 (12 bytes)
_DATA_728A_:
.db $09 $09 $81 $03 $0C $02 $09 $09 $81 $03 $0C $02

; 116th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7296 to 72B0 (27 bytes)
_DATA_7296_:
.db $0A $09 $86 $05 $06 $02 $02 $06 $05 $04 $09 $82 $08 $02 $09 $09
.db $81 $07 $06 $02 $86 $06 $04 $04 $06 $02 $02

; 117th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 72B1 to 72BF (15 bytes)
_DATA_72B1_:
.db $15 $09 $81 $05 $0C $09 $82 $05 $05 $05 $09 $83 $8D $07 $02

; 118th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 72C0 to 72DE (31 bytes)
_DATA_72C0_:
.db $09 $09 $81 $07 $03 $02 $82 $06 $06 $03 $02 $84 $06 $04 $06 $02
.db $0A $09 $88 $05 $04 $05 $09 $09 $05 $04 $05 $03 $09 $81 $05

; 119th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 72DF to 72F6 (24 bytes)
_DATA_72DF_:
.db $83 $02 $06 $06 $04 $02 $82 $06 $06 $0D $02 $8A $05 $09 $09 $05
.db $04 $04 $05 $09 $09 $08 $0C $02

; 120th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 72F7 to 7305 (15 bytes)
_DATA_72F7_:
.db $88 $09 $05 $06 $02 $02 $06 $04 $06 $0E $02 $81 $06 $15 $02

; 121st entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7306 to 7316 (17 bytes)
_DATA_7306_:
.db $08 $09 $81 $03 $0D $02 $03 $09 $82 $05 $05 $03 $09 $81 $08 $0D
.db $02

; 122nd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7317 to 7342 (44 bytes)
_DATA_7317_:
.db $8F $0A $0B $0A $0B $0A $0B $0A $0B $0A $0B $0A $0B $0A $0B $0A
.db $04 $87 $99 $0B $0A $0B $0C $0D $0C $0D $0C $0D $0C $0D $0C $0D
.db $0C $0D $0C $0D $0C $0D $0C $0D $0C $0D $0C $0D

; 142nd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7343 to 7351 (15 bytes)
_DATA_7343_:
.db $0B $09 $84 $72 $73 $13 $36 $13 $09 $83 $12 $35 $36 $07 $09

; 143rd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7352 to 7362 (17 bytes)
_DATA_7352_:
.db $0A $09 $85 $6B $6C $87 $13 $36 $12 $09 $84 $6F $70 $35 $36 $07
.db $09

; 144th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7363 to 7384 (34 bytes)
_DATA_7363_:
.db $96 $0E $0F $0E $0F $0E $0E $0F $61 $62 $63 $87 $79 $34 $13 $7D
.db $0F $0E $0F $0E $0F $0E $0F $09 $09 $86 $67 $68 $69 $87 $35 $36
.db $07 $09

; 145th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7385 to 73B0 (44 bytes)
_DATA_7385_:
.db $8F $0A $0B $0A $0B $0A $0B $0A $0B $0A $0B $0A $0B $34 $13 $7B
.db $04 $87 $99 $0B $0A $0B $0C $0D $0C $0D $0C $0D $0C $0D $7A $87
.db $7A $0D $12 $35 $7C $0D $0C $0D $0C $0D $0C $0D

; 146th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 73B1 to 73C3 (19 bytes)
_DATA_73B1_:
.db $0C $09 $84 $34 $88 $1F $20 $12 $09 $87 $12 $35 $22 $23 $24 $25
.db $26 $03 $09

; 147th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 73C4 to 73D1 (14 bytes)
_DATA_73C4_:
.db $0C $09 $83 $34 $88 $1A $13 $09 $83 $12 $87 $1D $07 $09

; 148th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 73D2 to 73DF (14 bytes)
_DATA_73D2_:
.db $0C $09 $83 $34 $13 $36 $13 $09 $83 $12 $87 $17 $07 $09

; 149th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 73E0 to 73ED (14 bytes)
_DATA_73E0_:
.db $08 $09 $84 $52 $54 $54 $52 $13 $09 $82 $50 $50 $0B $09

; 154th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 73EE to 7410 (35 bytes)
_DATA_73EE_:
.db $03 $09 $81 $50 $03 $4F $81 $51 $04 $54 $84 $51 $4F $4F $51 $04
.db $54 $81 $52 $09 $09 $84 $53 $54 $54 $53 $04 $09 $86 $50 $4F $4F
.db $50 $09 $09

; 155th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7411 to 741E (14 bytes)
_DATA_7411_:
.db $81 $51 $14 $54 $84 $51 $09 $50 $51 $11 $54 $82 $53 $09

; 156th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 741F to 7432 (20 bytes)
_DATA_741F_:
.db $82 $09 $09 $0A $37 $82 $34 $13 $08 $37 $82 $09 $09 $0A $37 $82
.db $12 $35 $08 $37

; 164th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7433 to 7455 (35 bytes)
_DATA_7433_:
.db $82 $09 $09 $08 $37 $8E $09 $09 $34 $13 $36 $09 $37 $37 $3A $3B
.db $37 $3A $09 $09 $08 $37 $8C $09 $09 $12 $35 $36 $09 $37 $37 $3A
.db $3B $37 $3A

; 167th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7456 to 746D (24 bytes)
_DATA_7456_:
.db $0C $09 $82 $34 $87 $04 $37 $84 $3A $3B $37 $3A $0C $09 $82 $12
.db $87 $04 $37 $84 $3A $3B $37 $3A

; 168th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 746E to 7487 (26 bytes)
_DATA_746E_:
.db $0C $09 $8A $34 $13 $36 $09 $37 $37 $3A $3B $37 $3A $0C $09 $8A
.db $12 $35 $36 $09 $37 $37 $3A $3B $37 $3A

; 169th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7488 to 749D (22 bytes)
_DATA_7488_:
.db $0C $09 $84 $34 $13 $36 $09 $06 $37 $0C $09 $8A $12 $35 $36 $09
.db $37 $37 $56 $39 $37 $56

; 171st entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 749E to 74C5 (40 bytes)
_DATA_749E_:
.db $81 $10 $04 $09 $81 $10 $04 $09 $85 $10 $72 $73 $74 $75 $03 $09
.db $81 $10 $03 $09 $81 $11 $04 $09 $81 $11 $04 $09 $85 $11 $09 $76
.db $77 $78 $03 $09 $81 $11 $03 $09

; 173rd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 74C6 to 74F2 (45 bytes)
_DATA_74C6_:
.db $83 $09 $09 $10 $03 $09 $88 $10 $09 $09 $10 $6B $6C $6D $6E $03
.db $09 $84 $10 $09 $09 $10 $03 $09 $81 $11 $03 $09 $88 $11 $09 $09
.db $11 $09 $6F $70 $71 $03 $09 $85 $11 $09 $09 $11 $09

; 174th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 74F3 to 7509 (23 bytes)
_DATA_74F3_:
.db $8D $0E $0F $0E $0F $0E $0F $0E $61 $62 $63 $64 $65 $66 $12 $09
.db $84 $67 $68 $69 $6A $09 $09

; 175th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 750A to 752B (34 bytes)
_DATA_750A_:
.db $8A $0B $0A $0B $0A $0B $0A $0B $5A $5B $5C $03 $09 $81 $10 $08
.db $09 $8E $0D $0C $0D $0C $0D $0C $0D $5D $87 $5E $5F $60 $09 $11
.db $08 $09

; 176th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 752C to 7535 (10 bytes)
_DATA_752C_:
.db $82 $09 $09 $14 $37 $82 $09 $09 $14 $37

; 186th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7536 to 755E (41 bytes)
_DATA_7536_:
.db $82 $09 $09 $05 $37 $91 $3A $3B $37 $37 $3A $3B $37 $37 $3A $3B
.db $37 $37 $3A $3B $37 $09 $09 $05 $37 $8F $3A $3B $37 $37 $3A $3B
.db $37 $37 $3A $3B $37 $37 $3A $3B $37

; 187th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 755F to 7578 (26 bytes)
_DATA_755F_:
.db $82 $09 $09 $14 $37 $82 $09 $09 $05 $37 $8F $56 $39 $37 $37 $56
.db $39 $37 $37 $56 $39 $37 $37 $56 $39 $37

; 188th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7579 to 7582 (10 bytes)
_DATA_7579_:
.db $0A $09 $04 $37 $12 $09 $04 $37 $08 $09

; 189th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7583 to 7584 (2 bytes)
_DATA_7583_:
.db $2C $37

; 190th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7585 to 759A (22 bytes)
_DATA_7585_:
.db $83 $81 $82 $83 $0F $37 $87 $81 $82 $83 $37 $84 $85 $86 $0F $37
.db $83 $84 $85 $86 $01 $37

; 191st entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 759B to 75B4 (26 bytes)
_DATA_759B_:
.db $03 $37 $83 $84 $85 $86 $09 $37 $83 $84 $85 $86 $04 $37 $83 $7E
.db $7F $80 $0F $37 $83 $7E $7F $80 $01 $37

; 192nd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 75B5 to 75CE (26 bytes)
_DATA_75B5_:
.db $03 $37 $83 $7E $7F $80 $09 $37 $83 $7E $7F $80 $07 $37 $83 $81
.db $82 $83 $09 $37 $83 $81 $82 $83 $04 $37

; 193rd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 75CF to 75E8 (26 bytes)
_DATA_75CF_:
.db $06 $37 $83 $81 $82 $83 $03 $37 $83 $81 $82 $83 $0D $37 $83 $84
.db $85 $86 $03 $37 $83 $84 $85 $86 $07 $37

; 194th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 75E9 to 75FC (20 bytes)
_DATA_75E9_:
.db $09 $37 $83 $84 $85 $86 $10 $37 $83 $7E $7F $80 $03 $37 $83 $7E
.db $7F $80 $07 $37

; 195th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 75FD to 760A (14 bytes)
_DATA_75FD_:
.db $09 $37 $83 $7E $7F $80 $13 $37 $83 $81 $82 $83 $0A $37

; 196th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 760B to 7622 (24 bytes)
_DATA_760B_:
.db $95 $38 $37 $38 $37 $38 $37 $38 $37 $38 $37 $38 $37 $38 $37 $38
.db $37 $38 $37 $38 $37 $38 $17 $37

; 197th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7623 to 763B (25 bytes)
_DATA_7623_:
.db $16 $37 $96 $38 $37 $38 $37 $38 $37 $38 $37 $38 $37 $38 $37 $38
.db $37 $38 $37 $38 $37 $38 $37 $38 $37

; 198th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 763C to 764A (15 bytes)
_DATA_763C_:
.db $07 $09 $06 $37 $10 $09 $86 $37 $55 $37 $37 $55 $37 $09 $09

; 199th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 764B to 766B (33 bytes)
_DATA_764B_:
.db $06 $09 $83 $05 $04 $06 $03 $02 $84 $07 $09 $09 $07 $03 $02 $83
.db $06 $04 $05 $09 $09 $83 $05 $04 $05 $04 $09 $83 $05 $04 $05 $03
.db $09

; 200th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 766C to 7685 (26 bytes)
_DATA_766C_:
.db $83 $04 $04 $06 $0A $02 $82 $06 $06 $07 $02 $03 $09 $83 $05 $04
.db $06 $06 $02 $84 $08 $09 $09 $08 $06 $02

; 201st entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7686 to 7691 (12 bytes)
_DATA_7686_:
.db $83 $04 $04 $06 $13 $02 $03 $09 $81 $08 $12 $02

; 202nd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 7692 to 76B0 (31 bytes)
_DATA_7692_:
.db $82 $02 $58 $05 $37 $07 $59 $05 $37 $81 $58 $03 $02 $86 $57 $38
.db $37 $37 $38 $57 $07 $02 $86 $57 $38 $37 $37 $38 $57 $02 $02

; 203rd entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 76B1 to 76CF (31 bytes)
_DATA_76B1_:
.db $87 $02 $57 $38 $37 $37 $38 $57 $07 $02 $86 $57 $38 $37 $37 $38
.db $57 $03 $02 $81 $58 $05 $37 $07 $38 $05 $37 $81 $58 $02 $02

; 204th entry of Pointer Table from 6469 (indexed by _RAM_D300_)
; Data from 76D0 to 7A5C (909 bytes)
_DATA_76D0_:
.db $03 $02 $82 $58 $58 $0B $02 $82 $58 $58 $07 $02 $82 $58 $58 $0B
.db $02 $82 $58 $58 $04 $02 $82 $02 $58 $11 $37 $81 $58 $03 $02 $84
.db $57 $59 $37 $37 $0B $59 $84 $37 $37 $59 $57 $02 $02 $86 $02 $58
.db $37 $81 $82 $83 $09 $37 $85 $81 $82 $83 $37 $58 $03 $02 $85 $58
.db $37 $84 $85 $86 $09 $37 $85 $84 $85 $86 $37 $58 $02 $02 $82 $02
.db $58 $11 $37 $81 $58 $03 $02 $85 $58 $37 $7E $7F $80 $09 $37 $85
.db $7E $7F $80 $37 $58 $02 $02 $82 $02 $58 $11 $37 $81 $58 $03 $02
.db $81 $58 $11 $37 $81 $58 $02 $02 $86 $02 $58 $37 $81 $82 $83 $03
.db $37 $83 $81 $82 $83 $03 $37 $85 $81 $82 $83 $37 $58 $03 $02 $85
.db $58 $37 $84 $85 $86 $03 $37 $83 $84 $85 $86 $03 $37 $85 $84 $85
.db $86 $37 $58 $02 $02 $82 $02 $58 $11 $37 $81 $58 $03 $02 $85 $58
.db $37 $7E $7F $80 $03 $37 $83 $7E $7F $80 $03 $37 $85 $7E $7F $80
.db $37 $58 $02 $02 $82 $02 $58 $04 $37 $83 $81 $82 $83 $03 $37 $83
.db $81 $82 $83 $04 $37 $81 $58 $03 $02 $81 $58 $04 $37 $83 $84 $85
.db $86 $03 $37 $83 $84 $85 $86 $04 $37 $81 $58 $02 $02 $82 $02 $58
.db $11 $37 $81 $58 $03 $02 $81 $58 $04 $37 $83 $7E $7F $80 $03 $37
.db $83 $7E $7F $80 $04 $37 $81 $58 $02 $02 $17 $02 $81 $57 $11 $59
.db $83 $57 $02 $02 $03 $09 $81 $08 $12 $02 $83 $04 $04 $06 $13 $02
.db $0F $09 $83 $05 $04 $05 $03 $09 $81 $05 $0E $09 $81 $07 $03 $02
.db $84 $06 $04 $06 $02 $05 $09 $03 $37 $88 $A1 $B3 $B4 $B5 $B6 $B7
.db $B8 $B9 $03 $37 $08 $09 $03 $37 $84 $BA $BB $BB $BC $07 $37 $03
.db $09 $05 $09 $03 $37 $88 $A1 $9A $A8 $A9 $AA $AB $AC $A7 $03 $37
.db $08 $09 $03 $37 $88 $A1 $AD $AE $AF $B0 $B1 $B2 $A7 $03 $37 $03
.db $09 $05 $09 $03 $37 $88 $99 $9A $9B $9C $9D $9E $9F $A0 $03 $37
.db $08 $09 $03 $37 $88 $A1 $9A $A2 $A3 $A4 $A5 $A6 $A7 $03 $37 $03
.db $09 $05 $09 $05 $37 $84 $90 $91 $92 $93 $05 $37 $08 $09 $04 $37
.db $85 $94 $95 $96 $97 $98 $05 $37 $03 $09 $05 $09 $0E $37 $08 $09
.db $0E $37 $03 $09 $03 $02 $82 $06 $05 $08 $09 $8C $05 $04 $04 $06
.db $02 $02 $06 $04 $05 $04 $04 $05 $0E $09 $82 $05 $05 $03 $09 $07
.db $02 $83 $06 $04 $06 $11 $02 $82 $06 $05 $03 $09 $83 $05 $04 $06
.db $09 $02 $06 $09 $83 $34 $13 $36 $05 $09 $83 $81 $82 $83 $0B $09
.db $83 $12 $35 $36 $05 $09 $83 $84 $85 $86 $05 $09 $06 $09 $83 $34
.db $13 $36 $13 $09 $83 $12 $35 $36 $05 $09 $83 $7E $7F $80 $05 $09
.db $05 $01 $85 $40 $09 $81 $82 $83 $07 $09 $85 $81 $82 $83 $09 $09
.db $05 $01 $85 $3C $09 $84 $85 $86 $07 $09 $85 $84 $85 $86 $09 $09
.db $05 $01 $81 $40 $10 $09 $05 $01 $85 $3C $09 $7E $7F $80 $07 $09
.db $85 $7E $7F $80 $09 $09 $82 $09 $53 $11 $54 $84 $51 $50 $09 $51
.db $14 $54 $81 $51 $84 $09 $09 $50 $51 $05 $54 $81 $53 $03 $09 $82
.db $50 $50 $08 $09 $81 $52 $08 $54 $89 $51 $4F $51 $54 $54 $51 $4F
.db $4F $50 $03 $09 $06 $09 $83 $50 $4F $50 $11 $09 $82 $50 $51 $03
.db $54 $81 $52 $0C $09 $03 $09 $83 $81 $82 $83 $06 $09 $83 $34 $13
.db $36 $0A $09 $83 $84 $85 $86 $06 $09 $83 $12 $35 $36 $07 $09 $0C
.db $09 $83 $34 $13 $36 $0A $09 $83 $7E $7F $80 $06 $09 $83 $12 $35
.db $36 $07 $09 $0C $09 $88 $34 $13 $36 $09 $09 $81 $82 $83 $0E $09
.db $88 $12 $35 $36 $09 $09 $84 $85 $86 $02 $09 $0C $09 $83 $34 $13
.db $36 $13 $09 $88 $12 $35 $36 $09 $09 $7E $7F $80 $02 $09 $8F $09
.db $09 $81 $82 $83 $09 $09 $84 $85 $86 $09 $09 $34 $13 $36 $09 $09
.db $83 $84 $85 $86 $07 $09 $83 $12 $35 $36 $07 $09 $07 $09 $88 $7E
.db $7F $80 $09 $09 $34 $13 $36 $09 $09 $8D $7E $7F $80 $09 $09 $81
.db $82 $83 $09 $09 $12 $35 $36 $07 $09 $0F $09 $83 $81 $82 $83 $13
.db $09 $83 $84 $85 $86 $04 $09 $25 $09 $83 $7E $7F $80 $04 $09 $09
.db $09 $83 $81 $82 $83 $13 $09 $83 $84 $85 $86 $0A $09 $1F $09 $83
.db $7E $7F $80 $0A $09 $03 $09 $83 $81 $82 $83 $13 $09 $83 $84 $85
.db $86 $10 $09 $19 $09 $83 $7E $7F $80 $10 $09 $04 $09 $84 $46 $47
.db $48 $49 $04 $09 $83 $34 $13 $36 $0B $09 $84 $4A $4B $4C $4D $04
.db $09 $83 $12 $35 $36 $07 $09 $0B $09 $84 $8C $34 $13 $36 $0B $09
.db $84 $42 $43 $44 $45 $04 $09 $83 $12 $35 $36 $07 $09

; 1st entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7A5D to 7A5E (2 bytes)
_DATA_7A5D_:
.db $2C $01

; 2nd entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7A5F to 7A70 (18 bytes)
_DATA_7A5F_:
.db $06 $01 $83 $05 $05 $07 $07 $01 $83 $05 $05 $03 $16 $01 $83 $05
.db $07 $01

; 3rd entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7A71 to 7A88 (24 bytes)
_DATA_7A71_:
.db $82 $05 $03 $0B $01 $81 $03 $0A $01 $03 $05 $81 $03 $04 $01 $86
.db $05 $07 $01 $01 $05 $03 $06 $01

; 32nd entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7A89 to 7A9E (22 bytes)
_DATA_7A89_:
.db $07 $01 $07 $05 $05 $01 $81 $03 $03 $01 $05 $05 $81 $07 $07 $01
.db $05 $05 $81 $07 $02 $01

; 34th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7A9F to 7AAC (14 bytes)
_DATA_7A9F_:
.db $06 $01 $81 $03 $0C $01 $81 $03 $15 $01 $81 $03 $02 $01

; 36th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7AAD to 7AB2 (6 bytes)
_DATA_7AAD_:
.db $18 $01 $81 $07 $13 $01

; 37th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7AB3 to 7AB8 (6 bytes)
_DATA_7AB3_:
.db $19 $01 $81 $07 $12 $01

; 39th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7AB9 to 7AC2 (10 bytes)
_DATA_7AB9_:
.db $12 $01 $81 $03 $16 $01 $81 $05 $02 $01

; 40th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7AC3 to 7ACD (11 bytes)
_DATA_7AC3_:
.db $10 $01 $82 $05 $03 $16 $01 $81 $05 $03 $01

; 41st entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7ACE to 7AD7 (10 bytes)
_DATA_7ACE_:
.db $0F $01 $81 $03 $15 $01 $81 $03 $06 $01

; 42nd entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7AD8 to 7AE1 (10 bytes)
_DATA_7AD8_:
.db $0F $01 $81 $03 $15 $01 $81 $03 $06 $01

; 43rd entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7AE2 to 7AF3 (18 bytes)
_DATA_7AE2_:
.db $08 $01 $81 $07 $06 $01 $81 $05 $0A $01 $81 $07 $0A $01 $81 $03
.db $06 $01

; 44th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7AF4 to 7AFD (10 bytes)
_DATA_7AF4_:
.db $0E $01 $81 $05 $15 $01 $81 $03 $07 $01

; 45th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7AFE to 7B0B (14 bytes)
_DATA_7AFE_:
.db $0D $01 $81 $03 $11 $01 $81 $07 $03 $01 $81 $03 $08 $01

; 46th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7B0C to 7B18 (13 bytes)
_DATA_7B0C_:
.db $0C $01 $81 $03 $13 $01 $84 $07 $01 $01 $05 $08 $01

; 48th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7B19 to 7B23 (11 bytes)
_DATA_7B19_:
.db $0A $01 $81 $03 $16 $01 $82 $05 $07 $09 $01

; 49th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7B24 to 7B2D (10 bytes)
_DATA_7B24_:
.db $0D $01 $81 $07 $15 $01 $81 $03 $08 $01

; 50th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7B2E to 7B3B (14 bytes)
_DATA_7B2E_:
.db $09 $01 $81 $03 $04 $01 $81 $03 $11 $01 $81 $05 $0B $01

; 51st entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7B3C to 7B45 (10 bytes)
_DATA_7B3C_:
.db $0E $01 $81 $03 $15 $01 $81 $03 $07 $01

; 52nd entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7B46 to 7B4B (6 bytes)
_DATA_7B46_:
.db $24 $01 $81 $07 $07 $01

; 53rd entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7B4C to 7B59 (14 bytes)
_DATA_7B4C_:
.db $08 $01 $81 $03 $16 $01 $81 $05 $05 $01 $81 $07 $06 $01

; 54th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7B5A to 7B63 (10 bytes)
_DATA_7B5A_:
.db $10 $01 $81 $03 $15 $01 $81 $03 $05 $01

; 55th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7B64 to 7B71 (14 bytes)
_DATA_7B64_:
.db $07 $01 $81 $03 $16 $01 $81 $05 $07 $01 $81 $07 $05 $01

; 56th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7B72 to 7B7F (14 bytes)
_DATA_7B72_:
.db $07 $01 $81 $05 $09 $01 $81 $03 $15 $01 $81 $03 $04 $01

; 57th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7B80 to 7B92 (19 bytes)
_DATA_7B80_:
.db $06 $01 $81 $05 $0C $01 $82 $05 $07 $07 $01 $81 $03 $0A $01 $81
.db $07 $04 $01

; 58th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7B93 to 7B9C (10 bytes)
_DATA_7B93_:
.db $15 $01 $81 $07 $05 $01 $81 $03 $10 $01

; 60th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7B9D to 7BAC (16 bytes)
_DATA_7B9D_:
.db $04 $01 $81 $03 $0F $01 $81 $03 $06 $01 $81 $05 $0F $01 $01 $05

; 61st entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7BAD to 7BB9 (13 bytes)
_DATA_7BAD_:
.db $10 $01 $84 $05 $01 $01 $03 $16 $01 $81 $05 $01 $01

; 62nd entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7BBA to 7BC3 (10 bytes)
_DATA_7BBA_:
.db $0F $01 $81 $03 $15 $01 $81 $03 $06 $01

; 63rd entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7BC4 to 7BD1 (14 bytes)
_DATA_7BC4_:
.db $0F $01 $81 $03 $0A $01 $81 $07 $0A $01 $81 $03 $06 $01

; 64th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7BD2 to 7BDB (10 bytes)
_DATA_7BD2_:
.db $0F $01 $81 $03 $15 $01 $81 $03 $06 $01

; 65th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7BDC to 7BED (18 bytes)
_DATA_7BDC_:
.db $08 $01 $81 $07 $05 $01 $81 $03 $0C $01 $81 $07 $09 $01 $81 $05
.db $06 $01

; 66th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7BEE to 7BFB (14 bytes)
_DATA_7BEE_:
.db $09 $01 $81 $07 $04 $01 $81 $03 $15 $01 $81 $03 $07 $01

; 67th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7BFC to 7C04 (9 bytes)
_DATA_7BFC_:
.db $21 $01 $84 $07 $01 $01 $07 $07 $01

; 68th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7C05 to 7C11 (13 bytes)
_DATA_7C05_:
.db $0E $01 $81 $03 $13 $01 $84 $07 $01 $01 $05 $06 $01

; 69th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7C12 to 7C19 (8 bytes)
_DATA_7C12_:
.db $16 $01 $03 $05 $81 $07 $12 $01

; 70th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7C1A to 7C1F (6 bytes)
_DATA_7C1A_:
.db $1A $01 $81 $07 $11 $01

; 71st entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7C20 to 7C2F (16 bytes)
_DATA_7C20_:
.db $05 $01 $81 $03 $0D $01 $81 $03 $07 $01 $81 $03 $0E $01 $02 $05

; 72nd entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7C30 to 7C39 (10 bytes)
_DATA_7C30_:
.db $05 $01 $81 $03 $15 $01 $81 $03 $10 $01

; 73rd entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7C3A to 7C47 (14 bytes)
_DATA_7C3A_:
.db $12 $01 $81 $03 $08 $01 $81 $07 $0D $01 $81 $05 $02 $01

; 74th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7C48 to 7C55 (14 bytes)
_DATA_7C48_:
.db $06 $01 $81 $07 $0B $01 $81 $05 $09 $01 $81 $03 $0F $01

; 75th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7C56 to 7C65 (16 bytes)
_DATA_7C56_:
.db $07 $01 $81 $03 $06 $01 $81 $03 $16 $01 $83 $05 $05 $03 $04 $01

; 76th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7C66 to 7C6F (10 bytes)
_DATA_7C66_:
.db $07 $01 $81 $03 $15 $01 $81 $03 $0E $01

; 77th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7C70 to 7C7D (14 bytes)
_DATA_7C70_:
.db $0D $01 $81 $03 $0F $01 $81 $07 $06 $01 $81 $05 $07 $01

; 78th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7C7E to 7C83 (6 bytes)
_DATA_7C7E_:
.db $1E $01 $81 $07 $0D $01

; 79th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7C84 to 7C89 (6 bytes)
_DATA_7C84_:
.db $1F $01 $81 $07 $0C $01

; 80th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7C8A to 7C96 (13 bytes)
_DATA_7C8A_:
.db $0C $01 $81 $03 $13 $01 $84 $07 $01 $01 $05 $08 $01

; 109th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7C97 to 7CA0 (10 bytes)
_DATA_7C97_:
.db $12 $01 $81 $03 $16 $01 $83 $05 $01 $03

; 110th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7CA1 to 7CAB (11 bytes)
_DATA_7CA1_:
.db $10 $01 $82 $05 $03 $16 $01 $81 $05 $03 $01

; 111th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7CAC to 7CB5 (10 bytes)
_DATA_7CAC_:
.db $0F $01 $81 $05 $15 $01 $81 $03 $06 $01

; 112th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7CB6 to 7CC4 (15 bytes)
_DATA_7CB6_:
.db $09 $01 $81 $03 $15 $01 $82 $03 $05 $03 $01 $81 $03 $07 $01

; 114th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7CC5 to 7CCA (6 bytes)
_DATA_7CC5_:
.db $1E $01 $81 $07 $0D $01

; 116th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7CCB to 7CDE (20 bytes)
_DATA_7CCB_:
.db $0B $01 $85 $07 $01 $01 $05 $03 $0F $01 $81 $07 $06 $01 $03 $05
.db $83 $07 $01 $01

; 117th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7CDF to 7CE7 (9 bytes)
_DATA_7CDF_:
.db $23 $01 $81 $03 $06 $01 $82 $07 $01

; 118th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7CE8 to 7D02 (27 bytes)
_DATA_7CE8_:
.db $09 $01 $81 $03 $04 $01 $81 $03 $05 $01 $81 $03 $0B $01 $88 $05
.db $01 $07 $01 $01 $05 $01 $07 $03 $01 $81 $05

; 113th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7D03 to 7D19 (23 bytes)
_DATA_7D03_:
.db $83 $01 $01 $03 $05 $01 $81 $03 $0D $01 $8A $07 $01 $01 $05 $01
.db $01 $07 $01 $01 $05 $0C $01

; 120th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7D1A to 7D28 (15 bytes)
_DATA_7D1A_:
.db $88 $01 $01 $07 $01 $01 $05 $05 $07 $0E $01 $81 $07 $15 $01

; 121st entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7D29 to 7D32 (10 bytes)
_DATA_7D29_:
.db $08 $01 $81 $03 $11 $01 $81 $03 $12 $01

; 122nd entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7D33 to 7D4A (24 bytes)
_DATA_7D33_:
.db $95 $05 $01 $05 $01 $05 $01 $05 $01 $05 $01 $05 $01 $05 $01 $05
.db $01 $05 $01 $05 $01 $05 $17 $01

; 198th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7D4B to 7D50 (6 bytes)
_DATA_7D4B_:
.db $21 $01 $81 $03 $0A $01

; 199th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7D51 to 7D6C (28 bytes)
_DATA_7D51_:
.db $06 $01 $83 $05 $01 $03 $06 $01 $81 $03 $05 $01 $81 $07 $09 $01
.db $83 $05 $01 $07 $04 $01 $83 $05 $01 $07 $03 $01

; 200th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7D6D to 7D83 (23 bytes)
_DATA_7D6D_:
.db $83 $01 $01 $03 $0B $01 $81 $03 $0A $01 $83 $05 $01 $03 $06 $01
.db $84 $07 $01 $01 $05 $06 $01

; 202nd entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7D84 to 7D9F (28 bytes)
_DATA_7D84_:
.db $07 $01 $07 $05 $05 $01 $81 $03 $03 $01 $86 $05 $05 $01 $01 $05
.db $07 $07 $01 $86 $05 $05 $01 $01 $05 $07 $02 $01

; 203rd entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7DA0 to 7DAD (14 bytes)
_DATA_7DA0_:
.db $06 $01 $81 $03 $0C $01 $81 $03 $15 $01 $81 $03 $02 $01

; 204th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7DAE to 7DC1 (20 bytes)
_DATA_7DAE_:
.db $04 $01 $81 $03 $0C $01 $81 $03 $08 $01 $81 $03 $0C $01 $83 $03
.db $01 $03 $02 $01

; 205th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7DC2 to 7DD5 (20 bytes)
_DATA_7DC2_:
.db $13 $01 $81 $03 $03 $01 $84 $05 $05 $01 $01 $0B $05 $84 $01 $01
.db $05 $07 $02 $01

; 206th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7DD6 to 7DDF (10 bytes)
_DATA_7DD6_:
.db $13 $01 $81 $03 $15 $01 $81 $03 $02 $01

; 213th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7DE0 to 7DE5 (6 bytes)
_DATA_7DE0_:
.db $29 $01 $81 $03 $02 $01

; 214th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7DE6 to 7E27 (66 bytes)
_DATA_7DE6_:
.db $16 $01 $83 $05 $05 $07 $13 $01 $10 $01 $82 $05 $03 $12 $01 $81
.db $07 $03 $01 $83 $05 $05 $07 $01 $01 $04 $01 $81 $07 $08 $01 $84
.db $05 $01 $01 $03 $04 $01 $84 $07 $01 $01 $07 $0E $01 $82 $05 $07
.db $03 $01 $09 $01 $81 $03 $12 $01 $81 $07 $03 $01 $83 $05 $01 $03
.db $09 $01

; 153rd entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7E28 to 7E32 (11 bytes)
_DATA_7E28_:
.db $08 $01 $81 $03 $16 $01 $82 $05 $07 $0B $01

; 154th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7E33 to 7E4E (28 bytes)
_DATA_7E33_:
.db $03 $01 $81 $05 $03 $01 $81 $03 $07 $01 $81 $03 $0E $01 $84 $05
.db $01 $01 $07 $04 $01 $86 $05 $01 $01 $07 $01 $01

; 155th entry of Pointer Table from 6655 (indexed by _RAM_D300_)
; Data from 7E4F to 7FFF (433 bytes)
_DATA_7E4F_:
.db $81 $03 $16 $01 $82 $05 $03 $11 $01 $81 $07 $01 $01 $13 $01 $84
.db $05 $03 $01 $07 $14 $01 $01 $05 $03 $01 $81 $07 $05 $01 $81 $03
.db $04 $01 $81 $03 $08 $01 $81 $07 $08 $01 $85 $05 $05 $07 $01 $01
.db $03 $05 $81 $03 $03 $01 $07 $01 $82 $05 $03 $12 $01 $81 $07 $03
.db $01 $81 $05 $0C $01
.dsb 356, $FF
.db $4B $2F $2F $54 $04 $05 $00 $3C

