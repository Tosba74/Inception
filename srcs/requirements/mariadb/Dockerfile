# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bmangin <bmangin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/15 17:33:10 by bmangin           #+#    #+#              #
#    Updated: 2022/03/15 17:56:11 by bmangin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

LABEL	maintainer ${MAIL42}

RUN		apt-get update && apt-get upgrade -y && apt-get install -y vim git wget curl zsh
RUN		apt-get install -y mariadb-server

EXPOSE	3306

