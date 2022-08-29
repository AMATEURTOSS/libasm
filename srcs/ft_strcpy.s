# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yochoi <yochoi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/20 16:33:56 by yochoi            #+#    #+#              #
#    Updated: 2020/03/21 20:21:57 by yochoi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_strcpy

_ft_strcpy:
	mov		rax, 0				; rax = 0
	mov		dl, 0				; dl = 0
	jmp		cpy_loop			; jump to cpy_loop

cpy_loop:
	cmp		BYTE[rsi + rax], 0	; if (rsi[rax] == 0) ZF = 1
	jz		final				; if (ZF == 1) jump to final
	mov		dl, BYTE[rsi + rax]	; dl = rsi[rax]
	mov		BYTE[rdi + rax], dl	; rdi[rax] = dl
	inc		rax					; rax++
	jmp		cpy_loop			; jump to cpy_loop

final:
	mov		dl, BYTE[rsi + rax]	; dl = rsi[rax]
	mov		BYTE[rdi + rax], dl	; rdi[rax] = dl
	mov		rax, rdi			; rax = rdi
	jmp		return				; jump to return

return:
	ret							; return (rax)