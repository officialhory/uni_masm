# Assembly for MASM
Assembly codes for university class. All the codes are far from optimal and experimental. 

All the codes were tested in Dosbox.

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

* Readkey
    ``` assembly
        MOV AX, 0003h
        int 10h
    ```

* End of program
    ``` assembly
        mov	ax, 4c00h
	    int	21h
    ```