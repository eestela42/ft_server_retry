# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/06 15:59:20 by user42            #+#    #+#              #
#    Updated: 2021/03/06 15:59:33 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
RUN apt-get update -y && \
apt-get upgrade -y && \
apt-get install -y nginx \
mariadb-server \
php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-cgi php7.3-mbstring \
wget zip tar

ARG autoindex=1
ENV var_autoindex=${autoindex}
COPY srcs/start.sh /root
COPY srcs/config.inc.php /root
COPY srcs/ssl.conf /etc/nginx/sites-available/localhost.conf
COPY srcs/wordpress.tar.gz /root
COPY srcs/phpMyAdmin.zip /root

RUN chmod u+x /root/start.sh
CMD ["/root/start.sh"]
