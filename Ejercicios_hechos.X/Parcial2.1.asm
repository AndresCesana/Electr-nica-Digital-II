;Parcial 2
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
contador_primero EQU 0x20
contador_segundo EQU 0x21
contador_0.1S EQU 0x22
variable1 EQU 0x23
variable2 EQU 0x24
vector EQU 0x25

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
    MOVLW   B'00000101'
    MOVWF   OPTION_REG
    MOVLW   B'00000000'
    MOVWF   TRISA
    MOVWF   TRISC
    BANKSEL PORTB
    movlw b'00000000'
    movwf PORTB
    movwf PORTC
    movwf PORTA
    movlw b'10110000'
    movwf INTCON
    movlw .10
    movwf contador_0.1S
    movlw .0
    movwf contador_primero 
    movwf contador_segundo 
    movlw .99
    movwf TMR0
LOOP 
    goto LOOP 
INTERRUPCION 
    btfsc INTCON, INTF
    goto interrumpio_RB0
    btfsc INTCON, T0IF
    goto interrumpio_TMR0
    retfie 
interrumpio_RB0
    bcf INTCON, INTF
    movf contador_primero, w
    movwf variable1
    movf contador_segundo, w
    movwf variable2 
    clrf contador_primero
    clrf contador_segundo
    goto fin_interrupcion_RB0
interrumpio_TMR0
    bcf INTCON, T0IF
    call cargar
    movwf PORTA
    decfsz contador_0.1S 
    goto fin_interrupcion_TMR0
    movlw .10
    movwf contador_0.1S 
    incf contador_primero 
    movlw .10
    subwf contador_primero, w 
    btfss STATUS, Z
    goto fin_interrupcion_TMR0
    movwf contador_primero
    incf contador_segundo 
    movlw .4
    subwf contador_segundo, w 
    btfss STATUS, Z
    goto fin_interrupcion_TMR0
    movwf contador_segundo
    goto fin_interrupcion_TMR0
cargar     
    btfss vector,0
    goto carga2
carga1 
    movlw .1
    movwf PORTC
    movlw .2
    movwf vector
    movlw 0x23
    movwf FSR 
    goto valor
carga2 
    movlw .2
    movwf PORTC
    movlw .1
    movwf vector
    movlw 0x24
    movwf FSR
valor
    movf INDF, w
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
fin_interrupcion_RB0
    retfie
fin_interrupcion_TMR0
    movlw .99
    movwf TMR0
    retfie
    END

