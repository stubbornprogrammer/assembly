.equ BUFFER_SIZE, 4
.equ NEW_LINE, 10

.section .data
filename:
.string "outputfile\.txt"

.section .bss
.lcomm buffer_data, BUFFER_SIZE

.section .text

.globl _start
_start:

movq $2, %rax
movq $filename, %rdi
movq $0x441, %rsi
movq $0666, %rdx
syscall

cmpq $0, %rax
jl exit_with_error

movq %rax, %r9

read_from_buffer:

movq $0, %rax
movq $0, %rdi
movq $buffer_data, %rsi
movq $BUFFER_SIZE, %rdx
syscall

cmpq $0, %rax
jl exit_with_error

movq %rax, %rbx

movq $1, %rax
movq %r9, %rdi
movq $buffer_data, %rsi
movq %rbx, %rdx
syscall

cmpq $0, %rax
jl exit_with_error

decq %rbx
cmpb $NEW_LINE, buffer_data(,%rbx,1)
je exit

jmp read_from_buffer

exit:
movq $60, %rax
movq $0, %rdi
syscall

exit_with_error:
movq $60, %rax
movq $1, %rdi
syscall
