FROM php:8.3-fpm-alpine
RUN apk update && apk upgrade
#WORKDIR /usr/share/nginx/html

# Copie os arquivos PHP e a configuração do PHP
#COPY web/index.html /usr/share/nginx/html
COPY web /app
#COPY config/php.ini /usr/local/etc/php/php.ini
#COPY custom-www.conf /usr/local/etc/php-fpm.d/custom-www.conf

EXPOSE 9000
CMD ["php-fpm"]