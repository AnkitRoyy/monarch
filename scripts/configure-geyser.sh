#!/bin/bash
# ============================================================
#  configure-geyser.sh — Patch Geyser config after first run
# ============================================================

GEYSER_CONFIG="plugins/Geyser-Spigot/config.yml"

if [ ! -f "$GEYSER_CONFIG" ]; then
  echo "[WARN] Geyser config not found — skipping patch (will use defaults)"
  exit 0
fi

echo "[INFO] Patching Geyser config..."

sed -i 's/auth-type: online/auth-type: floodgate/' "$GEYSER_CONFIG"
sed -i '/^bedrock:/,/^[^ ]/ s/port: .*/port: 19132/' "$GEYSER_CONFIG"
sed -i 's/# floodgate-key-file:.*/floodgate-key-file: key.pem/' "$GEYSER_CONFIG"
sed -i 's/show-cooldown: title/show-cooldown: false/' "$GEYSER_CONFIG"
sed -i 's/ping-passthrough-interval: .*/ping-passthrough-interval: 3/' "$GEYSER_CONFIG"
sed -i 's/thread-pool-size: .*/thread-pool-size: 4/' "$GEYSER_CONFIG"
sed -i 's/cache-chunks: .*/cache-chunks: true/' "$GEYSER_CONFIG"
sed -i 's/compression-level: .*/compression-level: 6/' "$GEYSER_CONFIG"

echo "[OK] Geyser config patched — auth: floodgate, port: 19132"
