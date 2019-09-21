.section .data
name:
.string "inputfile.txt"
 
.section .bss
.lcomm buffer_data, 500

.section .text

.globl _start
_start:
 
movq $2, %rax
movq $name, %rdi
movq $0, %rsi
movq $0666, %rdx
syscall

movq %rax, %rdi
movq $0, %rax
movq $buffer_data, %rsi
movq $500, %rdx
syscall

movq $1, %rdi
movq $buffer_data, %rsi
movq $500, %rdx
movq $1, %rax
syscall

movq $60, %rax
movq $0, %rdi
syscall
