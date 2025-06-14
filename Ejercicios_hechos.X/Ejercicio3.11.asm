;3.11
    LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_ON & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF

puntero1 EQU 0X20
valor EQU 0x30
puntero2 EQU 0x31
	ORG 0x00
    movlw 0x21 
    movwf puntero1
    movlw 0x31 
    movwf puntero2
INICIO ;w = 0 f = 1
    movf puntero1, w
    movwf FSR 
    incfsz puntero1
    movf INDF , W
    movfw valor
    movf puntero2, w
    movwf FSR 
    incfsz puntero2
    movf valor , w
    andwf .15, w
    call conv
    goto cargar
conv addwf PCL, f
    retlw 0x00
    retlw 0x01
    retlw 0x02
    retlw 0x03
    retlw 0x04
    retlw 0x05
    retlw 0x06
    retlw 0x07
    retlw 0x08
    retlw 0x09
    retlw 0x11
    retlw 0x12
    retlw 0x13
    retlw 0x14
    retlw 0x15
    retlw 0x16
cargar 
    movwf INDF 
    goto INICIO
    END    


