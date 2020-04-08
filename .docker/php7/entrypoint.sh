#!/bin/bash
export COMPOSER_ALLOW_SUPERUSER=1
if [ ! -d "vendor" ]; then
    echo "Chamilo not installed - deploying."
    git clone --progress -b "${CHAMILO_VERSION}" --single-branch --depth 1 https://github.com/chamilo/chamilo-lms /tmp/chamilo
    shopt -s dotglob nullglob
    mv /tmp/chamilo/* /chamilo
    rm -rf /tmp/chamilo
    COMPOSER_MEMORY_LIMIT=-1 composer global require hirak/prestissimo
    COMPOSER_MEMORY_LIMIT=-1 composer install --prefer-dist
fi
chown -R www-data:www-data app main/default_course_document web
php-fpm