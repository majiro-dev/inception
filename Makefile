MV_PATH= './data/wordpress'
WV_PATH= './data/mariadb'

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

reset:
	docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null	
up:
	sudo docker compose -f ./srcs/docker-compose.yml up -d

stop:
	sudo docker compose -f ./srcs/docker-compose.yml stop
.PHONY: all vol clean fclean re logs volrm reset stop up
