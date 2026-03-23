# Privacy Policy

**Effective Date:** February 16, 2026
**Last Updated:** March 6, 2026

## Overview

Synctacles provides free Home Assistant apps for energy optimization and system maintenance. This Privacy Policy explains what your app shares with us, why, and how we protect it.

**Key Points:**
- All Synctacles products are **100% free** with no paid tiers
- All features work **without registration** — no account, no email
- Your app shares **minimal, anonymous data** to help us improve the product for the entire community
- You can **delete all your data** at any time from the app Settings

---

## 1. Responsible Party

**Name:** Synctacles
**Contact:** support@synctacles.com
**Location:** Madeira, Portugal

---

## 2. What Your App Shares

### 2.1 Install Identifier (always active)

Your app generates a random identifier (UUID) on first install and periodically shares:
- **Installation ID** (randomly generated UUID, not linked to you personally)
- **Product name** (e.g., "energy" or "care")
- **App version** (e.g., "1.3.1")
- **System architecture** (e.g., "aarch64", "x86_64")

This contains no personal information — only 4 anonymous fields so we can count active installations and prioritize architecture support.

**Legal Basis:** Legitimate Interest (GDPR Article 6(1)(f))
**Balancing test:** Our legitimate interest is counting active installations and monitoring version adoption. The impact on users is minimal: data is pseudonymous, cannot be linked to individuals without additional information, and is automatically removed after 90 days of inactivity.

### 2.2 Community Improvement Data (default: enabled, opt-out available)

To help improve app quality for all users, your app periodically shares anonymous system information:

**General (both apps):**
- **Installation ID** (same UUID as above)
- **Product version** and **Home Assistant version**
- **System info** (architecture, OS type, install type)
- **Language and country** (for localization priority)
- **Uptime range** (e.g., "7-30 days" — bucketed, not exact)

**Energy app additionally shares:**
- **Active price source** (e.g., "worker", "external_sensor") and **fallback frequency range**
- **Cache efficiency range** (e.g., ">90%")
- **Price source reliability** (which source tier is active, daily report)
- **Energy coverage hints** (bidding zone and contract type, one-time, only if a third-party energy sensor is detected and Synctacles Energy is not installed)

**Care app additionally shares:**
- **Database health metrics** (size range, health grade, orphan count)
- **Cleanup outcome ranges** (items removed range, duration range)
- **Common issue signatures** (normalized integration error patterns — no entity names, no personal data, no configuration details)
- **System health overview** (CPU/memory usage percentages, disk capacity, installed addon slugs and versions, HA resolution status)

All values that could identify usage patterns are sent as **ranges** (buckets), not exact numbers. No IP addresses are stored. No entity names, automation content, or configuration details are included.

**Legal Basis:** Legitimate Interest (GDPR Article 6(1)(f))
**Balancing test:** Our legitimate interest is improving app stability and performance for all users. The impact is minimal: data is anonymous, bucketed where possible, and automatically removed after 90 days.
**Purpose:** Improve app stability, prioritize bug fixes, understand common issues across the community, and optimize performance.
**How to opt out:** Disable "Community Data" in the app Settings tab.

### 2.3 Knowledge Base Interaction

When you search the Knowledge Base, your app sends:
- **Search query** (the text you type)
- **Installation ID** (for rate limiting and usage analytics)
- **Article feedback** (helpful/not helpful, if you choose to rate an article)

This data helps us improve search quality and article relevance.

**Legal Basis:** Legitimate Interest (GDPR Article 6(1)(f))

### 2.4 Optional User Feedback

If you submit feedback or a bug report via the app, your submission includes:
- **Feedback text** (your comment)
- **Category and severity** (if reporting a bug)
- **Basic system info** (HA version, app version, architecture)

**Legal Basis:** Consent (GDPR Article 6(1)(a))
**Purpose:** Improve our products based on user feedback.

**Note:** Bug reports may automatically create GitHub Issues in our public repository. Do not include personal information in bug reports.

### 2.5 AI Diagnostics (optional, your key)

If you use AI diagnostics, your app communicates directly with your chosen AI provider (Anthropic, OpenAI, Google, or Groq) using **your own API key**. Synctacles never sees or stores this data. Before sending, your app automatically strips API keys, GPS coordinates, IP addresses, email addresses, MAC addresses, and webhook URLs.

### 2.6 What We DO NOT Have Access To

