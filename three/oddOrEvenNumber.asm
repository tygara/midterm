section .data
  num db 5                      ; Reserves a single byte input value initalized to 5
  numChx db 2

  evnMsg db "even number", 10   ; Defines ASCII for even num message w/ new line
  evn_len equ $-evnMsg          ; evn_len = $(addressCounter) - (address of evnMsg)

  oddMsg db "odd number", 10    ; Defines ASCII for odd num message w/ new line
  odd_len equ $-oddMsg          ; odd_len = $(addressCounter) - (address of oddMsg)


section .text
  global _start                 ; starting breakpoint

; The method I'm using here leverages the ax register and the cmp instruction
; I know that when we use the div operator to perform byte sized division operations
; the remainder of the operation is stored in ah (higher bound of the ax register)
; & and the quotient is stored in al (lower bound of ax register).
; because div behaves this way, I use the registers themselves along with cmp instruction
; to verify wether or not a number is even or odd. Once the comparison is done, a global 
; flag is set indicating wether or not the most recent cmp operation yielded a positve num
; or a negative num

; divide ax (ah=0, al=num) by the byte at numChx
; div byte [numChx] -> ah=remainder, al=quotient
; CMP ah,0 sets ZF=1 if ah==0, else ZF=0
_start:
  mov al, [num]                   ; loading our dividen into a register 
  xor ah, ah                      ; Clearing upper ax register bound
  div byte [numChx]               ; Quotient is in al & remainder is in ah


; cmp x,y sets ZF=1 if x == y, else ZF=0
  cmp ah, 0                         
  je  _evnblock                   ; if ZF=1, jump to _evnblock


; simple instruction to print oddMsg
_oddBlock:
  mov eax, 4
  mov ebx, 1
  mov ecx, oddMsg
  mov edx, odd_len
  int 0x80
  jmp _exit


; simple instruction to print evnMsg
_evnblock:
  mov eax, 4
  mov ebx, 1
  mov ecx, evnMsg
  mov edx, evn_len
  int 0x80
  jmp _exit

_exit:
  mov eax, 1
  xor ebx, ebx
  int 0x80
  

