section .text
	global _ft_strdup
	extern _ft_strlen
	extern _malloc

_ft_strdup:
			push rdi
			call _ft_strlen
			xor rdi, rdi
			add rdi, rax
			add rdi, 1
			call _malloc
			pop rdi
			mov r8, -1
			cmp rax, 0
			je exit

increment:
			inc r8

null_verif:
			mov bl, BYTE[rdi + r8]
			cmp bl, 0
			je close_str

copy:
			mov [rax + r8], bl
			jmp increment
			
close_str:
			mov BYTE[rax + r8], bl
			ret
			
exit:
			mov rax, 0
			ret
