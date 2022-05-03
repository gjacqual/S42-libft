/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.h                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gjacqual <gjacqual@student.21-school.ru>   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/07/12 20:27:59 by gjacqual          #+#    #+#             */
/*   Updated: 2022/05/03 14:55:03 by gjacqual         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef GET_NEXT_LINE_H
# define GET_NEXT_LINE_H

# include <unistd.h>
# include <stdlib.h>
# include <limits.h>
# include "libft.h"

# ifndef BUFFER_SIZE
#  define BUFFER_SIZE 34
# endif

/*
*	Identify platform/compiler from preprocessor macros
*	https://stackoverflow.com/questions/4605842/how-to-identify-\
*	platform-compiler-from-preprocessor-macros
*/

# ifdef __linux__
#  define OPEN_MAX 1024
# endif

char	*get_next_line(int fd);
char	*ft_get_line(char **tail, char **line);
char	*ft_strjoin_mod(char const *s1, char const *s2);

#endif 