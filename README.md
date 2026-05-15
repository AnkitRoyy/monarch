# 🎮 Monarch Minecraft Server
> **Java + Bedrock + PE cross-play** — hosted free on GitHub Actions, world saves automatically.

---

## ✅ One-time setup

### 1. Push this repo to GitHub
```bash
git init
git add .
git commit -m "first commit"
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git branch -M main
git push -u origin main
```

### 2. Add your playit.gg secret
1. Repo → **Settings** → **Secrets and variables** → **Actions**
2. **New repository secret**
3. Name: `PLAYIT_SECRET` | Value: your playit secret key

### 3. That's it — never touch your machine again!

---

## 🚀 Starting the Server
1. **Actions** tab → **🎮 Start Minecraft Server** → **Run workflow**
2. Wait ~2 min for startup
3. Get your addresses from https://playit.gg/account/tunnels

---

## 🎮 Connection Addresses (permanent, never change)

| Edition | Address | Port |
|---------|---------|------|
| **Java** (1.8 – 1.21.4) | `your-java-tunnel.joinmc.link` | 25565 |
| **Bedrock / PE** | `your-bedrock-tunnel.at.ply.gg` | (from playit dashboard) |

---

## 🛑 Stopping the Server
**Actions** tab → **🛑 Stop Minecraft Server** → **Run workflow**

> ✅ World is **automatically saved** to GitHub Artifacts when the server stops (kept for 90 days).
> ✅ World is **automatically restored** when you start the server again.

---

## ⚙️ Customisation

| What | How |
|------|-----|
| Difficulty / gamemode | Edit `config/server.properties` |
| Make yourself admin | Type `op YourUsername` in the Actions console |
| Whitelist friends | `whitelist on` then `whitelist add FriendName` |
| Change RAM | Edit `-Xmx6G` in `start-server.yml` |

---

## ⏱️ GitHub Actions Free Limits

| Limit | Value |
|-------|-------|
| Max session | ~5h 50min |
| Free mins/month | 2,000 min (~33 hrs) |
| RAM | 7 GB total (server gets 6 GB) |
| Recommended players | 10–15 |
