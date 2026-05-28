cask "agent-teams" do
  version "0.1.7"
  sha256 arm:   "5f55e0b70fd99c1fd50d8baa9ba83220c629ad29ee301c1a8fdc0881f734cebd",
         intel: "d129fdb33940aa35027781e0dbff700a28452971a533d089d08311007aaf6fd0"

  url "https://github.com/ahwei/agent-teams-releases/releases/download/v#{version}/Agent-Teams-#{version}-#{Hardware::CPU.intel? ? "x64" : "arm64"}.dmg"
  name "Agent Teams"
  desc "Local read-only dashboard for Claude Code sessions, agent teams, tokens/cost and tasks"
  homepage "https://github.com/ahwei/agent-teams-releases"
  auto_updates true

  app "Agent Teams.app"

  # Ad-hoc-signed apps inherit com.apple.quarantine from the DMG download,
  # which makes macOS Gatekeeper block first launch ("can't be opened because
  # Apple cannot check it for malicious software"). Strip the attribute as
  # part of the install so the user can just double-click from /Applications.
  # Notes:
  #   - Runs as the user, NOT sudo — /Applications is admin-writable, and the
  #     app file ownership after the `app` stanza is the installing user.
  #   - Safe to run if the attribute is already absent (xattr -d -r is a no-op
  #     in that case; non-zero exit only if the path itself is missing).
  #   - Once an Apple Developer ID + notarization story exists, this whole
  #     block + the caveat below can be removed in one change.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Agent Teams.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Agent Teams",
    "~/Library/Application Support/ahwei-agent-teams",
    "~/Library/Preferences/dev.ahwei.agent-teams.plist",
    "~/Library/Saved Application State/dev.ahwei.agent-teams.savedState",
    "~/Library/Logs/Agent Teams",
    "~/Library/Caches/dev.ahwei.agent-teams",
  ]

  caveats <<~EOS
    Agent Teams is ad-hoc signed (no Apple Developer ID) and is NOT notarized.
    The cask's postflight strips com.apple.quarantine automatically so first
    launch from /Applications just works. If you ever see a Gatekeeper prompt
    anyway (older cask, manual install), run:

      xattr -dr com.apple.quarantine "/Applications/Agent Teams.app"

    Updates: this cask tracks new releases on `brew upgrade --cask agent-teams`.
    The app also self-updates via electron-updater (GitHub Releases) — both land
    on the same versions; use whichever you prefer.

    Release notes: https://github.com/ahwei/agent-teams-releases/releases/tag/v#{version}
  EOS
end
