# Compile the source code
FROM php:8.1-cli AS build
RUN apt-get update \
    && apt-get install -y git libzip-dev zip
RUN docker-php-ext-install zip
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Add the source code
ADD https://github.com/beyondcode/expose.git#master /src
WORKDIR /src
RUN composer install -o --prefer-dist && chmod a+x expose

# Build the final image
FROM php:8.1-cli
RUN apt-get update \
    && apt-get install -y libzip-dev zip ca-certificates dumb-init
RUN docker-php-ext-install zip

# Copy the built binary
COPY --from=build /src /src
WORKDIR /src

# Overlay the rootfs
ADD rootfs /
RUN chmod 755 /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "serve" ]
