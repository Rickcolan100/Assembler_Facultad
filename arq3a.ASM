       ORG 1000H
Dato1l DW 2H
Dato1h DW 2H
Dato2l DW 4H
Dato2h DW 4H 
       
       ORG 2000H
       MOV AX, Dato1l
       MOV CX, Dato1h
       ADD AX, Dato2l
       ADC CX, Dato2h
       HLT
       END
