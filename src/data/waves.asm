; Simple macro for enemy wave data
; 
; A enemy wave consists in a group of 3 bytes:
; - Spawn timer
; - Entity A count and type
; - Entity B count and type
;
; Entity count and type byte is divided as follows:
; cccttttt
; c = Entity cuont
; t = Entity type

.MACRO enemy_wave
    .db \1
    .db \2 << 5 | \3
    .IF NARGS > 3
        .db \4 << 5 | \5
    .ELSE
        .db 0
    .ENDIF
.ENDM

waves:
enemy_wave 00  00 $00

enemy_wave 48  07 ENTITY_ENEMY_1

enemy_wave 08  07 ENTITY_ENEMY_1

enemy_wave 20  07 $17

enemy_wave 20  02 ENTITY_POWER_UP \
               07 ENTITY_ENEMY_1

enemy_wave 20  01 ENTITY_POWER_UP \
               07 $17

enemy_wave 32  02 ENTITY_POWER_UP \
               07 $0B

enemy_wave 34  02 $1D \
               07 ENTITY_ENEMY_1

enemy_wave 32  01 $1D \
               07 $0B

enemy_wave 20  02 ENTITY_POWER_UP \
               07 $10

enemy_wave 20  02 ENTITY_POWER_UP \
               07 $17

enemy_wave 05  07 $0D

enemy_wave 05  07 $0D

enemy_wave 16  02 ENTITY_POWER_UP \
               07 $1A

enemy_wave 08  02 ENTITY_POWER_UP \
               07 $1A

enemy_wave 32  01 $1D \
               07 $17

enemy_wave 16  06 $10 \
               07 ENTITY_ENEMY_1

enemy_wave 12  02 ENTITY_POWER_UP \
               07 $1A

enemy_wave 22  01 ENTITY_POWER_UP \
               07 ENTITY_ENEMY_1

enemy_wave 32  01 $1C \
               07 $1B

enemy_wave 20  07 $12 \
               07 $12

enemy_wave 48  01 $11

enemy_wave 20  02 ENTITY_POWER_UP \
               07 $12

enemy_wave 00  07 $0C

enemy_wave 00  07 $0C

enemy_wave 16  03 ENTITY_POWER_UP \
               07 $15

enemy_wave 16  02 ENTITY_POWER_UP \
               07 $1A

enemy_wave 05  07 $0D

enemy_wave 20  07 $17 \
               07 $17

enemy_wave 16  01 $1C \
               07 $1A

enemy_wave 05  07 $0D

enemy_wave 32  03 $1D \
               07 $17

enemy_wave 24  01 $0E \
               07 ENTITY_ENEMY_1

enemy_wave 24  02 ENTITY_POWER_UP \
               07 $0B

enemy_wave 32  02 $1D \
               07 $12

enemy_wave 32  02 $1D \
               07 $15

enemy_wave 00  07 $13

enemy_wave 12  07 ENTITY_ENEMY_1

enemy_wave 08  07 $1B \
               07 $1A

enemy_wave 18  04 ENTITY_POWER_UP \
               07 $10

enemy_wave 05  07 $0D

enemy_wave 00  07 $0C

enemy_wave 16  07 $15 \
               07 $15

enemy_wave 12  02 ENTITY_POWER_UP \
               07 ENTITY_ENEMY_1

enemy_wave 20  07 $12 \
               07 $12

enemy_wave 48  01 $11

enemy_wave 00  07 $13

enemy_wave 18  01 $0E \
               07 $1A

enemy_wave 12  07 $1A

enemy_wave 08  02 ENTITY_POWER_UP \
               07 $1A

enemy_wave 20  07 $12 \
               07 $17

enemy_wave 18  07 $12 \
               07 $0B

enemy_wave 24  04 $1C \
               07 $15

enemy_wave 00  07 $13

enemy_wave 16  03 ENTITY_POWER_UP \
               07 $1A

enemy_wave 64  01 $1D \
               07 $1A

enemy_wave 64  01 $1D \
               07 $12

enemy_wave 08  07 $1A

enemy_wave 07  03 ENTITY_POWER_UP \
               07 $1A

enemy_wave 16  07 $15 \
               07 $15

enemy_wave 05  07 $0D

enemy_wave 16  02 ENTITY_POWER_UP \
               07 ENTITY_ENEMY_1

enemy_wave 05  07 $0D

enemy_wave 28  04 $1D \
               07 $12

enemy_wave 64  01 $11

enemy_wave 18  02 ENTITY_POWER_UP \
               07 $10

enemy_wave 28  04 $1D \
               07 $10

enemy_wave 64  01 $11

enemy_wave 18  03 ENTITY_POWER_UP \
               07 $10

enemy_wave 24  01 $1C \
               07 $15

enemy_wave 34  07 ENTITY_POWER_UP \
               01 ENTITY_POWER_UP

enemy_wave 08  07 $1A

enemy_wave 12  07 $1A

enemy_wave 12  07 $15

enemy_wave 40  01 $1D \
               07 $1A

enemy_wave 36  01 $1D \
               07 $17

enemy_wave 16  07 $15 \
               07 $15

enemy_wave 16  07 $10 \
               07 ENTITY_ENEMY_1

enemy_wave 12  07 $10 \
               07 ENTITY_ENEMY_1

enemy_wave 16  01 $0E \
               07 $1A

enemy_wave 20  04 $1C \
               07 $0B

enemy_wave 16  07 $1B \
               07 $12

enemy_wave 18  07 $10 \
               07 $12

enemy_wave 16  07 $17 \
               07 $12

enemy_wave 12  07 $17 \
               07 $12

enemy_wave 00  07 $0C

enemy_wave 16  07 $1B \
               07 $10

enemy_wave 05  07 $0D

enemy_wave 12  07 $17 \
               07 $17

enemy_wave 12  07 $0B \
               07 ENTITY_ENEMY_1

enemy_wave 24  04 $1C \
               03 ENTITY_POWER_UP

enemy_wave 12  07 $12 \
               07 $1A

enemy_wave 08  07 $1A

enemy_wave 00  07 $0C

enemy_wave 16  07 $12

enemy_wave 00  01 $11

enemy_wave 32  02 $1C \
               07 ENTITY_POWER_UP

enemy_wave 00  00 $00

enemy_wave 58  00 $0D \
               06 $03
