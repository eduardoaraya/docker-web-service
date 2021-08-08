FROM php:8-fpm
COPY ./src/backend /var/www/backend
EXPOSE 9000
WORKDIR /var/www/backend
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd
CMD ["php-fpm"]
