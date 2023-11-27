
MV_PATH= mariadb
WV_PATH= wordpress

all:
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build

vol:
	sudo mkdir -p ${MV_PATH}
	sudo mkdir -p ${WV_PATH}
	sudo chown -R $USER:$USER ${MV_PATH}
	sudo chown -R $USER:$USER ${WV_PATH}

clean:	
	sudo rm -rf ${MV_PATH} ${WV_PATH}

fclean:
	clean
	sudo docker system prune -af --volumes
	docker volume rm srcs_mariadb-data srcs_wordpress-data

.PHONY: all vol clean fclean
