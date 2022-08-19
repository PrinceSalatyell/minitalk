# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: salatiel <salatiel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/12 16:31:17 by josanton          #+#    #+#              #
#    Updated: 2022/08/19 15:35:27 by salatiel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# SERVER

SSRC	=	server.c

SNAME	=	server

# CLIENT

CSRC	=	client.c

CNAME	=	client

GCC		=	gcc -Wall -Wextra -Wextra

RM		=	rm -f

${SNAME}:	${SSRC}
			${MAKE} -C ./libft
			${GCC} -o ${SNAME} ${SSRC} -Llibft/ -lft

${CNAME}:	${CSRC}
			${MAKE} -C ./libft
			${GCC} -o ${CNAME} ${CSRC} -Llibft/ -lft

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
