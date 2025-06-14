;Parcial1 ver cuantos 1 logicos hay y guardar en 80h.
    LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_ON & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
numero EQU 0x20
valor1 EQU 0x21
valor2 EQU 0x22
decenas EQU 0x23
unidades EQU 0x24
gena EQU 0x25
	ORG 0x00
INICIO ;w = 0 f = 1
    movlw .10
    movwf decenas 
    movlw .1
    movwf unidades
    bcf STATUS, C
diez
    movf decenas,w
    subwf numero 
    btfsc STATUS, C
    goto conta1
    addwf decenas, w
    movwf numero 
    bcf STATUS, C
    goto uno 
conta1
    incf valor1
    goto diez 
uno 
    movf unidades,w
    subwf numero 
    btfsc STATUS, C
    goto conta2
    goto empaquetar
conta2
    incf valor2
    goto uno 
empaquetar
    swapf valor1 
    movf valor2, w
    addwf valor1, w
    movwf gena
    goto INICIO
    END  


