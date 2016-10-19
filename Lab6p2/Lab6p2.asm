;@Author:		John Lahut
;@Date:			3/8/2016
;@Project:		Lab6
;@Filename:		Lab6p2.asm
;@I/O:			All I/O are done via console
;@Assumptions:	None
;@Purpose:		Demonstrates use of the LABEL directive.
;				Takes two smaller sizes values (2 WORDs) and creates a new type LongValue of size DWORD



title    Lab6b.asm    ; YOUR NAME HERE 

.386
.model flat, stdcall	;Protected Mode

;Declare named constants
 LF                equ 0Ah
 CR                equ 0Dh

;FILL IN CODE for Procedure prototypes
WriteHex proto
Crlf proto
ExitProcess proto, :dword


.stack 100h

.data
	LongValue LABEL DWORD
	val1 WORD 5678h
	val2 WORD 1234h

.code

main proc


	  ; mov LongValue into the EAX here:
	  mov eax, LongValue

	  ; Output the contents of the EAX here:
	  call WriteHex

	  ; Output a newline:
	  call Crlf
	
	  
      ;FILL IN CODE that terminates the program
	  call ExitProcess


main endp

end main

comment *
12345678
Press any key to continue . . .
*