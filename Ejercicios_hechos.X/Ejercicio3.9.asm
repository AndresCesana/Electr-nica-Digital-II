;3.9
    LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_ON & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
    CBLOCK 0x20
    Restador 
    Numero_ascii
    Numero_bcd
    ENDC
	ORG 0x00
INICIO ;w = 0 f = 1
    movlw 0x30
    movwf Restador
    subwf Numero_ascii , w
    movwf Numero_bcd
    END    
