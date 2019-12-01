; This code counts the number of words in the SENTENCE variable (number of spaces+1).
Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	MOV	AX, Code
	MOV	DS, AX
	
    MOV AX, 0003h
    INT 10

    XOR DX, DX
    MOV DI, offset SENTENCE
    DEC DI
    
CYCLE:
    INC DI
    MOV DH, [DI]
    
    CMP DH, 13
    JZ PRINT

    CMP DH, " "
    JZ INCREASE

    JMP CYCLE

INCREASE:
    INC DL
    JMP CYCLE

PRINT:
    MOV SI, offset EOP
    ADD DL, 49
    MOV [SI + 33], DL
    MOV DX, offset SENTENCE
    MOV AH, 09h
    INT 21h

END_OF_PROGRAM:
	MOV	AX, 4c00h
	INT	21h

SENTENCE DB "The quick brown fox jumps over the lazy dog",13,10 ; CR, LF
EOP DB "Number of words in the SENTENCE:  !$" ; Change 33rd char

Code	Ends

Data	Segment

Data	Ends

Stack	Segment

Stack	Ends
	End	Start
