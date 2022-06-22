/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: josanton <josanton@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/05/13 10:14:49 by josanton          #+#    #+#             */
/*   Updated: 2022/05/17 16:24:08 by josanton         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static int	check(char *str, int argv)
{
	int	i;

	i = 0;
	while (str[i])
	{
		if (str[i] < '0' || str[i] > '9')
		{
			ft_printf("Invalid PID");
			return (0);
		}
		i++;
	}
	if (argv != 3)
	{
		ft_printf("Wrong parameters");
		return (0);
	}
	return (1);
}

int	main(int argv, char	**argc)
{
	int	id;
	int	i;
	int	j;

	if (check(argc[1], argv))
	{
		id = ft_atoi(argc[1]);
		i = 0;
		j = argv;
		while (argc[2][i])
		{
			j = 32;
			while (j++ < argc[2][i])
			{
				kill(id, SIGUSR1);
				usleep(20);
			}
			usleep(20);
			kill(id, SIGUSR2);
			i++;
		}
	}
	return (0);
}
