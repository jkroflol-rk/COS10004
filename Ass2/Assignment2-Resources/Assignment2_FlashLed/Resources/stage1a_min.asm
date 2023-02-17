; function stage1a_min
; returns the minimum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1a_min:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)
        push {r3}
        cmp r0,r1
        movle r3,r0
        movgt r3,r1
        cmp r2,r3
        movle r3,r2

        ; this is a place holder - replace "1" with the register holding the return value
        mov r0,r3
        pop {r3}

        bx lr