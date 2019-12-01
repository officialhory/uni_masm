Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	MOV	AX, Code
	MOV	DS, AX
	
	mov ax,3
	int 10h

    XOR DX, DX
    XOR BX, BX
    MOV CX, 20
    MOV AH, 2
    MOV DL, 8
 

SIDES:
    PUSH DX
    INT 10h
    MOV DL, "x"
    INT 21h
    POP DX
    PUSH DX
    ADD DL, BL
    INT 10h
    MOV DL, "x"
    INT 21h
    POP DX
    INC DH
    INC BL
    LOOP SIDES

    MOV CX, BX
    INC CX

BASE:
    PUSH DX
    INT 10h
    MOV DL,"x"
    INT 21h
    POP DX
    INC DL
    loop BASE
	
	MOV DH, 12
	MOV DL, 12
	INT 10h

END_OF_PROGRAM:
	mov	ax, 4c00h
	int	21h	

Code	Ends

Data	Segment

Data	Ends

Stack	Segment

Stack	Ends
	End	Start
