macro delay {

local .wait
mov r2,#0x3F0000

.wait:
sub r2,#1
cmp r2,#0
bne .wait
}

BASE = $3F000000
GPIO_OFFSET=$200000

mov r0,BASE
orr r0,GPIO_OFFSET

mov r1,#1
lsl r1,#24
str r1,[r0,#4]

mov r1,#1
lsl r1,#27
str r1,[r0,#0]

loop$:
mov r1,#1
lsl r1,#18

mov r3,#1
lsl r3,#9

orr r1,r3

str r1,[r0,#28]
delay

str r1,[r0,#40]
delay

b loop$



