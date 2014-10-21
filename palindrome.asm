;Palindrome - Reverse and Version							PALINDROME.ASM
;
;		Objective:	To check if a number is a palindrome or not
;		Input    :	Requests a number N from the user
;		Output 	 :	Tells whether a number is a palindrome or not

%include "io.mac"

.DATA
	prompt_msg 	db 	"Please enter a positive number : ", 0
	error_msg 	db 	"ERROR : The number is not valid.", 0
	pal_msg 	db 	"The number is a PALINDROME.", 0
	notpal_msg 	db	"The number is NOT a PALINDROME.", 0

.UDATA 
	unrev resb 32
	rev   resb 32
	quot  resb 32
	rem   resb 32

.CODE	
	.STARTUP
		PutStr prompt_msg	;Requests a number
		GetLInt EAX;read the number into BX
		cmp EAX, 0
		JL error
		mov [unrev], EAX
		mov [quot], EAX 
		mov ECX, 0
		mov [rev], ECX
		;reverse the number into EAX
	reverser: 
		mov EAX, [quot]
		mov EDX, 0
		mov ECX, 10
		div ECX
		mov [quot], EAX
		mov [rem], EDX

		
		mov EAX, [rev]
		mov EDX, 0
		mov ECX, 10
		mul ECX
		add EAX, [rem]
		mov [rev], EAX
		
		mov ECX, 0
		CMP [quot], ECX
		JE compare;compare the number BX and EAX
		
		JMP reverser
		;if equal goto pal else notpal
		
compare: 
	mov ECX, [rev]
	CMP [unrev], ECX
	JE pal
	JMP notpal

error: 	
	PutStr error_msg
	nwln	
	.EXIT

pal: 	
	PutStr pal_msg
	nwln	
	.EXIT

notpal:	
	PutStr notpal_msg
	nwln
	.EXIT
