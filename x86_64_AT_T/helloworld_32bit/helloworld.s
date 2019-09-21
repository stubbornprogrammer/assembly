.section .data
msg:
.string "Hello world\n"

.section .text

.globl _start
_start:

movl $1, %eax
movl $1, %edi
movl $msg, %esi
movl $12, %edx
syscall

movl $60, %eax
movl $0, %edi
syscall
