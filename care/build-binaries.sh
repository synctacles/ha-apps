#!/bin/bash
# Build multi-arch binaries for CARE addon
# Builds static Go binaries for amd64, arm64, and armv7

set -e

# Configuration
SOURCE_REPO="/opt/github/care-app"
OUTPUT_DIR="$(pwd)/binaries"
VERSION="${VERSION:-0.1.0-beta}"
BUILD_DATE="${BUILD_DATE:-$(date -u +"%Y-%m-%dT%H:%M:%SZ")}"

# Get commit hash from source repo
cd "$SOURCE_REPO"
GIT_COMMIT=$(git log -1 --format="%H")
GIT_SHORT=$(git log -1 --format="%h")

echo "=========================================="
echo "Building CARE Binaries (Multi-arch)"
echo "=========================================="
echo "Source:     ${SOURCE_REPO}"
echo "Output:     ${OUTPUT_DIR}"
echo "Version:    ${VERSION}"
echo "Commit:     ${GIT_COMMIT}"
echo "Build Date: ${BUILD_DATE}"
echo "=========================================="
echo ""

# Create output directory
mkdir -p "$OUTPUT_DIR"
cd "$SOURCE_REPO"

# Verify we're on a clean state
if [[ -n $(git status -s) ]]; then
    echo "⚠️  WARNING: Uncommitted changes detected!"
    echo ""
    git status -s
    echo ""
    read -p "Continue anyway? [y/N] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Build function
build_binary() {
    local GOOS=$1
    local GOARCH=$2
    local GOARM=$3
    local OUTPUT_NAME=$4

    echo "Building ${OUTPUT_NAME}..."

    if [[ -n "$GOARM" ]]; then
        GOARM=$GOARM GOOS=$GOOS GOARCH=$GOARCH CGO_ENABLED=0 \
            go build -trimpath \
            -ldflags="-s -w -X main.version=${VERSION} -X main.commit=${GIT_COMMIT} -X main.buildDate=${BUILD_DATE}" \
            -o "${OUTPUT_DIR}/${OUTPUT_NAME}" \
            ./cmd/care-addon
    else
        GOOS=$GOOS GOARCH=$GOARCH CGO_ENABLED=0 \
            go build -trimpath \
            -ldflags="-s -w -X main.version=${VERSION} -X main.commit=${GIT_COMMIT} -X main.buildDate=${BUILD_DATE}" \
            -o "${OUTPUT_DIR}/${OUTPUT_NAME}" \
            ./cmd/care-addon
    fi

    local SIZE=$(du -h "${OUTPUT_DIR}/${OUTPUT_NAME}" | cut -f1)
    echo "  ✅ ${OUTPUT_NAME} (${SIZE})"
}

# Build for all architectures
echo "Building binaries..."
echo ""

build_binary "linux" "amd64" "" "care-addon-amd64"
build_binary "linux" "arm64" "" "care-addon-arm64"
build_binary "linux" "arm" "7" "care-addon-armv7"

echo ""
echo "=========================================="
echo "✅ All binaries built successfully!"
echo "=========================================="
echo ""
ls -lh "$OUTPUT_DIR"
echo ""
echo "Build metadata:"
echo "  Version: ${VERSION}"
echo "  Commit:  ${GIT_SHORT} (${GIT_COMMIT})"
echo "  Date:    ${BUILD_DATE}"
echo ""
echo "Next steps:"
echo "  1. Test binaries: ./binaries/care-addon-amd64 --version"
echo "  2. Build Docker images: ./build-docker.sh"
echo ""
