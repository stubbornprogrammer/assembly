.section .data
.section .text

.globl _start
_start:

popq %rcx

cmpq $2, %rcx
jne exit_with_error

popq %rcx
popq %rcx

movq $0, %rdx
movq $0, %rsi

loop_start:
movq (%rcx,%rsi,1),%rax
cmp %al,%dl
je loop_done
incq %rsi
jmp loop_start

loop_done:

movq $10, (%rcx,%rsi,1)
incq %rsi

movq %rsi, %rdx
movq %rcx, %rsi
movq $1, %rax
movq $1, %rdi
syscall

movq $60, %rax
movq $0, %rdi
syscall

exit_with_error:
movq $60, %rax
movq $-1, %rdi
syscall
