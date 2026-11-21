cask "weir" do
  version "0.8.0"
  sha256 "7d40a7fb1dcdbab8a4db911eb56b4e1d2a1323696d2005236b7ba0f9ec18a1fb"

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
