;Ejercicio Parcial 2
; 100 ms interrumpe y led 50ms 
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
contador_100ms	EQU 0x20

; Codigo 
    org     0x00
    goto    INICIO
    org     0x04 
    goto    INTERR
INICIO    
    BANKSEL ANSELH
    CLRF    ANSELH
    CLRF    ANSEL
    BANKSEL TRISB
    movlw   b'00000111'
    movwf   OPTION_REG
    MOVLW   B'00000000'
    MOVWF   TRISB
    BANKSEL PORTB
    movlw b'00000000'
    movwf PORTB
    movlw .2
    movwf contador_100ms
    movlw b'10100000'
    movwf INTCON
    movlw .61
    movwf TMR0
LOOP
    goto LOOP
INTERR
    btfsc INTCON, T0IF
    goto interrumpe_TMR0
    retfie
interrumpe_TMR0
    bcf INTCON, T0IF
    movlw .61
    movwf TMR0
    decfsz contador_100ms
    goto valor_alto
    bsf PORTB, 0
    movlw .2
    movwf contador_100ms 
    goto fin_interrupcion
valor_alto 
    bcf PORTB, 0
fin_interrupcion
    retfie
    END 


