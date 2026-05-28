cask "agent-teams" do
  version "0.1.3"
  sha256 arm:   "419a4a4c130aa689706ac6be03f6875a353383f6724c066904eacd6d841d37fc",
         intel: "3861f4754ce189b4c463025963a13907fde246f735cd1b69741b3a4b9184757f"

  url "https://github.com/ahwei/agent-teams-releases/releases/download/v#{version}/Agent-Teams-#{version}-#{Hardware::CPU.intel? ? "x64" : "arm64"}.dmg"
  name "Agent Teams"
  desc "Local read-only dashboard for Claude Code sessions, agent teams, tokens/cost and tasks"
  homepage "https://github.com/ahwei/agent-teams-releases"
  auto_updates true

  app "Agent Teams.app"

  zap trash: [
    "~/Library/Application Support/Agent Teams",
    "~/Library/Preferences/dev.ahwei.agent-teams.plist",
    "~/Library/Saved Application State/dev.ahwei.agent-teams.savedState",
    "~/Library/Logs/Agent Teams",
  ]

  caveats <<~EOS
    Agent Teams is ad-hoc signed (no Apple Developer ID) and is NOT notarized.
    On first launch macOS Gatekeeper will block it. To allow:

      xattr -dr com.apple.quarantine "/Applications/Agent Teams.app"

    Or: right-click the app in /Applications, choose Open, then confirm.

    Updates: this cask tracks new releases on `brew upgrade --cask agent-teams`.
    The app also self-updates via electron-updater (GitHub Releases) — both land
    on the same versions; use whichever you prefer.

    Release notes: https://github.com/ahwei/agent-teams-releases/releases/tag/v#{version}
  EOS
end
