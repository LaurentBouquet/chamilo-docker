FROM php:7.3-fpm

RUN apt-get update --fix-missing

# Install MySQL PDO
RUN apt-get install -y git libpq-dev libzip-dev libpng-dev libxml2-dev \
    && docker-php-ext-configure mysqli -with-mysqli=mysqlnd \
    && docker-php-ext-configure pdo_mysql -with-pdo-mysql=mysqlnd \
    && docker-php-ext-install pdo pdo_mysql mysqli bcmath exif gd soap zip intl

RUN pecl install xdebug-2.9.4 \
    && docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

COPY config/php.ini /usr/local/etc/php/conf.d/
WORKDIR /chamilo
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["bash", "/usr/local/bin/entrypoint.sh"]
