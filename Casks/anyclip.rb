cask "anyclip" do
  version "1.0.0"
  sha256 "9d335d3ca8db2cdb55c68bf94549c0cf86928c03ad24f3ce91ae36483a23f95b"

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
