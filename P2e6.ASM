        ORG 1000H
MSJ     DB "INGRESE UN NUMERO:"
FINM    DB ?
NUM     DB ?
CERO    DB "Cero"
FIN0    DB ?
UNO     DB "Uno"
FIN1    DB ?
DOS     DB "Dos"
FIN2    DB ?
TRES    DB "Tres"
FIN3    DB ?
CUATRO  DB "Cuatro"
FIN4    DB ?
CINCO   DB "Cinco"
FIN5    DB ?
SEIS    DB "Seis"
FIN6    DB ?
SIETE   DB "Siete"
FIN7    DB ?
OCHO    DB "Ocho"
FIN8    DB ?
NUEVE   DB "Nueve"
FIN9    DB ?

        ORG 2000H
SIGO1:  MOV AH, O
SIGO:   MOV BX, OFFSET MSJ
        MOV AL, OFFSET FINM - OFFSET MSJ
        INT 7
        MOV BX, OFFSET NUM
        INT 6
        CMP CL, 30H
        JNZ UNO1
        MOV BX, OFFSET CERO
        MOV AL, OFFSET FIN0 - OFFSET CERO
        INT 7
        ADD AH, 1
        CMP AH, 1
        JNZ SIGO
        JMP AFUERA
UNO1:   CMP CL, 31H 
        JNZ DOS2
        MOV BX, OFFSET UNO
        MOV AL, OFFSET FIN1 - OFFSET UNO
        INT 7
        JMP SIGO1
DOS1:   CMP CL, 32H 
        JNZ TRES3
        MOV BX, OFFSET DOS
        MOV AL, OFFSET FIN2 - OFFSET DOS
        INT 7
        JMP SIGO1
TRES3:  CMP CL, 33H 
        JNZ CUATRO4
        MOV BX, OFFSET TRES
        MOV AL, OFFSET FIN3 - OFFSET TRES
        INT 7
        JMP SIGO1
CUATRO4:CMP CL, 34H 
        JNZ CINCO5
        MOV BX, OFFSET CUATRO
        MOV AL, OFFSET FIN4 - OFFSET CUATRO
        INT 7
        JMP SIGO1
CINCO5: CMP CL, 35H 
        JNZ SEIS6
        MOV BX, OFFSET CINCO
        MOV AL, OFFSET FIN5 - OFFSET CINCO
        INT 7
        JMP SIGO1
SEIS6:  CMP CL, 36H 
        JNZ SIETE7
        MOV BX, OFFSET SEIS
        MOV AL, OFFSET FIN6 - OFFSET SEIS
        INT 7
        JMP SIGO1
SIETE7: CMP CL, 37H 
        JNZ DOS2
        MOV BX, OFFSET UNO
        MOV AL, OFFSET FIN1 - OFFSET UNO
        INT 7
        JMP SIGO1
OCHO8:  CMP CL, 38H 
        JNZ NUEVE9
        MOV BX, OFFSET OCHO
        MOV AL, OFFSET FIN8 - OFFSET OCHO
        INT 7
        JMP SIGO1
NUEVE9: CMP CL, 39H
        MOV BX, OFFSET NUEVE
        MOV AL, OFFSET FIN9 - OFFSET NUEVE
        INT 7
AFUERA: HLT
        END 










       
                

