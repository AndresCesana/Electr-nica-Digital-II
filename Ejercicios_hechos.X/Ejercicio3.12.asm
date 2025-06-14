;3.12
;Realizar un programa en Lenguaje Ensamblador que transforme 10 Bytes que 
;contienen números BCD empaquetados a ASCII. Los números BCD están 
;almacenados empezando en el Registro A0H y el resultado se almacenará a partir 
;del Registro 1A0H
    LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_ON & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF

puntero1 EQU 0xAA
valor1 EQU 0xAB
valor2 EQU 0xAC
segn EQU 0x20
puntero2 EQU 0xAD
contador EQU 0xAE
valor3 EQU 0xAF
	ORG 0x00
    movlw 0xA0 
    movwf puntero1
    movlw 0xA0 
    movwf puntero2
    movlw .10
    movwf contador
    movlw .2
    movwf valor3
INICIO ;w = 0 f = 1
    bcf STATUS,IRP
    movf puntero1, w
    movwf FSR 
    incfsz puntero1
    movlw .2
    movwf valor3
    goto loop 
loop 
    decfsz valor3 
    goto Primer_numero
    goto Segundo_numero
Primer_numero
    movlw .15
    andwf INDF, w
    movwf valor1
    goto loop
Segundo_numero
    swapf INDF, w
    movwf segn
    movlw .15
    andwf segn, w
    movwf valor2
    goto cargar
cargar 
    bsf STATUS,IRP
    movf puntero2, w
    movwf FSR 
    movf valor2, w
    movwf INDF
    incfsz puntero2
    movf puntero2, w
    movwf FSR 
    movf valor1, w
    movwf INDF
    incfsz puntero2
    decfsz contador
    goto INICIO
    goto FIN
FIN
    END    

