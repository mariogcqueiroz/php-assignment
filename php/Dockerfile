FROM php:8.3-fpm-alpine
WORKDIR /usr/share/nginx/html

# Copie os arquivos PHP e a configuração do PHP
COPY web/index.php /usr/share/nginx/html
#COPY config/php.ini /usr/local/etc/php/php.ini
#COPY custom-www.conf /usr/local/etc/php-fpm.d/custom-www.conf

EXPOSE 6680
CMD ["php-fpm"]