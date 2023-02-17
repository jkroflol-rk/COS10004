;  Kernel.asm
; Other than the BASE address, this file should not be modified.  The code here initialises input registers and
; arrays and then calls each function for each stage of the assignment.
; Your task is to provide the code for the functions in each associated file.
; See the bottom of this file for the included source files

; initialise base address for your PI (choose only one of these and comment
; out the other (Pi 4 by default)

;BASE=$FE000000 ; RPI 4 Peripherals address ;
BASE=$3F000000; for RP2 and RP3 Peripherals address

mov sp,$1000  ;make room on the stack


 ;  Initalisation
 ; calls init function with register and array initialisations.  This will:
 ; - assign BASE address for peripherals to r10
 ; - assign registers r5, r6, and r7 with values for Stage 1 and 2
 ; - defines the array "numarray" for Stage 3, 4 and 5
 ; - assign the length of numarray to r8

bl INIT  ;  calls init function with register and array initialisations

; Start-up flash sequence - 7 short flashes
mov r0,BASE
mov r1,7;
mov r2,$20000  ; pause time between flashes r10
bl FLASH
mov r1,$200000 ; pause time
bl PAUSE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Stage 2 function call  (flash the contents of numarray1)
mov r0,BASE ; pass peripheral base address
mov r1,r8  ; size of arrays
adr r2,numarray1
bl stage2_flash_array

mov r1, $200000
mov r0, BASE
bl PAUSE   ; Pause for 2 seconds



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Stage 3 function call (bubble sort numarray1 and flash contents

; Stage 3 start - 3 short flashes
mov r0,BASE
mov r1,3;
mov r2,$20000  ; pause time between flashes r10
bl FLASH
mov r1,$200000 ; pause time
bl PAUSE

mov r0,r8   ; size of array
adr r1,numarray1 ; address of input array
mov r2, BASE  ; pass BASE address of peripherals
bl stage3_bubblesort


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Stage 4 function call (quicksort numarray2 and flash contents

; Completion flash sequence - 7 short flashes
mov r0,BASE
mov r1,7;
mov r2,$20000  ; pause time between flashes r10
bl FLASH
mov r1,$200000 ; pause time
bl PAUSE

finalloop$:
b finalloop$

include "INIT.asm"
include "FLASH.asm"
include "PAUSE.asm"
include "stage2_flash_array.asm"
include "stage3_bubblesort.asm"


