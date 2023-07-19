.model small
.stack 100h

.data
prompt db 'Did i eat your souvlaki? (y/n): $'
hello db 'I am terribly sorry$'
bye db 'ok$'

.code
main:
  mov ax, @data
  mov ds, ax

  ; Print prompt
  mov ah, 09h
  lea dx, prompt
  int 21h

  ; Read character from keyboard
  mov ah, 01h
  int 21h
  cmp al, 'y'
  je say_hello
  cmp al, 'n'
  je say_bye
  jmp main

say_hello:
  ; Print "Hello!" message
  mov ah, 09h
  lea dx, hello
  int 21h
  jmp exit

say_bye:
  ; Print "Bye!" message
  mov ah, 09h
  lea dx, bye
  int 21h
  jmp exit

exit:
  ; Exit program
  mov ah, 4ch
  int 21h
end main
