# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: josanton <josanton@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/12 16:31:17 by josanton          #+#    #+#              #
#    Updated: 2022/06/22 17:03:09 by josanton         ###   ########.fr        #
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
			${GCC} ${^}  -o ${@}

${CNAME}:	${CSRC}
			${MAKE} -C ./libft
			${GCC} ${^} -o ${@}

submodule:
			@git submodule update --init --recursive

all:		${SNAME} ${CNAME} submodule

clean:
			$(MAKE) clean -C ./libft

fclean:		clean
			$(MAKE) fclean -C ./libft
			${RM} ${SNAME}
			${RM} ${CNAME}

re:			fclean all

.PHONY:		all clean fclean re submodule
