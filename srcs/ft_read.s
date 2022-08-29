# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yochoi <yochoi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/22 04:16:13 by yochoi            #+#    #+#              #
#    Updated: 2020/03/22 18:17:59 by yochoi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; rax = Syscall num
; rdi = fd		ex)mov rbx, 0 <-- is stdin
; rsi = memory space to store read data from the file
; rdx = size of data to read
; Here's why I use the carry flag when dealing with errors:
; https://www.freebsd.org/doc/en_US.ISO8859-1/books/developers-handbook/x86-return-values.html

section .text
	global	_ft_read

_ft_read:
	mov		rax, 0x2000003	; rax = 0x2000003 --> syscall number of read function
	syscall					; call read function(0x2000003)
	jc		error			; the carry flag is cleared upon success, set upon failure.
	ret						; return (rax);

error:
	mov		rax, -1			; rax = -1
	ret						; return (rax);