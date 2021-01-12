section .text
	global _ft_strcpy

_ft_strcpy:
			mov r8, -1
			mov rax, rdi

increment:
			inc r8

null_verif:
			cmp BYTE[rsi + r8], 0
			je close_dst
copy:
			mov bl, [rsi + r8]
			mov [rax + r8], bl
			jmp increment

close_dst:
			mov BYTE[rax + r8], 0
			ret
