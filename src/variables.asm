.enum $C000 export
_RAM_C000_ dsb $100
_RAM_C100_ db
_RAM_C101_ db
_RAM_C102_ db
_RAM_C103_ db
_RAM_C104_ db
p1Lives db
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
_RAM_C11F_ .dw
highScoreByte1 db
highScoreByte2 db
highScoreByte3 db
.ende

.enum $C123 export
_RAM_C123_ db
p1ScoreByte1 db
p1ScoreByte2 db
p1ScoreByte3 db
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

; xxxxxxxs
; s = Enable vertical scroll
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
enemy1Counter db
.ende

.enum $C310 export
_RAM_C310_ db
frame_parity_RAM_C311_ db
timer_RAM_C312_ db
half_timer_15_RAM_C313_ dw
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
    player1 INSTANCEOF Entity
    player2 INSTANCEOF Entity
.ende

.enum $C600 export
    entities INSTANCEOF Entity ENTITY_ARRAY_SIZE
.ende

.enum $C600 export
_RAM_C600_ db
_RAM_C601_ db
entity type db
_RAM_C603_ db
_RAM_C604_ db
_RAM_C605_ db
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
