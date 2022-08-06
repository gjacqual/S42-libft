# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gjacqual <gjacqual@student.21-school.ru>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/08 17:47:04 by gjacqual          #+#    #+#              #
#    Updated: 2022/05/03 13:23:07 by gjacqual         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Program conf
NAME		:=	libft.a

# Compilation Parameters

CC			:= cc
CFLAGS		:= -Wall -Wextra -Werror
RM			:= rm -f

# Includes
INC			:= libft.h
# Sources
SRCS		:= 	ft_putchar_fd.c\
				ft_putstr_fd.c\
				ft_memset.c\
				ft_isdigit.c\
				ft_isalpha.c\
				ft_memcmp.c\
				ft_memcpy.c\
				ft_bzero.c\
				ft_atoi.c\
				ft_memchr.c\
				ft_strlen.c\
				ft_strmapi.c\
				ft_strncmp.c\
				ft_tolower.c\
				ft_toupper.c\
				ft_isalnum.c\
				ft_isascii.c\
				ft_isprint.c\
				ft_calloc.c\
				ft_memmove.c\
				ft_strchr.c\
				ft_strrchr.c\
				ft_putnbr_fd.c\
				ft_strjoin.c\
				ft_putendl_fd.c\
				ft_itoa.c\
				ft_strdup.c\
				ft_strlcat.c\
				ft_strnstr.c\
				ft_strlcpy.c\
				ft_substr.c\
				ft_strtrim.c\
				ft_split.c\
				ft_striteri.c\
				ft_memccpy.c\
				ft_lstnew.c\
				ft_lstadd_front.c\
				ft_lstsize.c\
				ft_lstlast.c\
				ft_lstadd_back.c\
				ft_lstdelone.c\
				ft_lstclear.c\
				ft_lstiter.c\
				ft_lstmap.c\
				ft_strcmp.c\
				get_next_line.c
			

# Object files
OBJS_DIR	:=	./objs

OBJS		:=  ${addprefix ${OBJS_DIR}/, ${notdir ${SRCS:.c=.o}}}

# Targets
all	:	${NAME}

${NAME}	:	${OBJS}
				@ar rcs $@ $^
				@echo "\033[0;32mLibft is Ready\033[0m"
				
${OBJS_DIR}: 
			@mkdir -p ${OBJS_DIR}
			
${OBJS_DIR}/%.o : %.c ${INC} Makefile | ${OBJS_DIR}  
			${CC} ${CFLAGS} -c $< -o $@

#Utils
clean		:
	@rm -rf ${OBJS_DIR} 
	@echo "\033[0;96mLibft is Cleaned\033[0m"

fclean		:	clean
	@${RM} ${NAME}
	@echo "\033[0;96mLibft is Full Cleaned\033[0m"	

re			:	fclean all

.PHONY:	all clean fclean re
