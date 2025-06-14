;7.3
;Según el esquema que se muestra y utilizando técnicas de multiplexado de 
;display desarrolle un programa que cuente desde ´000000´al iniciarse el 
;programa. El contador avanza una cuenta cada segundo y al llegar a 
;´999999´vuelve a ´000000´y así indefinidamente. Los displays y la cuenta se 
;manejan por la interrupción en RB0 que se activa por flanco descendente.
;Se pide además calcular la frecuencia a la que se debe colocar el generador de 
;onda cuadrada que ingresa por RB0.
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
valor_D1 EQU 0x21
valor_D2 EQU 0x22
valor_D3 EQU 0x23
valor_D4 EQU 0x24
controlador EQU 0x25
controlador_v EQU 0x26
; Codigo 
    org     0x00
    goto    INICIO
    org 0x04 
    goto segundos
INICIO    
    BANKSEL ANSELH
    CLRF    ANSELH
    CLRF    ANSEL
    BANKSEL TRISB
    MOVLW   B'00000001'
    MOVWF   TRISB
    MOVWF   WPUB
    MOVLW   B'00000000'
    MOVWF   TRISA
    MOVLW   B'00000000'
    MOVWF   TRISC
    BCF  OPTION_REG, 7
    BCF  OPTION_REG, 6
    BANKSEL PORTB
    movlw b'00000000'
    movwf PORTB
    movlw b'11111111'
    movwf PORTC
    movlw b'11110000'
    movwf PORTA
    movlw b'10010000'
    movwf INTCON
    movlw .200
    movwf contador_1S
    movlw .0
    movwf valor_D1 
    movwf valor_D2
    movwf valor_D3 
    movwf valor_D4
    movlw .4
    movwf controlador
    movlw b'11111110'
    movwf controlador_v
LOOP
    goto LOOP 
segundos
    bcf INTCON, 1
    call CARGA
    bsf STATUS, C
    rlf controlador_v
    decfsz contador_1S
    goto fin_interrupcion 
    incf valor_D1
    movlw .200
    movwf contador_1S
    movlw .10
    subwf valor_D1, w
    btfss STATUS, Z
    goto fin_interrupcion 
    movwf valor_D1
;diez_segundos
    incf valor_D2
    movlw .10
    subwf valor_D2, w
    btfss STATUS, Z
    goto fin_interrupcion 
    movwf valor_D2
;cien_segundos
    incf valor_D3
    movlw .10
    subwf valor_D3, w
    btfss STATUS, Z
    goto fin_interrupcion 
    movwf valor_D3
;mil_segundos
    incfsz valor_D4
    movlw .10
    subwf valor_D4, w
    btfss STATUS, Z
    goto fin_interrupcion 
    movwf valor_D4
    goto fin_interrupcion 
CARGA
    movf controlador_v, w
    movwf PORTA
    btfss controlador_v,0
    goto cargar_0
    btfss controlador_v,1
    goto cargar_1
    btfss controlador_v,2
    goto cargar_2
    btfss controlador_v,3
    goto cargar_3
    movlw b'11111110'
    movwf PORTA
    movwf controlador_v
cargar_0
    movlw 0x21
    movwf FSR
    call tabla
    movwf PORTC
    return
cargar_1
    movlw 0x22
    movwf FSR
    call tabla
    movwf PORTC
    return
cargar_2
    movlw 0x23
    movwf FSR
    call tabla
    movwf PORTC
    return
cargar_3
    movlw 0x24
    movwf FSR
    call tabla
    movwf PORTC
    return
tabla
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
fin_interrupcion  
    retfie
    END


