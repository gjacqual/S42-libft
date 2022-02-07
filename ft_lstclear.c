/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstclear.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gjacqual <gjacqual@student.21-school.ru>   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/07 01:36:45 by gjacqual          #+#    #+#             */
/*   Updated: 2022/02/07 02:09:20 by gjacqual         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_lstclear(t_list **lst, void (*del)(void*))
{
	t_list *tmp;
	
	if (*lst && lst && del)
	{	
		while(*lst)
		{
			tmp = (*lst)->next;
			ft_lstdelone(*lst, del);
			*lst = tmp;
		}
		lst = NULL;
	}
}
