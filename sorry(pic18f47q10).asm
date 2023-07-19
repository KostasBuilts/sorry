#pragma config FEXTOSC = OFF    ; External oscillator mode selection bits (Oscillator not enabled)
#pragma config RSTOSC = HFINTOSC_64MHZ ; Power-up default value for COSC bits (HFINTOSC with 2x PLL (32 MHz))

    ; Define I/O registers
    RC1REG equ 0x19E           ; USART Receive Register
    TX1REG equ 0x19F           ; USART Transmit Register
    TX1STA equ 0x19C           ; USART Transmit Status and Control Register
    RC1STA equ 0x19D           ; USART Receive Status and Control Register
    TRISB equ 0x086            ; Port B Direction Register

    ; Set CPU clock frequency to 64 MHz
    org 0x2007
    dw 0xFFFF
    dw 0xFFFF
    dw 0xFFFF
    dw 0xFFFF
    dw 0xFFFF
    dw 0xFFFF
    dw 0xFFFF
    dw 0xFFFF
    dw 0xFFEF                ; OSCCON1 register
    dw 0xFFFF
    dw 0xFFFF
    dw 0xFFFF

    ; Configure the UART
    banksel TRISB
    bcf TRISB,5              ; RB5 (RX) pin is input
    bsf TRISB,7              ; RB7 (TX) pin is output
    movlw 207                ; Set the baud rate to 9600 baud at 64 MHz
    movwf SP1BRGL
    clrf SP1BRGH
    bsf TX1STA,TXEN          ; Enable transmission
    bsf RC1STA,CREN          ; Enable reception

loop:
    ; Wait for a character to be received
    btfss PIR3,RC1IF
    bra loop

    ; Read the received character
    movf RC1REG,w
    movwf FSR,0

    ; Print "I am terribly sorry" message if character is 'y' or 'Y'
    movlw 'y'
    xorwf FSR,0,w
    bnz print_bye
    movlw 'I'
    call print_char
    movlw ' '
    call print_char
    movlw 'a'
    call print_char
    movlw 'm'
    call print_char
    movlw ' '
    call print_char
    movlw 't'
    call print_char
    movlw 'e'
    call print_char
    movlw 'r'
    call print_char
    movlw 'r'
    call print_char
    movlw 'i'
    call print_char
    movlw 'b'
    call print_char
    movlw 'l'
    call print_char
    movlw 'y'
    call print_char
    movlw ' '
    call print_char
    movlw 's'
    call print_char
    movlw 'o'
    call print_char
    movlw 'r'
    call print_char
    movlw 'r'
    call print_char
    movlw 'y'
    call print_char
    bra loop

    ; Print "Bye!" message if character is 'n' or 'N'
print_bye:
    movlw 'n'
    xorwf FSR,0,w
    bnz loop
    movlw 'O'
    call print_char
    movlw 'K'
    call print_char
    bra loop

    ; Subroutine to print a character to the UART
print_char:
    movwf TX1REG
    bsf PIR3,TX1IF
    btfss TX1STA,TRMT
    bra $-1
    return
