;Ejercicio 5.4
;Escribir un código en assembler que realice una interrupción por RB cuando se 
;realice un cambio de nivel en cualquiera de los puertos RB4 a RB7. En el servicio 
;a la interrupción (ISR) generar un retardo de 100 mseg. Recuerde que estas 
;interrupciones por nivel y debe implementar un sistema antirebote. Suponer un 
;reloj de 4 Mhz.
;Se va a ver esto en proteus a traves de una LED
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
contador  EQU 0x20
vector    EQU 0x21
contador1 EQU 0x22
; Codigo 
    org     0x00
    goto    INICIO
    org     0x04 
    goto    INTERR
INICIO    
    BANKSEL ANSELH
    CLRF    ANSELH
    MOVLW   B'01010111'
    MOVWF   OPTION_REG
    BCF     STATUS,RP1
    MOVLW   B'11110000'
    MOVWF   TRISB
    MOVLW   B'11110000'
    MOVWF   WPUB
    MOVLW   B'11110000'
    MOVWF   IOCB
    BCF     STATUS,RP0
    CLRF    PORTB
    BSF     INTCON,RBIE
    BCF     INTCON,RBIF
    BCF     INTCON,T0IF
    BSF     INTCON,GIE	 
    GOTO     $	 
LOOP
    goto LOOP
INTERR
    call    RETARDO 
    bcf     INTCON, RBIF
    movf    vector, w
    andwf   PORTB
    btfsc   STATUS, Z
    goto    fin_interrupcion
    incf    contador1
    btfsc   vector, 7
    retfie 
    rlf     vector 
    goto    INTERR
RETARDO
    movlw   .5
    movwf   contador
RETARDO1
    movlw   .99
    movwf   TMR0
CIEN_MILISEGUNDOS 
    btfss   INTCON, T0IF
    goto    CIEN_MILISEGUNDOS
    bcf     INTCON, T0IF
    decfsz  contador
    goto    RETARDO1
    movlw   .5
    movwf   contador
    return
fin_interrupcion 
    bsf     PORTB, RB3
    retfie
    END 