[![Docker Build and Publish](https://github.com/MatteoR23/docker-caddy-dns-crowdsec-geoip/actions/workflows/cicd.yml/badge.svg)](https://github.com/MatteoR23/docker-caddy-dns-crowdsec-geoip/actions/workflows/cicd.yml)

# docker-caddy-dns-crowdsec-geoip

Forked version from [rom4nik/docker-caddy-dns](https://github.com/rom4nik/docker-caddy-dns)

Docker image containing [Caddy reverse proxy](https://caddyserver.com/) built with addition of the DNS Challange for the following providers:
- [OVH](https://github.com/caddy-dns/ovh) 
- [Cloudflare](https://github.com/caddy-dns/cloudflare)

With the addition of:
- [GeoIP](https://github.com/porech/caddy-maxmind-geolocation)
- [Crowdsec](https://github.com/hslatman/caddy-crowdsec-bouncer) and  DNS provider modules.

GitHub Actions is used to ensure quick updates when upstream releases a new version.

## How to use

### Pull the image

```sh
docker pull ghcr.io/matteor23/docker-caddy-dns-crowdsec-geoip:latest
```
Or use a specific version:
```sh
docker pull ghcr.io/matteor23/docker-caddy-dns-crowdsec-geoip:<version>
```

### Run with Docker

```sh
docker run -d \
  -p 80:80 -p 443:443 \
  -v $PWD/Caddyfile:/etc/caddy/Caddyfile \
  -v $PWD/site:/srv \
  -v caddy_data:/data \
  -v caddy_config:/config \
  --name caddy \
  ghcr.io/matteor23/docker-caddy-dns-crowdsec-geoip:latest
```

### Example Caddyfile with DNS Challenge

```Caddyfile
example.com {
  tls {
    dns cloudflare {env.CLOUDFLARE_API_TOKEN}
  }
  reverse_proxy localhost:8080
}
```

### Environment variables for DNS providers

Set the required environment variables for your DNS provider. For example, for Cloudflare:

```sh
export CLOUDFLARE_API_TOKEN=your_cloudflare_api_token
```

For OVH, see [caddy-dns/ovh documentation](https://github.com/caddy-dns/ovh).

### Enable GeoIP and Crowdsec

Refer to the respective plugin documentation for configuration:
- [GeoIP plugin usage](https://github.com/porech/caddy-maxmind-geolocation)
- [Crowdsec plugin usage](https://github.com/hslatman/caddy-crowdsec-bouncer)

### Docker Compose example

```yaml
version: "3"
services:
  caddy:
    image: ghcr.io/matteor23/docker-caddy-dns-crowdsec-geoip:latest
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile
      - ./site:/srv
      - caddy_data:/data
      - caddy_config:/config
    environment:
      - CLOUDFLARE_API_TOKEN=your_cloudflare_api_token
volumes:
  caddy_data:
  caddy_config:
```

### More info

Follow [documentation](https://hub.docker.com/_/caddy) for official Docker image, replacing `caddy:<version>` with `ghcr.io/matteor23/docker-caddy-dns-crowdsec-geoip:<version>` (or `:latest`). While writing Caddyfile, enable the DNS challenge by following [those steps](https://caddy.community/t/how-to-use-dns-provider-modules-in-caddy-2/8148#enabling-the-dns-challenge-5).

## Thanks
Thank you to rom4nik, who originally created this repository
