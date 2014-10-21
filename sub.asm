;Assembly language program to find sub   SUBPROG.ASM
;
;         Objective: To add two integers.
;            Inputs: Two integers.
;            Output: Sub of input numbers.
%include  "io.mac"

.DATA
prompt1_msg  db  'Enter first number: ',0
prompt2_msg  db  'Enter second number: ',0
sub_msg      db  'Sub is: ',0
error_msg    db  'Overflow has occurred!',0
 
.UDATA
number1      resd  1        ; stores first number
number2      resd  1        ; stores first number
subt          resd  1        ; stores sub
 
.CODE
      .STARTUP
      ; prompt user for first number
      PutStr  prompt1_msg
      GetLInt [number1]
      
      ; prompt user for second number
      PutStr  prompt2_msg
      GetLInt [number2]
      
      ; find sub of two 32-bit numbers
      mov     EAX,[number1]
      sub     EAX,[number2]
      mov     [subt],EAX
       
      ; check for overflow
      jno     no_overflow
      PutStr  error_msg
      nwln
      jmp     done
 
      ; display sub
no_overflow:
      PutStr  sub_msg
      PutLInt [subt]
      nwln
done:
      .EXIT
