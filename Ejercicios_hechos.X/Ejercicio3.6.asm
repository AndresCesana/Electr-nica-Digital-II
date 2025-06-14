;3.6
    LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_ON & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
    
DELAY_1 EQU 0x20
cont_1 EQU .250
DELAY_2 EQU 0x21
cont_2 EQU .200
DELAY_3 EQU 0x22
cont_3 EQU .6
    ORG 0X00
INICIO
    MOVLW cont_1 ; 1u
    MOVWF DELAY_1 ; 1u solo una vez 
FOR1
    MOVLW cont_2 ; 1u 
    MOVWF DELAY_2 ; 1u se repite por cada n que pasa
FOR2
    MOVLW cont_3 ; 1u  
    MOVWF DELAY_3 ; 1u se repite por cada m que pasa y m depende de n veces que pasa 
FOR3
    DECFSZ DELAY_3, F ; 1u si 1(p-1) ,2u si 0 todo esto se repite n y m veces
    GOTO FOR3 ; 2u se repite (p-1) veces 
    DECFSZ DELAY_2, F ; 1u si 1(m-1) ,2u si 0 todo esto se repite m veces 
    GOTO FOR2 ; 2u se repite (m-1) veces 
    DECFSZ DELAY_1, F ; 1u si 1(n-1) veces ,2u si 0 se repite  
    GOTO FOR1 ; 2u  se repite (n-1) veces 
    GOTO INICIO ; 2u se repite una vez  
    END


