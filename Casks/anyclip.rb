cask "anyclip" do
  version "1.1.9"
  sha256 "6062321c859cca6fad1e87a272699fd92aaa2fc956ed4f561bf686a4560c85f4"

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
