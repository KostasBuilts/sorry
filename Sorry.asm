section .data
    prompt db 'Did I eat your souvlaki? (y/n): '
    prompt_len equ $ - prompt
    hello db 'I am terribly sorry'
    hello_len equ $ - hello
    bye db 'ok'
    bye_len equ $ - bye

section .text
    global _start

_start:
    ; Print prompt
    mov eax, 4          ; system call for write
    mov ebx, 1          ; file descriptor for stdout
    mov ecx, prompt     ; message to print
    mov edx, prompt_len ; message length
    int 0x80            ; call kernel

    ; Read character from keyboard
    mov eax, 3          ; system call for read
    mov ebx, 0          ; file descriptor for stdin
    mov ecx, input      ; buffer for input
    mov edx, 1          ; number of bytes to read
    int 0x80            ; call kernel

    cmp byte [input], 'y'
    je say_hello
    cmp byte [input], 'n'
    je say_bye
    jmp _start

say_hello:
    ; Print "Hello!" message
    mov eax, 4          ; system call for write
    mov ebx, 1          ; file descriptor for stdout
    mov ecx, hello      ; message to print
    mov edx, hello_len  ; message length
    int 0x80            ; call kernel
    jmp exit

say_bye:
    ; Print "Bye!" message
    mov eax, 4          ; system call for write
    mov ebx, 1          ; file descriptor for stdout
    mov ecx, bye        ; message to print
    mov edx, bye_len    ; message length
    int 0x80            ; call kernel
    jmp exit

exit:
    ; Exit program
    mov eax, 1          ; system call for exit
    xor ebx, ebx        ; return value of 0
    int 0x80            ; call kernel

section .bss
    input resb 1        ; buffer for input
