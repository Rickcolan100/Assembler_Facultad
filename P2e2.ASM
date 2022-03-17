       ORG 1000H 
INICIO DB 01H

       ORG 2000H
       MOV AH, FFH
       MOV BX, OFFSET INICIO
       MOV AL, 1
ASC:   INT 7
       ADD BYTE PTR [BX], 1H
       CMP AL, FFH
       JNZ ASC
       INT 0 
       END 
