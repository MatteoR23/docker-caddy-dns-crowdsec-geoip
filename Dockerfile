ARG CADDY_VERSION=
ARG OVH_DNS_VERSION=
ARG CROWDSEC_BOUNCER_VERSION=
ARG MAXMIND_GEOIP_VERSION=
ARG CLOUDFLARE_VERSION=

# Use the official Caddy image as the base for building
FROM docker.io/library/caddy:${CADDY_VERSION}-builder AS builder

# Build Caddy with OVH, Crowdsec and Geo IP modules
RUN xcaddy build \
	--with github.com/caddy-dns/ovh@${OVH_DNS_VERSION} \
	--with github.com/hslatman/caddy-crowdsec-bouncer/http@${CROWDSEC_BOUNCER_VERSION} \
	--with github.com/porech/caddy-maxmind-geolocation@${MAXMIND_GEOIP_VERSION} \
	--with github.com/caddy-dns/cloudflare@${CLOUDFLARE_VERSION}

	
# Final image with the built Caddy binary
FROM docker.io/library/caddy:alpine

# Copy the built Caddy binary from the builder stage
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
