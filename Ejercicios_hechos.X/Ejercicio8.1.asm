;8.1
;Realizar un programa en Lenguaje Ensamblador que cuente de 0 a 9 
;indefinidamente. Cada número permanecerá encendido 1 seg (retardo por 
;software). El conteo iniciará en 0 al apretarse el pulsador y se detendrá al volver 
;a pulsarlo en el valor que esté la cuenta. Se muestra el esquema del hardware 
;sobre el que correrá el programa. El oscilador es de 4MHz.
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
contador_1S  EQU 0x20
par_impar EQU 0x21
valor EQU 0x22
puntero EQU 0x23
; Codigo 
    org     0x00
    goto    INICIO
    org     0x04 
    goto    INTERRUPCION 
INICIO    
    BANKSEL ANSELH
    CLRF    ANSELH
    CLRF    ANSEL
    BANKSEL TRISB
    MOVLW   B'00000001'
    MOVWF   TRISB
    MOVWF   WPUB
    MOVLW   B'00000000'
    MOVWF   TRISC
    MOVLW   B'00000110'
    MOVWF   OPTION_REG
    BANKSEL PORTB
    movlw b'00000000'
    movwf PORTB
    movlw b'00000000'
    movwf PORTC
    movlw b'10010000'
    movwf INTCON
    movlw .50
    movwf contador_1S
    movlw .10
    movwf puntero
    movlw .0
    movwf valor
    movwf par_impar
LOOP
    goto LOOP 
INTERRUPCION 
    bcf INTCON, 1
    bcf INTCON, 2
    bsf INTCON, GIE
    incf par_impar
    btfss par_impar, 0
    goto impar
    goto par
par
    movlw .99
    movwf TMR0
    bcf INTCON, 2   
un_segundo
    btfss INTCON, T0IF
    goto un_segundo
    decfsz contador_1S
    goto par
    movlw .50
    movwf contador_1S
    call valores
    goto par
impar
    goto impar
valores
    call carga
    movwf PORTC
    incf valor
    decfsz puntero
    return
    movlw .10
    movwf puntero
    movlw .0
    movwf valor
    return
carga
    movf valor, w
    addwf PCL, f
    retlw b'00111111'
    retlw b'00000110'
    retlw b'01011011'
    retlw b'01001111'
    retlw b'01100110'
    retlw b'01101101'
    retlw b'01111101'
    retlw b'00000111'
    retlw b'01111111'
    retlw b'01100111'
fin_interrupcion  
    retfie
    END


