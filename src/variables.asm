.enum $C000 export
_RAM_C000_ dsb $100
vdpRegister0 db
vdpRegister1 db
state db
flags_RAM_C103_ db
_RAM_C104_ db
p1Lives db
p2Lives db
interruptFlag db
two_frame_toggle_RAM_C108_ db
.ende

.enum $C10A export
interruptActionSlot1 db
interruptActionSlot2 db
interruptActionSlot3 db
interruptActionSlot4 db
interruptActionSlot5 db
interruptActionSlot6 db
interruptActionSlot7 db
interruptActionSlot8 db
interruptActionSlot9 db
interruptActionSlot10 db
interruptActionSlot11 db
interruptActionSlot12 db
interruptActionSlot13 db
interruptActionSlot14 db
interruptActionSlot15 db
interruptActionSlot16 db
interruptActionSlot17 db
interruptActionSlot18 db
.ende

.enum $C11E export
stateBackup db
highScoreByte1 db
highScoreByte2 db
highScoreByte3 db
.ende

.enum $C123 export
player1ScoreChanged db
p1ScoreByte1 db
p1ScoreByte2 db
p1ScoreByte3 db
player2ScoreChanged db
p2ScoreByte1 db
p2ScoreByte2 db
p2ScoreByte3 db
drawRectAttributes db
.ende

.enum $C12D export
frameCounter db
_RAM_C12E_ db
input.player1 db
input.player1Changes db
input.player2 db
input.player2Changes db
flags_RAM_C133_ db
mapIndex .dw
mapIndex.low db
mapIndex.high db
starsCounts db
.ende

.enum $C145 export
lastStarTileIndex db
playerThatCollectedTheLastStar db
starBlinkTimer db
screenTimer dw
cheatCounter1 db
cheatCounter2 db
_RAM_C14C_ dw
_RAM_C14E_ db
_RAM_C14F_ db
_RAM_C150_ db

; xxxxxxxs
; s = Enable vertical scroll
unknownFlags_RAM_C151_ db
mark3LogoStateInitialized db
.ende

.enum $C300 export
_RAM_C300_ db
_RAM_C301_ db
_RAM_C302_ db
autofireTimer db
_RAM_C304_ db
_RAM_C305_ db
.ende

.enum $C307 export
_RAM_C307_ db
_RAM_C308_ db
.ende

.enum $C30A export
_RAM_C30A_ db
jellyFishCount db
_RAM_C30C_ db
timer_RAM_C30D_ db
enemy1Counter db
.ende

.enum $C310 export
verticalScroll db
scrollTimer db
metatileOffset db
nextMetatileVramPointer dw
waveTimer db
wave db
.ende

.enum $C318 export
_RAM_C318_ db
_RAM_C319_ db
.ende

.enum $C31F export
curvedBullet_RAM_C31F_ db
_RAM_C320_ db
_RAM_C321_ db
wave_RAM_C322_ db
enemySpawnTimer db
enemySpawnTimerReset db
waveEntityACount db
waveEntityAType db
waveEntityBCount db
waveEntityBType db
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
player1ExtraLifeScore db
player2ExtraLifeScore db
_RAM_C337_ db
statusTextTimer db
bonusTier db
.ende

.enum $C500 export
spriteBuffer dsb $40
_RAM_C540_ db
.ende

.enum $C600 export
    player1 INSTANCEOF Entity
    player2 INSTANCEOF Entity
.ende

.enum $C600 export
    entities INSTANCEOF Entity ENTITY_ARRAY_SIZE
.ende

.enum $C60B export
_RAM_C60B_ dw
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

.enum $C622 export
_RAM_C622_ db
_RAM_C623_ db
_RAM_C624_ db
_RAM_C625_ db
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
soundRequest db
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
demoInput db
.ende

.enum $D300 export
v_map db
.ende

.enum $E801 export
_RAM_E801_ db
.ende
