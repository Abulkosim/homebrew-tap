cask "weir" do
  version "0.8.1"
  sha256 "16da8ccd34dcd9f378f73040c0e0636b9291c010df64458e68da3b6b41b8cbb2"

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
