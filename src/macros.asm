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
; c = Entity count
; t = Entity type
.MACRO entity_wave args interval, aCount, aType, bCount, bType
    .db interval
    .db aCount << 5 | aType
    .IF NARGS > 3
        .db bCount << 5 | bType
    .ELSE
        .db 0
    .ENDIF
.ENDM
