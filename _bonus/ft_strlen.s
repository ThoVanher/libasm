section .text

	global _ft_strlen

_ft_strlen:
			mov rax, -1

increment:
			inc rax

compare:	
			cmp BYTE[rdi + rax], 0
			jne increment

exit:
			ret
			
