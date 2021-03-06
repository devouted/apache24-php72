FROM php:7.2-apache
RUN apt-get update && apt-get install -y gnupg && apt-key update -y && apt-get upgrade -y
RUN apt-get install -y bash git ca-certificates curl zip zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev software-properties-common  mysql-client mc
RUN a2enmod proxy proxy_ajp proxy_http rewrite deflate headers proxy_balancer proxy_connect proxy_html substitute expires vhost_alias
COPY ./config/apache2/sites-available/001-wildcard.conf /etc/apache2/sites-available/001-wildcard.conf
RUN a2ensite 001-wildcard.conf
