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
    CBLOCK 0x20 
contador_col      ; 0x20
contador_fil      ; 0x21
valor             ; 0x22
aux               ; 0x23
aux1              ; 0x24
salida            ; 0x25
contador_0.025S   ; 0x26 
vector_puertoB    ; 0x27
vector_TMR0       ; 0x28
contador_1S       ; 0x29
valor_D1          ; 0x2A
valor_D2          ; 0x2B
valor_D3          ; 0x2C
valor_D4          ; 0x2D
controlador_v     ; 0x2E
temperatura_1     ; 0x2F
temperatura_2     ; 0x30
vector_iniciacion ; 0x31
vector_Temp_Tiemp ; 0x32
valor_D3_resta    ; 0x33
valor_D4_resta    ; 0x34
vector_minutos    ; 0x35
    ENDC
; Codigo 
    org     0x00
    goto    INICIO
    org     0x04 
    goto    INTERR
    org     0x05
INICIO    
    BANKSEL ANSELH
    clrf    ANSELH
    BANKSEL TRISB
    movlw   b'00000100'
    movwf   OPTION_REG
    movlw   b'00001110'
    movwf   TRISB
    movwf   WPUB
    movwf   IOCB
    clrf    TRISA
    clrf    TRISC
    clrf    TRISD
    clrf    TRISE
    BANKSEL PORTB
    clrf    PORTB
    movlw   b'00111111'
    movwf   PORTD
    movlw   b'10101000'
    movwf   INTCON
    ;variables de teclado
    movlw   .0
    movwf   contador_fil
    movwf   contador_col
    movwf   valor
    movwf   aux
    movwf   aux1
    movlw   b'01111111'
    movwf   salida
    movlw   .5
    movwf   contador_0.025S
    movlw   .1
    movwf   vector_puertoB
    movwf   vector_TMR0
    ; variables de contador
    movlw   .0
    movwf   valor_D1 
    movwf   valor_D2
    movwf   valor_D3 
    movwf   valor_D4
    movwf   vector_iniciacion
    movwf   vector_Temp_Tiemp
    movlw   .4
    movwf   temperatura_1
    movwf   temperatura_2
    movlw   .1 
    movwf   controlador_v
    movlw   .100
    movwf   TMR0 
LOOP
    goto    LOOP
INTERR
    btfsc   INTCON, T0IF
    goto    interr_TMR0
    btfsc   INTCON, RBIF
    goto    interr_RB
    goto    fin_interrupcion
; ARRANCA INTERRUPCION PUERTO B
interr_RB
    bcf     INTCON, RBIF
    movlw   .3
    subwf   vector_iniciacion, w
    btfsc   STATUS, Z
    goto    fin_interr_portb
    movf    PORTB, w
    movwf   aux
    movlw   b'00001110'
    andwf   aux, f 
    movlw   b'00001110'
    subwf   aux, w
    btfsc   STATUS, Z
    goto    fin_interr_portb
    btfss   vector_TMR0, 0     ; tiene que arrancar saltando 
    goto    fin_interr_portb   
    bcf     vector_puertoB, 0
    incf    vector_iniciacion  ; el vector del puerto en 0
    goto    fin_interr_portb 
; FIN INTERRUPCION DEL PUERTO B
; ARRANCA INTERRUPCION TMR0
interr_TMR0
    bcf     INTCON, T0IF      ; si entro aca no vuelvo a hacer el programa
    btfss   vector_puertoB, 0  ; entra si esta en 0
    call    retardo_del_puertoB
    movlw   .3
    subwf   vector_iniciacion, w
    btfsc   STATUS, Z
    goto    cargar_valores
    goto    fin_interr_TMR0
retardo_del_puertoB
    decfsz  contador_0.025S
    return
    movlw   .5
    movwf   contador_0.025S
    bsf     vector_TMR0, 0     ; cuando termino pongo en 1 el vector del tmr0
    bsf     vector_puertoB, 0  ; el vecror del puerto en 1 
    call    valor_teclado
    movlw   .1
    subwf   vector_iniciacion, w
    btfss   STATUS, Z
    goto    segundo_valor
primer_valor 
    movf    valor, w
    movwf   valor_D4_resta
    return
segundo_valor
    movf    valor, w
    movwf   valor_D3_resta
    incf    vector_iniciacion
    return 
