# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bmangin <bmangin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/15 17:20:35 by bmangin           #+#    #+#              #
#    Updated: 2022/03/15 18:09:10 by bmangin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

override PATH_S	:= srcs

CD				:= cd

all:
	${CD} ${PATH_S} && docker-compose up --build -d

clean:
	${CD} ${PATH_S} && docker-compose down
	${CD} ${PATH_S} && docker volume rm dbdata
#	${CD} ${PATH_S} && docker volume rm wpdata

fclean:
	docker system prune -f
	docker rmi -f ${shell docker images -a -q}

re: clean all