cask "anyclip" do
  version "1.4.5"
  sha256 "2617c9f83ea534fae0fbd0aeca2602b6fb2eee3ff1549107b444f99e00e837f2"

  url "https://github.com/gum798/AnyClip/releases/download/v#{version}/AnyClip-v#{version}-macos-universal.zip"
  name "AnyClip"
  desc "LAN clipboard sync between two computers"
  homepage "https://github.com/gum798/AnyClip"

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
