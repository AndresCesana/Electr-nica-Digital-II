    LIST P = 16F887
    RADIX HEX
#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
 
    ORG	    0x00
    GOTO    INICIO
    ORG     0x04 
    goto    interrupciones
INICIO
    BSF	    STATUS,RP0
    MOVLW   .5		; BAUDIOS 10417
    MOVWF   SPBRG
    movlw   b'01100000' ; NO MOVER HASTA PONER 9 BIT 
    movwf   TXSTA
    BSF	    PIE1,RCIE   ; HABILITA INT RX
    CLRF    TRISD	    ; SALIDA
    Banksel PIR1 
    movlw   b'11010000' ; NO MOVER HASTA PONER 9 BIT 
    movwf   RCSTA
    BCF	    PIR1,RCIF   ; LIMPIAMOS FLAG RX
    Banksel PIE1
    movlw   b'00100000'
    movwf   PIE1
    movlw   b'11000000'
    movwf   INTCON
    banksel PORTA
    movlw   .255
    movwf   TXREG
LOOP 
    goto    LOOP
interrupciones
    banksel PIR1
    BTFSS   PIR1,RCIF
    retfie
    MOVF    RCREG,W	; RCREG -> W
    movwf   PORTD
    btfsc   RCSTA, 0
    bcf     PORTD, 7
    MOVF    RCREG,W
    MOVWF   TXREG
    BCF	    PIR1,RCIF	; APAGO INT RX
    retfie 
    END


