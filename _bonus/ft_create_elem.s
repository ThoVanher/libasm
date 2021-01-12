section .text
	global _ft_create_elem
	global _ft_list_push_front
	extern _malloc
	extern _ft_strlen

_ft_create_elem:
				push rsp
				mov rsi, rdi
				mov rdi, 16
				call _malloc
				cmp rax, 0
				je exit_failed
				mov [rax], rsi
				pop rsp
				ret
exit_failed: 
			ret

_ft_list_push_front:
				cmp rdi, 0
				je exit_failed
				mov rcx, [rdi]
				cmp rcx, 0
				je first_elem
				jne push_front

first_elem:
				call _ft_create_elem	
				ret

push_front:
				push rdi
				push rsi
				call _ft_create_elem
				pop rsi
				pop rdi
				mov [rax + 8], rcx
				mov rcx, rax
				ret
				
