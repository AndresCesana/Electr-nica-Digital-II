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
contador_tercero EQU 0x22
contador_cuarto  EQU 0x23
primer_byte      EQU 0x24
segundo_byte	 EQU 0x2A
contador_1S	 EQU 0x26
flag_cuenta_completa EQU 0x27
contador_3S EQU 0x28
vector EQU 0x29

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
    MOVLW   B'00000100'
    MOVWF   OPTION_REG
    MOVLW   B'00000000'
    MOVWF   TRISD
    MOVWF   TRISC
    BANKSEL PORTB
    movlw b'00000000'
    movwf PORTB
    movwf PORTC
    movwf PORTD
    movlw b'10110000'
    movwf INTCON
    movlw .200
    movwf contador_1S 
    movlw .3
    movwf contador_3S 
    movlw b'01111101'
    movwf primer_byte
    clrf segundo_byte
    movlw b'11111110'
    movwf vector
    movlw .100
    movwf TMR0
    movlw .0
    movwf flag_cuenta_completa
LOOP 
    goto LOOP 
INTERRUPCION 
    btfsc INTCON, INTF
    goto interrumpio_PORTB
    btfsc INTCON, T0IF
    goto interrumpio_TMR0
    retfie 
interrumpio_PORTB
    bcf INTCON, INTF
    btfsc flag_cuenta_completa, 0
    goto fin_interrupcion_PORTB
    decf segundo_byte
    movlw b'11111111'
    subwf segundo_byte, w
    btfss STATUS, Z
    goto cargo_interrupcion_PORTB
    movlw b'11111111'
    andwf primer_byte, w
    btfss STATUS, Z
    goto no_desbordo
    movlw b'11111111'
    andwf segundo_byte, w
    btfss STATUS, Z
    goto cargo_interrupcion_PORTB
    movlw .1
    movwf flag_cuenta_completa
    goto fin_interrupcion_PORTB
no_desbordo
    decf primer_byte
cargo_interrupcion_PORTB
    movlw b'00001111'
    andwf segundo_byte, w
    movwf contador_cuarto
    movlw b'11110000'
    andwf segundo_byte, w
    movwf contador_tercero
    swapf contador_tercero, f
    movlw b'00001111'
    andwf primer_byte, w
    movwf contador_segundo
    movlw b'11110000'
    andwf primer_byte, w
    movwf contador_primero
    swapf contador_primero, f
fin_interrupcion_PORTB
    retfie
interrumpio_TMR0
    bcf INTCON, T0IF
    call cargar
    movwf PORTD
    btfss flag_cuenta_completa, 0
    goto fin_interrupcion_TMR0
    decfsz contador_1S 
    goto fin_interrupcion_TMR0
    movlw .200
    movwf contador_1S 
    decfsz contador_3S 
    goto fin_interrupcion_TMR0
    clrf flag_cuenta_completa
    movlw .200
    movwf contador_1S 
    movlw .3
    movwf contador_3S 
    movlw b'01111101'
    movwf primer_byte
    clrf segundo_byte
    goto fin_interrupcion_TMR0
cargar     
    btfss vector,0
    goto carga0
    btfss vector,1
    goto carga1
    btfss vector,2
    goto carga2
    btfss vector,3
    goto carga3
carga0 
    movf vector, w
    movwf PORTC
    movlw b'11111101'
    movwf vector
    movlw 0x23
    movwf FSR 
    goto valor
carga1
    movf vector, w
    movwf PORTC
    movlw b'11111011'
    movwf vector
    movlw 0x22
    movwf FSR 
    goto valor
carga2
    movf vector, w
    movwf PORTC
    movlw b'11110111'
    movwf vector
    movlw 0x21
    movwf FSR 
    goto valor
carga3
    movf vector, w
    movwf PORTC
    movlw b'11111110'
    movwf vector
    movlw 0x20
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
    retlw b'01011111'
    retlw b'01111100'
    retlw b'00111001'
    retlw b'01011110'
    retlw b'01111011'
    retlw b'01110001'
fin_interrupcion_RB0
    retfie
fin_interrupcion_TMR0
    movlw .99
    movwf TMR0
    retfie
    END



