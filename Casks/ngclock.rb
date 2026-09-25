cask "ngclock" do
  version "0.6.1"
  sha256 "be5493d3eb1f0ee39ca71cb729d1d9a63a5bfa0be11511efb1103bcf05ce7e90"

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
