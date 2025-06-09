[![Docker Build and Publish](https://github.com/MatteoR23/docker-caddy-dns-crowdsec-geoip/actions/workflows/cicd.yml/badge.svg)](https://github.com/MatteoR23/docker-caddy-dns-crowdsec-geoip/actions/workflows/cicd.yml)

# docker-caddy-ovh-crowdsec-geoip

Forked version from [rom4nik/docker-caddy-dns](https://github.com/rom4nik/docker-caddy-dns)

Docker image containing [Caddy reverse proxy](https://caddyserver.com/) built with addition of [GeoIP](https://github.com/porech/caddy-maxmind-geolocation), [Crowdsec](https://github.com/hslatman/caddy-crowdsec-bouncer) and [OVH](https://github.com/caddy-dns/ovh) DNS provider modules.

GitHub Actions is used to ensure quick updates when upstream releases a new version.

## How to use
Follow [documentation](https://hub.docker.com/_/caddy) for official Docker image, replacing `caddy:<version>` with `ghcr.io/matteor23/docker-caddy-dns:<version>` (or `:latest`). While writing Caddyfile, enable the DNS challenge by following [those steps](https://caddy.community/t/how-to-use-dns-provider-modules-in-caddy-2/8148#enabling-the-dns-challenge-5).

## Thanks
Thank you to rom4nik, who originally created this repository
