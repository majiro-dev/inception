FROM	debian:buster

RUN	apt update -y
RUN	apt upgrade -y

RUN	apt-get install mariadb-server -y

RUN	apt install vim -y
RUN	apt install curl -y

COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY	conf/my_conf.sh /my_config.sh

ENTRYPOINT	["bash", "my_config.sh"]

EXPOSE	3306
