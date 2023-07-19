start:
    ; Clear the screen
    lda #$0c    ; set the color to light blue
    sta $d020
    lda #$00    ; clear the screen
    sta $0400
    ldy #$18
clear_loop:
    lda #$20
    sta $0400,y
    dey
    bpl clear_loop

    ; Print prompt
    ldx #<prompt
    ldy #>prompt
print_prompt:
    lda (xx),y
    beq read_char
    jsr $ffd2
    inx
    bne print_prompt
    iny
    bne print_prompt

read_char:
    ; Read character from keyboard
    lda #$00
    jsr $ffd2
    cmp #$0d    ; check for Return/Enter
    beq start   ; if Enter is pressed, start over
    cmp #$79    ; check for "y" key
    bne check_n
    ; Print "Hello!" message
    ldx #<hello
    ldy #>hello
    jmp print_message

check_n:
    cmp #$6e    ; check for "n" key
    bne read_char
    ; Print "Bye!" message
    ldx #<bye
    ldy #>bye

print_message:
    ; Print message
    lda (xx),y
    beq start
    jsr $ffd2
    inx
    bne print_message
    iny
    bne print_message

section .data
prompt:
    .text "Did i eat your souvlaki? (y/n): ",0
hello:
    .text "I am terribly sorry",0
bye:
    .text "ok",0
