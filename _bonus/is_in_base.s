section .text
	global _is_in_base

_is_in_base:
			xor r8, r8
			xor rax, rax
			xor rbx, rbx
			jmp compare

inc_i:		
			inc r8
			
compare:
			mov bl, [rdi + r8]
			cmp bl, 0
			je exit
			cmp bl, sil
			je exit_success
			jmp inc_i

exit_success:
			mov rax, 1
			ret

exit:
			mov rax, 0
			ret
