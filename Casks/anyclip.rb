cask "anyclip" do
  version "1.1.3"
  sha256 "ef2a9264def08aebf47e5404af11dc1041ec4319fed7b1d787a58eadb318066f"

  url "https://github.com/gum798/AnyClip/releases/download/v#{version}/AnyClip-v#{version}-macos-arm64.zip"
  name "AnyClip"
  desc "LAN clipboard sync between two computers"
  homepage "https://github.com/gum798/AnyClip"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "AnyClip.app"

  caveats <<~EOS
    AnyClip is ad-hoc signed (not notarized), so Gatekeeper blocks the
    first launch. Either right-click AnyClip.app and choose Open once, or:
      xattr -dr com.apple.quarantine /Applications/AnyClip.app
  EOS

  zap trash: [
    "~/.anyclip",
    "~/Library/LaunchAgents/com.anyclip.plist",
  ]
end
