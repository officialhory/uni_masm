;==========================================================================
;N�v:
;Neptun k�d:
;D�tum:
;
;==========================================================================
Code	Segment
	assume CS:Code, DS:Data, SS:Stack


Start:
	mov	ax, Code
	mov	DS, AX

	mov ax,3
	int 10h


;==========================================================================
;1. feledat: 
;Karakteres �zemm�dban rajzoljon egy der�ksz�g� h�romsz�get.
;A h�romsz�g egyik cs�csa legyen a 10,10 koordin�t�n.
;
;A h�romsz�g m�rete �s elhelyezked�se az al�bbi v�zlatnak megfelel� legyen! 
;x
;xx
;x x
;x  x
;x   x
;x    x
;x     x
;xxxxxxxx
;==========================================================================

	mov	dx, offset feladat1
	mov	ah,9
	int	21h
;**************************************************************************
;Ide �rja a megfelel� programr�szt!
	XOR DX, DX
    XOR BX, BX
    MOV CX, 7
    MOV AH, 2
	MOV DH, 2
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
;Eddig
;**************************************************************************
	xor	ax,ax
	int	16h
;==========================================================================
;2. feledat: 
;Karakteres �zemm�dban �rja ki a k�perny�re SI �rt�k�t bin�ris form�ban!
;Haszn�lja a balra rot�l� (RCL) utas�t�st, amely a Carry bitet �ll�tja!
;==========================================================================
	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,12		;DH:Y koordinata
	int	10h

	mov	dx, offset feladat2
	mov	ah,9
	int	21h

	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,14		;DH:Y koordinata
	int	10h

	mov	si,65534
;**************************************************************************
;Ide �rja a megfelel� programr�szt!
	mov cl, 17
	mov bx, si

leptet:
	cmp cx, 0
	dec cx
	je f2_vege

	rcl bx, 1

	jc egyes
	jnc nulla

egyes:
	mov dl, "1"
	int 21h
	jmp leptet

nulla:
	mov dl, "0"
	int 21h
	jmp leptet

f2_vege:

;Eddig
;**************************************************************************
	xor	ax,ax
	int	16h
;==========================================================================
;3. feledat: 
;D�ntse el a megnyomott bilenty�r�l, hogy sz�mot, vagy egy�b karaktert
;"vitt" be! A ciklusb�l "ESC" billenty� le�t�s�vel lehet kil�pni.
;Haszn�lja a program el�re meg�rt �zeneteit!
;==========================================================================
	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,15		;DH:Y koordinata
	int	10h

	mov	dx, offset feladat3
	mov	ah,9
	int	21h

bevitel1:
	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,17		;DH:Y koordinata
	int	10h

	xor ah,ah
	int 16h
	cmp al,27
	jz Feladat3_Vege
;**************************************************************************
;Ide �rja a megfelel� programr�szt!

	cmp al, 48
	jl nem
	cmp al,57
	jg nem
	jmp szam

nem:
	mov dx, offset uzenetnemszam
	mov ah, 09h
	int 21h
	jmp bevitel1

szam:
	mov dx, offset uzenetszam
	mov ah, 09h
	int 21h
	jmp bevitel1

;Eddig
;**************************************************************************
Feladat3_Vege:
;==========================================================================
;4. feledat: 
;Karakteres �zemm�dban �rja ki a k�perny�re SI �rt�k�t decim�lis form�ban!
;==========================================================================
	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,19		;DH:Y koordinata
	int	10h

	mov	dx, offset feladat4
	mov	ah,9
	int	21h

	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,21		;DH:Y koordinata
	int	10h

	mov	si,256
;**************************************************************************
;Ide �rja a megfelel� programr�szt!
	; xor bx, bx
	
	; mov ax, si
	; mov	bl, 100
	; div bl
	; mov bh, ah
	; mov dl, al
	; add dl, 48
	; mov ah, 2
	; int 21h

	; xor ax, ax
	; mov al, bh

	; mov	bl, 10
	; div bl
	; mov bh, ah
	; mov dl, al
	; add dl, 48
	; mov ah, 2
	; int 21h

	; mov dl, bh
	; add dl, 48
	; mov ah, 2
	; int 21h
	
  MOV CX, 3
  MOV BL, 10
  MOV DL, "0"
  MOV AX, SI
  MOV DI, offset RESULTLDEC
  ADD DI, 2

DECIMALLOOP:
  DIV BL
  MOV [DI], AH
  ADD [DI], DL
  DEC DI
  XOR AH, AH
  LOOP DECIMALLOOP

  mov dx, offset RESULTLDEC
  mov ah, 09h
  int 21h

;Eddig
;**************************************************************************
	xor	ax,ax
	int	16h

	mov ax,3
	int 10h

;==========================================================================
;5. feledat: 
;Karakteres �zemm�dban �rja ki a "Hello Vilag" uzenetet!
;Haszn�lja a megl�v� "uzenet5" sztringet!
;==========================================================================
	mov	dx, offset feladat5
	mov	ah,9
	int	21h

	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,2		;DH:Y koordinata
	int	10h

;**************************************************************************
;Ide �rja a megfelel� programr�szt!
	mov	dx, offset uzenet5
	mov	ah,9
	int	21h
;Eddig
;**************************************************************************
	xor	ax,ax
	int	16h
;==========================================================================
;6. feledat: 
;Sz�m�tsa ki a "muvelet1" sztringben megadott szorz�st.
;A k�t sz�jegyet elv�laszt� "*" szimb�lumot nem kell feldolgozni!
;A szorzat eredm�ny�nek megfelel� karaktert jelen�tse meg a k�perny�n.
;==========================================================================
	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,4		;DH:Y koordinata
	int	10h

	mov	dx, offset feladat6
	mov	ah,9
	int	21h

	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,6		;DH:Y koordinata
	int	10h

;**************************************************************************
;Ide �rja a megfelel� programr�szt!


	mov di, offset muvelet1	
	mov ax, [di]
	sub ax, 48
	mov bx, [di + 2]
	sub bx, 48

	mul bx

	mov dx, ax
	mov ah, 02h
	int 21h

;Eddig
;**************************************************************************
	xor	ax,ax
	int	16h

Program_Vege:
	mov	ax, 4c00h
	int	21h

uzenetszam	db	"Szamjegy lett leutve!    $"
uzenetnemszam	db	"Nem szamjegy lett leutve!$"
uzenet5		db	"Hello Vilag!$"
muvelet1	db	"5*7"
	
feladat1	db	"Elso feladat: derekszogu haromszog.$" 
feladat2	db	"Masodik feladat: SI erteke binarisan.$" 
feladat3	db	"Harmadik feladat: szamjegy bevitele.(ESC=kilepes)$" 
feladat4	db	"Negyedik feladat: SI erteke decimalisan.$" 
feladat5	db	"Otodik feladat: uzenet kiiras.$" 
feladat6	db	"Hatodik feladat: szamolas.$" 

RESULTLDEC DB "    DEC$"

Code	Ends

Data	Segment

Data	Ends

Stack	Segment

Stack	Ends
	End	Start
