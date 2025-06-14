;5.7
;Utilizando interrupciones por RB0, muestre mediante un display de 7 segmentos 
;el número de veces que sucedió un flanco descendente. 
;Se pide:
;a. El programa en assembler del programa principal y de la rutina de interrupción 
;con resistencia de pull-up interna.
;b. El circuito completo considerando que el display es cátodo común y cada 
;display consume 20 mA. 
;c. El circuito completo considerando ahora que el display es ánodo común.
;d. Si cada display consume 50 mA, ¿Cómo quedarían los circuitos para los casos b 
;y c?
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
; Codigo 
    org     0x00
    goto    INICIO
    org     0x04 
    goto    INTERR
INICIO    
    BANKSEL ANSELH
    CLRF    ANSELH
    BANKSEL TRISB
    bcf OPTION_REG, INTEDG
    bcf OPTION_REG, 7
    MOVLW   B'00000001'
    MOVWF   TRISB
    MOVLW   B'00000001'
    MOVWF   WPUB
    clrf    TRISA
    clrf    TRISC
    clrf    TRISD
    clrf    TRISE
    BANKSEL PORTB
    movlw   b'11000000'
    movwf    PORTD
    movlw   b'10010000'
    movwf   INTCON
    movlw   .0
    movwf   contador
LOOP
    goto LOOP
INTERR
    btfss INTCON, INTF
    retfie 
interr_RB0
    bcf INTCON, INTF
    incf contador
    movf contador, w
    sublw .10
    btfss STATUS, Z
    goto valor
    movlw .0
    movwf contador
valor
    call tabla
    movwf PORTD
    goto fin_interrupcion
tabla 
    movf contador, w
    addwf PCL, f
    retlw b'11000000'
    retlw b'11111001'
    retlw b'10100100'
    retlw b'10110000'
    retlw b'10011001'
    retlw b'10010010'
    retlw b'10000010'
    retlw b'11111000'
    retlw b'10000000'
    retlw b'10011000'
fin_interrupcion 
    retfie
    END 






