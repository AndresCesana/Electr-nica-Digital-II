;3.15
;Escribir un programa que convierta un conjunto de números de 4 bits en su 
;equivalente en código Exceso Tres. Estos números tienen su nibble inferior en 0 y 
;el superior contiene un número binario natural BCD. Son 15 números ubicados a 
;partir del Registro 40H y luego de modificarlos se deben guardar en el mismo 
;lugar y con el mismo formato. No utilizar tabla.

    LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_ON & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF

contador1 EQU 0x21
valor EQU 0x22
valor1 EQU 0x23
    org 0x00
    movlw 0x40
    movwf contador1
    movlw .15
    movwf valor
INICIO ;w = 0 f = 1
    movf contador1, w
    movwf FSR
    movlw .3
    addwf INDF, w 
    movwf valor1
    movf valor1, w
    movwf INDF
    incfsz contador1
    decfsz valor
    goto INICIO
    goto FIN
FIN
    END


