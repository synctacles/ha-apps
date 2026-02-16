###########################################
# Synctacles CARE - Home Assistant App   #
# Multi-arch build for HA App Store       #
###########################################

# Build arguments
ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:3.18

###########################################
# Stage 1: Build Go binary from source   #
###########################################

FROM golang:1.23-alpine AS builder

# Install git for cloning source
RUN apk add --no-cache git

# Clone source code from care-app repository
# Using latest main branch (change to specific tag for releases)
WORKDIR /build
RUN git clone --depth 1 https://github.com/synctacles/care-app.git .

# Download Go dependencies
RUN go mod download

# Build binary with optimizations
# - CGO_ENABLED=0: Static linking (no external C dependencies)
# - trimpath: Remove file paths from binary (smaller size, better security)
# - ldflags "-s -w": Strip debug info (smaller binary)
RUN CGO_ENABLED=0 GOOS=linux GOARCH=${TARGETARCH:-amd64} \
    go build -trimpath -ldflags="-s -w" \
    -o /care-addon ./cmd/care-addon

###########################################
# Stage 2: Runtime image                 #
###########################################

FROM ${BUILD_FROM}

# Install runtime dependencies
# bashio: HA app configuration helper
RUN apk add --no-cache bash

# Copy binary from builder stage
COPY --from=builder /care-addon /usr/bin/care-addon

# Copy entrypoint script
COPY run.sh /

# Make scripts executable
RUN chmod +x /run.sh /usr/bin/care-addon

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD /usr/bin/care-addon --health || exit 1

# Labels (HA app metadata)
LABEL \
    io.hass.name="Synctacles CARE" \
    io.hass.description="System diagnostics and AI support" \
    io.hass.arch="amd64|aarch64|armv7" \
    io.hass.type="addon" \
    io.hass.version="0.1.0-beta" \
    maintainer="Synctacles <support@synctacles.com>" \
    org.opencontainers.image.title="Synctacles CARE" \
    org.opencontainers.image.description="Home Assistant system diagnostics and AI support" \
    org.opencontainers.image.vendor="Synctacles" \
    org.opencontainers.image.authors="support@synctacles.com" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/synctacles/ha-apps"

# Start app
CMD ["/run.sh"]
