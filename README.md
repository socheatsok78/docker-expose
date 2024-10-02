# About

This is a custom Docker image for the [Expose](https://expose.dev) tunneling service. It configured to support both self-hosted and public servers and can be use as a standalone server or as a client to connect to the servers.

## What is Expose?

A beautiful, fully open-source, tunneling service - written in pure PHP

[Website](https://expose.dev/) | [Source code](https://github.com/beyondcode/expose)

## Usage

### Running as a server

```bash
# Start a self-hosted server on port "80" with the domain "sharedwithexpose.localhost"
docker run -d --name expose-server -p 80:80 \
    -e EXPOSE_SERVER_DOMAIN=sharedwithexpose.localhost \
    -e EXPOSE_SERVER_PORT=80 \
    -e EXPOSE_SERVER_ADMIN_USERNAME=admin \
    -e EXPOSE_SERVER_ADMIN_PASSWORD=expose \
    socheatsok78/expose:main serve
```

**Environment variables**:
- `EXPOSE_SERVER_ADMIN_USERNAME` - The username for the admin panel, defaults to `admin`
- `EXPOSE_SERVER_ADMIN_PASSWORD` - The password for the admin panel, defaults to `expose`

### Running as a client

```bash
# Connect to a self-hosted server running on "sharedwithexpose.localhost:80" and expose "http://your-local-service:80"
docker run -d --name expose-server -p 80:80 \
    -e EXPOSE_SERVER_DOMAIN=sharedwithexpose.localhost \
    -e EXPOSE_SERVER_PORT=80 \
    socheatsok78/expose:main share http://your-local-service:80
```

**Environment variables**:
- `EXPOSE_AUTH_TOKEN` - The authentication token for the server, defaults to `""`
- `EXPOSE_AUTH_BASIC` - The basic authentication for the server, defaults to `""`

### Environment variables

- `EXPOSE_SERVER_DOMAIN` - The domain of the server, defaults to `localhost`
- `EXPOSE_SERVER_PORT` - The port of the server, defaults to `443`
- `EXPOSE_DEFAULT_SERVER` - The default server to use, defaults to `self-hosted`
- `EXPOSE_SERVER_ENDPOINT_URL` - The endpoint URL of the Expose public servers, defaults to `https://expose.dev/api/servers`

## Docker Secrets

As an alternative to passing sensitive information via environment variables, `_FILE` may be appended to the previously listed environment variables, causing the initialization script to load the values for those variables from files present in the container. In particular, this can be used to load passwords from Docker secrets stored in `/run/secrets/<secret_name>` files. For example:

```bash
docker run -d --name expose-server -p 80:80 \
    -e EXPOSE_SERVER_DOMAIN=sharedwithexpose.localhost \
    -e EXPOSE_SERVER_PORT=80 \
    -e EXPOSE_SERVER_ADMIN_USERNAME_FILE=/run/secrets/username \
    -e EXPOSE_SERVER_ADMIN_PASSWORD_FILE=/run/secrets/password \
    socheatsok78/expose:main serve
```

Currently, this is only supported for `EXPOSE_SERVER_ADMIN_USERNAME`, `EXPOSE_SERVER_ADMIN_PASSWORD`, `EXPOSE_AUTH_TOKEN` and `EXPOSE_AUTH_BASIC`.

## License
The MIT License (MIT). Please see [License File](LICENSE) for more information.
