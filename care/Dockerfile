###########################################
# Synctacles CARE - Home Assistant App   #
# Multi-arch build for HA App Store       #
# Build strategy: Pinned commit for reproducibility
###########################################

# Build arguments
ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:3.18
ARG GIT_COMMIT=352d2a14e2fa11b70464e3a7585e69bfdfbe46a3
ARG VERSION=0.1.0-beta
ARG BUILD_DATE

###########################################
# Stage 1: Build Go binary from source   #
###########################################

FROM golang:1.23-alpine AS builder

# Install git for cloning source
RUN apk add --no-cache git

# Accept build args in builder stage
ARG GIT_COMMIT
ARG VERSION

# Clone source code from care-app repository
# Full clone (not --depth 1) to allow checkout of specific commits
WORKDIR /build
RUN git clone https://github.com/synctacles/care-app.git . && \
    git checkout ${GIT_COMMIT} && \
    echo "Building from commit: $(git log -1 --format='%H %s')"

# Download Go dependencies
RUN go mod download

# Build binary with optimizations and version info
# - CGO_ENABLED=0: Static linking (no external C dependencies)
# - trimpath: Remove file paths from binary (smaller size, better security)
# - ldflags: Strip debug info + embed version/commit info
RUN CGO_ENABLED=0 GOOS=linux GOARCH=${TARGETARCH:-amd64} \
    go build -trimpath \
    -ldflags="-s -w -X main.version=${VERSION} -X main.commit=${GIT_COMMIT} -X main.buildDate=${BUILD_DATE}" \
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

# Accept build args in runtime stage for labels
ARG VERSION
ARG GIT_COMMIT
ARG BUILD_DATE

# Labels (HA app metadata + build info for traceability)
LABEL \
    io.hass.name="Synctacles CARE" \
    io.hass.description="System diagnostics and AI support" \
    io.hass.arch="amd64|aarch64|armv7" \
    io.hass.type="addon" \
    io.hass.version="${VERSION}" \
    maintainer="Synctacles <support@synctacles.com>" \
    org.opencontainers.image.title="Synctacles CARE" \
    org.opencontainers.image.description="Home Assistant system diagnostics and AI support" \
    org.opencontainers.image.vendor="Synctacles" \
    org.opencontainers.image.authors="support@synctacles.com" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/synctacles/ha-apps" \
    org.opencontainers.image.version="${VERSION}" \
    org.opencontainers.image.revision="${GIT_COMMIT}" \
    org.opencontainers.image.created="${BUILD_DATE}"

# Start app
CMD ["/run.sh"]
