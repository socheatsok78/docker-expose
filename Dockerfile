FROM php:8.1-cli AS base
RUN apt-get update \
    && apt-get install -y libzip-dev zip ca-certificates dumb-init \
    && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install zip

# Compile the source code
FROM base AS build
RUN apt-get update \
    && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Add the source code
ADD https://github.com/beyondcode/expose.git#master /src
WORKDIR /src
RUN composer install -o --prefer-dist && chmod a+x expose

# Build the final image
FROM base
COPY --from=build /src /src
WORKDIR /src
ADD rootfs /
RUN chmod 755 /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "serve" ]
