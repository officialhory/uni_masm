# MASM Assembly codes
Assembly codes for university class. All the codes are far from optimal and experimental. 

All the codes were tested in Dosbox with MASM Assembler.

## Important code blocks

* Clear screen
    ``` assembly
        MOV AX, 0003h
        INT 10h
    ```

* Print Char with DOS (eg.: Prints content of DL half-register -> changes AL)
    ``` assembly
        MOV DL, "x" 
        MOV AH, 02h
        INT 21h
    ```

* Print String with DOS (eg.: SOMESTRING DB "my string$")
    ``` assembly
        MOV DX, offset SOMESTRING
        MOV AH, 09h
        INT 21h
    ```

* Readkey (Needs 00h in AH)
    ``` assembly
        XOR AH, AH
        int 16h
    ```

* End of program
    ``` assembly
        mov	ax, 4c00h
	    int	21h
    ```