; TERMINA INTERRUPCION DE TMR0
; ARRANCA A LEER EL TECLADO
valor_teclado
columna
    btfss   aux, 3
    goto    fila
    rlf     aux
    movlw   b'00001111'
    andwf   aux, f
    incf    contador_col, f 
    movlw   .2
    subwf   contador_col, w
    btfss   STATUS, Z
    goto    columna 
fila  
    movf    salida, w
    movwf   PORTB
    movf    PORTB, W
    movwf   aux1
    movlw   b'00001110'
    andwf   aux1, f
    movlw   b'00001110'
    subwf   aux1, w
    btfss   STATUS, Z
    goto    obtener_valor
    movlw   .3
    addwf   contador_fil
    bsf     STATUS, C
    rrf     salida
    clrf    aux1
    goto    fila 
obtener_valor 
    clrf    valor
    movf    contador_fil, w
    addwf   contador_col, w 
    movwf   valor
    incf    valor
    movlw   .11
    subwf   valor, w
    btfsc   STATUS, Z
    movwf   valor
restaurar_valores 
    clrf    aux
    clrf    aux1
    clrf    contador_fil
    clrf    contador_col
    clrf    salida
    movlw   b'01111111'
    movwf   salida
    clrf    PORTB 
    bcf     INTCON, RBIF
    return
; TERMINA DE VER EL TECLADO 
; CARGO VALORES EN DISPLAY 
cargar_valores
    goto tablas
un_segundo
    decfsz contador_1S
    goto fin_interr_TMR0
    movlw .200
    movwf contador_1S
    incf valor_D1
    movlw .10
    subwf valor_D1, w
    btfss STATUS, Z
    goto fin_interr_TMR0
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
    goto fin_interr_TMR0 
    movwf valor_D2
cien_segundos
    incf valor_D3
    movlw .10
    subwf valor_D3, w
    btfss STATUS, Z
    goto fin_interr_TMR0
    movwf valor_D3
    btfsc vector_minutos,0
    goto llego_a_la_cuenta
mil_segundos
    incf valor_D4
    movf valor_D4_resta
    subwf valor_D4, w
    btfss STATUS, Z
    goto fin_interr_TMR0
    bsf  vector_minutos,0
    movwf valor_D4
    goto  fin_interr_TMR0
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
    btfss vector_Temp_Tiemp, 0
    goto Tiempo_0
    movlw b'11000110'
    movwf PORTD 
    goto un_segundo
cargar_1
    bcf STATUS, C
    rlf controlador_v
    btfss vector_Temp_Tiemp, 0
    goto Tiempo_1
    movlw b'10011100'
    movwf PORTD 
    goto un_segundo
cargar_2
    bcf STATUS, C
    rlf controlador_v
    btfss vector_Temp_Tiemp, 0
    goto Tiempo_2
    movlw 0x2F
    movwf FSR
    call bcd_7seg
    movwf PORTD 
    goto un_segundo
cargar_3
    movlw .1
    movwf controlador_v
    btfss vector_Temp_Tiemp, 0
    goto Tiempo_3
    movlw 0x30
    movwf FSR
    call bcd_7seg
    movwf PORTD 
    goto un_segundo
Tiempo_0
    movlw 0x2A
    movwf FSR
    call bcd_7seg
    movwf PORTD 
    goto un_segundo
Tiempo_1
    movlw 0x2B
    movwf FSR
    call bcd_7seg
    movwf PORTD 
    goto un_segundo
Tiempo_2
    movlw 0x2C
    movwf FSR
    call bcd_7seg
    movwf PORTD 
    bcf PORTD, 7
    goto un_segundo
Tiempo_3
    movlw 0x2D
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
    retlw b'11000000'
    retlw b'11000000'
    retlw b'11000000'
    retlw b'11000000'
    retlw b'11000000'
    retlw b'11000000'
llego_a_la_cuenta
    movlw   .0
    movwf   valor_D1 
    movwf   valor_D2
    movwf   valor_D3 
    movwf   valor_D4
    movwf   vector_iniciacion
    movwf   vector_Temp_Tiemp
    goto    fin_interr_TMR0
fin_interr_portb
    goto fin_interrupcion 
fin_interr_TMR0
    movlw   .100
    movwf   TMR0
    goto    fin_interrupcion 
fin_interrupcion
    retfie
    END 

