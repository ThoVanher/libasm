section .text
	global _verif_base
	extern _ft_strlen
	extern _printf

_verif_base:
			call _ft_strlen
			cmp rax, 0
			je exit
			cmp rax, 1
			je exit
			mov r8, -1
			xor r9, r9

inc_i:
			inc r8

i_while_loop:
			mov bl, BYTE[rdi + r8]
			cmp bl, 0
			je exit_iwhile_loop
			mov r9, r8
			inc r9
			je exit_iwhile_loop
			jmp j_while_loop

inc_j:
			inc r9

j_while_loop:
			mov cl, BYTE[rdi + r9]
			cmp cl, 0
			je inc_i
			cmp bl, cl
			je exit
			jmp inc_j
			
exit_iwhile_loop:
			mov r8, -1

inc_i2:
			inc r8
			mov bl, BYTE[rdi + r8]
			cmp bl, 0
			je exit_base_valide

second_i_wl:
			cmp bl, 9
			je exit
			cmp bl, 10
			je exit
			cmp bl, 11
			je exit
			cmp bl, 12
			je exit
			cmp bl, 13
			je exit
			cmp bl, 32
			je exit
			cmp bl, 43
			je exit
			cmp bl, 45
			je exit
			jmp inc_i2

exit_base_valide:	
			mov rax, 1
			ret
exit:
			mov rax, 0
			ret
			
