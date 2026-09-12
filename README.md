# homebrew-ngclock

Homebrew tap for [NGCLock](https://ngclock.amzngm.com/) — a 9-hour net work-time
limit that lives in your menu bar.

```sh
brew tap amzngm/ngclock
brew install --cask ngclock
```

Apple Silicon only for now. The build isn't notarised yet, so the first launch
needs a **right-click → Open** on NGCLock in Applications — once. Homebrew
removed `--no-quarantine` in 5.0, so the install command can't skip it.

This file and `Casks/ngclock.rb` are generated from the main repo's
`scripts/brew.mjs` on every release — don't hand-edit.
