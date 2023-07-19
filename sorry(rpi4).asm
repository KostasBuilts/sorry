@ Start of program
        .global _start
        .section .text
_start:
        @ Print prompt
        adr r0, prompt
        bl puts

        @ Read character
        mov r0, #0       @ Use stdin for input
        bl getchar

        @ Check input
        cmp r0, #'y'
        beq sorry
        cmp r0, #'Y'
        beq sorry
        cmp r0, #'n'
        beq ok
        cmp r0, #'N'
        beq ok
        b invalid

sorry:
        @ Print "I am terribly sorry"
        adr r0, sorry_msg
        bl puts
        b exit

ok:
        @ Print "OK"
        adr r0, ok_msg
        bl puts
        b exit

invalid:
        @ Print "Invalid input."
        adr r0, invalid_msg
        bl puts

exit:
        @ Exit program
        mov r7, #1       @ Use exit syscall
        mov r0, #0       @ Return code 0
        svc #0           @ Call syscall

        .section .data
prompt:
        .ascii "Did I eat your souvlaki? (y or n): "
        .byte 0
sorry_msg:
        .ascii "I am terribly sorry"
        .byte 0
ok_msg:
        .ascii "OK"
        .byte 0
invalid_msg:
        .ascii "Invalid input."
        .byte 0
