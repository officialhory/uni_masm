; Number converter for 8 bit numbers.
Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	MOV	AX, Code
	MOV	DS, AX
	
  MOV AX, 0003h
  INT 10h

; ***** DEC *****
  XOR CX, CX
  MOV CL, 100
  MOV DL, "0"
  MOV AX, 241
  MOV DI, offset RESULTDEC

DECIMAL:
  DIV CL
  MOV [DI], AL
  ADD [DI], DL
  INC DI
  MOV AL, AH
  XOR AH, AH

  MOV CL, 10
  DIV CL
  MOV [DI], AL
  ADD [DI], DL
  INC DI
  MOV AL, AH
  XOR AH, AH

  MOV [DI], AL
  ADD [DI], DL

; ***** BIN *****

  MOV CX, 8
  MOV BL, 2
  MOV DL, "0"
  MOV AX, 241
  MOV DI, offset RESULTBIN
  ADD DI, 7

BINARY:
  DIV BL
  MOV [DI], AH
  ADD [DI], DL
  DEC DI
  XOR AH, AH
  LOOP BINARY

; ***** DEC LOOP ******
  MOV CX, 3
  MOV BL, 10
  MOV DL, "0"
  MOV AX, 241
  MOV DI, offset RESULTLDEC
  ADD DI, 2

DECIMALLOOP:
  DIV BL
  MOV [DI], AH
  ADD [DI], DL
  DEC DI
  XOR AH, AH
  LOOP DECIMALLOOP

; ***** HEX *****
  MOV CX, 2
  MOV BL, 16
  MOV DX, 3730h
  MOV AX, 241
  MOV DI, offset RESULTLHEX
  ADD DI, 1

HEX:
  DIV BL
  MOV [DI], AH
  CMP AH,10 
  JL number
  JG letter
return:
  DEC DI
  XOR AH, AH
  LOOP HEX
  JMP PRINT

number:
  ADD [DI], DL
  jmp return

letter:
  ADD [DI], DH
  jmp return

PRINT:
  MOV DX, offset RESULTDEC
  MOV AH, 09h
  INT 21h

END_OF_PROGRAM:
	MOV	ax, 4c00h
	INT	21h

RESULTDEC DB "    DEC w/o",13,10
RESULTLDEC DB "    DEC w/ loop",13,10
RESULTBIN DB "         BIN w/ loop",13,10
RESULTLHEX DB "   HEX w/ loop$"
Code	Ends

Data	Segment

Data	Ends

Stack	Segment

Stack	Ends
	End	Start
