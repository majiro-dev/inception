
MV_PATH= mariadb
WV_PATH= wordpress

all:
	$(MAKE) vol
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build

vol:
	sudo mkdir -p ${MV_PATH}
	sudo mkdir -p ${WV_PATH}
	sudo chown -R $(USER):$(USER) ${MV_PATH}
	sudo chown -R $(USER):$(USER) ${WV_PATH}

restart:
	sudo systemctl restart docker

volrm:
	sudo docker system prune -af --volumes
	docker volume rm srcs_mariadb srcs_wordpress	
	sudo rm -rf ${MV_PATH} ${WV_PATH}

clean:
	sudo docker compose -f srcs/docker-compose.yml down
	sudo docker compose -f srcs/docker-compose.yml rm -f

fclean:
	$(MAKE) clean
	$(MAKE) volrm

re:
	$(MAKE) fclean
	$(MAKE) all

logs:
	sudo docker compose -f ./srcs/docker-compose.yml logs

.PHONY: all vol clean fclean re logs volrm
