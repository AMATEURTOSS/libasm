# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yochoi <yochoi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/21 16:27:17 by yochoi            #+#    #+#              #
#    Updated: 2020/03/21 20:22:04 by yochoi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_strcmp

_ft_strcmp:
	mov		rax, 0				; rax = 0
	jmp		cmp_loop			; jump to cmp_loop

cmp_loop:
	cmp		byte [rdi + rax], 0	; if (rdi[rax] == 0) ZF = 1
	jz		final				; if (ZF == 1) jump to final
	cmp		byte [rsi + rax], 0	; if (rsi[rax] == 0) ZF = 1
	jz		final				; if (ZF == 1) jump to final
	mov		dl, byte [rdi + rax]; dl = rdi[rax]
	cmp		dl, byte [rsi + rax]; if (dl == rsi[rax]) ZF = 1
	jnz		final				; if (!ZF == 1) jump to final
	add		rax, 1				; rax++
	jmp		cmp_loop			; jump to cmp_loop

final:
	mov		dl, byte [rdi + rax]; dl = rdi[rax]
	sub		dl, byte [rsi + rax]; dl -= rsi[rax]
	movsx		rax, dl				; rax = dl
	jmp		return				; jump to return

return:
	ret							; return (rax);
