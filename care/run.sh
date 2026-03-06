#!/usr/bin/with-contenv bashio

# Read addon options via bashio and export as env vars.
# This bridges HA addon config (JSON) to Go's env-based config.

export SYNCTACLES_AI_PROVIDER="$(bashio::config 'ai_provider' 'anthropic')"
export SYNCTACLES_AI_API_KEY="$(bashio::config 'ai_api_key' '')"
export NOTIFICATIONS_ENABLED="$(bashio::config 'notifications_enabled' 'true')"
export SCHEDULED_SCAN_ENABLED="$(bashio::config 'scheduled_scan_enabled' 'false')"
export AUTO_CLEANUP_ENABLED="$(bashio::config 'auto_cleanup_enabled' 'false')"
export AUTONOMOUS_MODE_ENABLED="$(bashio::config 'autonomous_mode_enabled' 'false')"
export DEBUG_MODE="$(bashio::config 'debug_mode' 'false')"

exec /usr/bin/care-addon
