cask "weir" do
  version "0.7.2"
  sha256 "b432e698ef4df100f697b80670bbe03961389cf241c13b9f27d99ab2c3aa6c8a"

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
  binary "#{appdir}/Weir.app/Contents/MacOS/weir"

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
    The weir command (weir --json, weir test) works once Weir has opened.
  EOS
end
