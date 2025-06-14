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
contador_1S   EQU 0x20
valor_D1      EQU 0x21
valor_D2      EQU 0x22
valor_D3      EQU 0x23
valor_D4      EQU 0x24
controlador   EQU 0x25
controlador_v EQU 0x26
contador_5S   EQU 0x27
vector_Temp_Tiemp      EQU 0x28
temperatura_1 EQU 0x29
    org     0x00
    goto    INICIO
temperatura_2 EQU 0x2A 
; Codigo 
    org     0x04
    goto    INTERRUPCION 
INICIO    
    BANKSEL ANSELH
    clrf    ANSELH
    clrf    ANSEL
    BANKSEL TRISB
    clrf    TRISB
    clrf    TRISA
    movlw   B'00000000'
    movwf   TRISC
    clrf    TRISD
    clrf    TRISE
    movlw   B'00000100'
    movwf   OPTION_REG
    BANKSEL PORTB
    movlw b'11000000'
    movwf PORTD
    movlw b'00001111'
    movwf PORTC
    movlw b'10100000'
    movwf INTCON
    movlw .5
    movwf contador_5S
    movlw .200
    movwf contador_1S
    movlw .0
    movwf valor_D1 
    movwf valor_D2
    movwf valor_D3 
    movwf valor_D4
    movlw .4
    movwf temperatura_1
    movwf temperatura_2
    movlw .1 
    movwf controlador_v
    movwf vector_Temp_Tiemp
    movlw .100
    movwf TMR0
LOOP
    goto LOOP
INTERRUPCION 
    btfss INTCON, T0IF
    retfie
interrupcion_TMR0
    bcf INTCON, T0IF
    goto tablas
un_segundo
    decfsz contador_1S
    goto fin_interrupcion 
    movlw .200
    movwf contador_1S
    incf valor_D1
    movlw .10
    subwf valor_D1, w
    btfss STATUS, Z
    goto fin_interrupcion
    movwf valor_D1
flag 
    comf vector_Temp_Tiemp, f
    movlw b'00000001'
    andwf vector_Temp_Tiemp, f
diez_segundos
    incf valor_D2
    movlw .6
    subwf valor_D2, w
    btfss STATUS, Z
    goto fin_interrupcion 
    movwf valor_D2
cien_segundos
    incf valor_D3
    movlw .10
    subwf valor_D3, w
    btfss STATUS, Z
    goto fin_interrupcion 
    movwf valor_D3
mil_segundos
    incf valor_D4
    movlw .6
    subwf valor_D4, w
    btfss STATUS, Z
    goto fin_interrupcion
    movwf valor_D4
fin_interrupcion 
    movlw .100
    movwf TMR0
    retfie
tablas
    movf controlador_v, w
    movwf PORTC
    btfsc controlador_v,0
    goto cargar_0
    btfsc controlador_v,1
    goto cargar_1
    btfsc controlador_v,2
    goto cargar_2
    btfsc controlador_v,3
    goto cargar_3
cargar_0
    bcf STATUS, C
    rlf controlador_v
    btfsc vector_Temp_Tiemp, 0
    goto Tiempo_0
    movlw b'11000110'
    movwf PORTD 
    goto un_segundo
cargar_1
    bcf STATUS, C
    rlf controlador_v
    btfsc vector_Temp_Tiemp, 0
    goto Tiempo_1
    movlw b'10011100'
    movwf PORTD 
    goto un_segundo
cargar_2
    bcf STATUS, C
    rlf controlador_v
    btfsc vector_Temp_Tiemp, 0
    goto Tiempo_2
    movlw 0x29
    movwf FSR
    call bcd_7seg
    movwf PORTD 
    goto un_segundo
cargar_3
    movlw .1
    movwf controlador_v
    btfsc vector_Temp_Tiemp, 0
    goto Tiempo_3
    movlw 0x2A
    movwf FSR
    call bcd_7seg
    movwf PORTD 
    goto un_segundo
Tiempo_0
    movlw 0x21
    movwf FSR
    call bcd_7seg
    movwf PORTD 
    goto un_segundo
Tiempo_1
    movlw 0x22
    movwf FSR
    call bcd_7seg
    movwf PORTD 
    goto un_segundo
Tiempo_2
    movlw 0x23
    movwf FSR
    call bcd_7seg
    movwf PORTD 
    bcf PORTD, 7
    goto un_segundo
Tiempo_3
    movlw 0x24
    movwf FSR
    call  bcd_7seg
    movwf PORTD 
    goto un_segundo
bcd_7seg
    movf  INDF, w
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
    END 