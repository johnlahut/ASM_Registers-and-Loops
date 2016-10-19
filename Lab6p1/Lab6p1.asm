;@Author:		John Lahut
;@Date:			3/8/2016
;@Project:		Lab6
;@Filename:		Lab6p1.asm
;@I/O:			All I/O are done via console
;@Assumptions:	None
;@Purpose:		Demonstrates use of direct and indirect indexing of lists stored in asm



title    Lab6.asm

.386
.model flat, stdcall	;Protected Mode

;Declare named constants
 LF                equ 0Ah
 CR                equ 0Dh

;FILL IN CODE for Procedure prototypes
;External prototypes from the Irvine Library

WriteInt proto
WriteString proto
Crlf proto
ExitProcess proto, :dword


.stack 100h

.data
      msg1 byte "The values in list using indirect addressing are:", LF, CR, 0
      msg2 byte "The values in list using indexed addressing are:", LF, CR, 0
      list sdword  15, -8, 25, -40, 50, 35, -48, 17, -80, 2, 18, -30

		
.code


main proc
      ;FILL IN CODE that prints
      ;  "The values in list using indirect addressing are:"
	  mov edx, offset msg1
	  call WriteString


	  ;initialize registers
	  mov eax, 0
	  mov ebx, 0
	  mov ecx, 0


      ;FILL IN CODE using indirect addressing that prints the
      ; values stored in list, one per line
	  mov ecx, LENGTHOF list	;LCV -- ecx reg gets the number of elements in the list
	  mov ebx, OFFSET list		;ebx reg gets the address of the starting element of the list

	  DO1:
			mov eax, [ebx]		;eax contains the number to write to console...[ebx] command gets the value that at the address that ebx contains
			call WriteInt		;Write the current integer to the console
			call Crlf			;Print blank line
			add ebx, TYPE list	;increment the ebx to point to the next element...need to get size(type) of element in list
			loop DO1


		

      ;FILL IN CODE that prints
      ;   "The values in list using indexed addressing are:"
	  call Crlf					;Blank line
	  mov edx, offset msg2		;edx must store beginning address of msg2
	  call WriteString			;print msg2


      ;FILL IN CODE using indexed addressing that prints the values stored
      ; in list, one per line
	  mov ecx, LENGTHOF list	;LCV -- ecx gets the number of elements in the list
	  mov esi, 0				;esi stores the starting index

	  DO2:
			mov eax, list[esi]	;eax gets list[value in esi]
			call WriteInt		;Write current int to console
			call Crlf			;Print black line
			add esi, TYPE list	;esi gets the next index in the list, size adjusted
			loop DO2			;loop back to the top of the loop


      ;FILL IN CODE that terminates the program
	  push 0
	  call ExitProcess


main endp

end main