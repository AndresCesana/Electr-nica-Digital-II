; Parcial 2
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
valor EQU 0x20
; Codigo 
    org     0x00
INICIO    
    bcf STATUS, C
    movlw 0xc2 
    movwf FSR 
    movlw 0x17
    andwf FSR, 1
    nop 
    bcf STATUS, C
    movlw 0x05 
    sublw 0x34 
    movwf valor
    nop 
    END 


