# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gjacqual <gjacqual@student.21-school.ru>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/08 17:47:04 by gjacqual          #+#    #+#              #
#    Updated: 2022/02/08 00:37:42 by gjacqual         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Program conf
NAME		:= libft.a

# Compilation Parameters

CC			:= clang
CFLAGS		:= -Wall -Wextra -Werror
RM			:= rm -f

# Includes
INC			:= libft.h
# Sources
SRCS	:= 	ft_putchar_fd.c\
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
			ft_memccpy.c

SRCS_B	:=	ft_lstnew.c\
			ft_lstadd_front.c\
			ft_lstsize.c\
			ft_lstlast.c\
			ft_lstadd_back.c\
			ft_lstdelone.c\
			ft_lstclear.c\
			ft_lstiter.c\
			ft_lstmap.c

# Object files
OBJS 		:= ${SRCS:.c=.o}
OBJS_B 		:= ${SRCS_B:.c=.o}

# Targets
all: 		 ${NAME}

${NAME}		:	${OBJS}
				ar rcs ${NAME} ${OBJS}
				@echo "Libft is Ready"

bonus		:	${OBJS_B}
				ar rcs ${NAME} ${OBJS_B}
				@echo "Libft with Bonus is Ready"

# for unit_tests in Linux
.PHONY:	so
so:
	$(CC) -nostartfiles -fPIC $(CFLAGS) $(SRCS) $(SRCS_B)
	gcc -nostartfiles -shared -o libft.so $(OBJS) $(OBJS_B)

#Utils
clean		:
	@${RM} ${OBJS} ${OBJS_B}
	@echo "Libft is Cleaned"

fclean		:	clean
	@${RM} ${NAME}
	@echo "Libft is Full Cleaned"	

re			:	fclean all

.PHONY:	all clean fclean re bonus
