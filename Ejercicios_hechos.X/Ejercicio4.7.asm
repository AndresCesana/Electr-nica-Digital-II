;4.7
;Realizar un programa en Lenguaje Ensamblador que cuente de 0 a 9 
;indefinidamente. Cada número permanecerá encendido 1 seg (retardo por 
;software). El conteo iniciará en 0 al apretarse el pulsador y se detendrá al volver 
;a pulsarlo en el valor que esté la cuenta. Se muestra el esquema del hardware 
;sobre el que correrá el programa. El oscilador es de 4MHz.
     LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
    

; variables de la rutina de delay 1 s
DELAY_1 EQU 0x20
cont_1 EQU .247
DELAY_2 EQU 0x21
cont_2 EQU .213
DELAY_3 EQU 0x22
cont_3 EQU .5
; variables
    CBLOCK 23h
    CONTADOR
    BANDERA_BUTTON
    PORTB_ANTERIOR
    ENDC
    ORG 0X00
;configuracion de puertos
    BANKSEL PORTB
    CLRF PORTD
    CLRF PORTB
    BANKSEL TRISB
    MOVLW 0XFF
    MOVWF TRISB
    CLRF TRISD
    BANKSEL ANSELH 
    CLRF ANSELH
    BANKSEL PORTB
    MOVLW .9
    MOVWF CONTADOR
INICIO   
    DECFSZ BANDERA_BUTTON,W ; SI MI BANDERA ESTA EN 0 PARPADEO
    CALL MOSTRAR
    BTFSS PORTB_ANTERIOR,0
    GOTO AFTER_BUTTON
    BTFSC PORTB,0
    GOTO AFTER_BUTTON
    GOTO SWITCH ; EN CASO DE HABER APRETADO EL BOTON VOY A SWITCH DONDE INVIERTO BANDERA
SWITCH
    COMF BANDERA_BUTTON
    MOVF BANDERA_BUTTON,W
    ANDLW b'00000001'
    MOVWF BANDERA_BUTTON
AFTER_BUTTON   
    DECFSZ CONTADOR,W
    CALL RESET7
    MOVF PORTB,W
    MOVWF PORTB_ANTERIOR
    GOTO INICIO
    END
RESET7
    MOVLW .9
    MOVWF CONTADOR
    RETURN
    
MOSTRAR
    MOVF CONTADOR,W
    CALL DEC_7SEG
    MOVWF PORTD
    CALL DELAY_1S
    RETURN

DEC_7SEG ADDWF PCL,F
    RETLW b'01101111'
    RETLW b'01111111'
    RETLW b'00000111'
    RETLW b'01111101'
    RETLW b'01101101'
    RETLW b'01100110'
    RETLW b'01001111'
    RETLW b'01011011'
    RETLW b'00000110'
    RETLW b'00111111'
    
DELAY_1S
    MOVLW cont_1 ; 1u
    MOVWF DELAY_1 ; 1u solo una vez 
FOR1
    MOVLW cont_2 ; 1u 
    MOVWF DELAY_2 ; 1u se repite por cada n que pasa
FOR2
    MOVLW cont_3 ; 1u  
    MOVWF DELAY_3 ; 1u se repite por cada m que pasa y m depende de n veces que pasa 
FOR3
    DECFSZ DELAY_3, F ; 1u si 1(p-1) ,2u si 0 todo esto se repite n y m veces
    GOTO FOR3 ; 2u se repite (p-1) veces 
    DECFSZ DELAY_2, F ; 1u si 1(m-1) ,2u si 0 todo esto se repite m veces 
    GOTO FOR2 ; 2u se repite (m-1) veces 
    DECFSZ DELAY_1, F ; 1u si 1(n-1) veces ,2u si 0 se repite  
    GOTO FOR1 ; 2u  se repite (n-1) veces 
    RETURN


