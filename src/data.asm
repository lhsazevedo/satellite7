.INCLUDE "data/map.asm"

baseTiles:
.INCBIN "graphics/baseTiles.inc"

.INCLUDE "graphics/characterTiles.asm"

enemyTiles:
.INCBIN "graphics/enemyTiles.inc"

.INCLUDE "graphics/mark3Tiles.asm"

terrainTiles:
.INCBIN "graphics/terrainTiles.inc"

.INCLUDE "data/mapBlocks.asm"

// Header
.ORG $7FF8
.db $4B
.db $2F
.db $2F
.db $54
.db $04
.db $05
.db $00
.db $3C
