section .data                           
   startMsg db 'Did I eat your souvlaki (y/n):' 
   lenstartMsg equ $-startMsg
   sorryMsg db 'I am terribly sorry'
   lensorryMsg equ $-sorryMsg                          

section .bss           
   ansr resb 5
	
section .text          
   global _start
	
_start:                
   mov eax, 4
   mov ebx, 1
   mov ecx, startMsg
   mov edx, lenstartMsg
   int 80h
  
   mov eax, 3
   mov ebx, 2
   mov ecx, ansr  
   mov edx, 5          
   int 80h 

   mov eax, 4
   mov ebx, 1
   mov ecx, sorryMsg
   mov edx, lensorryMsg
   int 80h
    
   mov eax, 1
   mov ebx, 0
   int 80h