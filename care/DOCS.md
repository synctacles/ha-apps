# Synctacles CARE - Documentation

**Version:** 0.1.0-beta
**Last Updated:** February 16, 2026

---

## Overview

Synctacles CARE provides proactive system diagnostics, cleanup, and AI-powered troubleshooting for Home Assistant.

**All features are 100% free with no registration required.**

---

## Features

### 🏥 Health Scan

Comprehensive system health analysis with A-F scoring:

- **Database Health** - Size, fragmentation, query performance
- **Integration Status** - Error detection, availability
- **Sensor Health** - Unavailable sensors, stale data
- **Recorder Performance** - Database write speed, purge efficiency
- **Log Analysis** - Error pattern detection

**Output:**
- Overall health score (A-F)
- Specific issue details
- Actionable recommendations

### 🔒 Security Scan

Security assessment with 0-100 scoring:

- Default password detection
- Exposed service check
- Integration security audit
- SSL/TLS configuration review
- Authentication method analysis

### 🧹 Orphan Detection

Find and clean up orphaned resources:

- **Entities** - Removed devices/integrations
- **Automations** - References to deleted entities
- **Scripts** - Broken service calls
- **Scenes** - Invalid entity references

**Free tier:** Cleanup up to 25 orphans at once

### 📚 Knowledge Base Search

Search 17,000+ Home Assistant articles:

- GitHub Issues (home-assistant/core)
- Community Forum threads
- Reddit r/homeassistant posts
- StackOverflow questions

**Proactive Matching:** Automatically finds solutions for detected issues

### 🤖 AI Diagnostics (BYOK)

AI-powered troubleshooting with Claude:

- Bring Your Own Anthropic API Key
- Step-by-step diagnostics
- Recipe-based auto-fix (with confirmation)
- Natural language problem description

**Cost:** ~€0.03-0.25 per session (you control usage)

---

## Installation

See [README.md](README.md) for installation instructions.

---

## Configuration

All features work without configuration. Advanced options:

```yaml
# Optional: Your Synctacles API key (reserved for future features)
api_key: ""

# Optional: License key (not needed, all features free)
license_key: ""

# Optional: Anthropic API key for AI diagnostics
ai_api_key: "sk-ant-..."

# Enable notifications (default: true)
notifications_enabled: true

# Enable scheduled daily health scans (default: false)
scheduled_scan_enabled: false

# Enable automatic orphan cleanup (default: false)
# Note: Requires confirmation before each cleanup
auto_cleanup_enabled: false

# Enable debug logging (default: false)
debug_mode: false

# Demo mode for testing (default: false)
demo_mode: false

# Send anonymous telemetry (default: false)
telemetry_enabled: false
```

**Save and restart the app after configuration changes.**

---

## Web UI

Access via **Sidebar → Synctacles CARE**

### Dashboard

- Health score card (A-F)
- Security score card (0-100)
- Orphan count
- Active recommendations list

### Tabs

1. **Health** - Full health scan report with details
2. **Security** - Security scan results and recommendations
3. **Orphans** - List of orphaned entities with cleanup options
4. **Knowledge Base** - Search HA articles and solutions
5. **AI Support** - AI-powered diagnostics (requires API key)
6. **Settings** - App configuration

---

## Home Assistant Entities

The app creates these sensors:

| Entity ID | Type | Description | Unit |
|-----------|------|-------------|------|
| `sensor.care_health_score` | sensor | Overall health score | 0-100 |
| `sensor.care_health_grade` | sensor | Health grade | A-F |
| `sensor.care_security_score` | sensor | Security score | 0-100 |
| `sensor.care_orphan_count` | sensor | Number of orphaned entities | count |
| `sensor.care_recommendations` | sensor | Active recommendation count | count |
| `sensor.care_last_scan` | sensor | Last health scan timestamp | datetime |

### Example Automation

**Alert on low health score:**

