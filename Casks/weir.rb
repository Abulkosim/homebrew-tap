cask "weir" do
  version "0.6.0"
  sha256 "0bb722a4b90df395677401da4c8ec52692069c70472005e611feb96134e8a9ab"

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
