Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	MOV	AX, Code
	MOV	DS, AX

	MOV AX, 0003h
	INT 10h

    XOR CX, CX

increase:
    inc cx
    jmp return

cycle:
    xor ax,ax
    int 16h
    mov dl, al
    mov bl, dl

	MOV AX, 0003h
    int 10h

    mov ah, 02h
    int 21h
    
    cmp dl, 48
    jz increase

return:   
    cmp cx, 4
    jz print

    cmp dl, 27
    jz print
    jnz cycle
    
print:
	MOV AX, 0003h
    int 10h

    mov	dx, offset string
	mov	ah, 9
	int	21h

Program_Vege:
	MOV	ax, 4c00h
	INT	21h

string DB "too many zeros...   $"

Code	Ends

Data	Segment

Data	Ends

Stack	Segment

Stack	Ends
	End	Start

