;Prender y apagar un led cada 1S
    LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF

; Definicion de variables 
contador EQU 0x20
activador EQU 0x21
; Codigo 
    org 0x00
    goto INICIO
    org 0x04
    goto INTERRUPCION
INICIO
    banksel ANSELH
    clrf    ANSELH
    clrf    ANSEL
    banksel TRISB
    clrf    TRISA
    clrf    TRISB
    clrf    TRISC
    clrf    TRISD
    clrf    TRISE
    movlw   b'00000110'
    movwf   OPTION_REG
    banksel PORTB
    movlw   b'00000000'
    movwf   PORTB
    movlw   b'10100000'
    movwf   INTCON
    movlw   .100
    movwf   TMR0
    movlw   .50
    movwf   contador
    movlw   .1
    movwf   activador
LOOP 
    goto    LOOP
INTERRUPCION
    btfss   INTCON, T0IF
    retfie 
PRENDE_LED
    bcf     INTCON, T0IF
    decfsz  contador
    goto    fin_interrupcion
    movlw   .50
    movwf   contador
    btfsc   activador, 0
    goto    prenderlo
    goto    apagarlo 
prenderlo 
    clrf    activador 
    bsf     PORTB, RB0
    goto    fin_interrupcion 
apagarlo 
    movlw   .1
    movwf   activador
    bcf     PORTB, RB0
fin_interrupcion 
    movlw   .100
    movwf   TMR0
    retfie
    END 