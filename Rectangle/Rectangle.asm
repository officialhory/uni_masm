
Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	MOV	AX, Code
	MOV	DS, AX
	
	mov ax,3
	int 10h


	MOV DH, 0   ; SOR
	MOV DL, 8	; OSZLOP
	XOR BX, BX
	MOV AH, 02
	MOV CX, 10 ; CIKLUS VÁLTOZÓ
	; INT 10h ; KURZOR POZÍCIÓ 
	; INT 21h ; KARAKTER KIÍRÁS DL-BŐL
	MOV BL, 10
	MOV BH, 0

top:
	PUSH DX
	INT 10h
	MOV DL, "x"
	INT 21h
	POP DX
	PUSH DX
	ADD DH, 10
	INT 10h
	MOV DL, "x"
	INT 21h
	POP DX
	INC DL
	loop top

	XOR CX,CX
	MOV CX,9
	DEC DL
	INC DH

sides:
	PUSH DX
	INT 10h
	MOV DL, "x"
	INT 21h
	POP DX
	PUSH DX
	SUB DL,9
	INT 10h
	MOV DL, "x"
	INT 21h
	POP DX
	INC DH
	loop sides

	MOV DH, 11
	MOV DL, 11
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
