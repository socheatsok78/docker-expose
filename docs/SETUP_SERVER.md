# Deployment guides

This directory contains deployment guides for running Expose server with fully valid SSL certificates using Cloudflare.

- Create a Cloudflare account
- Add a domain to Cloudflare
- Add Proxied DNS Record of your naked domain, e.g.: `sharedwithexpose.localhost`
- Add Proxied DNS Record of your `expose` subdomain, e.g.: `expose.sharedwithexpose.localhost`
- Add Proxied wildcard DNS Record of your domain, e.g.: `*.sharedwithexpose.localhost`
- Create a Cloudflare Origin Certificate and download it
- Deploy Expose server with all your necessary configurations

## Overview

![alt text](image.png)
