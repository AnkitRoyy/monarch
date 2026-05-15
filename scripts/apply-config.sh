#!/bin/bash
# ============================================================
#  apply-config.sh — Copy configs from /config into server root
# ============================================================
set -e

MOTD_EXTRA="${1:-}"

cp config/server.properties server.properties

if [ -n "$MOTD_EXTRA" ]; then
  SAFE=$(echo "$MOTD_EXTRA" | sed 's/[&/\]/\\&/g')
  sed -i "s/§r.*$/§r §7| §a$SAFE/" server.properties
fi

[ -f config/bukkit.yml ]     && cp config/bukkit.yml     bukkit.yml
[ -f config/spigot.yml ]     && cp config/spigot.yml     spigot.yml

mkdir -p plugins/ViaVersion
[ -f config/viaversion.yml ] && cp config/viaversion.yml plugins/ViaVersion/config.yml

echo "[OK] Configuration applied"
