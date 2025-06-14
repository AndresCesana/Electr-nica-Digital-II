;Configuracion de puertos 1er pic
    LIST P = 16F887
    RADIX HEX
#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_ON & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
; Configuracion de puertos
    banksel ANSELH
    clrf ANSELH ; Digitales todos los pines
    clrf ANSEL ; Digitales todos los pines
    banksel TRISA
    clrf TRISA; 00000000 Todas salidas 
    movlw 0x1F ; 00011111
    movwf TRISB ; RB5,6,7 Salidas teclado, RB4,3,2,1 Entradas teclado RB0 Entrada emergencia.
    movlw b'10000000'
    movwf TRISC ; RX = RC7 Entrada serie, RC6 salida serie R3,2,1,0 salida control display 
    banksel PORTB
    clrf PORTA
    clrf PORTB
    clrf PORTC

    


