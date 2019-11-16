.equ BUFFER_SIZE, 4
.equ NEW_LINE, 10

.section .data
.section .bss
.lcomm buffer_data, BUFFER_SIZE

.section .text

.globl _start
_start:

read_from_buffer:

movq $0, %rax
movq $0, %rdi
movq $buffer_data, %rsi
movq $BUFFER_SIZE, %rdx
syscall

movq %rax, %rbx

movq $1, %rax
movq $1, %rdi
movq $buffer_data, %rsi
movq %rbx, %rdx
syscall

decq %rbx
cmpb $NEW_LINE, buffer_data(,%rbx,1)
je exit

jmp read_from_buffer

exit:
movq $60, %rax
movq $0, %rdi
syscall
