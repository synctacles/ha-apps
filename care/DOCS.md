# 🩺 Synctacles CARE

> **✅ All features 100% free — no account, no registration, no subscription.**

System diagnostics, AI-powered troubleshooting, and smart automation fixing for Home Assistant.

---

## ✨ Features

| | Feature | What it does |
|---|---|---|
| ✅ | **Health Scan** | A–F grade with 0–100 score across database, integrations, sensors, recorder, and logs |
| 🛡️ | **Security Scan** | 8-point security assessment: 2FA, SSL, HA version, trusted networks, IP ban |
| 🧹 | **Cleanup** | Remove orphaned statistics and entities safely, in resource-aware batches |
| 💾 | **Backup Insights** | Disk usage overview and backup management — right from the Health tab |
| 📚 | **Knowledge Base** | Search 19,500+ HA support articles from GitHub, forum, Reddit, StackOverflow |
| 🤖 | **AI Assist** | BYOK AI — Diagnose issues and fix automations with Config Doctor |
| 💬 | **Feedback** | Structured bug reports with full environment context |

---

## 🚀 Installation

1. Go to **Settings → Apps → App Store**
2. Click the menu **(⋮) → Repositories** → add:
   ```
   https://github.com/synctacles/ha-apps
   ```
3. Find **Synctacles Care** in the store → **Install**
4. Start the app — the web UI opens automatically in the sidebar

---

## ⚙️ Configuration

All features work without any configuration. The only optional setting is an AI API key for the AI Assist tab.

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

> 💡 **Save and restart the app after any configuration change.**

---

## ✅ Health Tab

Runs a full system health scan and shows:

- 🎯 **A–F grade** with 0–100 score
- 🗄️ **Database Health** — size, fragmentation, orphaned stats and entities
- 💾 **Backup Insights** — disk usage, backup count and size, breakdown chart
- 💡 **Recommendations** — actionable steps for every detected issue
- 📚 **Proactive solutions** — auto-matched KB articles for your specific problems

### 🧹 Database cleanup

The **Cleanup** button removes orphaned stats and entities in batches. **VACUUM** compacts the database file. Both are safe and reversible by HA's own recorder.

---

## 🛡️ Security Tab

8-point security assessment with weighted scoring:

| Check | Weight | What it detects |
|---|---|---|
| 🔐 Two-Factor Authentication | 25% | TOTP 2FA active on your account |
| 🔒 SSL/HTTPS | 20% | HTTPS configured with a valid certificate |
| 🏠 HA Version | 10% | Running the latest Home Assistant Core |
| 🔄 Core Auto-Update | 10% | Automatic updates enabled |
| 📦 Apps up to date | 10% | All installed apps on their latest version |
| 🌐 Trusted Networks | 10% | No dangerous CIDR blocks (e.g. 0.0.0.0/0) |
| 🚫 IP Ban Protection | 10% | Brute-force protection active |
| ⚠️ Login Attempt Threshold | 5% | Max failed logins before IP ban |

> 💡 Hover the **ⓘ** icon next to each check for a plain-language explanation.

### Why Core Auto-Update matters

HA Core does **not** auto-update by default. Without it, security patches and integration fixes are not applied automatically.
Enable it at: **Settings → System → Updates → Automatically update Home Assistant Core**.

---

## 📚 Knowledge Base

Search **19,500+ Home Assistant support articles** sourced from:

- 🐙 GitHub Issues (home-assistant/core)
- 💬 Community Forum threads
- 🟠 Reddit r/homeassistant
- 📖 StackOverflow

FAQ articles are filtered to your language automatically. Community articles are always shown in English.

> ⏱️ **Rate limit:** 100 searches per day per installation.

---

## 🤖 AI Assist

The AI tab requires a BYOK (Bring Your Own Key) API key. Supported providers:

| Provider | Key source |
|---|---|
| 🟣 Anthropic (Claude) | console.anthropic.com |
| 🟢 OpenAI (GPT) | platform.openai.com |
| 🔵 Groq | console.groq.com |
| 🔷 Gemini | aistudio.google.com |

Add your key in **Settings → Apps → Synctacles Care → Configuration**.

### 🔍 Diagnose

Describe any Home Assistant issue in plain language. The AI:
- Reads your live HA logs in real time
- Cross-references your configuration and entity states
- Provides step-by-step diagnostics with actionable fixes

> 💶 **Estimated cost:** ~€0.01–0.25 per session depending on model and complexity.

### 🩻 Config Doctor

Analyzes your automations with AI:

1. Select an automation from the list
2. AI reads the YAML and cross-references all entity_ids against your running HA instance
3. View detected issues and a proposed fix with a side-by-side diff
4. Apply with one click — **an automatic backup is created first**
5. Restore the original at any time with **Rollback**

---

## 📡 MQTT Maintenance

The MQTT tab appears automatically when Care detects an MQTT broker (Mosquitto) on your system. It helps you find and clean up orphaned MQTT entities — sensors that were created via MQTT Discovery but are no longer being updated by any app or integration.

### What it shows

- **Total MQTT entities** — how many entities in your registry use the MQTT platform
- **Unique MQTT devices** — number of distinct MQTT devices
- **Stale entities** — entities not updated for more than 6 hours (24h for battery devices)
- **Orphan count** — high-confidence orphans (no live state and no device)

### Orphan confidence levels

| Level | Meaning | Threshold |
|---|---|---|
| `orphan` | No live state + no device in registry | Immediate |
| `likely_orphan` | Stale >24h + device offline or missing | 24h (48h for battery) |
| `stale` | Not updated recently, device may still exist | 6h (24h for battery) |

### How to clean up

1. Open the **MQTT** tab in Care
2. Review the orphan candidate list — each shows entity ID, domain, confidence, and hours since last update
3. Click **Remove** on individual entities, or use **Bulk Cleanup** for all high-confidence orphans
4. Confirm the action — Care publishes an empty retained message to the MQTT discovery topic

### Is removal safe?

Yes. Removal publishes an empty retained payload to the entity's MQTT discovery topic. If the source app (e.g., Synctacles Energy) is still running, it will republish the discovery message within ~15 minutes and the entity reappears automatically.

### Battery device awareness

Battery-powered devices (door sensors, motion detectors, smoke detectors, etc.) often sleep for long periods. Care uses longer thresholds for these devices to avoid flagging them as orphans when they are simply in sleep mode.

### Energy app auto-cleanup

When the Synctacles Energy app is uninstalled but its MQTT sensors remain, Care automatically detects and removes the 13 orphaned Energy discovery topics.

---

## 🔏 Privacy & Data

### What is collected automatically

- 🔑 Install ID (random UUID, generated locally, never linked to you)
- 📦 App version and HA version
- 💻 Architecture (amd64/aarch64/armv7)
- 🕵️ Anonymous error fingerprints (integration name + error class only, no log content)

### What is **never** collected

- ❌ Personal data, IP addresses, or location
- ❌ HA configuration, secrets, or entity names
- ❌ Log content or error messages
- ❌ API keys or credentials

📄 Full privacy policy: **https://synctacles.com/privacy**

---

## 🔧 Troubleshooting

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
- The web UI loads instantly. Background services start after the Supervisor API is ready — typically 30–60 seconds after HA boot.

---

## 💬 Support

| Channel | Link |
|---|---|
| 🐛 In-app | Use the **Feedback** tab |
| 🐙 GitHub | [Open an issue](https://github.com/synctacles/care-app/issues) |
| 📧 Email | support@synctacles.com |
| 🌐 Website | https://synctacles.com |

---

*Gemaakt met ❤️ op Madeira*
