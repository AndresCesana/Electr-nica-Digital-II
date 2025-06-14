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
contador_1S       ; 0x26
valor_D1          ; 0x27
valor_D2          ; 0x28
valor_D3          ; 0x29
valor_D4          ; 0x2A
controlador_v     ; 0x2B
temperatura_1     ; 0x2C
temperatura_2     ; 0x2D
vector_iniciacion ; 0x2E
vector_Temp_Tiemp ; 0x2F
valor_D3_resta    ; 0x30
valor_D4_resta    ; 0x31
vector_minutos    ; 0x32
retardo_1	  ; 0x33
retardo_2	  ; 0x34
vector_muestra    ; 0x35    
parpadeo          ; 0x36
numero            ; 0x37
vector_hola       ; 0x38
vector_letra      ; 0x39
    ENDC
; Codigo 
    org     0x00
    goto    INICIO
    org     0x04 
    goto    INTERR
INICIO 
    BANKSEL ANSELH
    clrf    ANSELH
    clrf    ANSEL
    BANKSEL TRISB
    movlw   b'00000100'
    movwf   OPTION_REG
    movlw   b'00001111'
    movwf   TRISB
    movwf   WPUB
    movlw   b'00001110'
    movwf   IOCB
    clrf    TRISA
    clrf    TRISC
    bsf     TRISC, 7
    clrf    TRISD
    clrf    TRISE
    banksel SPBRG
    MOVLW   .5		; BAUDIOS 10417
    MOVWF   SPBRG
    movlw   b'01100000' ; NO MOVER HASTA PONER 9 BIT 
    movwf   TXSTA
    BSF	    PIE1,RCIE   ; HABILITA INT RX
    Banksel PIR1 
    movlw   b'11010000' ; NO MOVER HASTA PONER 9 BIT 
    movwf   RCSTA
    clrf    RCREG
    movlw   .1 
    movwf   vector_letra
    movlw   .0
    movwf   vector_hola
    BANKSEL PORTA
    clrf    PORTB
    movlw   b'11111111'
    movwf   PORTD
    movlw   b'00001111'
    movwf   PORTC
    clrf    PORTA
    movlw   b'11111000'
    movwf   INTCON
    movlw   .0		;variables de teclado
    movwf   contador_fil
    movwf   contador_col
    movwf   valor
    movwf   aux
    movwf   aux1
    movlw   b'01111111'
    movwf   salida
    movlw   .110
    movwf   retardo_1
    movlw   .150
    movwf   retardo_2
    movlw   .0		; variables de contador
    movwf   valor_D1 
    movwf   valor_D2
    movwf   valor_D3 
    movwf   valor_D4
    movwf   valor_D3_resta
    movwf   valor_D4_resta
    movwf   vector_iniciacion
    movwf   vector_Temp_Tiemp
    movwf   vector_muestra
    movwf   parpadeo
    movlw   .0
    movwf   temperatura_1
    movwf   temperatura_2
    movwf   vector_hola
    movlw   .1 
    movwf   vector_letra
    movwf   controlador_v
    movlw   .200 
    movwf   contador_1S
    movlw   b'00011000'
    movwf   numero 
    movlw   .100
    movwf   TMR0
LOOP 
    goto    LOOP
bcd_7seg
    movf    INDF, w
    addwf   PCL, f
    retlw   b'11000000' ;0
    retlw   b'11111001' ;1
    retlw   b'10100100' ;2
    retlw   b'10110000' ;3
    retlw   b'10011001' ;4
    retlw   b'10010010' ;5
    retlw   b'10000010' ;6
    retlw   b'11111000' ;7
    retlw   b'10000000' ;8
    retlw   b'10011000' ;9
    retlw   b'11000000' ;*
    return
    retlw   b'11000000' ;#
INTERR
    btfsc   PIR1, 5
    goto    recepcion
    btfsc   INTCON, INTF
    goto    interr_INTE
    btfsc   INTCON, T0IF
    goto    interr_TMR0
    btfsc   INTCON, RBIF
    goto    interr_RB
    goto    fin_interrupcion
interr_INTE
    bcf     INTCON, INTF
    goto    reinicio
