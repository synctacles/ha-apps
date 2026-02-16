# CARE Addon Deployment Guide

**Version:** 0.1.1-beta
**Target:** ha.synctacles.com (test instance)
**Architecture:** amd64, arm64, armv7 (multi-arch)

---

## Deployment Strategy

### Phase 1: Local Registry Push ✅ CURRENT
1. Build multi-arch images locally
2. Push to GitHub Container Registry (ghcr.io)
3. Deploy to HA via addon repository

### Phase 2: HA Instance Deployment
1. Add addon repository to HA
2. Install addon from repository
3. Configure addon settings
4. Start and test addon

### Phase 3: Beta Testing
1. Invite beta testers
2. Monitor logs and feedback
3. Iterate based on feedback

---

## Prerequisites

- ✅ Backend API deployed (care.synctacles.com)
- ✅ Binaries built (amd64, arm64, armv7)
- ✅ Docker images built locally
- ⏳ GitHub Container Registry access
- ⏳ HA instance access

---

## Step 1: Build Multi-arch Images

```bash
cd /opt/github/ha-apps/care

# Build binaries
./build-binaries.sh

# Build Docker images (multi-arch)
./build-docker.sh
```

**Output:**
- `synctacles/care-app:0.1.0-beta` (amd64, arm64, armv7)

---

## Step 2: Push to GitHub Container Registry

### 2.1 Authenticate

```bash
echo $GITHUB_PAT | docker login ghcr.io -u synctacles-bot --password-stdin
```

### 2.2 Tag Images

```bash
# Tag for GHCR
docker tag synctacles/care-app:0.1.0-beta ghcr.io/synctacles/care-app:0.1.0-beta
docker tag synctacles/care-app:0.1.0-beta ghcr.io/synctacles/care-app:latest
```

### 2.3 Push Multi-arch Manifest

```bash
# Build and push all architectures
docker buildx build \
  --platform linux/amd64,linux/arm64,linux/arm/v7 \
  --build-arg VERSION=0.1.0-beta \
  --build-arg GIT_COMMIT=352d2a1 \
  --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
  -f Dockerfile.local \
  -t ghcr.io/synctacles/care-app:0.1.0-beta \
  -t ghcr.io/synctacles/care-app:latest \
  --push \
  .
```

### 2.4 Verify

```bash
# Check registry
gh api repos/synctacles/care-app/packages

# Pull image
docker pull ghcr.io/synctacles/care-app:0.1.0-beta
```

---

## Step 3: Deploy to HA Instance

### Option A: Via HA Addon Repository (Recommended)

1. **Add Repository to HA:**
   - Settings → Add-ons → Add-on Store → ⋮ → Repositories
   - Add: `https://github.com/synctacles/ha-apps`

2. **Install Addon:**
   - Search for "Synctacles CARE"
   - Click Install
   - Wait for build/download

3. **Configure:**
   ```yaml
   api_key: ""  # Optional
   ai_api_key: ""  # Optional (BYOK)
   debug_mode: true  # For beta testing
   ```

4. **Start:**
   - Click Start
   - Check logs for errors

### Option B: Manual Docker Load (Testing)

1. **Export Image:**
   ```bash
   docker save synctacles/care-app:0.1.0-beta | gzip > care-app.tar.gz
   ```

2. **Copy to HA Instance:**
   ```bash
   scp care-app.tar.gz ha-user@ha.synctacles.com:/tmp/
   ```

3. **Load Image:**
   ```bash
   ssh ha-user@ha.synctacles.com "sudo docker load < /tmp/care-app.tar.gz"
   ```

4. **Create Addon Config:**
   ```bash
   # Create /usr/share/hassio/addons/local/synctacles_care_go/
   # Copy config.yaml, run.sh
   # Build using: ha addons rebuild local_synctacles_care_go
   ```

---

## Step 4: Verify Deployment

### 4.1 Check Addon Status

```bash
# Via HA CLI
ha addons info local_synctacles_care

# Check logs
ha addons logs local_synctacles_care
```

### 4.2 Test Endpoints

