;8.2
;Genere la señal que se muestra utilizando interrupciones y TMR0. Considere que 
;el clock del microprocesador es de 8 MHz.
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
contador_50mS EQU 0x21
contador_50mSv EQU 0x22
contador_1Sv EQU 0x23
; Codigo 
    org     0x00
    goto    INICIO
INICIO    
    BANKSEL ANSELH
    CLRF    ANSELH
    CLRF    ANSEL
    BANKSEL TRISB
    MOVLW   B'00000000'
    MOVWF   TRISB
    MOVLW   B'00000101'
    MOVWF   OPTION_REG
    BANKSEL PORTB
    movlw b'00000000'
    movwf PORTB
    movlw b'10000000'
    movwf INTCON
    movlw .20
    movwf contador_1S
    movlw .1
    movwf contador_1Sv
    movwf contador_50mSv
    movlw .5
    movwf contador_50mS
CONTADOR
    bcf INTCON, T0IF
    movlw .99
    movwf TMR0
cincuenta_ms
    btfss INTCON, T0IF
    goto cincuenta_ms
    decfsz contador_50mS
    goto CONTADOR
    movlw .20
    movwf contador_50mS
    btfss contador_1Sv, 0
    goto inactivo_1
    btfsc contador_50mSv, 0
    goto activo
    goto nulo
inactivo_1 
    bcf PORTB, 0
    decfsz contador_1S
    goto CONTADOR
    movlw .20
    movwf contador_1S
    movlw .1
    movwf contador_1Sv
    goto CONTADOR
activo
    rlf contador_50mSv
    bsf PORTB, 0
    goto cuenta_de_1S 
nulo
    bcf INTCON, T0IE
    bcf PORTB, 0
    movlw .1
    movwf contador_50mSv
    goto cuenta_de_1S 
cuenta_de_1S 
    decfsz contador_1S
    goto CONTADOR
    rlf contador_1Sv
    movlw .20
    movwf contador_1S
    goto CONTADOR
    END


