# Dotfiles managed with chezmoi

This repository contains my personal dotfiles managed via [chezmoi](https://www.chezmoi.io/).

## Dependencies

The dotfiles target personal Linux/KDE machines and assume these tools are
installed:

- Core shell: `zsh`, `starship`, `nvim`, `git`, `chezmoi`, and Oh My Zsh with
	the `fzf`, `zsh-autosuggestions`, and `fast-syntax-highlighting` plugins
- Shell aliases and interactive helpers: `eza`, `fd`, `fzf`, `bat`, `xclip`,
	`lazygit`, `sops`, `age`, `delta`, and `meld`
- KDE SSH-key autostart: `openssh`, `ksshaskpass`, and KWallet
- Optional archive formats supported by `ex`: `unrar`, `unzip`, `p7zip`, and
	the corresponding system decompression tools

## Secrets and encryption

This repository is configured for AGE in `.chezmoi.toml.tmpl`.

Recommended practice:

- Keep private keys and secret material out of this repository
- Prefer encrypted chezmoi files (`*.age`) or external secret managers when storing sensitive values
- Avoid committing personal/work identifiers unless intentionally public
