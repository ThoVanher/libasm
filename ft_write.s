section .text

global _ft_write
 extern ___error

_ft_write:
			mov r8, rdx
			mov rax, 0x2000004
			syscall
			jc exit_error

exit:
			mov rax, r8
			ret

exit_error:
			call ___error
			mov rax, -1
			ret
