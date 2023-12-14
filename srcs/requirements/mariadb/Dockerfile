FROM	debian:buster-slim

RUN	apt-get update -y
RUN	apt-get upgrade -y

RUN	apt-get install mariadb-server -y

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	conf/my_conf.sh /my_config.sh

ENTRYPOINT	["bash", "my_config.sh"]

EXPOSE	3306
