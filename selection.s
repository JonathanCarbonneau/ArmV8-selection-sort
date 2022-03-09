/* 
Jonathan Carbonneau 
Selection Sort 
I pledge my honor that I have abided by the Stevens Honor System.
*/

.text
.global _start
.extern printf
_start:
   
	ADR   X20, Size          // Load address of f
	LDUR  X20, [X20, #0]   // Load the value of f
	LSL   X20, X20, #3
	SUB   X27, X20, #8
	
  
	ADR   X19, Array           // Load base address of A    
 	MOV X21, #0
	MOV X23, #0
	CBZ X27, End


LoopI:
	
	MOV X22, X21
	ADD X26, X21, #8
	
LoopJ:
	
	LDR X24, [X19, X26]
	LDR X25, [X19, X22]
	CMP X24, X25
	BGT else
	MOV X22, X26
else:
	ADD X26, X26, #8
	CMP X26, X20
	BLT LoopJ
	Bl Swap
	ADD X21, X21, #8
	CMP X21, X27
	BLT LoopI
	Bl End

Swap:
	LDR X24, [X19, X21]
	LDR X25, [X19, X22]
	STR X24, [X19, X22]
	STR X25, [X19, X21]
	BR LR

End:
	/* Print after value of A[0] */
Print:
    ADR  X0, msg
    LDR  X1, [X19, X23]
    BL    printf
    ADD  X23, X23, #8
    CMP X23, X20
    BLT Print
    /* Exit the program */
    MOV   X0, #0
    MOV   X8, #93
    SVC   #0

.data
    Array: .dword  96,75,55,34,83,8,91,86,61,15,41,53,48,66,32,43,38,22,84,64 // Array A
    Size: .dword  20           // Number f
    msg: .ascii "%d\n\0"

.end

