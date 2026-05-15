#!/bin/bash
# ============================================================
#  download.sh — Downloads all Minecraft server jars
# ============================================================
set -e

RED='\033[0;31m'; GREEN='\033[0;32m'; CYAN='\033[0;36m'; RESET='\033[0m'
info()    { echo -e "${CYAN}[DL]${RESET}  $1"; }
success() { echo -e "${GREEN}[OK]${RESET}  $1"; }
error()   { echo -e "${RED}[ERR]${RESET} $1"; exit 1; }

PAPER_VERSION="1.21.4"
mkdir -p plugins

# ── PaperMC ──────────────────────────────────────────────────
info "Fetching latest PaperMC $PAPER_VERSION build..."
PAPER_BUILD=$(curl -fsSL \
  "https://api.papermc.io/v2/projects/paper/versions/$PAPER_VERSION/builds" \
  | python3 -c "
import sys, json
data = json.load(sys.stdin)
builds = data.get('builds', [])
if not builds:
    print('ERROR: no builds found', file=sys.stderr)
    sys.exit(1)
print(builds[-1]['build'])
")
PAPER_JAR="paper-$PAPER_VERSION-$PAPER_BUILD.jar"
PAPER_URL="https://api.papermc.io/v2/projects/paper/versions/$PAPER_VERSION/builds/$PAPER_BUILD/downloads/$PAPER_JAR"
info "Downloading PaperMC build $PAPER_BUILD..."
curl -fsSL -o server.jar "$PAPER_URL"
success "PaperMC downloaded (build $PAPER_BUILD)"

# ── GeyserMC ─────────────────────────────────────────────────
info "Downloading GeyserMC (Bedrock bridge)..."
curl -fsSL -o plugins/Geyser-Spigot.jar \
  "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot"
success "GeyserMC downloaded"

# ── Floodgate ────────────────────────────────────────────────
info "Downloading Floodgate (Bedrock auth)..."
curl -fsSL -o plugins/floodgate-spigot.jar \
  "https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot"
success "Floodgate downloaded"

# ── ViaVersion ───────────────────────────────────────────────
info "Downloading ViaVersion..."
VIA_RELEASE=$(curl -fsSL "https://api.github.com/repos/ViaVersion/ViaVersion/releases/latest" \
  | python3 -c "import sys,json; print(json.load(sys.stdin)['tag_name'])")
curl -fsSL -o plugins/ViaVersion.jar \
  "https://github.com/ViaVersion/ViaVersion/releases/download/$VIA_RELEASE/ViaVersion-$VIA_RELEASE.jar"
success "ViaVersion $VIA_RELEASE downloaded"

# ── ViaBackwards ─────────────────────────────────────────────
info "Downloading ViaBackwards..."
VB_RELEASE=$(curl -fsSL "https://api.github.com/repos/ViaVersion/ViaBackwards/releases/latest" \
  | python3 -c "import sys,json; print(json.load(sys.stdin)['tag_name'])")
curl -fsSL -o plugins/ViaBackwards.jar \
  "https://github.com/ViaVersion/ViaBackwards/releases/download/$VB_RELEASE/ViaBackwards-$VB_RELEASE.jar"
success "ViaBackwards $VB_RELEASE downloaded"

echo ""
echo "✅ All downloads complete:"
ls -lh server.jar plugins/*.jar 2>/dev/null || true
