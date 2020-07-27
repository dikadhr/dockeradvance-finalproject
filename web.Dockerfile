FROM php:7.2-apache
LABEL mainteiner="dikadhr3@gmail.com"
RUN apt-get update && apt-get install curl -y
RUN apt-get clean && \ 
     apt-get autoremove -y
RUN docker-php-ext-install pdo pdo_mysql
COPY myweb-app/file-web /var/www/html/
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