recepcion
    clrf    PIR1
    btfsc   RCSTA, 0
    bsf     PORTA, 0
    movf    RCREG, W
    movwf   temperatura_1
    movwf   temperatura_2
    movlw   b'11111111'
    subwf   temperatura_1, w
    btfsc   STATUS, Z
    goto    reinicio 
    movlw   0x0f
    andwf   temperatura_1, f
    swapf   temperatura_2, f
    movlw   0x0f
    andwf   temperatura_2, f
    clrf    RCREG
    goto    fin_interrupcion 
transmitir
    movf    PORTB, w
    comf    PORTE
    banksel TXREG
    movf    numero, w
    movwf   TXREG 
    return
interr_RB		; ARRANCA INTERRUPCION PUERTO 
    bcf	    INTCON, RBIF
    movlw   .1
    movwf   vector_hola
    movlw   .2
    subwf   vector_iniciacion, w
    btfsc   STATUS, Z
    goto    fin_interr_portb
    movlw   b'10111111'
    movwf   PORTD
    movlw   b'00001111'
    movwf   PORTC
    movf    PORTB, w
    movwf   aux
    movlw   b'00001110'
    andwf   aux, f
    movlw   b'00001110'
    subwf   aux, w
    btfsc   STATUS, Z
    goto    fin_interr_portb
    clrf    aux
    call    retardo_50mS
    bcf	    INTCON, RBIF
    movf    PORTB, w
    movwf   aux
    movlw   b'00001110'
    andwf   aux, f
    movlw   b'00001110'
    subwf   aux, w
    btfsc   STATUS, Z
    goto    fin_interr_portb
    bcf	    INTCON, RBIF
    incf    vector_iniciacion 
columna
    btfss   aux,3
    goto    fila
    bsf	    STATUS, C
    rlf	    aux
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
    bsf	    STATUS, C
    rrf	    salida
    clrf    aux1
    goto    fila 
obtener_valor 
    movf    contador_fil, w
    addwf   contador_col, w 
    movwf   valor
    incf    valor
    movlw   .11
    subwf   valor, w
    btfss   STATUS, Z
    goto    inicializacion
    movlw   .0
    movwf   valor
inicializacion
    movlw   .1
    subwf   vector_iniciacion, w
    btfss   STATUS, Z
    goto    segundo_valor
primer_valor 
    movf    valor, w
    movwf   valor_D4_resta
    movlw   .255
    andwf   valor_D4_resta, w
    btfss   STATUS, Z
    goto    reiniciar
    bsf	    vector_minutos,0  
    goto    reiniciar
segundo_valor
    movf    valor, w
    movwf   valor_D3_resta
    call    transmitir
reiniciar
    banksel PORTA
    clrf    aux
    clrf    aux1
    clrf    contador_fil
    clrf    contador_col
    clrf    valor
    clrf    salida
    movlw   b'01111111'
    movwf   salida
    clrf    PORTB 
    bcf	    INTCON, RBIF
    goto    fin_interr_portb
retardo_50mS
    decfsz  retardo_1
    goto    retardo_50mS 
    movlw   .110
    movwf   retardo_1
    decfsz  retardo_2
    goto    retardo_50mS
    movlw   .150
    movwf   retardo_2
    return
interr_TMR0
    btfss   vector_hola,0
    call    hola
    bcf     INTCON, T0IF    
    movlw   .2
    subwf   vector_iniciacion, w
    btfss   STATUS, Z
    goto    fin_interr_TMR0
    movf    controlador_v, w
    movwf   PORTC
    btfsc   controlador_v,0
    goto    cargar_0
    btfsc   controlador_v,1
    goto    cargar_1
    btfsc   controlador_v,2
    goto    cargar_2
    btfsc   controlador_v,3
    goto    cargar_3
cargar_0    
    bcf	    STATUS, C
    rlf	    controlador_v
    btfss   vector_Temp_Tiemp, 0
    goto    Tiempo_0
    movlw   b'11000110'
    movwf   PORTD 
    goto    un_segundo
cargar_1
    bcf	    STATUS, C
    rlf	    controlador_v
    btfss   vector_Temp_Tiemp, 0
    goto    Tiempo_1
    movlw   b'10011100'
    movwf   PORTD 
    goto    un_segundo
