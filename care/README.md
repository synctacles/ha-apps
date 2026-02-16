# Synctacles CARE - Home Assistant Addon Build

**Version:** 0.1.1-beta
**Build Strategy:** Local pre-built binaries (private repo, full control, multi-arch)

## Features

- 🏥 **Health Scan** - A-F grading system
- 🔒 **Security Scan** - Vulnerability detection
- 🗑️ **Cleanup** - Orphan entity removal
- 📚 **KB Search** - Access 17,748+ support articles (NEW in 0.1.1)
- 🤖 **AI Support** - BYOK Anthropic integration
- 🌐 **Multi-arch** - amd64, arm64, armv7

## Quick Start

```bash
# 1. Build binaries (amd64, arm64, armv7)
VERSION=0.1.1-beta ./build-binaries.sh

# 2. Build Docker images
VERSION=0.1.1-beta ./build-docker.sh

# 3. Test
docker run --rm synctacles/care-app:0.1.1-beta /usr/bin/care-addon --version

# 4. Test KB endpoints
docker run -d -p 8100:8099 -e CARE_API_URL=https://care.synctacles.com synctacles/care-app:0.1.1-beta
curl "http://localhost:8100/api/kb/search?query=automation"
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
