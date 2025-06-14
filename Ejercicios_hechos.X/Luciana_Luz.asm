#include "p16f887.inc"
    LIST P=16F887
; CONFIG1
__CONFIG _CONFIG1, _FOSC_EXTRC_NOCLKOUT & _WDTE_OFF & _PWRTE_ON & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_ON
; CONFIG2
__CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
    cont equ 0x20
    ORG     0x00
    GOTO    inicio
    ORG     0x04
    GOTO    ISR    
; Configuracion de puertos
inicio 
    movlw .80
    movwf cont
    banksel ANSELH 
    clrf ANSELH ; Set ANSELH to 0 for digital input
    banksel TRISB
    movlw 0x01
    movwf TRISB ; Configure RB0 as input
    movwf WPUB ; Enable weak pull-up on PORTB
    clrf  TRISA
    clrf  TRISC
    clrf  TRISE
    clrf TRISD ; Configure PORTD as output
    banksel PORTB
    clrf PORTB ; Clear PORTB
    clrf PORTD ; Clear PORTD
;Configuro option e intcon
    banksel OPTION_REG
    movlw b'01000111' ; Setup TMR0 and INTEDG
    movwf OPTION_REG
    banksel INTCON
    movlw b'10010000' ; Enable RB0 interrupt and global interrupts
    movwf INTCON
    banksel PORTD
    movlw b'01000000'
    movwf PORTD
;Transmision serie 
    BANKSEL RCSTA
    MOVLW   b'10010000'
    MOVWF   RCSTA ; Enable serial port and continuous receive
    BANKSEL TXSTA
    MOVLW   b'00100100'
    MOVWF   TXSTA ; Enable transmit and set BRGH
    BANKSEL SPBRG
    MOVLW   b'00011001'
    MOVWF   SPBRG ; Set baud rate to 9600 (assuming Fosc = 4MHz)
    BANKSEL PIR1
    BCF     PIR1, RCIF ; Clear the receive interrupt flag
;Prendo display
LOOP 
    goto LOOP ; Infinite loop waiting for an interrupt
ISR
    btfss INTCON, INTF 
    goto interrupcion_INTF
    btfss INTCON, T0IF 
    goto interrupcion_T0IF
    goto fin_interrupcion 
interrupcion_INTF
    bcf INTCON, INTF ; Clear the interrupt flag
    movlw b'01111001' ; Assuming this pattern is for displaying 'E' on PORTD
    movwf PORTD 
    movlw   0x45 ; ASCII value for 'E'  OJO!!!!!!
    BANKSEL TXREG
    MOVWF   TXREG ; Transmit 'E'
retardo 
    movlw   .61
    movwf   TMR0
atras
    btfss INTCON, T0IF ; Wait for TMR0 overflow
    goto atras
    decfsz cont
    goto retardo
    banksel PORTD
    movlw b'01000000'
    movwf PORTD
    movlw .80
    movwf cont
    RETFIE
END


