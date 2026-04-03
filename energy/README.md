# Synctacles ENERGY

**Real-time electricity prices, smart actions, and cost tracking for 50 zones across 31 countries**

All features free. No account, no subscription — install and go.

---

## Features

- ⚡ **Live Prices** — Real-time wholesale and consumer electricity prices
- 🎯 **GO/WAIT/AVOID** — Smart action recommendations based on price levels
- 💰 **Best Window** — Find the cheapest hours for EV charging, washing, etc.
- 📊 **Price Chart** — Visual overview with 15-minute and hourly resolution
- 🌍 **50 Zones, 31 Countries** — EU/EEA wholesale + regulated zones (MT, IS, CY, TR, Madeira, Azores)
- 💱 **11 Currencies** — EUR, GBP, NOK, SEK, DKK, PLN, TRY, CHF, CZK, HUF, ISK
- 📋 **5 Pricing Modes** — Auto, Manual, External Sensor, Fixed Rate, Time-of-Use
- 🔌 **15 MQTT Sensors** — Price, action, cheapest/expensive hours, renewable share, live cost
- 🌿 **Renewable Share** — Real-time grid renewable percentage (solar + wind)
- 🔋 **Local Fallback** — Works offline with 48h cached data
- 🏠 **Setup Wizard** — Auto-detects your zone, supplier, and tariff sensor
- 🆓 **Free** — All features, no registration, no API key needed

---

## Installation

1. Go to **Settings** → **Apps** → **App Store** in Home Assistant
2. Click **⋮** → **Repositories** → add `https://github.com/synctacles/ha-apps`
3. Find **Synctacles Energy** and click **Install**
4. The setup wizard guides you through configuration

---

## Configuration

All settings are managed through the built-in web UI. Key options:

| Option | Default | Description |
|--------|---------|-------------|
| `zone` | Auto-detect | Your electricity bidding zone |
| `pricing_mode` | `auto` | Auto, Manual, External Sensor, Fixed, TOU |
| `supplier_id` | Auto-detect | Your energy supplier (for price calibration) |
| `go_threshold` | `-15` | % below average for GO recommendation |
| `avoid_threshold` | `20` | % above average for AVOID recommendation |
| `best_window_hours` | `3` | Cheapest consecutive hours to find |
| `power_sensor` | Auto-detect | Power sensor for live cost tracking (W) |

---

## Source Code

[synctacles/energy-app](https://github.com/synctacles/energy-app) — Go, Docker, open source

---
