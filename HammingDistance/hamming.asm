Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	MOV	AX, Code
	MOV	DS, AX
	
	MOV AX, 0003h
	INT 10h

    MOV SI, 0000000000000000b
    MOV DI, 1111111111111111b
    MOV CX, 16
    XOR DX, DX
    
    MOV AX, SI
    MOV BX, DI
    XOR AX, BX

HAMMING:
    CMP CX, 0
    JE PRINT
    DEC CX

    SHR AX, 1
    JNC HAMMING

    INC DX

    JMP HAMMING

PRINT:
    MOV CX, 2
    MOV BL, 10
    MOV AX, DX
    MOV DL, "0"
    MOV DI, offset RESULTDEC
    ADD DI, 1

DECIMALLOOP:
    DIV BL
    MOV [DI], AH
    ADD [DI], DL
    DEC DI
    XOR AH, AH
    LOOP DECIMALLOOP

    MOV DX, offset RESULTDEC
    MOV AH, 09h
    INT 21h

END_OF_PROGRAM:
	MOV	AX, 4c00h
	INT	21h

RESULTDEC DB "   HAMMING DISTANCE$"

Code	Ends

Data	Segment

Data	Ends

Stack	Segment

Stack	Ends
	End	Start
