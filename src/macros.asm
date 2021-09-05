; Simple macro for entity wave data
; Arguments: interval, a_count, a_type, b_count, b_type
; 
; A entity wave consists in a group of 3 bytes:
; - Spawn timer
; - Entity A count and type
; - Entity B count and type
;
; Entity count and type byte is divided as follows:
; cccttttt
; c = Entity cuont
; t = Entity type
.MACRO entity_wave
    .db \1
    .db \2 << 5 | \3
    .IF NARGS > 3
        .db \4 << 5 | \5
    .ELSE
        .db 0
    .ENDIF
.ENDM
