# 🎮 Monarch MC

A private Minecraft server with Java and Bedrock cross-play support.
Versions supported: Java 1.8 – 1.21.4 and any Bedrock / PE edition.

---

## 🔗 How to Join

The server runs over **Tailscale** — a private VPN that lets you connect securely without port forwarding or a public IP. You need to do this once.

### Step 1 — Install Tailscale

Download and install Tailscale for your device:

- **PC / Mac** → <https://tailscale.com/download>
- **Android / iOS** → search "Tailscale" in your app store

### Step 2 — Join the network

Ask the admin for an invite link. Open it, sign in with Google or GitHub, and you're in. Tailscale runs in the background — you don't need to touch it again.

### Step 3 — Launch Minecraft and connect

Once Tailscale is active, ask the admin for the server IP. Then:

| Edition | How to connect |
|---------|----------------|
| **Java** | Multiplayer → Add Server → paste `<server-ip>:25565` |
| **Bedrock / PE** | Servers → Add Server → paste `<server-ip>`, port `19132` |

> The admin will share the IP in the group when the server is up.

---

## ⚙️ How it works (the basics)

- The server runs on **GitHub Actions** — a free cloud runner. No dedicated machine, no electricity cost.
- When the admin starts it, a workflow spins up a Ubuntu machine, downloads the Minecraft server, restores the last saved world, and keeps it alive for up to ~6 hours.
- Connections go through **Tailscale** so the server is private — only people in the Tailscale network can reach it.
- When the admin stops the server (or it times out), the world is automatically saved back to the repo. It picks up exactly where it left off next time.
- Plugins running: **GeyserMC** (Bedrock bridge), **Floodgate** (Bedrock auth), **ViaVersion + ViaBackwards** (old Java version support).

---

## 📋 Server info

| Setting | Value |
|---------|-------|
| Mode | Survival |
| Difficulty | Normal |
| PvP | On |
| Max players | 20 |
| RAM | 6 GB |
| Java versions | 1.8 → 1.21.4 |
| Bedrock | Any version |

---

## ❓ FAQ

**The server isn't showing up / I can't connect.**
Check that Tailscale is running on your device (the icon should be active). If it is, ask the admin if the server is online — it's only up when manually started.

**I'm on Bedrock / PE. Do I need a Java account?**
No. Bedrock players join without a Java account. Floodgate handles auth for you.

**My old Java version isn't working.**
Versions 1.8 through 1.21.4 are all supported via ViaVersion and ViaBackwards. If something breaks, let the admin know.

**How long does the server stay up?**
Up to about 5 hours 50 minutes per session, limited by GitHub Actions free tier.

---

## 🛠️ Admin reference

<details>
<summary>Expand</summary>

### Starting the server

Actions tab → **server/start** → Run workflow → optionally add a MOTD suffix

### Stopping the server

Actions tab → **server/stop** → Run workflow
World saves to the repo automatically on stop.

### One-time secrets needed

| Secret | Where |
|--------|-------|
| `TAILSCALE_AUTH_KEY` | Tailscale admin console → Auth keys |
| `GITHUB_TOKEN` | Auto-provided by Actions |

### Change RAM

Edit `-Xmx6G` in `.github/workflows/start-server.yml` under the `start server` step.

### World saves

World is committed to `world-data/world.tar.gz` after every session. Kept in git history — recoverable if something breaks.

</details>
