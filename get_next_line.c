/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gjacqual <gjacqual@student.21-school.ru>   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/07/12 20:25:59 by gjacqual          #+#    #+#             */
/*   Updated: 2022/05/02 19:45:30 by gjacqual         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"

char	*ft_get_line(char **line, char **tail)
{
	char		*p_end;
	char		*tmp;
	int			len;

	p_end = ft_strchr(*tail, '\n');
	if (!p_end && **tail)
		*line = ft_strdup(*tail);
	else if (p_end)
		*line = ft_substr(*tail, 0, p_end - *tail + 1);
	else
	{
		free(*tail);
		*tail = NULL;
		*line = NULL;
		return (*line);
	}
	len = ft_strlen(*line);
	tmp = ft_strdup(*tail + len);
	free(*tail);
	*tail = tmp;
	if (*tail == NULL)
	{
		free(*tail);
	}
	return (*line);
}

char	*get_next_line(int fd)
{
	static char	*tail[OPEN_MAX];
	int			reading_size;
	char		*buf;
	char		*line;

	reading_size = 1;
	if (read(fd, 0, 0) < 0 || BUFFER_SIZE < 1 || fd < 0)
		return (NULL);
	buf = (char *)malloc(sizeof(char) * BUFFER_SIZE + 1);
	if (!buf)
		return (NULL);
	while (reading_size && !(ft_strchr(tail[fd], '\n')))
	{
		reading_size = read(fd, buf, BUFFER_SIZE);
		buf[reading_size] = '\0';
		tail[fd] = ft_strjoin_mod(tail[fd], buf);
		if (tail[fd] == NULL)
		{
			free(tail[fd]);
			free(buf);
			return (NULL);
		}
	}
	free(buf);
	return (line = ft_get_line(&line, &tail[fd]));
}

char	*ft_strjoin_mod(char const *s1, char const *s2)
{
	char	*newstr;
	size_t	s1size;
	size_t	s2size;
	size_t	newsize;

	if (!s1 && !s2)
		return (NULL);
	s1size = ft_strlen(s1);
	s2size = ft_strlen(s2);
	newsize = (s1size + s2size + 1);
	newstr = (char *)malloc(sizeof(char) * newsize);
	if (!newstr)
	{
		free((char *)newstr);
		return (NULL);
	}
	ft_memmove(newstr, s1, s1size);
	ft_memmove(newstr + s1size, s2, s2size);
	newstr[newsize - 1] = '\0';
	free((char *)s1);
	return (newstr);
}
