# Synctacles Care - Home Assistant Add-on

**All Features Free • No Registration Required • Privacy-Focused**

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armv7 Architecture][armv7-shield]

Proactive system diagnostics, cleanup, and AI-powered troubleshooting for Home Assistant.

---

## About

Synctacles Care keeps your Home Assistant healthy and secure with:

- 🏥 **Health Scan** - System health score (A-F) with actionable recommendations
- 🔒 **Security Scan** - Security score (0-100) with vulnerability detection
- 🧹 **Orphan Detection** - Find and clean up orphaned entities, automations, scripts
- 📚 **Knowledge Base** - Search 17,000+ HA articles, issues, and solutions
- 🤖 **AI Diagnostics** - Troubleshoot with Claude AI (bring your own Anthropic API key)
- 🆓 **100% Free** - All features unlocked, no subscription required

---

## Installation

### Option 1: Add Repository (Recommended)

1. Click the button below to add this repository:
   [![Add Repository][repository-badge]][repository-url]

2. Or manually:
   - Go to **Settings** → **Add-ons** → **Add-on Store** (bottom right ⋮)
   - Click **Repositories** → Add: `https://github.com/synctacles/addons`
   - Find **Synctacles Care** in the store → **Install**

### Option 2: Manual Installation

```bash
# SSH into your Home Assistant server
cd /addons
git clone https://github.com/synctacles/care-app.git synctacles_care
# Restart Home Assistant → Settings → Add-ons → Reload
```

---

## Configuration

### Basic Setup (All Features Work Without This!)

All features work immediately after installation. Configuration is **optional** for advanced features:

```yaml
# Optional: Your Synctacles API key (for future paid features)
api_key: ""

# Optional: License key (not needed, all features are free)
license_key: ""

# Optional: Your Anthropic API key for AI diagnostics (BYOK model)
ai_api_key: "sk-ant-..."

# Enable notifications (default: true)
notifications_enabled: true

# Enable scheduled daily health scans (default: false)
scheduled_scan_enabled: false

# Enable automatic orphan cleanup (default: false, requires confirmation)
auto_cleanup_enabled: false

# Enable debug logging (default: false)
debug_mode: false

# Demo mode (for testing, default: false)
demo_mode: false

# Send anonymous telemetry to help improve the addon (default: false)
telemetry_enabled: false
```

### AI Diagnostics (Optional - Bring Your Own Key)

To use AI-powered troubleshooting:

