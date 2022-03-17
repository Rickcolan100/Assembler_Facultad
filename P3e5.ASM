PIO      EQU 30H 

         ORG 1000H
NUM_CAR  DB 5
CAR      DB ?

         ORG 3000H
INI_IMP: MOV AL, 0FDH
         OUT PIO+2, AL
         MOV AL, 0
         IN AL, PIO
         AND AL, 0FDH
         OUT PIO, AL
         RET

         ORG 4000H 
PULSO:   IN AL, PIO
         OR AL, 02H
         OUT PIO, AL
         IN AL, PIO
         OUT PIO, AL
         RET 

         ORG 2000H
         PUSH AX
         CALL INI_IMP
         POP AX 
         MOV CL, NUM_CAR
LAZO:    INT 6
POLL:    IN AL, PIO 
         AND AL, 1
         JNZ POLL
         MOV AL, [BX]
         CALL PULSO
         POP CX
         DEC CL
         JNZ LAZO 
         INT 0
         END 

 
 
