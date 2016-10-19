;@Author:		John Lahut
;@Date:			3/8/2016
;@Project:		Lab6
;@Filename:		Lab6p3.asm
;@I/O:			All I/O are done via console
;@Assumptions:	None
;@Purpose:		Demonstrates loop usage for 16-bit registers. Outputs every letter of the alphabet.




title Lab5a.asm


.model small	;Real Mode


;Declare named constants
LF              equ   0Ah
CR              equ   0Dh
EXIT_NO_ERRORS  equ 4C00h

.stack 100h


.data
		msg    byte "The letters in the alphabet are:", LF, CR, '$'
		letter byte 'A'
		lcv	   byte 26


.code
main proc
        ;Set up ds to point at the data segment
         mov ax, @data
         mov ds, ax

        ;FILL IN CODE to print "The letters in the alphabet are:"
		mov ah, 9h					;DOS command is 9h for output of string
		mov dx, OFFSET msg			;DX must contain the beginning address of string
		int 21h						;execute DOS command



        ;FILL IN CODE to print the letters A through Z, all on one line
        ; using a DO..While loop

		mov ah, 2h					;DOS command is 2h for output of characters
		mov cx, lcv					;LCV is contained in the CX for 16-bit programs...26 letters in the alphabet

		DO:
			mov dl, letter			;DL must contain the letter for output for the DOS command
			int 21h					;exec DOS command
			inc letter				;move to the next letter in the alphabet
			loop DO					;while lcv !=0 loop back to DO

        ;Fill IN CODE to generate a CR/LF and then to terminate the program
		mov ax, EXIT_NO_ERRORS		;move into the ax the exit code
		int 21h						;exec DOS command

		
main endp
end main