cargar_2
    bcf	    STATUS, C
    rlf	    controlador_v
    btfss   vector_Temp_Tiemp, 0
    goto    Tiempo_2
    movlw   0x2C
    movwf   FSR
    goto    llamador
cargar_3
    movlw   .1
    movwf   controlador_v
    btfss   vector_Temp_Tiemp, 0
    goto    Tiempo_3
    movlw   0x2D
    movwf   FSR 
    goto    llamador
Tiempo_0
    btfss   vector_muestra, 0
    goto    mostrar_lo_cargado_0
    movlw   0x27
    movwf   FSR
    goto    llamador
Tiempo_1
    btfss   vector_muestra, 0
    goto    mostrar_lo_cargado_1
    movlw   0x28
    movwf   FSR
    goto    llamador
Tiempo_2
    btfss   vector_muestra, 0
    goto    mostrar_lo_cargado_2
    movlw   0x29
    movwf   FSR
    call    bcd_7seg
    movwf   PORTD 
    bcf	    PORTD, 7
    goto    un_segundo
Tiempo_3
    btfss   vector_muestra, 0
    goto    mostrar_lo_cargado_2
    movlw   0x2A
    movwf   FSR
    goto    llamador
mostrar_lo_cargado_0
    btfsc   parpadeo,0
    goto    mostrar_lo_cargado_2
    movlw   0x30
    movwf   FSR
    goto    llamador
mostrar_lo_cargado_1
    btfsc   parpadeo,0
    goto    mostrar_lo_cargado_2
    movlw   0x31
    movwf   FSR
    goto    llamador
mostrar_lo_cargado_2
    movlw   .255
    movwf   PORTD
    goto    un_segundo
llamador 
    call    bcd_7seg
    movwf   PORTD 
    goto    un_segundo
un_segundo
    movlw   .100
    subwf   contador_1S, w
    btfsc   STATUS, Z
    call    hacer_parpadear
    decfsz  contador_1S
    goto    fin_interr_TMR0
    movwf   contador_1S
    movlw   .200
    movwf   contador_1S
    call    hacer_parpadear
    incf    valor_D1
    movlw   .10
    subwf   valor_D1, w
    btfss   STATUS, Z
    goto    fin_interr_TMR0
    movwf   valor_D1
    bsf	    vector_muestra, 0
    goto    flag
hacer_parpadear
    comf    parpadeo, f
    movlw   b'00000001'
    andwf   parpadeo, f
    return
flag 
    comf    vector_Temp_Tiemp, f
    movlw   b'00000001'
    andwf   vector_Temp_Tiemp, f
diez_segundos
    incf    valor_D2
    movlw   .6
    subwf   valor_D2, w
    btfss   STATUS, Z
    goto    fin_interr_TMR0 
    movwf   valor_D2
cien_segundos
    incf    valor_D3
    btfsc   vector_minutos,0
    goto    llego_al_valor
    movlw   .10
    subwf   valor_D3, w
    btfss   STATUS, Z
    goto    fin_interr_TMR0
    movwf   valor_D3
    goto    mil_segundos
llego_al_valor
    movf    valor_D3_resta, w
    subwf   valor_D3, w
    btfss   STATUS, Z
    goto    fin_interr_TMR0
    goto    llego_a_la_cuenta
mil_segundos
    incf    valor_D4
    movf    valor_D4_resta, w
    subwf   valor_D4, w
    btfss   STATUS, Z
    goto    fin_interr_TMR0
    bsf	    vector_minutos,0
    movwf   valor_D4
    goto    fin_interr_TMR0
llego_a_la_cuenta
    call    transmitir
    clrf    valor_D1 
    clrf    valor_D2
    clrf    valor_D3 
    clrf    valor_D4
    goto    fin_interr_TMR0
; ----------INNECESARIO-----------
hola
    decfsz  contador_1S
    goto    inicio_hola
    movlw   .200 
    movwf   contador_1S
    incf    vector_letra
    movlw   .5
    subwf   vector_letra, w
    btfss   STATUS, Z
    goto    inicio_hola
    clrf    vector_letra
    movlw   .4
    movwf   vector_letra
