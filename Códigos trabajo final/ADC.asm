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
retardo_1   EQU 0x20
retardo_2   EQU 0x21
;CODIGO 
    org     0x00
    goto    INICIO
;------------------------PUERTOS--------------------
INICIO  
    BANKSEL ANSELH
    clrf    ANSELH
    clrf    ANSEL
    COMF    ANSEL	    ;ANALOGICAS EN EL PUERTO A
    BANKSEL TRISA
    MOVLW   0X01
    MOVWF   TRISB	    ;ENTRADA RB0
    MOVWF   TRISA	    ;ENTRADA RA0
    movlw   B'00000000'
    movwf   TRISC
    clrf    TRISD
    BANKSEL PORTB   
    movlw   b'11011000'	    ;ACTIVO INT GLOBALES EXT Y RB0
    movwf   INTCON
    ;-------------------------------ADC--------------------------------
    BANKSEL TRISD
    clrf    ADCON1
    BANKSEL PIR1
    MOVLW   B'01000001'	    ;7-6 FOSC/8 5-2 ELIGO EL CANAL AN0 DEJO EL GO/DONE EN 0 PARA NO ARRANCARLO
    MOVWF   ADCON0
    ;------------------------LIMPIEZA--------------------
    movlw   .255
    movwf retardo_1
    movlw .255
    movwf retardo_2
       
SENSADO
    BSF	    ADCON0,1
    CALL    RETARDO	    
    BANKSEL ADRESH
    MOVFW   ADRESH
    MOVWF   PORTD
    GOTO    SENSADO
RETARDO
    decfsz retardo_1
    goto RETARDO 
    movlw .255
    movwf retardo_1
    decfsz retardo_2
    goto RETARDO
    movlw .255
    movwf retardo_2
    RETURN
    END