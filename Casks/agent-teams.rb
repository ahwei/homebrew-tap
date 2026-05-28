cask "agent-teams" do
  version "0.1.1"
  sha256 arm:   "a5aba771e4a92e96dcba41fa15e71cdbbbde473cf0d477878262c10966ed4b57",
         intel: "2b7a1a47f32ae9ae950e11cb370ec0371c480ffece8047b182caeef60990fdaf"

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
