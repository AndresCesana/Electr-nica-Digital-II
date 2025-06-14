;3.13
;Redactar un programa que multiplique por 4 todos los números contenidos en los 
;Registros que van de 50H a 5FH (ambos inclusive). Estos números tienen su 
;nibble superior en 0 y el inferior contiene un número binario natural. El resultado 
;se guarda en el mismo lugar.
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
puntero1 EQU 0x21
contador2 EQU 0x22
valor EQU 0x23
	ORG 0x00
    movlw 0x50 
    movwf puntero1
    movlw .16
    movwf contador1
INICIO ;w = 0 f = 1
    bcf STATUS,IRP
    movf puntero1, w
    movwf FSR 
    movlw .2
    movwf contador2
loop 
    bcf STATUS , C
    rlf  INDF
    decfsz contador2
    goto loop
    movf INDF , W
    movwf valor
    goto Cargar   
Cargar 
    movf valor , w
    movwf INDF
    incfsz puntero1
    goto INICIO
    goto FIN
FIN
    END    