inicio_hola    
    movf    controlador_v, w
    movwf   PORTC
    btfsc   controlador_v,0
    goto    cargar_0_L
    btfsc   controlador_v,1
    goto    cargar_1_L
    btfsc   controlador_v,2
    goto    cargar_2_L
    btfsc   controlador_v,3
    goto    cargar_3_L
cargar_0_L    
    bcf	    STATUS, C
    rlf	    controlador_v
    movlw   .1
    subwf   vector_letra, w
    btfsc   STATUS, Z
    goto    cargarh
    movlw   .2
    subwf   vector_letra, w
    btfsc   STATUS, Z
    goto    cargaro
    movlw   .3
    subwf   vector_letra, w
    btfsc   STATUS, Z
    goto    cargarl
    movlw   .4
    subwf   vector_letra, w
    btfsc   STATUS, Z
    goto    cargara
cargar_1_L
    bcf	    STATUS, C
    rlf	    controlador_v
    movlw   .1
    subwf   vector_letra, w
    btfsc   STATUS, Z
    goto    cargar_vacio 
    movlw   .2
    subwf   vector_letra, w
    btfsc   STATUS, Z
    goto    cargarh
    movlw   .3
    subwf   vector_letra, w
    btfsc   STATUS, Z
    goto    cargaro
    movlw   .4
    subwf   vector_letra, w
    btfsc   STATUS, Z
    goto    cargarl
cargar_2_L
    bcf	    STATUS, C
    rlf	    controlador_v
    movlw   .1
    subwf   vector_letra, w
    btfsc   STATUS, Z
    goto    cargar_vacio 
    movlw   .2
    subwf   vector_letra, w
    btfsc   STATUS, Z
    goto    cargar_vacio
    movlw   .3
    subwf   vector_letra, w
    btfsc   STATUS, Z
    goto    cargarh
    movlw   .4
    subwf   vector_letra, w
    btfsc   STATUS, Z
    goto    cargaro
cargar_3_L
    movlw   .1
    movwf   controlador_v
    movlw   .1
    subwf   vector_letra, w
    btfsc   STATUS, Z
    goto    cargar_vacio 
    movlw   .2
    subwf   vector_letra, w
    btfsc   STATUS, Z
    goto    cargar_vacio
    movlw   .3
    subwf   vector_letra, w
    btfsc   STATUS, Z
    goto    cargar_vacio
    movlw   .4
    subwf   vector_letra, w
    btfsc   STATUS, Z
    goto    cargarh
cargarh
    movlw   b'10001001'
    movwf   PORTD
    return 
cargaro
    movlw   b'11000000'
    movwf   PORTD
    return 
cargarl
    movlw   b'11000111'
    movwf   PORTD
    return 
cargara
    movlw   b'10001000'
    movwf   PORTD
    return 
cargar_vacio
    movlw   b'11111111'
    movwf   PORTD
    return 
reinicio 
    BANKSEL PORTA
    clrf    PORTB
    movlw   b'10111111'
    movwf   PORTD
    movlw   b'00001111'
    movwf   PORTC
    movlw   .0		;variables de teclado
    movwf   contador_fil
    movwf   contador_col
    movwf   valor
    movwf   aux
    movwf   aux1
    movlw   b'01111111'
    movwf   salida
    movlw   .110
    movwf   retardo_1
    movlw   .150
    movwf   retardo_2
    movlw   .0		; variables de contador
    movwf   valor_D1 
    movwf   valor_D2
    movwf   valor_D3 
    movwf   valor_D4
    movwf   valor_D3_resta
    movwf   valor_D4_resta
    movwf   vector_iniciacion
    movwf   vector_Temp_Tiemp
    movwf   vector_muestra
    movwf   parpadeo
    movlw   .0
    movwf   temperatura_1
    movwf   temperatura_2
    movlw   .1
    movwf   controlador_v
    movlw   .200 
    movwf   contador_1S
    movlw   b'10010110'
    movwf   numero
    goto    fin_interrupcion 
fin_interr_TMR0
    movlw   .100
    movwf   TMR0
    goto    fin_interrupcion 
fin_interr_portb
fin_interrupcion
    retfie
    END


