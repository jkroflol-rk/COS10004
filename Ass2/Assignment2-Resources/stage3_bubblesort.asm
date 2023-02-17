; function stage3_bubblesort
; sorts numarray using the sorting algorithm bubble sort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage3_bubblesort:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)
        push {r3,r4,r5,r6,r7,r8,r9}
        mov r9,r0
        sub r9,r9,#2
        loop$:
                mov r3,#0
                mov r4,#0
                mov r5,#0
                mov r6,#4
                loop2$:
                        ldr r7,[r1,r5]
                        ldr r8,[r1,r6]
                        cmp r7,r8
                        strgt r7,[r1,r6]
                        strgt r8,[r1,r5]
                        movgt r3,#1
                        add r4,#1
                        add r5,#4
                        add r6,#4
                        cmp r4,r9

                        ble loop2$
                sub r9,r9,#1
                cmp r3,#0
                bne loop$
        mov r3,r0
        mov r4,r1
        mov r5,r2
        mov r0,r5
        mov r1,r3
        mov r2,r4
        pop {r3,r4,r5,r6,r7,r8,r9}
        push {lr}
        bl stage2_flash_array
        pop {lr}

        ; your function must mov the address of the sorted array to r0

        bx lr