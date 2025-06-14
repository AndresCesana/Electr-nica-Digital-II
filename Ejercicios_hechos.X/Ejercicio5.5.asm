;5.5
;Se desea que al apretar el pulsador conectado a RA4 parpadeen, a una frecuencia 
;de 0.5Hz, los 8 LEDs conectados en cátodo común a los 8 terminales del puerto D 
;de un microcontrolador PIC 16F887. Dicho parpadeo se debe interrumpir 
;durante unos instantes (3 segundos) si se aprieta el pulsador conectado al 
;terminal RB0. Inicialmente, los LEDs están apagados. El oscilador es de 4MHz. 
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
contador_1s  EQU 0x20
contador_3s EQU 0x21
; Codigo 
    org     0x00
    goto    INICIO
    org     0x04 
    goto    INTERR
INICIO    
    BANKSEL ANSELH
    CLRF    ANSELH
    MOVLW   B'01000110'
    MOVWF   OPTION_REG
    BANKSEL TRISB
    MOVLW   B'00010001'
    MOVWF   TRISB
    MOVLW   B'00010001'
    MOVWF   WPUB
    MOVLW   B'00010000'
    MOVWF   IOCB
    MOVLW   B'00000000'
    MOVWF   TRISD
    BANKSEL PORTB
    CLRF    PORTB
    CLRF    PORTD
    movlw b'10011000'
    movwf INTCON
    movlw .10
    movwf contador_1s
    movlw .30
    movwf contador_3s
LOOP
    goto LOOP
INTERR
    btfsc INTCON, INTF
    goto interr_RB0
    btfss INTCON, RBIF
    goto fin_interrupcion
    goto    interr_RB4 
interr_RB0
    bcf INTCON, INTF
    bcf INTCON, RBIE
    clrf PORTD
    call RETARDO_3s
    goto fin_interr_RB0
interr_RB4
    bcf INTCON, RBIF
    bcf INTCON, RBIE
    bsf INTCON, GIE
    movlw b'11111111'
    movwf PORTD
    call retardo_1s
    clrf PORTD
    call retardo_1s
    goto interr_RB4
RETARDO_3s
    movlw   .100
    movwf   TMR0
tres_segundos 
    btfss   INTCON, T0IF
    goto    tres_segundos
    bcf     INTCON, T0IF
    decfsz  contador_3s
    goto    RETARDO_3s
    movlw   .30
    movwf   contador_3s
    return
retardo_1s
    movlw   .100
    movwf   TMR0
un_segundo
    btfss   INTCON, T0IF
    goto    un_segundo
    bcf     INTCON, T0IF
    decfsz  contador_1s
    goto    retardo_1s
    movlw   .10
    movwf   contador_1s
    return
fin_interr_RB0
    bsf INTCON, GIE
    bsf INTCON, RBIE
    bsf INTCON, RBIF
fin_interrupcion 
    retfie
    END 