# .config

Personal `~/.config` synced across machines.

| Directory | Tool |
|-----------|------|
| `nvim/` | Neovim (LazyVim based) |
| `tmux/` | tmux (`tmux.conf`, read natively by tmux >= 3.1) |
| `zed/` | Zed editor settings and keymap |
| `ghostty/` | Ghostty terminal |
| `iterm2/` | iTerm2 preferences and color scheme |
| `herdr/` | Herdr |

## Setup

```sh
git clone https://github.com/davidalecrim1/dotfiles.git ~/.config
```

Everything else under `~/.config` is ignored via `.gitignore`; new tools must be whitelisted explicitly.
