; Game
STATE_MARK_3_LOGO_BIT  = 0
STATE_START_SCREEN_BIT = 1
STATE_DEMO_BIT         = 2
STATE_GAMEPLAY_BIT     = 3
STATE_PAUSED_BIT       = 4

STATE_MARK_3_LOGO  = 1 << STATE_MARK_3_LOGO_BIT
STATE_START_SCREEN = 1 << STATE_START_SCREEN_BIT
STATE_DEMO         = 1 << STATE_DEMO_BIT
STATE_GAMEPLAY     = 1 << STATE_GAMEPLAY_BIT
STATE_PAUSED       = 1 << STATE_PAUSED_BIT

GAMEPLAY_INITIALIZED_BIT            = 0
GAMEPLAY_SHOULD_SPAWN_PLAYERS_BIT   = 3

GAMEPLAY_INITIALIZED = 1 << GAMEPLAY_INITIALIZED_BIT
GAMEPLAY_SHOULD_SPAWN_PLAYERS = 1 << GAMEPLAY_SHOULD_SPAWN_PLAYERS_BIT

INITIAL_LIVES = $02

MARK_3_LOGO_TIMER = $A0

; Entities
ENTITY_ARRAY_SIZE = $1B
ENTITY_SIZE = $20

ENTITY_PLAYER_1     = $01
ENTITY_PLAYER_2     = $02
ENTITY_BULLET       = $03
ENTITY_BOMB         = $04
ENTITY_ENEMY_BULLET = $07
ENTITY_DRAGONFLY    = $0A
ENTITY_DROP_STAR    = $0F
ENTITY_JELLYFISH    = $15
ENTITY_STAR         = $16
ENTITY_ENEMY_2      = $17
ENTITY_EXTRA_LIFE   = $22


; Entity config
ENTITY_ENEMY_1_X_POS           = $08
ENTITY_ENEMY_1_X_VELOCITY      = $02
ENTITY_ENEMY_1_Y_POS           = $F8
ENTITY_ENEMY_1_Y_VEL           = $02
ENTITY_ENEMY_1_STATE1_TIMER    = $48
ENTITY_ENEMY_1_ANIMATION_TIMER = $0C

ENTITY_BOMB_DRAG               = $10

; Audio
SOUND_80             = $80
SOUND_TITLE_SONG     = $81
SOUND_82             = $82
SOUND_MAIN_SONG      = $83
SOUND_GAME_OVER_SONG = $84
SOUND_PLAYER_1_FIRE  = $85
SOUND_BOMB_DROP      = $86
SOUND_87             = $87
SOUND_88             = $88
SOUND_STAR           = $89
SOUND_8A             = $8A
SOUND_EXTRA_LIFE     = $8B
SOUND_POWER_UP       = $8C
SOUND_BUMP           = $8D
SOUND_PLAYER_2_FIRE  = $8E
SOUND_8F             = $8F

; Input
JOY_UP_BIT    = 0
JOY_DOWN_BIT  = 1
JOY_LEFT_BIT  = 2
JOY_RIGHT_BIT = 3
JOY_BTN1_BIT  = 4
JOY_BTN2_BIT  = 5

JOY_UP    = 1 << JOY_UP_BIT
JOY_DOWN  = 1 << JOY_DOWN_BIT
JOY_LEFT  = 1 << JOY_LEFT_BIT
JOY_RIGHT = 1 << JOY_RIGHT_BIT
JOY_FIREA = 1 << JOY_BTN1_BIT
JOY_FIREB = 1 << JOY_BTN2_BIT


; VDP Register constants
VDP_R0_DISABLE_VSCROLL_COLS_24_TO_32    = 1 << 7
VDP_R0_DISABLE_HSCROLL_ROWS_0_AND_1     = 1 << 6
VDP_R0_MASK_COL_0                       = 1 << 5
VDP_R0_ENABLE_LINE_INTERRUPT            = 1 << 4
VDP_R0_SHIFT_SPRITES_LEFT               = 1 << 3
VDP_R0_USE_MODE_4                       = 1 << 2
VDP_R0_CHANGE_HEIGHT_IN_MODE_4          = 1 << 1
VDP_R0_NOSYNC_MONO                      = 1

VDP_R1_DISPLAY_VISIBLE          = 1 << 6
VDP_R1_ENABLE_FRAME_INTERRUPT   = 1 << 5
VDP_R1_224_LINE_MODE4           = 1 << 4
VDP_R1_240_LINE_MODE4           = 1 << 3
VDP_R1_SPRITES_8_x_16           = 1 << 1
VDP_R1_DOUBLE_SPRITE_PIXELS     = 1
