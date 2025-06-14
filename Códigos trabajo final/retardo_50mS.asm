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
retardo_1  EQU 0x20
retardo_2  EQU 0x21
; Codigo 
    org     0x00
    movlw .110
    movwf retardo_1
    movlw .150
    movwf retardo_2 
INICIO
    decfsz retardo_1
    goto INICIO 
    movlw .110
    movwf retardo_1
    decfsz retardo_2
    goto INICIO
    movlw .150
    movwf retardo_2
    goto INICIO
    END 
    


