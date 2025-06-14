;4.3
;Escribir un programa que cuente el número de veces que se pulsó la tecla 
;conectada al terminal RA4 y que saque ese valor en binario natural por el Puerto 
;B. Sólo se utilizarán los bits RB0 a RB3 que son los que tienen conectados diodos 
;LED para su observación. Como consecuencia, el contador es de 4 bits: de 0 a 15.

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
	ORG 0x00
; Configuracion de puertos
    banksel PORTA
    clrf PORTA
    clrf ANSEL
    movlw 0xFF
    movwf TRISA
    banksel PORTB
    clrf PORTB
    clrf ANSELH
    movlw 0xF0
    movwf TRISB
    
INICIO ;w = 0 f = 1
    btfss PORTA , 4
    goto INICIO 
    btfsc PORTA , 4
    goto INICIO
    incfsz contador 
    movf contador , w
    movwf PORTB
    goto INICIO
fin
    END  



