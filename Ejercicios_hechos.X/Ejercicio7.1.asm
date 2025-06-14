;7.1
;Realizar un programa que obtenga el valor de la tecla y la guarde en código BCD 
;empaquetado. Debe colocarla en un buffer circular de 32 nibbles en 20H. La 
;resolución de cuál es la tecla apretada y su almacenamiento se resuelve 
;integralmente dentro de la interrupción.
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
    bcf OPTION_REG, 7
    bsf OPTION_REG, 6
    MOVLW   B'00001111'
    MOVWF   TRISB
    MOVLW   B'00001111'
    MOVWF   WPUB
    MOVLW   B'00001111'
    MOVWF   IOCB
    MOVLW   B'00000000'
    MOVWF   TRISD
    BANKSEL PORTB
    movlw b'00000000'
    movwf PORTB
    movlw b'00000000'
    movwf  PORTD
    movlw b'10001000'
    movwf INTCON
    movlw .0
    movwf contador_fil
    movwf contador_col
    movwf valor
    movlw b'10110000'
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
fila
    btfss aux,3
    goto columna
    bsf STATUS, C
    rlf aux
    movlw b'00001111'
    andwf aux, f
    movlw .3
    addwf contador_fil, f 
    goto fila
columna  
    movf salida, w
    movwf PORTB
    movf PORTB, w
    movwf aux1
    movlw b'00001111'
    andwf aux1, f
    movlw b'00001111'
    subwf aux1, w
    btfss STATUS, Z
    goto obtener_valor
    incf contador_col
    bsf STATUS, C
    rrf salida
    movlw b'11110000'
    andwf salida, f
    goto columna
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
    goto cargar_valor
es_cero
    movlw .0
    movwf valor
    call tabla
    movwf PORTD
    goto cargar_valor
tabla 
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
cargar_valor
    movf valor, w
    addwf valor_a_cargar, f
    movlw b'11110000'
    andwf valor_a_cargar, w
    btfss STATUS, Z
    goto ir_con_FSR
    swapf valor_a_cargar
    goto restaurar_valores 
ir_con_FSR
    movf puntero, w
    movwf FSR
    movf valor_a_cargar, w
    movwf INDF
    incf puntero
    movlw 0x39
    subwf puntero, w
    btfss STATUS, Z
    goto restaurar_valores
    movlw 0x29
    movwf puntero
restaurar_valores 
    movlw .0
    movwf contador_fil
    movwf contador_col
    movwf valor
    movlw b'10110000'
    movwf salida
fin_interrupcion 
    retfie
    END 
