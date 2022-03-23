override PATH_S	:= srcs

CD	:= cd
RM	:= rm -f

all:
	${CD} ${PATH_S} && docker-compose up --build -d

clean:
	${CD} ${PATH_S} && docker-compose down
	${CD} ${PATH_S} && docker volume ${RM} dbdata
	${CD} ${PATH_S} && docker volume ${RM} wpdata

fclean:
	docker system prune -f
	docker rmi -f ${shell docker images -a -q}

re: clean all

.PHONY: all clean fclean re
