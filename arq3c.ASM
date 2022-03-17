       ORG 1000H ; datos
Dato1h DW 2H
Dato1l DW 2H
Dato2h DW 4H
Dato2l DW 4H
    
       ORG 3000H ; subrutina sum32
Sum32: MOV BX, AX
       MOX AX, [BX]
       ADD BX, 2
       MOV DX, [BX]
       MOV BX, CX
       MOV CX, [BX]
       ADD BX, 2
       ADD AX, CX
       ADC DX, [BX]
       RET
       
       ORG 2000H ; programa principal
       MOV AX, OFFSET Dato1l
       MOX CX, OFFSET Dato1h
       CALL Sum32
       HLT
       END




