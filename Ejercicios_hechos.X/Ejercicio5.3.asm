;5.3
;Escribir un programa que lea de dos teclas conectadas a RB1 y RB2 y actúe sobre un relé 
;conectado en RB3.
;1. Si están ambas teclas abiertas el relé está abierto.
;2. Si RB2 está abierta y RB1 cerrada se activa el relé por 1 minuto.
;3. Si RB2 está cerrada y RB1 abierta se activa el relé por 2 minutos.
;4. Si están ambas cerradas se activa el relé por 3 minutos. 
;Cualquier cambio en las teclas mientras esté activado el relé no debe modificar la salida.

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
RETARDO_1_S EQU 0x20
contador3 EQU 0x21
contador4 EQU 0x22
; Codigo 
    org 0x00
    goto INICIO
    org 0x04 
    goto INTERR
INICIO
    banksel ANSELH
    clrf ANSELH
    banksel TRISB
    BSF     IOCB,IOCB1
    BSF     IOCB,IOCB2
    movlw b'00000110'
    movwf TRISB
    movlw b'00000111'
    movwf OPTION_REG
    movlw b'10011000'
    movwf INTCON
    banksel PORTB
    bcf PORTB, RB3
LOOP
    goto LOOP
INTERR
    bcf INTCON, RBIF
    movlw .20
    movwf RETARDO_1_S
    btfsc PORTB, RB1
    goto prende_2_4
    movlw .2
    movwf contador3
    btfsc PORTB, RB2
    goto prende_3
    goto LOOP
prende_2_4
    movlw .3
    movwf contador4
    btfss PORTB, RB2
    goto prende_2
    goto prende_4
prende_2
    bsf PORTB, RB3
    call RETARDO 
    goto fin_interrupcion
prende_3
    bsf PORTB, RB3
    call RETARDO
    decfsz contador3
    goto prende_3
    goto fin_interrupcion
prende_4
    bsf PORTB, RB3
    call RETARDO
    decfsz contador4
    goto prende_4
    goto fin_interrupcion
RETARDO
    movlw .61
    movwf TMR0
SEGUNDO 
    btfss INTCON, T0IF
    goto SEGUNDO
    bcf INTCON, T0IF
    decfsz RETARDO_1_S
    goto RETARDO
    movlw .20
    movwf RETARDO_1_S
    return
fin_interrupcion 
    bcf PORTB, RB3
    retfie
    END 