1. Get an API key from [Anthropic](https://console.anthropic.com/)
2. Add to configuration: `ai_api_key: "sk-ant-..."`
3. Save and restart the addon
4. AI diagnostics will be available in the web UI

**Cost:** ~€0.03-0.25 per AI session (you control the costs)

---

## Features

### 🏥 Health Scan

- **System Health Score** (A-F) based on:
  - Database size and fragmentation
  - Integration errors
  - Sensor failures
  - Recorder performance
  - Log errors

- **Actionable Recommendations**:
  - "Recorder database is 2.3 GB - consider purge"
  - "5 integrations with errors - click to diagnose"
  - "12 sensors unavailable - check connections"

### 🔒 Security Scan

- **Security Score** (0-100) based on:
  - Default passwords
  - Exposed services
  - Outdated integrations
  - SSL/TLS configuration
  - Authentication methods

### 🧹 Orphan Detection

Find and clean up:
- **Orphan Entities** (removed devices, integrations)
- **Orphan Automations** (referencing deleted entities)
- **Orphan Scripts** (broken service calls)
- **Orphan Scenes** (invalid entities)

**Free Tier:** Cleanup up to 25 orphans at once (prevents accidental mass deletion)

### 📚 Knowledge Base Search

- Search 17,000+ articles from:
  - Home Assistant GitHub Issues
  - Community Forum
  - Reddit r/homeassistant
  - StackOverflow

- **Proactive Matching**: Automatically finds solutions for detected issues

### 🤖 AI Diagnostics (BYOK)

- Bring Your Own Anthropic API Key
- Claude AI analyzes your system
- Provides step-by-step troubleshooting
- Recipe-based auto-fix (with confirmation)

---

## Web UI

Access via **Sidebar** → **Synctacles Care**

**Dashboard:**
- Health score card
- Security score card
- Orphan count
- Recent recommendations

**Tabs:**
- **Health** - Full health scan report
- **Security** - Security scan results
- **Orphans** - List of orphaned entities
- **Knowledge Base** - Search HA articles
- **AI Support** - AI-powered diagnostics (requires API key)

---

## Home Assistant Entities

The addon creates these sensors:

| Entity ID | Description |
|-----------|-------------|
| `sensor.care_health_score` | System health score (0-100) |
| `sensor.care_security_score` | Security score (0-100) |
| `sensor.care_orphan_count` | Number of orphaned entities |
| `sensor.care_recommendations` | Active recommendations count |
| `sensor.care_last_scan` | Last health scan timestamp |

### Example Automation

```yaml
automation:
  - alias: "Alert on low health score"
    trigger:
      - platform: numeric_state
        entity_id: sensor.care_health_score
        below: 50
    action:
      - service: notify.mobile_app
        data:
          message: "HA health score is low: {{ states('sensor.care_health_score') }}"
```

---

## Privacy & Data

### What We Collect (Optional)

**Only if you enable telemetry:**
- Installation ID (random UUID, not linked to you)
- Product version
- HA version and architecture
- Anonymous usage statistics

**What We DO NOT Collect:**
- ❌ Personal identifiable information
- ❌ HA configuration or secrets
- ❌ Entity names or data
- ❌ Logs or error messages

**GDPR Compliant:** [Privacy Policy](https://github.com/synctacles/platform/blob/main/PRIVACY.md)

---

## Troubleshooting

### "Health scan failed"

**Cause:** Insufficient Supervisor API permissions

**Solution:**
1. Check addon logs: **Settings** → **Add-ons** → **Synctacles Care** → **Log**
2. Ensure **Supervisor API** is enabled (default: enabled)
3. Restart Home Assistant

### "AI Support not available"

**Cause:** No Anthropic API key configured

**Solution:**
1. Get API key from https://console.anthropic.com/
2. Add to **Configuration** tab: `ai_api_key: "sk-ant-..."`
3. Save and restart addon

### "Entities not showing up"

**Solution:**
1. Go to **Settings** → **Devices & Services** → **MQTT**
2. Restart Home Assistant
3. Check addon logs for MQTT connection errors

### More Help

- **Documentation:** [DOCS.md](https://github.com/synctacles/platform/blob/main/DOCS.md)
- **GitHub Issues:** [Report a Bug](https://github.com/synctacles/platform/issues/new?template=bug_report.yml)
- **Community Forum:** [Home Assistant Forum](https://community.home-assistant.io/)

---

## Support

- **GitHub Issues:** https://github.com/synctacles/platform/issues
- **Documentation:** https://github.com/synctacles/platform/blob/main/DOCS.md
- **Privacy Policy:** https://github.com/synctacles/platform/blob/main/PRIVACY.md

---

## Contributing

Synctacles Care is open-source! Contributions welcome:

**Repositories:**
- Care App (this addon): https://github.com/synctacles/care-app
- Care Backend: https://github.com/synctacles/care-backend
- Platform: https://github.com/synctacles/platform

---

## License

MIT License - See [LICENSE](https://github.com/synctacles/care-app/blob/main/LICENSE)

---

## Credits

Built with ❤️ by Synctacles (DATADIO)

**Contact:** support@synctacles.com

---

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[repository-badge]: https://img.shields.io/badge/Add-Repository-blue?style=for-the-badge&logo=homeassistant
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fsynctacles%2Faddons
