section .text

global _ft_write
extern ___error

_ft_write:
			mov r8, rdx
			cmp rdi, 0
			jl exit_error
			cmp rsi, 0
			je exit_error
			cmp rdx, 0
			jc exit_error

print:
			mov rax, 0x2000004
			syscall

exit:
			mov rax, r8
			ret

exit_error:
			mov rax, -1
			ret
