       ORG 1000H
Dato1l DW 2H
Dato1h DW 2H
Dato2l DW 4H
Dato2h DW 4H

       ORG 3000H
Sum32: ADD AX, Dato2h
       ADC CX, Dato2l
       RET

       ORG 2000H
       MOV AX, Dato1h
       MOV CX, Dato1l
       CALL Sum32
       HLT
       END


       
 