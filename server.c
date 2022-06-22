/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: josanton <josanton@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/05/13 10:15:16 by josanton          #+#    #+#             */
/*   Updated: 2022/05/13 10:15:16 by josanton         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

char	g_c = 32;

static void	handle_user_sig(int sig)
{
	if (sig == SIGUSR1)
		g_c++;
	else
	{
		write(1, &g_c, 1);
		g_c = 32;
	}
}

int	main(void)
{
	int					pid;
	struct sigaction	sa;

	sa.sa_mask = 0;
	pid = getpid();
	ft_printf("%d\n", pid);
	sa.sa_flags = SA_RESTART;
	sa.sa_handler = &handle_user_sig;
	sigaction(SIGUSR1, &sa, NULL);
	sigaction(SIGUSR2, &sa, NULL);
	while (1)
		pause();
	return (0);
}
