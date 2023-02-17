; function stage2_flash_array
; flashes the contents of array given
; Arguments:
; r0 - BASE address of peripherals
; r1 - size of array
; r2 - array to flash
; Function returns nothing

stage2_flash_array:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)
        push {r1,r2,r3,r4,r5,r6,r7}
        sub r3,r1,#1
        mov r6,#4
        mov r4,#0
        loop_function_stage2:
                mul r7,r4,r6
                ldr r5,[r2,r7]
                push {r1,r2}
                mov r1,r5
                mov r2,$80000
                push {lr}
                bl FLASH
                pop {lr}
                pop {r1,r2}
                push {r1}
                mov r1,$200000
                push {lr}
                bl PAUSE
                pop {lr}
                pop {r1}
                add r4, #1
                cmp r4, r3
        ble loop_function_stage2

        pop {r1,r2,r3,r4,r5,r6,r7}
        ; your function should make use of the existing functions PLASH and PAUSE

        bx lr