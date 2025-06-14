;3.8
     LIST P = 16F887
    RADIX HEX

#include "p16f887.inc"
; CONFIG1
; __config 0x3FFA
 __CONFIG _CONFIG1, _FOSC_HS & _WDTE_ON & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
cont equ 0x28
    ORG 0x00
INICIO ;w = 0 f = 1
    movlw .15   ; Cargar 14 en cont, ya que vamos a escribir 15 veces empezando desde 30H
    movwf cont
    movlw 0x30  ; Cargar la dirección de memoria 30H en W
    movwf FSR   ; Mover el contenido de W a FSR
    
Aca
    movlw .33   ; Cargar el valor 33 en W
    movwf INDF  ; Escribir el valor en la posición de memoria apuntada por FSR
    incf FSR     ; Incrementar la dirección de memoria apuntada por FSR
    decfsz cont  ; Decrementar cont y saltar si es cero
    goto Aca     ; Volver al principio del bucle si cont no es cero
    goto fin     ; Ir al final si cont es cero
    
fin 
    end