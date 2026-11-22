# Abulkosim's Homebrew tap

```sh
brew install --cask abulkosim/tap/wick
brew install --cask abulkosim/tap/weir
brew install --cask abulkosim/tap/tonearm
```

| Cask | App |
| --- | --- |
| `wick` | [Wick](https://github.com/Abulkosim/wick): a menu bar app that keeps the Mac awake |
| `weir` | [Weir](https://github.com/Abulkosim/weir): a menu bar speed test and connection check |
| `tonearm` | [Tonearm](https://github.com/Abulkosim/tonearm): a menu bar mini player for the Spotify desktop app |

Casks are bumped automatically when a release is published. Tonearm's cask always points at its latest release, so it needs no bump. The apps are free and open source but not notarized, so macOS blocks the first launch: open **System Settings → Privacy & Security** and click **Open Anyway**. Tonearm's cask clears the quarantine flag, so it opens without this step.

The apps update themselves, and `brew upgrade` leaves them alone: Wick and Weir are marked `auto_updates true`, and Tonearm's cask always installs the latest release, which Homebrew skips unless you pass `--greedy`.

The Check casks workflow runs `brew style`, `brew audit --strict --online`, and a real install and `--zap` uninstall of Tonearm on a Mac, on every pull request.
