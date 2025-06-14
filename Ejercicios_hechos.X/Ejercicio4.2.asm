;4.2
;Escribir un programa que lea de dos pulsadores, conectados a RA4 y RB0, el estado 
;lógico y lo muestre en dos de los LEDs, RB2 y RB3. La configuración es como se muestra 
;en el esquema. 
;Adicionalmente indique los valores de las resistencias colocadas en cada puerto.
    LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_ON & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF

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
    movlw b'11110011'
    movwf TRISB
    
INICIO ;w = 0 f = 1
    btfsc PORTA , 4
    bsf PORTB , 2
    btfss PORTA , 4
    bcf PORTB , 2
    btfsc PORTB , 0
    bsf PORTB , 3
    btfss PORTB , 0
    bcf PORTB , 3
    goto INICIO
fin
    END  






