.section .data 
.section .bss
.lcomm buffer_data, 500

.section .text

.globl _start
_start:

movq $0, %rax
movq $0, %rdi
movq $buffer_data, %rsi
movq $500, %rdx
syscall

movq $1, %rax
movq $1, %rdi
syscall

movq $60, %rax
movq $0, %rdi
syscall
