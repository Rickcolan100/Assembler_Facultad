PIC      EQU 20H
HAND     EQU 40H
DMA      EQU 50H
N_DMA    EQU 20

         ORG 80
IP_DMA   DW RUT_DMA

         ORG 1000H
MSJ      DB " INFORMATICA"
FIN      DB ?
FLAG     DB 0

           ORG 3000H
RUT_DMA: MOV AL, 0
         OUT HAND+1, AL
         MOV FLAG, 1
         MOV AL, 0FFH 
         OUT PIC+1, AL
         MOV AL, 20H
         OUT PIC, AL
         IRET 

         ORG 2000H
         CLI
         MOV AL, NDMA 
         OUT PIC+7, AL
         MOV AX, OFFSET MSJ
         OUT DMA, AL
         MOV AL, AH 
         OUT DMA+1, AL
         MOV AX, OFFSET FIN-OFFSET MSJ 
         OUT DMA+2, AL
         MOV AL, AH
         OUT DMA+3, AL
         MOV AL, 4
         OUT DMA+6, AL
         MOV AL, 0F7H
         OUT PIC+1, AL
         OUT DMA+7, AL
         MOV AL, 80H
         OUT HAND+1, AL
         STI 

LAZO:    CMP FLAG, 1
         JNZ LAZO
         INT 0
         END 

       

 

