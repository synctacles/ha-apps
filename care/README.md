# Synctacles CARE - Home Assistant App

**Version:** 0.3.0-rc4

System diagnostics, AI-powered troubleshooting, and Config Doctor for Home Assistant.
All features are 100% free with no registration required.

## Features

- **Health Scan** - A-F grading system (database, integrations, sensors, recorder, logs)
- **Security Scan** - Vulnerability detection with 0-100 score
- **Cleanup** - Orphan entity removal with resource-aware chunked deletion
- **KB Search** - Access 19,000+ Home Assistant support articles
- **AI Assist** - BYOK Anthropic integration with Diagnose, Config Doctor, and Builder
- **Config Doctor** - AI-powered automation analysis with one-click fix and rollback
- **Synctacles Radar** - Silent error fingerprinting & community pattern matching
- **Feedback Loop** - Report bugs and get notified when they're resolved
- **Multi-arch** - amd64, arm64, armv7

## Build

Images are built via GitHub Actions and published to GHCR:

```
ghcr.io/synctacles/amd64-care:VERSION
ghcr.io/synctacles/aarch64-care:VERSION
ghcr.io/synctacles/armv7-care:VERSION
```

## Files

- `config.yaml` - HA app metadata + changelog
- `DOCS.md` - User-facing documentation (shown in HA Documentation tab)
- `translations/` - Configuration option translations (en, nl)
- `icon.png` / `logo.png` - App branding
