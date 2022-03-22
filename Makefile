override PATH_S	:= srcs

CD	:= cd
RM	:= rm -rf

all:
	${CD} ${PATH_S} && docker-compose up --build -d

clean:
	${CD} ${PATH_S} && docker-compose down
	${CD} ${PATH_S} && docker volume ${RM} /home/bmangin/data/dbdata
	${CD} ${PATH_S} && docker volume ${RM} /home/bmangin/data/wpdata

fclean:
	docker system prune -f
	docker rmi -f ${shell docker images -a -q}

re: clean all
