
;4.4
;Escribir un programa que, dependiendo del estado de dos interruptores 
;conectados a RA4 y RB0, presente en el puerto D diferentes funciones lógicas 
;cuya tabla de verdad es:
   
    LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_ON & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
numero_rotado EQU 0x20 
valor EQU 0x21
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
    movlw 0xFF
    movwf TRISB
    banksel PORTB
    clrf PORTB
    clrf ANSELH
    movlw 0xF0
    movwf TRISB
    banksel PORTD
    clrf PORTD
    clrf TRISD
    
INICIO ;w = 0 f = 1
    swapf PORTA , w
    movwf numero_rotado
    bcf STATUS , C
    rlf numero_rotado , w
    addwf PORTB , w
    movwf valor
    call tabla
    movwf PORTD
    goto fin 
tabla
    movf valor, w
    addwf PCL , f
    retlw b'10101010'
    retlw b'01010101'
    retlw b'00001111'
    retlw b'11110000'
fin
    END  



