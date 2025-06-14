;3.14
;El código Gray es un código binario en el que dos números consecutivos difieren 
;solamente en un bit. Escribir un programa que convierta un conjunto de números
;de 4 bits en su equivalente en código Gray. Estos números tienen su nibble
;superior en 0 y el inferior contiene un número binario natural. Son 20 números 
;ubicados a partir del Registro 120H. Utilizar tabla.
    LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_ON & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF

contador1 EQU 0x20
contador2 EQU 0x21
valor EQU 0x22
valor1 EQU 0x23
    org 0x00
    movlw 0x24
    movwf contador1
    movlw 0x20
    movwf contador2
    movlw .20
    movwf valor
INICIO ;w = 0 f = 1
    bcf STATUS , IRP
    movf contador1, w
    movwf FSR
    incfsz contador1
    call conversion 
    movwf valor1
    goto cargar 
conversion 
    movf INDF, w 
    addwf PCL , f
    retlw .0
    retlw .1
    retlw .3
    retlw .2
    retlw .6
    retlw .7
    retlw .5
    retlw .4
    retlw .12
    retlw .13
    retlw .16
    retlw .14
    retlw .10
    retlw .11
    retlw .9
    retlw .8
cargar 
    bsf STATUS , IRP
    movf contador2, w
    movwf FSR
    movf valor1, w
    movwf INDF
    incfsz contador2
    decfsz valor
    goto INICIO
    goto fin
fin
    END



