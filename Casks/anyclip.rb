cask "anyclip" do
  version "1.0.0"
  sha256 "1f804c391c1b05702aedbb287b0d6c638035f9bc39c90daeeb14f61916bdf5d3"

  url "https://github.com/gum798/AnyClip/releases/download/v#{version}/AnyClip-v#{version}-macos-arm64.zip"
  name "AnyClip"
  desc "LAN clipboard sync between two computers"
  homepage "https://github.com/gum798/AnyClip"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "AnyClip.app"

  caveats <<~EOS
    AnyClip is ad-hoc signed (not notarized). If macOS blocks the first
    launch, either install with:
      brew install --cask --no-quarantine anyclip
    or right-click AnyClip.app and choose Open once.
  EOS

  zap trash: [
    "~/.anyclip",
    "~/Library/LaunchAgents/com.anyclip.plist",
  ]
end
