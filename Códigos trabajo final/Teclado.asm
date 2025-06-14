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
contador_col  EQU 0x20
contador_fil  EQU 0x21
valor EQU 0x22
aux EQU 0x23
aux1 EQU 0x24
salida EQU 0x25
valor_a_cargar EQU 0x26
puntero EQU 0x27
; Codigo 
    org     0x00
    goto    INICIO
    org     0x04 
    goto    INTERR
INICIO    
    BANKSEL ANSELH
    CLRF    ANSELH
    BANKSEL TRISB
    bcf     OPTION_REG, 7
    MOVLW   B'00001110'
    MOVWF   TRISB
    MOVWF   WPUB
    MOVWF   IOCB
    clrf    TRISD
    clrf    TRISC
    clrf    TRISE
    clrf    TRISA
    BANKSEL PORTB
    clrf PORTB
    movlw b'01111111'
    movwf PORTD
    movlw b'10001000'
    movwf INTCON
    movlw .0
    movwf contador_fil
    movwf contador_col
    movwf valor
    movlw b'01111111'
    movwf salida
LOOP
    goto LOOP
INTERR
    btfsc INTCON, RBIF
    goto interr_RB
    goto fin_interrupcion 
interr_RB
    bcf INTCON, RBIF
    movf PORTB, w
    movwf aux
    movlw b'00001110'
    andwf aux, f
    movlw b'00001110'
    subwf aux, w
    btfsc STATUS, Z
    goto fin_interrupcion 
columna
    btfss aux,3
    goto fila
    bsf STATUS, C
    rlf aux
    movlw b'00001111'
    andwf aux, f
    incf contador_col, f 
    movlw .2
    subwf contador_col, w
    btfss STATUS, Z
    goto columna 
fila  
    movf salida, w
    movwf PORTB
    movf PORTB, W
    movwf aux1
    movlw b'00001110'
    andwf aux1, f
    movlw b'00001110'
    subwf aux1, w
    btfss STATUS, Z
    goto obtener_valor
    movlw .3
    addwf contador_fil
    bsf STATUS, C
    rrf salida
    clrf aux1
    goto fila 
obtener_valor 
    movf contador_fil, w
    addwf contador_col, w 
    movwf valor
    incf valor
    movlw .11
    subwf valor, w
    btfsc STATUS, Z
    goto es_cero
    call tabla
    movwf PORTD
    goto restaurar_valores 
es_cero
    movlw .0
    movwf valor
    call tabla
    movwf PORTD
    goto restaurar_valores 
tabla 
    movf valor, w
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
    retlw b'00111111'
    retlw b'00111111'
    retlw b'00111111'
    retlw b'00111111'
restaurar_valores 
    clrf aux
    clrf aux1
    clrf contador_fil
    clrf contador_col
    clrf valor
    clrf salida
    movlw b'01111111'
    movwf salida
    swapf PORTC
    clrf  PORTB 
    bcf INTCON, RBIF
fin_interrupcion 
    retfie
    END 

	