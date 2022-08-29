# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yochoi <yochoi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/19 15:02:39 by yochoi            #+#    #+#              #
#    Updated: 2020/03/21 20:21:50 by yochoi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; https://www.tutorialspoint.com/assembly_programming/assembly_conditions.htm

section .text
	global _ft_strlen

_ft_strlen:
	mov		rax, 0				; rax = 0
	jmp		len_loop			; jump to len_loop

len_loop:
	cmp		BYTE [rdi + rax], 0	; if (rdi[rax] == 0) ZF = 1
	jz		return				; if (ZF == 1) jump to return
	inc		rax					; rax++
	jmp		len_loop			; jump to len_loop

return:
	ret							; return (rax)