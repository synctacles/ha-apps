# CARE Addon Build Guide

This document describes how to build the Synctacles CARE Home Assistant addon with **pinned commits** for reproducibility and security.

## Build Strategy

**Hybrid Approach:** Clone from GitHub but pin to specific commit hash.

### Why Pinned Commits?

- ✅ **Reproducible builds** — Same commit = same binary
- ✅ **Supply chain security** — Know exactly what code is built
- ✅ **Version tracking** — Commit hash embedded in binary and labels
- ✅ **Audit trail** — Can trace back to exact source
- ✅ **Automated** — No manual binary copying needed

## Quick Start

### Single-arch Build (for testing)

```bash
cd /opt/github/ha-apps/care
./build.sh
```

This builds for `linux/amd64` using the default pinned commit.

### Override Build Parameters

```bash
# Build from different commit
GIT_COMMIT=abc123 ./build.sh

# Build specific version
VERSION=0.2.0 GIT_COMMIT=def456 ./build.sh

# Build for different platform
PLATFORM=linux/arm64 ./build.sh
```

## Multi-arch Build (Production)

For Home Assistant addon store, you need all three architectures:

```bash
# Enable Docker buildx (if not already enabled)
docker buildx create --name multiarch --use

# Build and push for all platforms
docker buildx build \
  --platform linux/amd64,linux/arm64,linux/arm/v7 \
  --build-arg VERSION=0.1.0-beta \
  --build-arg GIT_COMMIT=ab07dd41ae2d06c86f719dbfa95177d95c57a600 \
  --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
  -t ghcr.io/synctacles/care-app:0.1.0-beta \
  -t ghcr.io/synctacles/care-app:latest \
  --push \
  .
```

## Verify Build

### Check Labels (Traceability)

```bash
docker inspect synctacles/care-app:0.1.0-beta | jq '.[0].Config.Labels'
```

Expected output:
```json
{
  "io.hass.version": "0.1.0-beta",
  "org.opencontainers.image.version": "0.1.0-beta",
  "org.opencontainers.image.revision": "ab07dd41ae2d06c86f719dbfa95177d95c57a600",
  "org.opencontainers.image.created": "2026-02-16T02:45:00Z"
}
```

### Check Binary Version

```bash
docker run --rm synctacles/care-app:0.1.0-beta /usr/bin/care-addon --version
```

Expected output:
```
care-addon version 0.1.0-beta (commit ab07dd4, built 2026-02-16T02:45:00Z)
```

## Update Pinned Commit

When releasing a new version:

1. **Get latest commit from care-app repo:**
   ```bash
   cd /opt/github/care-app
   git log -1 --format="%H"
   ```

2. **Update default in `build.sh`:**
   ```bash
   GIT_COMMIT="${GIT_COMMIT:-NEW_COMMIT_HASH_HERE}"
   ```

3. **Update default in `Dockerfile`:**
   ```dockerfile
   ARG GIT_COMMIT=NEW_COMMIT_HASH_HERE
   ```

4. **Build and test:**
   ```bash
   ./build.sh
   docker run --rm synctacles/care-app:latest /usr/bin/care-addon --health
   ```

## Security Notes

### Commit Verification (Optional)

To verify commits are signed by trusted developers:

Add to Dockerfile after `git checkout`:
```dockerfile
RUN git verify-commit ${GIT_COMMIT} || \
    (echo "⚠️ WARNING: Unsigned commit ${GIT_COMMIT}" && exit 1)
```

Requires GPG keys to be imported in builder image.

### Supply Chain Protection

- ✅ Full clone (not shallow) allows commit verification
- ✅ Specific commit checkout prevents MITM attacks
- ✅ Build args are logged in image labels
- ✅ Immutable tags (don't reuse version numbers)

## Troubleshooting

### Build fails with "commit not found"

The pinned commit doesn't exist in the repository. Check:
```bash
cd /opt/github/care-app
git fetch origin
git log --oneline | head -10
```

### Multi-arch build fails

Ensure buildx is configured:
```bash
docker buildx ls
docker buildx create --name multiarch --use
```

### Binary has no version info

Check that `main.go` has version variables:
```go
var (
    version   = "dev"
    commit    = "unknown"
    buildDate = "unknown"
)
```

## CI/CD Integration

Example GitHub Actions workflow:

```yaml
name: Build CARE Addon
on:
  push:
    tags: ['v*']

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Build multi-arch
        run: |
          docker buildx build \
            --platform linux/amd64,linux/arm64,linux/arm/v7 \
            --build-arg VERSION=${GITHUB_REF_NAME} \
            --build-arg GIT_COMMIT=${GITHUB_SHA} \
            --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
            -t ghcr.io/synctacles/care-app:${GITHUB_REF_NAME} \
            --push \
            .
```

## References

- [Home Assistant Addon Development](https://developers.home-assistant.io/docs/add-ons)
- [Docker Multi-platform Builds](https://docs.docker.com/build/building/multi-platform/)
- [OCI Image Spec Labels](https://github.com/opencontainers/image-spec/blob/main/annotations.md)
