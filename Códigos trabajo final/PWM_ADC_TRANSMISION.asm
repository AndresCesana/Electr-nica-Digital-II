    LIST P = 16F887
    RADIX HEX
#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
retardo_1	EQU 0x20
retardo_2	EQU 0x21
valor_medido		EQU 0X23
    ORG	    0x00
    GOTO    INICIO
    ORG     0x04 
    goto    interrupciones
INICIO
    BANKSEL ANSELH
    clrf    ANSELH
    clrf    ANSEL
    COMF    ANSEL
    BANKSEL PR2
    MOVLW   .250
    MOVWF   PR2
    BCF	    TRISC,2;RC2 
    BANKSEL CCPR1L
    MOVLW   B'00000000' ;80% MSB
    MOVWF   CCPR1L
    MOVLW   B'00001111'
    MOVWF   CCP1CON
    BSF	    T2CON,1 ;16 PRESCALER
    BSF	    T2CON,2; TMR2 ON
    BANKSEL TRISA
    MOVLW   0X01
    MOVWF   TRISA	    ;ENTRADA RA0
    clrf    TRISB
    clrf    TRISD
    clrf    TRISE
    BANKSEL TRISD
    CLRF    TRISD	    ;TODO SALIDA
    clrf    ADCON1
    banksel SPBRG
    MOVLW   .5		; BAUDIOS 10417
    MOVWF   SPBRG
    movlw   b'00100000' ; NO MOVER HASTA PONER 9 BIT 
    movwf   TXSTA
    BSF	    PIE1,RCIE   ; HABILITA INT RX
    CLRF    TRISD	    ; SALIDA
    Banksel PIR1 
    movlw   b'10010000' ; NO MOVER HASTA PONER 9 BIT 
    movwf   RCSTA
    MOVLW   B'01000001'	    ;7-6 FOSC/8 5-2 ELIGO EL CANAL AN0 DEJO EL GO/DONE EN 0 PARA NO ARRANCARLO
    MOVWF   ADCON0
    Banksel PIE1
    movlw   b'00100000'
    movwf   PIE1
    movlw   b'11000000'
    movwf   INTCON
    banksel PORTA
    movlw   .100
    movwf   retardo_1
    movlw   .100
    movwf   retardo_2 
SENSADO
    BANKSEL ADCON0
    BSF	    ADCON0,1
    CALL    RETARDO	    
    BANKSEL ADRESH
    MOVF    ADRESH, w
    movwf   valor_medido
    movwf   CCPR1L
    BANKSEL TXREG
    MOVWF   TXREG
    GOTO    SENSADO
RETARDO
    decfsz retardo_1
    goto RETARDO 
    movlw .100
    movwf retardo_1
    decfsz retardo_2
    goto RETARDO
    movlw .100
    movwf retardo_2
    return
interrupciones
    banksel PIR1
    BTFSS   PIR1,RCIF
    retfie
    BCF	    PIR1,RCIF
    MOVF    RCREG,W	; RCREG -> W
    movwf   PORTD
    btfsc   RCSTA, 0
    bcf     PORTD, 7	
    retfie 
    END




