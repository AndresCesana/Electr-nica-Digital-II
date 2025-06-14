
; PIC16F877A Configuration Bit Setting
; Assembly source line config statements
    LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
;   PR2 = 77
;   CCPR1L = 00111110
;   CCPCON1 = 10
;   CCP1CON -> SALIDA RC2
;   PRESCALER = 16
;   TMR2 ON
;   CCP1 = PWM OPERACION
contador_L  EQU 0x20
contador_H  EQU 0x21
contador_CCPL  EQU 0x22
contador_CCPH  EQU 0x23
    org     0x00
    goto    INICIO
    org     0x04 
    goto    INTERR
	
INICIO
    BANKSEL PR2
    MOVLW	.150
    MOVWF	PR2
    BCF	TRISC,2;RC2 
    clrf    TRISA
    clrf    TRISB
    clrf    TRISC
    clrf    TRISD
    clrf    TRISE
    BANKSEL CCPR1L
    MOVLW   B'00000000' ;80% MSB
    MOVWF	CCPR1L
    BCF	CCP1CON,5 ; 1 LSB 80%
    BCF	CCP1CON,4 ; 0
    BSF	T2CON,1 ;16 PRESCALER
    BCF	T2CON,0
    BSF	T2CON,2; TMR2 ON
    BSF	CCP1CON,3; 11XX PWM
    BSF	CCP1CON,2
    BSF	CCP1CON,1
    BSF	CCP1CON,0
    BANKSEL OPTION_REG
    movlw   B'00000101'
    movwf   OPTION_REG
    BANKSEL INTCON
    movlw b'10100000'
    movwf INTCON
    movlw .100
    movwf TMR0
START
    GOTO    START	
INTERR
    btfss INTCON, T0IF
    retfie
    bcf INTCON, T0IF
    incf contador_L
    btfsc STATUS,Z
    goto aumentar_high
pasar_cont_pwm
    MOVLW   B'00000000' ;pongo pwm a 0
    MOVWF   CCPR1L
    movf contador_L,W
    movwf contador_CCPH
    bcf STATUS,C
    rrf contador_CCPH
    bcf STATUS,C
    rrf contador_CCPH
    btfsc contador_H,0
    bsf contador_CCPH,6
    btfsc contador_H,1
    bsf contador_CCPH,7
    movf contador_CCPH, W
    movwf CCPR1L
    goto fin_int
aumentar_high
    incf contador_H
    movlw .3
    subwf contador_H,W
    btfsc STATUS,Z
    clrf contador_H
    goto pasar_cont_pwm
fin_int
    movlw .100
    movwf TMR0
    retfie
	END




	