ORG $0800

; Interrupt service routine for receiving data over SCI
ISR_RX:
    PSHH            ; Save H register
    PSHX            ; Save X register

    LDA SCID        ; Load received character
    CMPA #'y'
    BEQ Sorry
    CMPA #'n'
    BEQ Ok

    ; Print newline character
    LDX #0x0A
    JSR putchar

    ; Restore registers
    PULX
    PULH
    RTI

Sorry:
    ; Print greeting
    LDX #SorryStr
    JSR puts
    BRA Done

Ok:
    ; Print farewell
    LDX #OkStr
    JSR puts

Done:
    ; Restore registers
    PULX
    PULH
    RTI

; Initialize SCI interface
InitSCI:
    LDX #SCI_BAUD
    STAB SCIBDH
    LDAB #0x00
    STAB SCIBDL

    ; Enable transmitter and receiver
    LDA #0x18
    STAA SCICR2

    ; Enable receive interrupt
    LDA #0x40
    STAA SCICR2

    RTS

; Print a string
puts:
    PSHX
    PSHH
    PSHD

    ; Loop through string until null terminator
Loop:
    LDAA 0,X+
    BEQ End
    JSR putchar
    BRA Loop

End:
    PULD
    PULD
    PULX
    RTS

; Print a single character
putchar:
    PSHH
    PSHD
    PSHX

    ; Wait for transmitter buffer to be empty
Wait:
    BITA SCISR1
    BPL Wait

    ; Transmit character
    STAA SCID

    PULX
    PULD
    PULH
    RTS

SorryStr:   FCB 'I am terribly sorry',0
OkStr:     FCB 'Ok',0

SCI_BAUD:   FDB $03E8    ; 9600 baud

ORG $FFFE
    DW ISR_RX       ; Set reset vector to ISR_RX