- ❌ **No tracking cookies** (we don't track you across websites)
- ❌ **No analytics services** (no Google Analytics, etc.)
- ❌ **No third-party advertising**
- ❌ **No selling of data** (we never sell your information)
- ❌ **No profiling** (we don't build user profiles)
- ❌ **No entity names or automation content**
- ❌ **No passwords, API keys, or secrets**
- ❌ **No email addresses** (we don't ask for or store email)

---

## 3. How This Data Helps the Community

### Install Identifier
- Count active installations to understand community size
- Monitor version adoption to know when to drop legacy support
- Ensure all architectures (Raspberry Pi, x86, etc.) remain supported

### Community Improvement Data
- Detect and fix stability issues before they affect more users
- Understand common integration problems across thousands of installations
- Optimize features for the most common system configurations
- Improve price source reliability (Energy) and database health tools (Care)

### Feedback & Bug Reports
- Fix reported bugs
- Prioritize feature requests

---

## 4. Where It's Kept & Security

### Where Your Data Is Stored

- **Install & community data:** Cloudflare D1 database (Cloudflare global network, GDPR-compliant)
- **Bug reports:** GitHub Issues (publicly visible, USA)

### Security Measures

- **Encryption:** All data transmitted over HTTPS (TLS 1.3)
- **Access control:** Database access restricted to authorized personnel only
- **Rate limiting:** Prevents abuse on all API endpoints
- **No raw IP storage:** IP addresses are hashed for rate limiting and cannot be recovered

### How Long It's Kept

- **Install & community data:** Automatically removed after 90 days of inactivity
- **Version history:** Automatically pruned after 180 days
- **Bug reports:** Retained indefinitely in GitHub (public record)
- **AI session data:** Processed in real-time by your AI provider and not retained by Synctacles

---

## 5. Your Rights (GDPR)

You have the following rights under the General Data Protection Regulation (GDPR):

### Right to Access
Request a copy of all data we hold about your installation. You can also retrieve your data directly via the API: `GET /api/v1/install/data?install_uuid=YOUR_UUID`.

### Right to Rectification
Request correction of inaccurate or incomplete data.

### Right to Erasure ("Right to be Forgotten")
Delete all your data via the "Delete My Data" button in the app Settings tab, or by emailing us. Deletion is immediate and automatic.

### Right to Restrict Processing
Request limitation of how we process your data.

### Right to Data Portability
Receive your data in a machine-readable format (JSON).

### Right to Object
Object to community data sharing by disabling "Community Data" in the app Settings tab.

**How to Exercise Your Rights:**
Email us at: **support@synctacles.com** with subject "GDPR Request"

We will respond within **30 days** as required by GDPR Article 12(3).

---

## 6. Third Parties

### Services We Use

- **GitHub:** Bug reports are publicly visible in our GitHub repository (by design)
- **Cloudflare:** Infrastructure hosting (GDPR-compliant) — see [Cloudflare Privacy Policy](https://www.cloudflare.com/privacypolicy/)

### We DO NOT Share Data With

- ❌ **Advertisers** (we have no ads)
- ❌ **Data brokers** (we never sell data)
- ❌ **Analytics companies** (no Google Analytics, etc.)
- ❌ **Social media platforms** (no Facebook Pixel, etc.)

### International Transfers

Your data is stored on **Cloudflare's global network** (GDPR-compliant, EU Standard Contractual Clauses). Data may also be accessed from:
- **GitHub Issues** (USA) — only if you submit a bug report

---

## 7. Cookies

**We do not use cookies.**

Our apps communicate directly with our API without browser-based tracking.

---

## 8. Children's Privacy

Our products are not directed at children under 16. If you believe a child has provided us with personal data, contact us immediately.

---

## 9. Changes to This Policy

We may update this policy to reflect changes in our practices or legal requirements. We will:
- Update the "Last Updated" date at the top
- Post a notice in our GitHub repository

**Your continued use of our products after changes constitutes acceptance of the updated policy.**

---

## 10. Supervisory Authority

If you are located in the EU/EEA and have concerns about how we handle your data, you have the right to lodge a complaint with your local data protection authority:

**Portugal (our jurisdiction):**
CNPD — Comissão Nacional de Proteção de Dados
Website: https://www.cnpd.pt/
Phone: +351 213 928 400

**Find your local authority:** https://edpb.europa.eu/about-edpb/about-edpb/members_en

---

## 11. Contact Us

For privacy-related questions, data access requests, or to exercise your GDPR rights:

**Email:** support@synctacles.com
**Subject:** Privacy Request
**Response Time:** Within 30 days (GDPR requirement)

---

## 12. Open Source & Transparency

Our code is open-source and available on GitHub:
- Platform: https://github.com/synctacles/platform
- Energy App: https://github.com/synctacles/energy-app
- Care App: https://github.com/synctacles/care-app

You can verify our data practices by reviewing the source code.

---

**Thank you for trusting Synctacles. We take your privacy seriously.**
