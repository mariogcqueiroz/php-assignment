FROM php:7.4-fpm
WORKDIR /usr/share/nginx/html
COPY web/index.php /usr/share/nginx/html
COPY config/php.ini /usr/local/etc/php.ini

EXPOSE 6880

CMD service start php-fpm