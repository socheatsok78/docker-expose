![banner](https://camo.githubusercontent.com/10737acd1043ef8ccd809d5e95dfd3ea0f5bef590ee1f949f052a234d13550ae/68747470733a2f2f6578706f73652e6465762f696d616765732f6578706f73652f6f675f636172642e706e67)

# About

A custom built container image for the [Expose](https://expose.dev/) tunneling service.

[Source](https://github.com/socheatsok78/docker-expose) | [Docker Hub](https://hub.docker.com/r/socheatsok78/expose)

## What is Expose?

A beautiful, fully open-source, tunneling service - written in pure PHP

[Website](https://expose.dev/) | [Source code](https://github.com/beyondcode/expose)

## Usage

### Running as a server

```bash
# Start a self-hosted server on port "80" with the domain "sharedwithexpose.localhost"
# Environment variables specific to the server:
# - `EXPOSE_SERVER_ADMIN_USERNAME` - The username for the admin panel, defaults to `admin`
# - `EXPOSE_SERVER_ADMIN_PASSWORD` - The password for the admin panel, defaults to `expose`
docker run -d --name expose-server -p 80:80 \
    -e EXPOSE_SERVER_DOMAIN=sharedwithexpose.localhost \
    -e EXPOSE_SERVER_PORT=80 \
    -e EXPOSE_SERVER_ADMIN_USERNAME=admin \
    -e EXPOSE_SERVER_ADMIN_PASSWORD=expose \
    socheatsok78/expose:main serve
```

Visit `http://expose.sharedwithexpose.localhost` to access the admin panel.

### Running as a client

```bash
# Connect to a self-hosted server running on "sharedwithexpose.localhost:80" and expose "http://your-local-service:80"
# Environment variables specific to the client:
# - `EXPOSE_AUTH_TOKEN` - The authentication token for the server, defaults to `""`
# - `EXPOSE_AUTH_BASIC` - The basic authentication for the server, defaults to `""`
docker run -d --name expose-server -p 4040:4040 \
    -e EXPOSE_SERVER_DOMAIN=sharedwithexpose.localhost \
    -e EXPOSE_SERVER_PORT=80 \
    socheatsok78/expose:main share http://your-local-service:80
```

## Environment variables

These are global environment variables that can be used to configure both the Expose server and client.

- `EXPOSE_SERVER_DOMAIN` - The domain of the server, defaults to `localhost`
- `EXPOSE_SERVER_PORT` - The port of the server, defaults to `443`
- `EXPOSE_CONFIG_DEFAULT_SERVER` - The default server to use, defaults to `self-hosted`
- `EXPOSE_CONFIG_SERVER_ENDPOINT_URL` - The endpoint URL of the Expose public servers, defaults to `https://expose.dev/api/servers`

## Docker Secrets

As an alternative to passing sensitive information via environment variables, `_FILE` may be appended to the previously listed environment variables, causing the initialization script to load the values for those variables from files present in the container. In particular, this can be used to load passwords from Docker secrets stored in `/run/secrets/<secret_name>` files. For example:

```bash
docker run -d --name expose-server \
    -e EXPOSE_SERVER_DOMAIN=sharedwithexpose.localhost \
    -e EXPOSE_SERVER_PORT=80 \
    -e EXPOSE_SERVER_ADMIN_USERNAME_FILE=/run/secrets/username \
    -e EXPOSE_SERVER_ADMIN_PASSWORD_FILE=/run/secrets/password \
    socheatsok78/expose:main serve
```

Currently, this is only supported for `EXPOSE_SERVER_ADMIN_USERNAME`, `EXPOSE_SERVER_ADMIN_PASSWORD`, `EXPOSE_AUTH_TOKEN` and `EXPOSE_AUTH_BASIC`.

## License
The MIT License (MIT). Please see [License File](https://github.com/socheatsok78/docker-expose/raw/main/LICENSE) for more information.
