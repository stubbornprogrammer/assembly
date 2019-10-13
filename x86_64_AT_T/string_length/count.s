.section .data

.section .bss
.lcomm data_buffer, 500
.lcomm output_buffer, 10

.section .text

.globl _start
_start:

movq $0, %rax
movq $0, %rdi
movq $data_buffer, %rsi
movq $500, %rdx
syscall

movq $data_buffer, %rcx
movq $0, %rdx
movq $0, %rsi

loop_start:
movq (%rcx,%rsi,1),%rax
cmp %al,%dl
je loop_done
incq %rsi
jmp loop_start

loop_done:

movq %rsi, output_buffer
movq $output_buffer, %rsi 

movq $1, %rax
movq $1, %rdi
movq $10, %rdx
syscall


movq $60, %rax
syscall

exit_with_error:
movq $60, %rax
movq $-1, %rdi
syscall

