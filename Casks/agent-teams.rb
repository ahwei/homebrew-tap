cask "agent-teams" do
  version "0.1.0"
  sha256 arm:   "cc4ac639072e74a9748920bf03fc420e2fc85f15245954b45fd7d158db374a07",
         intel: "6ec271f89cbc53157a9a731ca606a3954193725cdf6755a6f13782c5fb409854"

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
