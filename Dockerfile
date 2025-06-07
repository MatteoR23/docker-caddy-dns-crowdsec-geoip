FROM docker.io/library/caddy:builder AS builder

# Build Caddy with OVH, Crowdsec and Geo IP modules
RUN xcaddy build \
	--with github.com/caddy-dns/ovh \
	--with github.com/hslatman/caddy-crowdsec-bouncer/http \
	--with github.com/porech/caddy-maxmind-geolocation

# Final image with the built Caddy binary
FROM docker.io/library/caddy:alpine

# Copy the built Caddy binary from the builder stage
COPY --from=builder /usr/bin/caddy /usr/bin/caddy


