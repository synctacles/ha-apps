# Privacy Policy

**Effective Date:** February 16, 2026
**Last Updated:** February 16, 2026

## Overview

Synctacles provides free Home Assistant addons for energy optimization and system maintenance. This Privacy Policy explains how we collect, use, and protect your personal data when you use our products.

**Key Points:**
- All Synctacles products are **100% free** with no paid tiers
- Email verification is **optional** (only for telemetry and notifications)
- All addon features work **without registration**
- We collect **minimal data** and respect your privacy

---

## 1. Data Controller

**Name:** Synctacles (DATADIO)
**Contact:** support@synctacles.com
**Location:** Netherlands

---

## 2. What Data We Collect

### 2.1 Optional Email Verification

If you choose to verify your email address, we collect:
- **Email address** (for sending verification codes and optional notifications)
- **Verification timestamp** (when you completed verification)

**Legal Basis:** Consent (GDPR Article 6(1)(a))
**Purpose:** Email verification enables optional features like error notifications and product updates.

### 2.2 Anonymous Install Heartbeat (default: enabled)

When you enable "Anonymous install counting" in the app settings (enabled by default), we collect:
- **Installation ID** (randomly generated UUID, not linked to you personally)
- **Product name** (e.g., "energy" or "care")
- **App version** (e.g., "1.3.1")
- **System architecture** (e.g., "aarch64", "x86_64")

**This is the only data we collect by default.** It contains no personal information — only 4 anonymous fields to count active installations and supported architectures.

**Legal Basis:** Consent (GDPR Article 6(1)(a))
**Purpose:** Count active installations, monitor version adoption, and ensure architecture support.
**How to disable:** Set "heartbeat_enabled" to false in the app settings. Note: disabling this will limit access to remote features (KB search, price forecasts, etc.) because we cannot verify your installation.

### 2.3 Optional Usage Telemetry

If you additionally opt-in to telemetry, we collect more detailed (but still anonymous) data:
- **Installation ID** (same UUID as heartbeat)
- **Product version** (e.g., "Energy v1.2.0")
- **System information** (e.g., "Home Assistant OS on aarch64")
- **Usage statistics** (e.g., "uptime: 7-30 days", "cache hit rate: >90%")
- **IP address** (for rate limiting and abuse prevention)

**Legal Basis:** Consent (GDPR Article 6(1)(a))
**Purpose:** Improve app stability, prioritize bug fixes, and optimize performance.

### 2.4 Optional User Feedback

If you submit feedback via our addon, we collect:
- **Rating** (1-5 stars)
- **Feedback text** (optional comment)
- **Bug reports** (if you choose to report a bug)
- **IP address** (for rate limiting)

**Legal Basis:** Consent (GDPR Article 6(1)(a))
**Purpose:** Improve our products based on user feedback.

**Note:** Bug reports may automatically create GitHub Issues in our public repository. Do not include personal information in bug reports.

### 2.5 What We DO NOT Collect

- ❌ **No tracking cookies** (we don't track you across websites)
- ❌ **No analytics** (Google Analytics, etc.)
- ❌ **No third-party advertising**
- ❌ **No selling of data** (we never sell your information)
- ❌ **No profiling** (we don't build user profiles)

---

## 3. How We Use Your Data

### Email Address
- Send verification codes (one-time use)
- Send optional notifications (error alerts, product updates) — **you can opt-out anytime**
- Contact you regarding your feedback or bug reports

### Telemetry Data
- Monitor addon stability and performance
- Prioritize bug fixes based on affected users
- Optimize features for common system configurations

### Feedback & Bug Reports
- Improve addon features
- Fix reported bugs
- Track issue resolution

---

## 4. Data Storage & Security

### Where We Store Your Data

- **Email addresses:** PostgreSQL database on EU server (Hetzner, Germany)
- **Telemetry:** PostgreSQL database on EU server (Hetzner, Germany)
- **Bug reports:** GitHub Issues (publicly visible, USA)

### Security Measures

- **Encryption:** All data transmitted over HTTPS (TLS 1.3)
- **Access control:** Database access restricted to authorized personnel only
- **Rate limiting:** 5 requests per hour for feedback/email verification (prevents abuse)
- **Disposable email blocking:** We block temporary email addresses (e.g., mailinator.com)

### Data Retention

- **Email addresses:** Retained until you request deletion
- **Heartbeat data:** Automatically deleted after 90 days of inactivity
- **Telemetry:** Automatically deleted after 90 days of inactivity
- **Bug reports:** Retained indefinitely in GitHub (public record)

---

## 5. Your Rights (GDPR)

You have the following rights under the General Data Protection Regulation (GDPR):

### Right to Access
Request a copy of all personal data we hold about you.

### Right to Rectification
Request correction of inaccurate or incomplete data.

### Right to Erasure ("Right to be Forgotten")
Request deletion of your personal data. We will comply within 30 days.

### Right to Restrict Processing
Request limitation of how we process your data.

### Right to Data Portability
Receive your data in a machine-readable format (JSON).

### Right to Object
Object to processing of your data for specific purposes.

### Right to Withdraw Consent
Withdraw your consent to email verification or telemetry at any time. This does not affect prior processing based on consent.

**How to Exercise Your Rights:**
Email us at: **support@synctacles.com** with subject "GDPR Request"

We will respond within **30 days** as required by GDPR Article 12(3).

---

## 6. Data Sharing & Third Parties

### Who We Share Data With

- **GitHub:** Bug reports are publicly visible in our GitHub repository (by design)
- **Email provider:** Zoho Mail (for sending verification emails) — see [Zoho Privacy Policy](https://www.zoho.com/privacy.html)
- **Hosting provider:** Hetzner (Germany) — see [Hetzner Privacy Policy](https://www.hetzner.com/legal/privacy-policy)

### Who We DO NOT Share Data With

- ❌ **Advertisers** (we have no ads)
- ❌ **Data brokers** (we never sell data)
- ❌ **Analytics companies** (Google Analytics, etc.)
- ❌ **Social media platforms** (no Facebook Pixel, etc.)

### International Transfers

Your data is stored in **Germany (EU)** and not transferred outside the EU, except for:
- **GitHub Issues** (USA) — only if you submit a bug report
- **Email delivery** (Zoho routes emails globally)

These transfers are based on your explicit consent when submitting data.

---

## 7. Cookies & Tracking

**We do not use cookies or tracking technologies.**

Our addons communicate directly with our API without browser-based tracking.

---

## 8. Children's Privacy

Our products are not directed at children under 16. We do not knowingly collect data from children. If you believe a child has provided us with personal data, contact us immediately.

---

## 9. Changes to This Privacy Policy

We may update this policy to reflect changes in our practices or legal requirements. We will:
- Update the "Last Updated" date at the top
- Notify users via email (if you provided your email)
- Post a notice in our GitHub repository

**Your continued use of our products after changes constitutes acceptance of the updated policy.**

---

## 10. Supervisory Authority

If you are located in the EU/EEA and have concerns about how we handle your data, you have the right to lodge a complaint with your local data protection authority:

**Netherlands (our jurisdiction):**
Autoriteit Persoonsgegevens
Website: https://autoriteitpersoonsgegevens.nl/
Phone: +31 (0)70 888 85 00

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
- Energy: https://github.com/synctacles/energy-backend
- Care: https://github.com/synctacles/care-backend

You can verify our data practices by reviewing the source code.

---

**Thank you for trusting Synctacles with your data. We take your privacy seriously.** 🛡️
