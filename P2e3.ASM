    ORG 1000H
NUM DB 41H

    ORG 2000H
    MOV AH, 27
    MOV BX, OFFSET NUM
    MOV AL, 1H
SIG:INT 7
    ADD BYTE PTR [BX], 20H
    INT 7
    SUB BYTE PTR [BX], 20H
    ADD BYTE PTR [BX], 1H
    DEC AH
    JNZ SIG 
    HLT
    END 
 
