section .text
	global _place_in_base

_place_in_base:
				xor r8, r8
				xor rax, rax
				xor rbx, rbx
				jmp compare

inc_i:
				inc r8

compare:
				mov bl, [rdi + r8]
				cmp bl, sil
				jne inc_i

exit_place:
				mov rax, r8
				ret
