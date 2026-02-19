# Synctacles Home Assistant Apps

**All Features Free • No Registration Required • Privacy-Focused**

> ⚠️ **Beta Release** — These apps are in public beta. Feedback welcome via [GitHub Issues](https://github.com/synctacles/ha-apps/issues).

Official Home Assistant apps for Synctacles products.

---

## 🎯 Available Apps

### 🏥 CARE - System Diagnostics & AI Support

**Status:** 🚧 Beta (v0.1.0)

Proactive system diagnostics, cleanup, and AI-powered troubleshooting for Home Assistant.

**Features:**
- 🏥 Health scan (A-F score) with actionable recommendations
- 🔒 Security scan (0-100) with vulnerability detection
- 🧹 Orphan entity detection and cleanup
- 📚 Knowledge base search (17,000+ HA articles)
- 🤖 AI diagnostics (bring your own Anthropic API key)
- 🆓 100% free - All features unlocked

**[→ Install CARE](care/)**

---

### ⚡ ENERGY - Price Optimization

**Status:** 🚧 Beta (v0.1.0-beta)

Real-time electricity price tracking and optimization for NL and EU countries.

**Features:**
- ⚡ Live electricity prices (updated hourly)
- 💰 Best charging windows (cheapest hours)
- 🎯 Energy action recommendations (GO/WAIT/AVOID)
- 📊 Forecasts and price trends
- 🌍 Multi-country support (NL, DE, BE, AT, FR, ES, NO, SE, DK)
- 🔋 Local fallback — works offline with cached data
- 🆓 100% free - All features unlocked

**[→ Install ENERGY](energy/)**

---

## 📦 Installation

### Option 1: Add Repository (Recommended)

1. Go to **Settings** → **Apps** → **App Store** in Home Assistant
2. Click **⋮** (three dots, top right) → **Repositories**
3. Add repository URL: `https://github.com/synctacles/ha-apps`
4. Click **Add** → **Close**
5. Refresh the App Store page
6. Find **Synctacles CARE** or **Synctacles ENERGY**
7. Click **Install**

### Option 2: One-Click Add

[![Add Repository][add-repo-badge]][add-repo-url]

---

## 🔐 Privacy & Data

### What We Collect (Optional)

**Only if you enable telemetry:**
- Installation ID (random UUID, not linked to you)
- Product version
- System info (HA version, architecture)
- Anonymous usage statistics

### What We DO NOT Collect

- ❌ Personal identifiable information
- ❌ HA configuration or secrets
- ❌ Entity names or data
- ❌ Logs or error messages

**GDPR Compliant:** [Privacy Policy](https://github.com/synctacles/platform/blob/main/PRIVACY.md)

---

## 📚 Documentation

- **User Guide:** [DOCS.md](https://github.com/synctacles/platform/blob/main/DOCS.md)
- **CARE App:** [care/README.md](care/README.md)
- **Privacy Policy:** [PRIVACY.md](https://github.com/synctacles/platform/blob/main/PRIVACY.md)
- **License:** [LICENSE](LICENSE)

---

## 🆘 Support

- **GitHub Issues:** [Report a Bug](https://github.com/synctacles/ha-apps/issues/new?template=bug_report.yml)
- **Documentation:** [DOCS.md](https://github.com/synctacles/platform/blob/main/DOCS.md)
- **Community Forum:** [Home Assistant Forum](https://community.home-assistant.io/)

---

## 🤝 Contributing

Synctacles apps are open-source! Contributions welcome.

**Source Code Repositories:**
- CARE App: [synctacles/care-app](https://github.com/synctacles/care-app)
- CARE Backend: [synctacles/care-backend](https://github.com/synctacles/care-backend)
- Energy App: [synctacles/energy-app](https://github.com/synctacles/energy-app)
- Energy Backend: [synctacles/energy-backend](https://github.com/synctacles/energy-backend)
- Platform: [synctacles/platform](https://github.com/synctacles/platform)

---

## 📄 License

MIT License - See [LICENSE](LICENSE)

---

## 📧 Contact

- **Email:** support@synctacles.com
- **GitHub:** [@synctacles](https://github.com/synctacles)
- **Website:** https://synctacles.com

---

**Built with ❤️ by Synctacles**

---

[add-repo-badge]: https://img.shields.io/badge/Add_Repository-41BDF5?style=for-the-badge&logo=homeassistant&logoColor=white
[add-repo-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fsynctacles%2Fha-apps
