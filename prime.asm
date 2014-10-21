;Prime or not            PRIME.ASM
;
;        Objective: To check if a N is prime or not.
;            Input: Requests an integer N from the user.
;           Output: Outputs whether a number is prime              

%include "io.mac"

.DATA
prompt_msg  db  "Please enter a positive number: ",0
output_msg1  db  "The number is not PRIME.",0
output_msg2   db  "The number is PRIME",0
error_msg     db  "The number is not valid",0

.UDATA
divident resb 16
debug resb 16

.CODE
      .STARTUP
      PutStr  prompt_msg     ; request the number

try_again:
      GetInt  AX             ; read number into BX
      cmp     AX,0           ; test for a positive number
      mov     CX,2     
      
      jge     num_ok
      PutStr  error_msg
      nwln
      jmp     try_again

num_ok:
      mov     [divident],AX
      call    check


;----------------------------------------------------
;Procedure check receives a positive integer N in BX.
;It corresponding tells the result
;----------------------------------------------------

check:
      mov     AX,[divident]
      cmp     AX,CX 
    	mov DX, 0
      je      messg2
      DIV     CX
		cmp     DX,0
      je      messg1
		
      inc     CX
		JMP     check

                      
messg2:
       PutStr output_msg2 
	    nwln        
		.EXIT
        
messg1:
       PutStr output_msg1
		 nwln
        .EXIT
        







	
