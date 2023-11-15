FROM	debian:buster

RUN	apt update
RUN	apt upgrade
RUN	apt install nginx -y

RUN	apt install vim -y
RUN	apt install curl -y

RUN	apt install openssl -y
RUN	mkdir -p /etc/nginx/ssl
RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=ES/ST=AN/L=Malaga/O=42/OU=42/CN=manujime.42.fr/UID=manujime"		

RUN	mkdir -p /var/run/nginx

COPY	conf/nginx.conf /etc/nginx/nginx.conf
