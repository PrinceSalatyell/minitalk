# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/12 16:31:17 by josanton          #+#    #+#              #
#    Updated: 2022/05/13 21:23:34 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# SERVER

SSRC	=	server.c

SNAME	=	server

# CLIENT

CSRC	=	client.c

CNAME	=	client

GCC		=	gcc -Wall -Wextra -Wextra -L libft -lft

RM		=	rm -f

${SNAME}:	${SSRC}
			${MAKE} -C ./libft
			${GCC} ${SSRC}  -o ${SNAME}

${CNAME}:	${CSRC}
			${MAKE} -C ./libft
			${GCC} ${CSRC} -o ${CNAME}

all:		${SNAME} ${CNAME}

clean:		
			$(MAKE) clean -C ./libft

fclean:		clean
			$(MAKE) fclean -C ./libft
			${RM} ${SNAME}
			${RM} ${CNAME}

re:			fclean all

.PHONY:		all clean fclean re