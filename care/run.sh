#!/usr/bin/with-contenv bashio

# Read addon options via bashio and export as env vars.
# This bridges HA addon config (JSON) to Go's env-based config.

export SYNCTACLES_API_KEY="$(bashio::config 'api_key' '')"
export SYNCTACLES_LICENSE_KEY="$(bashio::config 'license_key' '')"
export SYNCTACLES_AI_API_KEY="$(bashio::config 'ai_api_key' '')"
export NOTIFICATIONS_ENABLED="$(bashio::config 'notifications_enabled' 'true')"
export SCHEDULED_SCAN_ENABLED="$(bashio::config 'scheduled_scan_enabled' 'false')"
export AUTO_CLEANUP_ENABLED="$(bashio::config 'auto_cleanup_enabled' 'false')"
export DEBUG_MODE="$(bashio::config 'debug_mode' 'false')"
export DEMO_MODE="$(bashio::config 'demo_mode' 'false')"
export TELEMETRY_ENABLED="$(bashio::config 'telemetry_enabled' 'false')"

exec /usr/bin/care-addon
