.section .data
filename:
.string "outputfile\.txt"

.section .bss
.lcomm buffer_data, 500

.section .text

.globl _start
_start:

movq $2, %rax
movq $filename, %rdi
movq $0x401, %rsi
movq $0666, %rdx
syscall

cmpq $0, %rax
jl exit_with_error

movq %rax, %rbx

movq $0, %rax
movq $0, %rdi
movq $buffer_data, %rsi
movq $500, %rdx
syscall

movq %rbx, %rdi
movq $1, %rax
movq $buffer_data, %rsi
movq $500, %rdx
syscall

movq $60, %rax
movq $0, %rdi
syscall

exit_with_error:
movq $60, %rax
movq $1, %rdi
syscall
