
title   IntEx.asm

; Purpose:  This program reads 3 integer values, num1, num2 and num3,
;               and computes and prints:    num1 * 2 - num2 + num3

.386
.model flat, stdcall

;Declare named constants
  LF               equ 0Ah
  CR               equ 0Dh

;External procedure prototypes
 ReadInt proto
 WriteInt proto
 WriteString proto
 Crlf proto
 ExitProcess proto, :dword

.stack 100h

.data
        prompt  byte "Enter 3 numbers, one per line:", CR, LF, 0
        message byte "The result is:  ", 0
        num1    sdword  ?           ;Holds 1st value entered by user
        num2    sdword  ?           ;Holds 2nd value entered by user
        num3    sdword  ?           ;Holds 3rd value entered by user

.code

main proc

    ;Print "Enter 3 numbers, one per line:"
     mov edx, offset prompt
     call WriteString

    ;Read num1, num2, num3
     call ReadInt
     mov num1, eax
   
     call ReadInt
     mov num2, eax                
 
     call ReadInt
     mov num3, eax

     call Crlf              ;Print a blank line

    ;Compute eax = num1 * 2 - num2 + num3
     mov eax, num1
     add eax, num1
     sub eax, num2
     add eax, num3

    ;Print "The result is:" eax
     mov edx, offset message
     call WriteString
     call WriteInt
     call Crlf

    ;Terminate the program
     push 0
     call ExitProcess
main endp

end main

 
comment *
Enter 3 numbers, one per line:
25
30
40

The result is:  +60
Press any key to continue . . .
*
