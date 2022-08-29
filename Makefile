# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yochoi <yochoi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/20 01:21:44 by yochoi            #+#    #+#              #
#    Updated: 2020/06/18 17:24:04 by yochoi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

## MAKEFILE ##

# COLORS #

# This is a minimal set of ANSI color codes
_END		=	\033[0;0m
_BOLD		=	\033[0;1m
_UNDER		=	\033[0;4m
_REV		=	\033[0;7m

# Colors
_GREY		=	\033[0;30m
_RED		=	\033[0;31m
_GREEN		=	\033[0;32m
_YELLOW		=	\033[0;33m
_BLUE		=	\033[0;34m
_PURPLE		=	\033[0;35m
_CYAN		=	\033[0;36m
_WHITE		=	\033[0;37m

# Inverted, i.e. colored backgrounds
_IGREY		=	\033[0;40m
_IRED		=	\033[0;41m
_IGREEN		=	\033[0;42m
_IYELLOW	=	\033[0;43m
_IBLUE		=	\033[0;44m
_IPURPLE	=	\033[0;45m
_ICYAN		=	\033[0;46m
_IWHITE		=	\033[0;47m

# **************************************************************************** #

.PHONY: re fclean clean test

NAME =	libasm.a

CC = gcc
CFLAGS = -Wall -Wextra -Werror -I$(INC_DIR)

SRC_DIR = ./srcs/
SRCS = $(addprefix $(SRC_DIR), $(SRC))
SRC = 	ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s

OBJ_DIR = ./obj/
OBJS = $(addprefix $(OBJ_DIR), $(OBJ))
OBJ = ${SRC:.s=.o}

INC_DIR = ./includes/

all: $(NAME)

$(NAME): $(OBJ_DIR) $(OBJS)
	@echo "$(_GREEN) All files compiled. $(_END)"
	@ar rcs $(NAME) $(OBJS)
	@echo "$(_GREEN) Library '$(NAME)' compiled. $(_END)"

$(OBJ_DIR)%.o: $(SRC_DIR)%.s
	@nasm -f macho64 $< -o $@

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

test: all
	@gcc ./srcs/main.c libasm.a
	@touch test.txt
	@./a.out

clean:
		@rm -rf $(OBJS)
		@rm -rf $(OBJ_DIR)
		@echo "$(_RED)'"$(OBJ_DIR)"' has been deleted. $(_END)"
fclean: clean
		@rm -rf $(NAME)
		@echo "$(_RED)'"$(NAME)"' has been deleted. $(_END)"
		@rm -rf a.out
		@echo "$(_RED)'"a.out"' has been deleted. $(_END)"
		@rm -rf test.txt
		@echo "$(_RED)'"test.txt"' has been deleted. $(_END)"
re: fclean all