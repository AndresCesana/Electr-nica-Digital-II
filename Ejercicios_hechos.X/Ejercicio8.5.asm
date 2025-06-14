;Ejercicio 8.5
;Realice un programa que cuente las botellas que pasan por una cinta de 
;producción. A medida que avanza la cuenta se mostrará su valor en dos displays 
;7 segmentos. Cada 80 botellas contadas enviará un pulso de 1 segundo a un relé 
;conectado a uno de los pines y volverá a reiniciar la cuenta en 0.  
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
contador_1s         EQU 0x20
contador_botellas1  EQU 0x21
contador_botellas2  EQU 0x22
llego_80            EQU 0x23
sincroniza_FSR      EQU 0X24
registro_w          EQU 0x70
registro_status     EQU 0x71
; Codigo 
    org     0x00
    goto    INICIO
    org     0x04 
    goto    INTERR
INICIO    
    BANKSEL ANSELH
    CLRF    ANSELH
    CLRF    ANSEL
    BANKSEL TRISB
    movlw   b'01000101'
    movwf   OPTION_REG
    MOVLW   B'00000001'
    MOVWF   TRISB
    MOVLW   B'00000001'
    MOVWF   WPUB
    MOVLW   B'00000000'
    MOVWF   TRISC
    BANKSEL PORTB
    movlw b'00000000'
    movwf PORTB
    movlw b'11111111'
    movwf  PORTC
    movlw .0
    movwf contador_botellas1
    movwf contador_botellas2
    movlw .100
    movwf contador_1s
    movlw b'10110000'
    movwf INTCON
    movlw .99
    movwf TMR0
LOOP
    goto LOOP
INTERR
    movwf registro_w
    swapf STATUS, W
    movwf registro_status
    btfsc INTCON, INTF
    goto interrumpe_RB0
    btfsc INTCON, T0IF
    goto interrumpe_TMR0
    retfie
interrumpe_RB0
    bcf INTCON, INTF
    incf contador_botellas1
    movlw .10
    subwf contador_botellas1, w 
    btfss STATUS, Z
    goto fin_interrupcionRB0
    movwf contador_botellas1
    incf contador_botellas2
    movlw .8
    subwf contador_botellas2, w 
    btfss STATUS, Z
    goto fin_interrupcionRB0
    movwf contador_botellas2
    movlw .1
    movwf llego_80
fin_interrupcionRB0
    swapf registro_status, w
    movwf STATUS
    swapf registro_w, f
    swapf registro_w, w
    retfie
interrumpe_TMR0
    bcf INTCON, T0IF
    movlw .99
    movwf TMR0
    call cargar
    movwf PORTC
    btfss llego_80, 0
    goto fin_interrupcionTMR0
    decfsz contador_1s
    goto espera_1s
    bsf INTCON, INTE
    goto fin_interrupcionTMR0
espera_1s
    bcf INTCON, INTE
fin_interrupcionTMR0
    swapf registro_status, w
    movwf STATUS
    swapf registro_w, f
    swapf registro_w, w
    retfie
cargar 
    btfsc sincroniza_FSR, 2
    goto primer_display 
segundo_display
    movlw 0x22
    movwf FSR 
    movf sincroniza_FSR, W
    movwf PORTB
    movlw b'00000100'
    movwf sincroniza_FSR
    goto tabla
primer_display 
    movlw 0x21
    movwf FSR 
    movf sincroniza_FSR, W
    movwf PORTB
    movlw b'00000010'
    movwf sincroniza_FSR
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
    END 
