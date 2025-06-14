;3.10
    LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_ON & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
    CBLOCK 0X31
    puntero1 
    puntero2
    puntero3
    valor1 
    primer_caracter 
    segundo_caracter
    resultado
    ENDC
	ORG 0x00
INICIO ;w = 0 f = 1
    movlw 0x20 ;Simulo la carga de los 16 datos seguidos en ascii, si los cargo manualmente no hace falta 
    movwf FSR
    movlw .48
    movwf valor1
    movlw .9
    movwf puntero1
cargadatos1 ;Carga 9 numeros del 0 al 8
    movf valor1, w
    movwf INDF
    incfsz valor1
    incfsz FSR
    decfsz puntero1
    goto cargadatos1 
    movlw .7
    movwf puntero1
    goto numerosdistintos
numerosdistintos ;Carga 7 numeros del 9 al 3
    movf valor1, w
    movwf INDF
    decfsz valor1
    incfsz FSR
    decfsz puntero1
    goto numerosdistintos
    goto continua_el_programa
continua_el_programa
    movlw .8
    movwf puntero1
    movlw 0x20 ;Arranco a ver valores desde el inici
    movwf puntero2
    movlw 0x38
    movwf puntero3
lectura_guardado_de_valores
    movf puntero2, w
    movwf FSR 
    movlw .15
    andwf INDF, w
    movwf primer_caracter
    swapf primer_caracter
    incfsz puntero2
    movf puntero2, w
    movwf FSR 
    movlw .15
    andwf INDF, w
    addwf primer_caracter,w
    incfsz puntero2
    movwf resultado
    movf puntero3, w
    movwf FSR
    movf resultado, w
    movwf INDF
    incfsz puntero3
    decfsz puntero1
    goto lectura_guardado_de_valores
    goto fin   
fin
    END  



