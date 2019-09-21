.section .data
filename:
.string "output\.txt"

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

movq $2, %rax
movq $filename, %rdi
movq $0x41, %rsi
movq $0666, %rdx
syscall

movq %rax, %rdi
movq $1, %rax
movq $buffer_data, %rsi
movq $500, %rdx
syscall

movq $60, %rax
movq $0, %rdi
syscall
