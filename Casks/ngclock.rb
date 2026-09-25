cask "ngclock" do
  version "0.6.0"
  sha256 "0832c59f5bee9a8277b92491532730296b61ff9e1d6937d5a4da8e51fad192ae"

  url "https://github.com/AMZNGM/ngclock-releases/releases/download/v#{version}/NGCLock-mac-arm64.dmg"
  name "NGCLock"
  desc "Net work-hour limit that sits in your menu bar"
  homepage "https://ngclock.amzngm.com/"

  livecheck do
    url "https://github.com/AMZNGM/ngclock-releases/releases/latest"
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "NGCLock.app"

  zap trash: [
    "~/.ngclock",
    "~/Library/Application Support/ngclock",
    "~/Library/Caches/com.ngm.ngclock",
    "~/Library/HTTPStorages/com.ngm.ngclock",
    "~/Library/Preferences/com.ngm.ngclock.plist",
    "~/Library/Saved Application State/com.ngm.ngclock.savedState",
  ]

  caveats <<~EOS
    NGCLock isn't notarised yet, so macOS blocks the first launch.
    Open it once, then: System Settings -> Privacy & Security ->
    scroll down -> Open Anyway. After that it launches normally.

    macOS 15 removed the old right-click -> Open bypass, and Homebrew
    removed --no-quarantine in 5.0, so this step can't be skipped.
  EOS
end
