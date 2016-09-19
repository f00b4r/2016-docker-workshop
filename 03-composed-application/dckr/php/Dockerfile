FROM php:7.0-fpm

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl && \
    docker-php-ext-install mysqli && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

WORKDIR /srv