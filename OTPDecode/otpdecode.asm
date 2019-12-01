Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	MOV	AX, Code
	MOV	DS, AX
	
	MOV AX, 0003h
	INT 10h

    MOV DI, offset titok
    MOV SI, offset kulcs
    MOV AH, 02
    MOV CX, 11

DECODE:
    MOV DX, [SI]
    XOR DX, [DI]
    INC DI
    INC SI

    INT 21h
    LOOP DECODE

Program_Vege:
	MOV	AX, 4c00h
	INT	21h

titok   db  "- 91g.r2#85"
kulcs   db  "AIRTGORPLKF"

Code	Ends

Data	Segment

Data	Ends

Stack	Segment

Stack	Ends
	End	Start
