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
