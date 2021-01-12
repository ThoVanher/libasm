section .text

	global _ft_strcmp

_ft_strcmp:
			mov rax, -1

increment:
			inc rax

null_verif: 
			cmp BYTE[rdi + rax], 0
			je get_diff
			cmp BYTE[rsi + rax], 0
			je get_diff
		
compare:
			mov bl, BYTE[rdi + rax]
			mov cl, BYTE[rsi + rax]
			cmp bl, cl	
			je increment
			jne get_diff

get_diff:
		mov bl, BYTE[rdi + rax]
		mov cl, BYTE[rsi + rax]
		sub bl, cl
		mov rax, rbx
		js signed
		jns exit

signed:
		sub rax, 256 

exit:
		ret
		
