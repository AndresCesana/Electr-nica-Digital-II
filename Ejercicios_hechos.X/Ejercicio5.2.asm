;5.2
;Escribir un programa que prenda un LED que se va desplazando cada vez que se 
;pulsa la tecla conectada a RB0. Al pulsar por primera vez la tecla se enciende el 
;LED conectado a RB1 y al llegar a RB3 vuelve a RB1 y así indefinidamente. El 
;programa principal no realiza tarea alguna y todo se desarrolla dentro de la 
;subrutina de interrupción.
    LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF

; Definicion de variables 
vector EQU b'00000010'
; Configuracion de puertos 

; Codigo 
    org 0x00
    goto INICIO
    org 0x04 
    goto INTERR
INICIO
    banksel ANSELH
    clrf ANSELH
    banksel TRISB
    movlw b'00000001'
    movwf TRISB
    bsf INTCON, INTE
    bsf INTCON, GIE 
    bsf INTCON, PEIE
    bcf INTCON, INTF
    bsf OPTION_REG, INTEDG
    banksel PORTB
    movlw b'00000010'
    movwf PORTB
LOOP
    goto LOOP
INTERR
    btfsc PORTB, RB1
    goto prende_2
    btfsc PORTB, RB2
    goto prende_3
    goto prende_1
prende_2
    bcf PORTB, RB1
    bsf PORTB, RB2
    goto fin_interrupcion
prende_3
    bcf PORTB, RB2
    bsf PORTB, RB3
    goto fin_interrupcion
prende_1
    bcf PORTB, RB3
    bsf PORTB, RB1
    goto fin_interrupcion 
fin_interrupcion 
    bcf INTCON, INTF
    retfie
    END 

