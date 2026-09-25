# homebrew-ngclock

Homebrew tap for [NGCLock](https://ngclock.amzngm.com/) — a 9-hour net work-time
limit that lives in your menu bar.

```sh
brew tap amzngm/ngclock
brew trust amzngm/ngclock
brew install --cask ngclock
```

Homebrew refuses to load casks from third-party taps until they're trusted, so
the `brew trust` line is required — without it the install stops with
"Refusing to load cask … from untrusted tap".

Apple Silicon only for now. The build isn't notarised yet, so the first launch
needs **System Settings → Privacy & Security → Open Anyway** — once. macOS 15
removed the right-click → Open bypass and Homebrew removed `--no-quarantine`
in 5.0, so the install command can't skip it.

This file and `Casks/ngclock.rb` are generated from the main repo's
`scripts/brew.mjs` on every release — don't hand-edit.
