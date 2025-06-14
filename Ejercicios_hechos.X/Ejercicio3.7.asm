;3.7
    LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_ON & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
    CBLOCK 20h
    OP_A 
    OP_B
    RES_
    ENDC
	ORG 0x00
INICIO ;w = 0 f = 1 
    bcf STATUS , C
    movfw OP_B 
    subwf OP_A , W
    movwf RES_
    btfsc STATUS , Z
    GOTO IGUALES 
    BTFSS STATUS, C
    GOTO BG
    GOTO fin
IGUALES
    movlw 0x00
    movwf RES_
    goto fin 
BG
    movfw OP_A
    addwf OP_B, W
    movwf RES_
    goto fin
fin 
    END
    