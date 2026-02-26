# Synctacles CARE - Home Assistant App

System diagnostics, AI-powered troubleshooting, and Config Doctor for Home Assistant.
All features are 100% free with no registration required.

## Features

- **Health Scan** - A-F grading system (database, integrations, sensors, recorder, logs)
- **Security Scan** - Vulnerability detection with 0-100 score
- **Cleanup** - Orphan entity removal with resource-aware chunked deletion
- **Backup Insights** - Disk usage overview and backup management
- **KB Search** - Access 19,000+ Home Assistant support articles
- **AI Assist** - BYOK AI integration with Diagnose and Config Doctor (Anthropic, OpenAI, Groq, Gemini)
- **Config Doctor** - AI-powered automation analysis with one-click fix and rollback
- **Feedback** - Structured bug reports with environment context
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
