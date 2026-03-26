# Synctacles ENERGY

**Real-time electricity price optimization for NL and EU countries**

**Stable release (v0.4.0)** — All features free, no registration required. Report issues via [GitHub Issues](https://github.com/synctacles/ha-apps/issues).

---

## Features

- ⚡ **Live Prices** - Real-time electricity prices (updated hourly)
- 💰 **Best Windows** - Identify cheapest charging hours
- 🎯 **Actions** - Energy action recommendations (GO/WAIT/AVOID)
- 📊 **Forecasts** - Price trends and predictions
- 🌍 **Multi-Country** - Support for NL, DE, BE, AT, FR, ES, NO, SE, DK
- 🔋 **Local Fallback** - Works offline with cached data
- 🆓 **Free** - All features unlocked, no registration required

---

## Installation

1. Go to **Settings** → **Apps** → **App Store** in Home Assistant
2. Click **⋮** (three dots, top right) → **Repositories**
3. Add: `https://github.com/synctacles/ha-apps`
4. Find **Synctacles ENERGY** and click **Install**

---

## Configuration

| Option | Default | Description |
|--------|---------|-------------|
| `zone` | `NL` | Bidding zone (NL, DE, BE, AT, FR, ES, NO, SE, DK, ...) |
| `go_threshold` | `-15` | Price below which GO is recommended (ct/kWh) |
| `avoid_threshold` | `20` | Price above which AVOID is recommended (ct/kWh) |
| `best_window_hours` | `3` | Number of cheapest hours to find per day |
| `coefficient` | `0` | Price correction coefficient |
| `debug_mode` | `false` | Enable verbose logging |

---

## Source Code

- **App:** [synctacles/energy-app](https://github.com/synctacles/energy-app)

---