```bash
# Version check
curl http://localhost:8099/api/version

# Health scan
curl http://localhost:8099/api/scan/health

# KB search (NEW in 0.1.1-beta)
curl "http://localhost:8099/api/kb/search?query=automation&limit=2"

# KB categories (NEW in 0.1.1-beta)
curl http://localhost:8099/api/kb/categories

# KB get by ID (NEW in 0.1.1-beta)
curl http://localhost:8099/api/kb/50
```

### 4.3 Test Features

- [ ] Version shows 0.1.1-beta
- [ ] Health scan runs successfully
- [ ] Security scan returns results
- [ ] Orphan detection finds entities
- [ ] **KB search works** (queries backend API, 17,748+ articles)
- [ ] **KB categories returns 29 categories**
- [ ] **KB get by ID returns article details**
- [ ] AI support initializes (with API key)

---

## Troubleshooting

### Addon Won't Start

1. **Check logs:**
   ```bash
   ha addons logs local_synctacles_care
   ```

2. **Common issues:**
   - Backend URL not reachable → Check `CARE_API_URL` env var
   - Missing permissions → Check hassio_api/homeassistant_api settings
   - Port conflict → Check ingress_port in config.yaml

### Backend Connection Failed

1. **Test from addon container:**
   ```bash
   docker exec -it addon_local_synctacles_care /bin/sh
   curl https://care.synctacles.com/health
   ```

2. **Check DNS:**
   ```bash
   nslookup care.synctacles.com
   ```

### Build Errors

1. **Missing binaries:**
   ```bash
   cd /opt/github/ha-apps/care
   ./build-binaries.sh
   ```

2. **Docker buildx issues:**
   ```bash
   docker buildx create --name multiarch --use
   docker buildx inspect --bootstrap
   ```

---

## Rollback Procedure

If the Go addon has issues, rollback to Python version:

```bash
# Stop Go addon
ha addons stop local_synctacles_care_go

# Start Python addon
ha addons start local_synctacles_care

# Remove Go addon
ha addons uninstall local_synctacles_care_go
```

---

## Monitoring

### Metrics to Watch

1. **Memory usage:** Should be < 50MB (vs 60MB Python)
2. **Response time:** Health scan < 10s
3. **Error rate:** Check logs for exceptions
4. **Backend API calls:** Monitor care.synctacles.com logs

### Log Locations

- **Addon logs:** `/var/log/hassio/` (via `ha addons logs`)
- **Backend logs:** `ssh cc-hub 'ssh brains "journalctl -u care-prod-api"'`

---

## Success Criteria

✅ Addon starts without errors (version 0.1.1-beta)
✅ Health scan completes successfully
✅ **KB search returns results from 17,748+ articles**
✅ **KB categories endpoint works (29 categories)**
✅ **KB get by ID returns article details**
✅ Backend API connection established (care.synctacles.com)
✅ Memory usage < 50MB (measured: 2.5MB)
✅ No critical errors in logs

---

## Next Steps After Deployment

1. **Beta Testing:**
   - Invite 5-10 users
   - Collect feedback
   - Monitor for crashes/errors

2. **Documentation:**
   - Update DOCS.md with deployment notes
   - Create troubleshooting guide
   - Add screenshots

3. **Public Release:**
   - Make ha-apps repo public
   - Announce on Home Assistant forums
   - Submit to official addon repository (optional)

---

## Changelog

### 0.1.1-beta (2026-02-16)
**KB Search Feature Added**
- ✅ Added `/api/kb/search` endpoint - Search 17,748+ KB articles
- ✅ Added `/api/kb/categories` endpoint - List 29 categories
- ✅ Added `/api/kb/{id}` endpoint - Get article by ID
- ✅ Full backend API integration (care.synctacles.com)
- ✅ Tested on DEV and HA instances
- 📦 Commit: cee5369

### 0.1.0-beta (2026-02-16)
**Initial Beta Release**
- Health scan (A-F grading)
- Security scan
- Orphan entity detection
- 8 embedded solutions (offline)
- Multi-arch build system (amd64, arm64, armv7)

---

**Deployment Owner:** Synctacles Team
**Last Updated:** 2026-02-16
**Status:** Ready for beta testing (v0.1.1-beta)
