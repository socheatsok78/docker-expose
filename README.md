# About

This is a custom Docker image for the [Expose](https://expose.dev) tunneling service. It configured to support both self-hosted and public servers and can be use as a standalone server or as a client to connect to the servers.

## What is Expose?

A beautiful, fully open-source, tunneling service - written in pure PHP

[Website](https://expose.dev/) | [Source code](https://github.com/beyondcode/expose)

## Usage

### Running as a server

```bash
docker run -d --name expose-server -p 80:80 -e EXPOSE_SERVER_DOMAIN=sharedwithexpose.localhost -e EXPOSE_SERVER_PORT=80 -e EXPOSE_SERVER_ADMIN_USERNAME=admin -e EXPOSE_SERVER_ADMIN_PASSWORD=expose socheatsok78/expose:main
```

### Running as a client

```bash
# WIP
```

### Environment variables

- `EXPOSE_SERVER_DOMAIN` - The domain of the server, defaults to `localhost`
- `EXPOSE_SERVER_PORT` - The port of the server, defaults to `443`
- `EXPOSE_SERVER_ADMIN_USERNAME` - The username for the admin panel, defaults to `admin`
- `EXPOSE_SERVER_ADMIN_PASSWORD` - The password for the admin panel, defaults to `expose`

**Optional**:
- `EXPOSE_DEFAULT_SERVER` - The default server to use, defaults to `self-hosted`
- `EXPOSE_SERVER_ENDPOINT_URL` - The endpoint URL of the Expose public servers, defaults to `https://expose.dev/api/servers`
