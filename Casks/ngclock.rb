cask "ngclock" do
  version "0.5.0"
  sha256 "cc14d856aa5e7ad5dbadb4588feba14ec56c7fdff810d8a15f166b119961fea3"

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
    Right-click NGCLock in Applications and choose Open, once.
    After that it launches normally.

    Homebrew removed --no-quarantine in 5.0, so this step can't be
    skipped from the install command any more.
  EOS
end
