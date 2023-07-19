        ORG   $8000
START:  LDAA  #$00
        STAA  SCI0CR1  ; Enable SCI receiver

WAIT:   BITA  SCI0SR1  ; Wait for data to be received
        BPL   WAIT

        LDAA  SCI0DRL  ; Read the received data
        CMPA  #'y'
        BEQ   SORRY
        CMPA  #'n'
        BEQ   OK
        BRA   WAIT

SORRY:  LDAA  #'I'
        JSR   SEND
        LDAA  #' '
        JSR   SEND
        LDAA  #'a'
        JSR   SEND
        LDAA  #'m'
        JSR   SEND
        LDAA  #' '
        JSR   SEND
        LDAA  #'t'
        JSR   SEND
        LDAA  #'e'
        JSR   SEND
        LDAA  #'r'
        JSR   SEND
        LDAA  #'r'
        JSR   SEND
        LDAA  #'i'
        JSR   SEND
        LDAA  #'b'
        JSR   SEND
        LDAA  #'l'
        JSR   SEND
        LDAA  #'y'
        JSR   SEND
        LDAA  #' '
        JSR   SEND
        LDAA  #'s'
        JSR   SEND
        LDAA  #'o'
        JSR   SEND
        LDAA  #'r'
        JSR   SEND
        LDAA  #'r'
        JSR   SEND
        LDAA  #'y'
        JSR   SEND
        BRA   WAIT

OK:    LDAA  #'O'
        JSR   SEND
        LDAA  #'K'
        JSR   SEND
        BRA   WAIT

SEND:   STAA  SCI0DRL  ; Send the character
        BITA  SCI0SR1  ; Wait for the transmission to complete
        BPL   -
        RTS

        ORG   $FFFE
        DC.W  START  ; Reset vector
