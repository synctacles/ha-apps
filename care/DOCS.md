# Synctacles CARE - Documentation

**Version:** 0.3.0
**Last Updated:** February 23, 2026

---

## Overview

Synctacles CARE provides system diagnostics, AI-powered troubleshooting, and Config Doctor for Home Assistant.

**All features are 100% free with no registration required.**

---

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

### Health Scan

Comprehensive system health analysis with A-F scoring:

- **Database Health** - Size, fragmentation, query performance
- **Orphan Detection** - Statistics and entities without state data
- **Data Retention** - Oldest/newest state timestamps
- **Schema Detection** - Supports 2024+ and legacy HA database schemas

### Security Scan

Security assessment with 0-100 scoring (7-point check):

- 2FA enabled
- SSL/HTTPS active
- HA version current
- Trusted networks safe
- IP ban enabled
- Login attempts limited
- Apps up to date

### Orphan Detection & Cleanup

Find and clean up orphaned resources:

- **Statistics** - Entries for entities that no longer exist
- **Entities** - Registry entries without state data

Chunked deletion with resource-aware profiles (Pi 3 through x86).

### Knowledge Base Search

Search 19,000+ Home Assistant articles:

- GitHub Issues (home-assistant/core)
- Community Forum threads
- Reddit r/homeassistant posts
- StackOverflow questions
- Language-filtered FAQ articles

**Proactive Matching:** Automatically finds solutions for detected issues

### AI Assist Hub

The AI tab provides three tools in a hub layout:

#### Diagnose
- Bring Your Own Anthropic API Key
- Model selection: Haiku (fast), Sonnet (balanced), or Opus (thorough)
- Describe your issue in natural language
- Step-by-step diagnostics with live log streaming via terminal panel
- Local execution — all HA API calls happen on your device

**Cost:** ~$0.01-0.25 per session depending on model (you control usage)

#### Config Doctor (Phase 1: Automations)
- List all automations with on/off status and last triggered time
- View automation YAML before sending to AI
- Claude cross-references entity_ids and service calls against your actual HA instance
- Side-by-side diff view: original vs fixed YAML
- One-click apply with automatic backup
- Instant rollback to previous config
- Requires AI API key (same as Diagnose)

#### Builder (Coming Soon)
- Create automations and blueprints from natural language descriptions

### Synctacles Radar

Silent error detection and community intelligence:

- Automatic error fingerprinting from system logs
- Adaptive scanning (high alert mode after HA restarts)
- Community-wide error pattern matching
- Proactive KB solution notifications (confidence > 90%)

### Feedback Loop

Report issues and get notified when they're resolved:

- Structured bug reports with environment context
- Automatic resolution notifications
- Version-aware feedback tracking

---

## Installation

1. Add the repository to Home Assistant:
   - Go to **Settings > Apps > App Store**
   - Click the menu (3 dots) > **Repositories**
   - Add: `https://github.com/synctacles/ha-apps`
2. Find **Synctacles Care** in the App Store
3. Click **Install**
4. Start the app

---

## Configuration

All features work without configuration. Optional settings:

```yaml
# Anthropic API key for AI Assist and Config Doctor (BYOK)
ai_api_key: "sk-ant-..."

# Enable HA persistent notifications (default: true)
notifications_enabled: true

# Enable scheduled daily health scans (default: false)
scheduled_scan_enabled: false

# Enable automatic orphan cleanup (default: false)
auto_cleanup_enabled: false

# Enable debug logging (default: false)
debug_mode: false
```

**Save and restart the app after configuration changes.**

---

## Web UI

Access via **Sidebar > Synctacles Care**

### Tabs

1. **Health** - Full health scan report with A-F score
2. **Security** - Security scan results (0-100 score)
3. **Cleanup** - Orphaned entities with cleanup and VACUUM options
4. **Knowledge Base** - Search 19K+ HA articles
5. **AI Assist** - Hub with Diagnose, Config Doctor, and Builder
6. **Feedback** - Report issues and track resolutions
7. **About** - App info, features, changelog, links

### First Launch

On first install, a disclaimer/liability notice is shown (available in 8 languages). Accept once to use the app.

### Dark Mode

Automatically follows your Home Assistant theme preference. Toggle available in the UI header.

### Languages

Available in 8 languages: English, Dutch, German, Spanish, Danish, Finnish, Portuguese, French. Auto-detected from browser settings.

---

## Privacy & Data

### What We Collect (Automatic)

- Installation ID (random UUID, not linked to you)
- App version and HA version
- Architecture (amd64/aarch64/armv7)
- Anonymous error fingerprints (integration + error class only)
- Environment snapshot (HA version, addon count, disk space)

### What We DO NOT Collect

- Personal information or IP addresses
- HA configuration, secrets, or entity names
- Logs or error message content
- API keys or credentials

### GDPR Compliance

Privacy policy: https://synctacles.com/privacy

**Your Rights:** Access, delete, export your data, or object to processing.

**Contact:** support@synctacles.com

---

## Troubleshooting

### "Health scan failed"

1. Check app logs: **Settings > Apps > Synctacles CARE > Log**
2. Ensure Supervisor API access is enabled (default: enabled)
3. Restart Home Assistant
4. Check HA version: requires 2024.1+

### "AI Assist not available"

1. Get an Anthropic API key: https://console.anthropic.com/
2. Add to app configuration: `ai_api_key: "sk-ant-..."`
3. Save and restart the app

### "Config Doctor shows no automations"

1. Ensure you have automations configured in HA
2. Check that `homeassistant_api: true` is set in the app config (default: enabled)
3. The Supervisor API must be accessible (check app logs)

### App takes long to start

The web UI loads instantly. Background services (radar, telemetry, heartbeat) start after the Supervisor API is ready, which may take 30-60 seconds after HA boot.

---

## FAQ

**Is CARE really free?**
Yes, 100% free. No trials, no hidden costs, and no plans for paid tiers.

**Do I need to register?**
No. All features work without registration.

**How much does AI Assist cost?**
~$0.01-0.25 per session depending on model choice (Anthropic API pricing). You bring your own key.

**Can I use this offline?**
Partially. Health/security scans and cleanup work offline. KB search, AI Assist, and Config Doctor require internet.

**What is Config Doctor?**
Config Doctor analyzes your automations with AI. It reads the YAML config, cross-references entity_ids and service calls against your HA instance, shows you what's wrong with a diff view, and lets you apply fixes with automatic backup and rollback.

**What is Synctacles Radar?**
A silent background pipeline that detects errors in your HA logs, fingerprints them, and checks if solutions exist in our 19K+ article knowledge base. When a high-confidence match is found, you get a notification.

---

## Support

- **Issues:** [Report a Bug](https://github.com/synctacles/care-app/issues)
- **Email:** support@synctacles.com

---

**Built by Synctacles**
