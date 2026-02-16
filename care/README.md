# Synctacles CARE - Home Assistant Addon Build

**Build Strategy:** Local pre-built binaries (private repo, full control, multi-arch)

## Quick Start

```bash
# 1. Build binaries (amd64, arm64, armv7)
./build-binaries.sh

# 2. Build Docker images
./build-docker.sh

# 3. Test
docker run --rm synctacles/care-app:0.1.0-beta /usr/bin/care-addon --version
```

## Files

- `build-binaries.sh` — Builds Go binaries for all architectures
- `build-docker.sh` — Builds Docker images using pre-built binaries
- `Dockerfile.local` — Multi-arch Dockerfile (copies local binaries)
- `config.yaml` — HA addon metadata
- `run.sh` — Container entrypoint
- `binaries/` — Compiled binaries (gitignored)

## Full Documentation

See `BUILD.md` for complete build documentation.
