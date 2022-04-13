FROM dmstr/php-yii2:latest-nginx
WORKDIR /app
COPY . .
RUN chmod -R 777 /app/web/assets 
RUN chmod -R 777 /app/runtime