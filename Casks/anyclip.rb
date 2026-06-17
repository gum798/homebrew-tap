cask "anyclip" do
  version "1.1.7"
  sha256 "6d09af3b89cf51c37910813359e489b272d890d6aa7d967f2bec1079f7737dc0"

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