```yaml
automation:
  - alias: "CARE: Low health alert"
    trigger:
      - platform: numeric_state
        entity_id: sensor.care_health_score
        below: 50
    action:
      - service: notify.mobile_app
        data:
          title: "⚠️ HA Health Low"
          message: "Health score: {{ states('sensor.care_health_grade') }} ({{ states('sensor.care_health_score') }}/100)"
```

**Daily health report:**

```yaml
automation:
  - alias: "CARE: Daily health report"
    trigger:
      - platform: time
        at: "08:00:00"
    action:
      - service: notify.mobile_app
        data:
          title: "🏥 Daily Health Report"
          message: |
            Health: {{ states('sensor.care_health_grade') }}
            Security: {{ states('sensor.care_security_score') }}/100
            Orphans: {{ states('sensor.care_orphan_count') }}
```

---

## Troubleshooting

### "Health scan failed"

**Possible causes:**
- Insufficient Supervisor API permissions
- HA Core version incompatible (requires 2024.1+)

**Solutions:**
1. Check app logs: **Settings → Apps → Synctacles CARE → Log**
2. Ensure **Supervisor API** access enabled (default: enabled)
3. Restart Home Assistant
4. Check HA version: `ha core info`

### "AI Support not available"

**Cause:** No Anthropic API key configured

**Solution:**
1. Get API key: https://console.anthropic.com/
2. Add to **Configuration** tab: `ai_api_key: "sk-ant-..."`
3. Save and restart app

### "Entities not showing up"

**Solutions:**
1. Refresh MQTT integration:
   - **Settings → Devices & Services → MQTT → Configure**
   - Restart Home Assistant
2. Check app logs for MQTT connection errors
3. Verify Mosquitto broker is running

### "Orphan cleanup not working"

**Expected behavior:** Free tier limits cleanup to 25 orphans per operation

**Solution:**
- Run cleanup multiple times for >25 orphans
- Or configure Anthropic API key for unlimited cleanup

---

## Privacy & Data

### What We Collect (Optional)

**Only if telemetry is enabled:**
- Installation ID (random UUID)
- App version
- HA version and architecture
- Anonymous usage statistics (uptime, scan frequency)

**What We DO NOT Collect:**
- Personal information
- HA configuration or secrets
- Entity names or values
- Logs or error messages

### GDPR Compliance

Full privacy policy: [PRIVACY.md](https://github.com/synctacles/platform/blob/main/PRIVACY.md)

**Your Rights:**
- Access your data
- Delete your data
- Export your data
- Object to processing

**Contact:** support@synctacles.com

---

## FAQ

### Is CARE really free?

Yes, 100% free. No trials, no paid tiers, no hidden costs.

### Do I need to register?

No. All features work without registration. Optional email verification is only for future notifications.

### Is my data safe?

Yes. Minimal data collection, EU storage (Germany), GDPR compliant.

### Can I use this offline?

Partially. Health/security scans work offline. Knowledge Base and AI features require internet.

### How much does AI support cost?

~€0.03-0.25 per AI session (Anthropic API pricing). You bring your own key and control costs.

### Can I contribute?

Yes! CARE is open-source: [synctacles/care-app](https://github.com/synctacles/care-app)

---

## Support

- **Issues:** [Report a Bug](https://github.com/synctacles/ha-apps/issues/new?template=bug_report.yml)
- **Discussions:** [GitHub Discussions](https://github.com/synctacles/ha-apps/discussions)
- **Community:** [Home Assistant Forum](https://community.home-assistant.io/)
- **Email:** support@synctacles.com

---

## Changelog

### 0.1.0-beta (2026-02-16)

**Initial beta release**

- Health scan with A-F scoring
- Security scan with 0-100 scoring
- Orphan entity detection
- Knowledge base search (17,000+ articles)
- AI diagnostics (BYOK)
- Free tier: All features unlocked
- Privacy-focused: Optional telemetry, GDPR compliant

---

**Built with ❤️ by Synctacles**
