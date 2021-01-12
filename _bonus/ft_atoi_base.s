section .text
		global _ft_atoi_base
		extern _ft_strlen
		extern _verif_base
		extern _is_in_base
		extern _place_in_base

_ft_atoi_base:
				push rdi	
				mov rdi, rsi			;passe base dans rdi pour appel verif_base
				call _verif_base
				pop rdi					;recup str dans rdi
				cmp rax, 0
				je exit_failed			;base non valide
				push rdi
				mov rdi, rsi
				call _ft_strlen
				pop rdi
				mov rcx, rax			;sauve base_length dans rcx
				xor r13, r13			;int i = 0
				xor r14, r14			;int sign = 0
				xor r15, r15			;int res = 0
				jmp skip_white_space
inc_i:
				inc r13
				jmp skip_white_space
inc_sign:
				inc r14
				inc r13
skip_white_space:
				mov bl, [rdi + r13]		; bl = str[i]
				cmp bl, 9	
				je inc_i				;str[i] = '\t'
				cmp bl, 10	
				je inc_i				;str[i] = '\n'
				cmp bl, 11
				je inc_i				;str[i] = '\v'
				cmp bl, 12 
				je inc_i				;str[i] = '\f'
				cmp bl, 13
				je inc_i				;str[i] = '\r'
				cmp bl, 32
				je inc_i				;str[i] = ' '
				cmp bl, 43
				je inc_i				;str[i] = '+'
				cmp bl, 45
				je inc_sign				;str[i] = '-'
				jmp wlp_result
inc_i2:
				inc r13
wlp_result:
				mov bl, [rdi + r13]	
				cmp bl, 0
				je get_signe			;str[i] = '\0'
				push rdi
				push rsi
				mov rdx, [rdi + r13]
				mov rdi, rsi
				mov rsi, rdx
				call _is_in_base
				pop rsi
				pop rdi
				cmp rax, 0
				je get_signe			;str[i] not anymore in base
get_result:
				mov rax, r15
				mul rcx					;res = res * ft_strlen(base)
				mov r15, rax			
				push rdi
				push rsi
				mov rdx, [rdi + r13]
				mov rdi, rsi
				mov rsi, rdx
				call _place_in_base
				pop rsi
				pop rdi
				add r15, rax			;res = res + place_in_base
				jmp inc_i2		
get_signe:
				mov eax, r14d			;sign count put in eax 
				mov r13d, 2
				xor rdx, rdx			;initializing rdx to avoid floating point exception
				div r13d
				mov eax, edx			;edx contain the modulo
				cmp eax, 1				;sign % 2 == 1 ? 
				je negatif_res
positif_res :
				mov rax, r15
				ret				
negatif_res:
				mul r15					;there before mul, rax = 1, after = 15 
				mul r13 				;r13 = 2, permit to double rax
				sub r15, rax			;change the sign of r15
				mov rax, r15
				ret
				
exit_failed:
				ret
