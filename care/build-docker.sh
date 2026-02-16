#!/bin/bash
# Build Docker images for all architectures using pre-built binaries
# This script expects binaries to be built first with build-binaries.sh

set -e

# Configuration
VERSION="${VERSION:-0.1.0-beta}"
BUILD_DATE="${BUILD_DATE:-$(date -u +"%Y-%m-%dT%H:%M:%SZ")}"
BINARIES_DIR="binaries"
DOCKERFILE="Dockerfile.local"

# Get commit hash from binaries metadata (embedded in binary)
if [[ -f "${BINARIES_DIR}/care-addon-amd64" ]]; then
    # Extract commit from binary strings (embedded by ldflags)
    GIT_COMMIT=$(strings "${BINARIES_DIR}/care-addon-amd64" | grep -E '^[a-f0-9]{40}$' | head -1 || echo "unknown")
else
    echo "❌ Error: Binaries not found in ${BINARIES_DIR}/"
    echo "Run ./build-binaries.sh first!"
    exit 1
fi

echo "=========================================="
echo "Building CARE Docker Images"
echo "=========================================="
echo "Version:    ${VERSION}"
echo "Commit:     ${GIT_COMMIT}"
echo "Build Date: ${BUILD_DATE}"
echo "Dockerfile: ${DOCKERFILE}"
echo "=========================================="
echo ""

# Check if buildx is available for multi-arch
if docker buildx version >/dev/null 2>&1; then
    USE_BUILDX=true
    echo "✅ Docker buildx available (multi-arch support)"
else
    USE_BUILDX=false
    echo "⚠️  Docker buildx not available (single-arch only)"
fi
echo ""

# Map architecture names
# Docker uses: amd64, arm64, arm/v7
# Binary names: care-addon-amd64, care-addon-arm64, care-addon-armv7

# Create symlinks for Docker TARGETARCH variable
mkdir -p "${BINARIES_DIR}/arm"
ln -sf "../care-addon-armv7" "${BINARIES_DIR}/arm/v7" 2>/dev/null || true

if [[ "$USE_BUILDX" == true ]]; then
    echo "Building multi-arch image with buildx..."
    echo ""

    # Create or use existing builder
    docker buildx create --name care-builder --use 2>/dev/null || docker buildx use care-builder

    # Build for all platforms
    docker buildx build \
        --platform linux/amd64,linux/arm64,linux/arm/v7 \
        --build-arg VERSION="${VERSION}" \
        --build-arg GIT_COMMIT="${GIT_COMMIT}" \
        --build-arg BUILD_DATE="${BUILD_DATE}" \
        -f "${DOCKERFILE}" \
        -t "synctacles/care-app:${VERSION}" \
        -t "synctacles/care-app:latest" \
        --load \
        .

    echo ""
    echo "✅ Multi-arch build complete!"
else
    echo "Building single-arch image (amd64 only)..."
    echo ""

    docker build \
        --build-arg VERSION="${VERSION}" \
        --build-arg GIT_COMMIT="${GIT_COMMIT}" \
        --build-arg BUILD_DATE="${BUILD_DATE}" \
        --build-arg TARGETARCH="amd64" \
        -f "${DOCKERFILE}" \
        -t "synctacles/care-app:${VERSION}" \
        -t "synctacles/care-app:latest" \
        .

    echo ""
    echo "✅ Single-arch build complete (amd64)!"
fi

echo ""
echo "=========================================="
echo "Docker Images Built"
echo "=========================================="
docker images synctacles/care-app
echo ""
echo "Verify build:"
echo "  docker inspect synctacles/care-app:${VERSION} | jq '.[0].Config.Labels'"
echo ""
echo "Test locally:"
echo "  docker run --rm synctacles/care-app:${VERSION} /usr/bin/care-addon --version"
echo ""
echo "Push to registry:"
echo "  docker tag synctacles/care-app:${VERSION} ghcr.io/synctacles/care-app:${VERSION}"
echo "  docker push ghcr.io/synctacles/care-app:${VERSION}"
echo ""
