; function stage1c_diff
; returns the difference between the max and min value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1c_diff:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end

        ;find min value
        push {lr,r4,r5}
        push {r0}

        bl stage1a_min
        mov r4,r0
        pop {r0}
        ;find max value

        bl stage1b_max
        mov r5,r0

        sub r0,r5,r4
        pop{lr,r4,r5}

        bx lr