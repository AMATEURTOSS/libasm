# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yochoi <yochoi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/21 19:52:21 by yochoi            #+#    #+#              #
#    Updated: 2020/03/22 18:10:52 by yochoi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; https://filippo.io/making-system-calls-from-assembly-in-mac-os-x/
; rax = Syscall num
; rdi = fd		ex)mov rbx, 1 <-- is stdout
; rsi = memory space storing data to write to the file
; rdx = the length of data to write to the file
; Here's why I use the carry flag when dealing with errors:
; https://www.freebsd.org/doc/en_US.ISO8859-1/books/developers-handbook/x86-return-values.html

section .text
	global	_ft_write

_ft_write:
	mov		rax, 0x2000004	; rax = 0x2000004 --> syscall number of write function
	syscall					; call write function(0x2000004)
	jc		error			; the carry flag is cleared upon success, set upon failure.
	ret						; return (rax)

error:
	mov		rax, -1			; rax = -1
	ret						; return (rax)