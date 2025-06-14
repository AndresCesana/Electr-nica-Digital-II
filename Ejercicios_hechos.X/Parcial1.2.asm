;Parcial1 ver cuantos numeros mayor a 100 y menor a 1oo hay.
    LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_ON & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
contador EQU 0x20
mayor_100 EQU 0xA0
menor_100 EQU 0xA1
resta EQU 0x21
	ORG 0x00
    
INICIO ;w = 0 f = 1	
    movlw 0x30
    movwf FSR
    movlw .20
    movwf contador
    bsf STATUS, RP0
    clrf mayor_100
    clrf menor_100
bucle 
    bcf STATUS, RP0
    movlw .100
    subwf INDF , w
    movwf resta
    btfsc STATUS, C
    goto mayor
    goto menor
mayor 
    bsf STATUS, RP0
    incf mayor_100
    bcf STATUS, RP0
    incf FSR
    decfsz contador
    goto bucle
    goto FIN
menor 
    bsf STATUS, RP0
    incf menor_100
    bcf STATUS, RP0
    incf FSR
    decfsz contador
    goto bucle
    goto FIN
FIN
    END  


