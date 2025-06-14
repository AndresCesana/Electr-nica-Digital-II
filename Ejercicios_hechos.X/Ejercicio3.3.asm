;3.3
    LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_ON & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
    CBLOCK 21h
    OP_A 
    OP_B
    OP_C
    RES_L0     
    RES_H0
    RES_L1     
    RES_H1 
    ENDC
	ORG 0x00
INICIO ;w = 0 f = 1 
    movf OP_A, w
    addwf OP_B, w
    movwf RES_L0
    clrf RES_H0
    rlf RES_H0, f
    movf RES_H0, f
    movf RES_L0, w
    subwf RES_L1, w
    movwf RES_L1
    clrf RES_H1
    rlf RES_H1, f
    movf RES_H1, f
    
    END     
    
    
    
    
    
    
    
    
    





