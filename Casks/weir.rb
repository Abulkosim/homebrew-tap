cask "weir" do
  version "0.5.0"
  sha256 "74a633d3784981339344db38f434e8846e4a3503b268cc7c497eeb05aaf7c027"

  url "https://github.com/Abulkosim/weir/releases/download/v#{version}/Weir_#{version}_universal.dmg"
  name "Weir"
  desc "Menu bar speed test and connection check"
  homepage "https://abulkosim.github.io/weir/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "Weir.app"

  uninstall quit: "com.abulkosim.weir"

  zap trash: [
    "~/Library/Application Support/com.abulkosim.weir",
    "~/Library/Caches/com.abulkosim.weir",
    "~/Library/Caches/weir",
    "~/Library/LaunchAgents/Weir.plist",
    "~/Library/WebKit/com.abulkosim.weir",
    "~/Library/WebKit/weir",
  ]

  caveats <<~EOS
    Weir is not notarized, so macOS blocks the first launch.
    Open System Settings → Privacy & Security, click Open Anyway, then Open.
    On macOS 12–14, Control-click Weir in Applications → Open also works.
  EOS
end
