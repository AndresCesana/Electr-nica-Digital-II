;3.4
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
    Segundo_A
    Primero_A
    Segundo_B     
    Primero_B
    ENDC
	ORG 0x00
INICIO ;w = 0 f = 1 
    movfw Primero_B
    addwf Primero_A, w
    movwf Primero_A
    btfsc STATUS , C
    goto c1
    goto c0
c0    
    movfw Segundo_B
    addwf Segundo_A, w
    movwf Segundo_A
    goto fin 
c1
    movfw Segundo_B
    addwf .1 , w
    addwf Segundo_A, f
    goto fin 
    
fin 
    END  
    
    


