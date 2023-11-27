FROM	debian:buster

RUN	apt update -y
RUN	apt upgrade -y
RUN	apt install nginx -y

RUN	apt install vim -y
RUN	apt install curl -y

RUN	apt install openssl -y
RUN	mkdir -p /etc/nginx/ssl
RUN	openssl req -newkey rsa:4096 -days 42 -nodes -x509  \
	 -subj "/C=ES/ST=AN/L=Malaga/O=42/OU=42/CN=manujime.42.fr/UID=manujime" \
	 -out /etc/nginx/ssl/inception.crt \
	 -keyout /etc/nginx/ssl/inception.key

RUN	mkdir -p /var/run/nginx

COPY	conf/nginx.conf /etc/nginx/nginx.conf

RUN 	chmod 755 /var/www/html
RUN	chown -R www-data:www-data /var/www/html

CMD	["nginx", "-g", "daemon off;"]
