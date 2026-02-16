#!/bin/bash
# Build script for Synctacles CARE addon with pinned commits
# This ensures reproducible builds with version tracking

set -e

# Default values (override with environment variables)
VERSION="${VERSION:-0.1.0-beta}"
GIT_COMMIT="${GIT_COMMIT:-352d2a14e2fa11b70464e3a7585e69bfdfbe46a3}"
BUILD_DATE="${BUILD_DATE:-$(date -u +"%Y-%m-%dT%H:%M:%SZ")}"
PLATFORM="${PLATFORM:-linux/amd64}"

echo "=========================================="
echo "Building Synctacles CARE Addon"
echo "=========================================="
echo "Version:    ${VERSION}"
echo "Commit:     ${GIT_COMMIT}"
echo "Build Date: ${BUILD_DATE}"
echo "Platform:   ${PLATFORM}"
echo "=========================================="

# Build the image
docker build \
  --build-arg VERSION="${VERSION}" \
  --build-arg GIT_COMMIT="${GIT_COMMIT}" \
  --build-arg BUILD_DATE="${BUILD_DATE}" \
  --platform "${PLATFORM}" \
  -t "synctacles/care-app:${VERSION}" \
  -t "synctacles/care-app:latest" \
  .

echo ""
echo "✅ Build complete!"
echo ""
echo "Image tags:"
echo "  - synctacles/care-app:${VERSION}"
echo "  - synctacles/care-app:latest"
echo ""
echo "Verify build info:"
echo "  docker inspect synctacles/care-app:${VERSION} | jq '.[0].Config.Labels'"
echo ""
echo "Run locally:"
echo "  docker run --rm synctacles/care-app:${VERSION} /usr/bin/care-addon --version"
