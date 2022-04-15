NAME	= Inception
override PATH_S	:= srcs
CD	:= cd
RM	:= rm -f
COMPOSE := ${CD} ${PATH_S} && docker-compose -p ${NAME}

all: .up

folders:
	sudo mkdir -p /User/bmangin/data
	sudo mkdir -p /User/bmangin/data/dbdata
	sudo mkdir -p /User/bmangin/data/wpdata

.up:	folders
	${COMPOSE} up -d --build
ifeq ("$(wildcard .config-done)","")
	sudo chmod 777 /etc/hosts
	sudo echo "127.0.0.1 bmangin.42.fr" >> /etc/hosts
	touch .config-done
endif

clean:
	${COMPOSE} stop 
	docker network prune -f

fclean:
	${COMPOSE} down -v
	sudo rm -rf ${HOME}/data

prune:	fclean
	docker system prune --volumes --force --all

image:	prune
	docker rmi -f ${shell docker images -a -q}

re:		fclean all

.PHONY: all folders .up clean fclean prune image re
