# Synctacles CARE - Documentation

**Version:** 0.3.0
**Last Updated:** February 23, 2026

---

## Overview

Synctacles CARE provides proactive system diagnostics, cleanup, and AI-powered troubleshooting for Home Assistant.

**All features are 100% free with no registration required.**

---

## Features

### Health Scan

Comprehensive system health analysis with A-F scoring:

- **Database Health** - Size, fragmentation, query performance
- **Integration Status** - Error detection, availability
- **Sensor Health** - Unavailable sensors, stale data
- **Recorder Performance** - Database write speed, purge efficiency
- **Log Analysis** - Error pattern detection

### Security Scan

Security assessment with 0-100 scoring:

- Default password detection
- Exposed service check
- Integration security audit
- SSL/TLS configuration review
- Authentication method analysis

### Orphan Detection & Cleanup

Find and clean up orphaned resources:

- **Entities** - Removed devices/integrations
- **Automations** - References to deleted entities
- **Scripts** - Broken service calls
- **Scenes** - Invalid entity references

### Knowledge Base Search

Search 19,000+ Home Assistant articles:

- GitHub Issues (home-assistant/core)
- Community Forum threads
- Reddit r/homeassistant posts
- StackOverflow questions
- Language-filtered FAQ articles

**Proactive Matching:** Automatically finds solutions for detected issues

### AI Diagnostics (BYOK)

AI-powered troubleshooting with Claude:

- Bring Your Own Anthropic API Key
- Model selection: Haiku (fast), Sonnet (balanced), or Opus (thorough)
- Step-by-step diagnostics with live log streaming
- Recipe-based auto-fix (with confirmation)
- Natural language problem description
- Live terminal panel for real-time log viewing

**Cost:** ~$0.03-0.25 per session (you control usage)

### Synctacles Radar

Silent error detection and community intelligence:

- Automatic error fingerprinting from system logs
- WebSocket real-time event detection
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
# Anthropic API key for AI diagnostics (BYOK)
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
3. **Orphans** - Orphaned entities with cleanup options
4. **Knowledge Base** - Search 19K+ HA articles
5. **AI Support** - AI diagnostics with live terminal, log streaming, and model selection
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

### "AI Support not available"

1. Get an Anthropic API key: https://console.anthropic.com/
2. Add to app configuration: `ai_api_key: "sk-ant-..."`
3. Save and restart the app

### App takes long to start

The web UI loads instantly. Background services (radar, telemetry, heartbeat) start after the Supervisor API is ready, which may take 30-60 seconds after HA boot.

---

## FAQ

**Is CARE really free?**
Yes, 100% free. No trials, no paid tiers, no hidden costs.

**Do I need to register?**
No. All features work without registration.

**How much does AI support cost?**
~$0.03-0.25 per AI session (Anthropic API pricing). You bring your own key.

**Can I use this offline?**
Partially. Health/security scans work offline. KB search and AI features require internet.

**What is Synctacles Radar?**
A silent background pipeline that detects errors in your HA logs, fingerprints them, and checks if solutions exist in our 19K+ article knowledge base. When a high-confidence match is found, you get a notification.

---

## Support

- **Issues:** [Report a Bug](https://github.com/synctacles/ha-apps/issues)
- **Email:** support@synctacles.com

---

**Built by Synctacles**
