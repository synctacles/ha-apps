# Synctacles CARE — Documentation

System diagnostics, AI-powered troubleshooting, and Config Doctor for Home Assistant.

**All features are 100% free — no account, no registration, no subscription required.**

---

## Features

| Feature | What it does |
|---|---|
| **Health Scan** | A-F score: database, integrations, sensors, recorder, logs |
| **Security Scan** | 0–100 score: 2FA, SSL, HA version, trusted networks, IP ban, login threshold |
| **Cleanup** | Remove orphaned statistics and entities with chunked, resource-aware deletion |
| **Backup Insights** | Disk usage overview and backup management from the Health tab |
| **Knowledge Base** | Search 19,000+ HA support articles (GitHub, forum, Reddit, StackOverflow) |
| **AI Assist** | BYOK AI: Diagnose issues and fix automations with Config Doctor |
| **Feedback** | Structured bug reports with environment context |

---

## Installation

1. Go to **Settings → Apps → App Store**
2. Click the menu (⋮) → **Repositories** → add `https://github.com/synctacles/ha-apps`
3. Find **Synctacles Care** in the store and click **Install**
4. Start the app — the web UI opens automatically in the sidebar

---

## Configuration

All features work without configuration. The only optional setting is an AI API key for the AI Assist tab.

```yaml
# AI provider (anthropic / openai / groq / gemini)
ai_provider: anthropic

# Your API key for the selected provider — leave empty to disable AI features
ai_api_key: ""

# Enable HA persistent notifications when issues are detected (default: true)
notifications_enabled: true

# Enable scheduled daily health scans (default: false)
scheduled_scan_enabled: false

# Enable automatic orphan cleanup during scheduled scans (default: false)
auto_cleanup_enabled: false

# Debug logging — only enable when reporting issues (default: false)
debug_mode: false
```

**Save and restart the app after any configuration change.**

---

## Health Tab

Runs a full system health scan and shows:

- **A–F grade** with 0–100 score
- **Database Health** — size, fragmentation, orphaned stats/entities
- **Backup Insights** — total disk usage, backup count and size, breakdown chart
- **Recommendations** — actionable steps for any detected issues
- **Proactive solutions** — auto-matched KB articles for your specific problems

### Database cleanup

The **Cleanup** button removes orphaned stats and entities in batches. **VACUUM** compacts the database file. Both are safe and reversible by HA's own recorder.

---

## Security Tab

8-point security assessment with weighted scoring:

| Check | Weight | What it detects |
|---|---|---|
| Two-Factor Authentication | 25% | TOTP 2FA active |
| SSL/HTTPS | 20% | HTTPS configured with valid certificate |
| HA Version | 10% | Running latest Home Assistant Core |
| Core Auto-Update | 10% | Auto-updates enabled |
| Add-ons up to date | 10% | All installed apps on latest version |
| Trusted Networks | 10% | No dangerous CIDR blocks (e.g. 0.0.0.0/0) |
| IP Ban Protection | 10% | Brute-force protection active |
| Login Attempt Threshold | 5% | Max failed logins before IP ban |

Hover the **ⓘ** icon next to each check for an explanation of why it matters.

### Why Core Auto-Update matters

HA Core does **not** auto-update by default. Without it, security patches, integration fixes, and API changes are not applied automatically. Enable it at: **Settings → System → Updates → Automatically update Home Assistant Core**.

---

## Knowledge Base

Search 19,000+ Home Assistant support articles sourced from:
- GitHub Issues (home-assistant/core)
- Community Forum threads
- Reddit r/homeassistant
- StackOverflow

FAQ articles are filtered to your language automatically. Community articles are always shown in English.

**Rate limit:** 100 searches per day per installation.

---

## AI Assist

The AI tab requires a BYOK (Bring Your Own Key) API key. Supported providers:

| Provider | Key source |
|---|---|
| Anthropic (Claude) | console.anthropic.com |
| OpenAI (GPT) | platform.openai.com |
| Groq | console.groq.com |
| Gemini | aistudio.google.com |

Add your key in **Settings → Apps → Synctacles Care → Configuration**.

### Diagnose

Describe any Home Assistant issue in plain language. The AI:
- Reads your live HA logs in real time
- Cross-references your configuration and entity states
- Provides step-by-step diagnostics with actionable fixes

**Estimated cost:** ~€0.01–0.25 per session depending on model and complexity.

### Config Doctor

Analyzes your automations with AI:

1. Select an automation from the list
2. AI reads the YAML and cross-references all entity_ids against your running HA instance
3. View detected issues and a proposed fix with a side-by-side diff
4. Apply with one click — an automatic backup is created first
5. Restore the original at any time with **Rollback**

---

## Privacy & Data

### What is collected automatically

- Install ID (random UUID, generated locally, not linked to you)
- App version and HA version
- Architecture (amd64/aarch64/armv7)
- Anonymous error fingerprints (integration name + error class only, no log content)

### What is never collected

- Personal data, IP addresses, or location
- HA configuration, secrets, or entity names
- Log content or error messages
- API keys or credentials

Full privacy policy: **https://synctacles.com/privacy**

---

## Troubleshooting

**Health scan fails**
- Check app logs: Settings → Apps → Synctacles Care → Log
- Requires Home Assistant 2024.1 or newer
- Supervisor API must be accessible (enabled by default)

**AI Assist not available**
- Add an API key in Configuration (see AI Assist section above)
- Click "Check API status" in the AI tab to verify the key works

**Config Doctor shows no automations**
- Ensure automations are configured in HA
- The Supervisor API must be accessible (check app logs)

**App takes long to start**
- The web UI loads instantly. Background services (telemetry, radar) start after the Supervisor API is ready — typically 30–60 seconds after HA boot.

---

## Support

- **Bugs:** Use the **Feedback** tab in the app or [open an issue](https://github.com/synctacles/care-app/issues)
- **Email:** support@synctacles.com
- **Website:** https://synctacles.com

---

*Gemaakt met ❤️ op Madeira*
