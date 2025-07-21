section .data
  ; declearing a single bytes for all our variables
  var1 db 10                ; var1 = 10
  var2 db 3                 ; var2 = 3
  var3 db 9                 ; var3 = 9

section .bss
  ; reservering a single byte variable named result
  result resb 1             ; (var1 + 2)12 / 6(var3-var2) = 2

section .text
  global _start


_start:
  mov al, 2
  add al, [var1]            ; al = 12

  mov cl, [var3]            ; cl = 9
  sub cl, [var2]            ; 9 - 3 = 6 -> cl = 6

  ; clear upper register before performing division, we do this to clear any left over nums 
  xor ah, ah
  div cl                    ; 12/6 al = 2

  ; convert raw numeric value into ascii equivalent to print to console
  add al, '0'

  mov [result], al


_print:
  mov eax, 4
  mov ebx, 1
  mov ecx, result
  mov edx, 1
  int 0x80

_exit_program:
  mov eax, 1
  xor ebx, ebx
  int 0x80
