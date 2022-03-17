PIC      EQU 20H             
DMA      EQU 50H             
N_DMA    EQU 20H              
                           
         ORG 80H              
IP_DMA   DW RUT_DMA          
                           
         ORG 1000H           
MSJ      DB "FACULTAD DE"    
         DB " INFORMATICA"   
FIN      DB ?                
NCHAR    DB ?                
                           
         ORG 1500H          
COPIA    DB ?                                    
                           
         ORG 3000H                  
RUT_DMA: MOV AL, 0FFH ;inhabilita..                            
         OUT PIC+1, AL ;interrupc de PIC
         MOV BX, OFFSET COPIA       
         MOV AL, NCHAR              
         INT 7                      
         MOV AL, 20H                
         OUT PIC, AL ; EOI       
         IRET                                         
                           
         ORG 2000H   
         CLI
         MOV AL, N_DMA
         OUT PIC+7, AL
         MOV AX, OFFSET MSJ
         OUT DMA, AL
         MOV AL, AH
         OUT DMA+1, AL
         MOV AX, OFFSET FIN - OFFSET MSJ
         OUT DMA+2, AL
         MOV AL, AH
         OUT DMA+3, AL
         MOV AX, OFFSET COPIA
         OUT DMA+4, AL
         MOV AL, AH
         OUT DMA+5, AL
         MOV AL, 0AH 
         OUT DMA+6, AL
         MOV AL, 0F7H
         OUT PIC+1, AL
         STI
         MOV BX, OFFSET MSJ
         MOV AL, OFFSET FIN - OFFSET MSJ
         MOV NCHAR, AL
         INT 7
         MOV AL, 07H
         OUT DMA+7, AL
         INT 0
         END 
               