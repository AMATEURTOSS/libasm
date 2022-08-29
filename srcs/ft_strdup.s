# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yochoi <yochoi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/22 04:45:41 by yochoi            #+#    #+#              #
#    Updated: 2020/03/22 18:44:09 by yochoi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_strdup
	extern	_malloc
	extern	_ft_strlen
	extern	_ft_strcpy

_ft_strdup:
	cmp		rdi, 0		; if (rdi == 0) ZF = 1
	jz		error		; if (ZF = 1) jump to error
	call	_ft_strlen	; ft_strlen(rdi)
	inc		rax			; rax++ --> len of rdi
	push	rdi			; store rdi in stack memory
	mov		rdi, rax	; rdi = rax
	call	_malloc		; malloc(rdi)
	cmp		rax, 0		; if (rax == 0) ZF = 1
	jz		error		; if (ZF == 1) jump to error --> malloc error
	pop		rdi			; store the value in stack memory in rdi
	mov		rsi, rdi	; rsi = rdi
	mov		rdi, rax	; rdi = rax
	call	_ft_strcpy	; ft_strcpy(rdi, rsi)
	jmp		return		; jump to return

error:
	mov		rax, 0		; rax = 0
	jmp		return		; jump to return

return:
	ret					; return (rax)