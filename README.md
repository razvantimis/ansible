# Razvan Timis MacOS Setup


## How to install

Run `./bootstrap.sh` (personal machine) or `./bootstrap.sh work` (work machine)

## Profiles

`vars/profiles/<profile>.yml` holds what differs per machine: git identity, SSH key source, extra casks.

- `personal` — vaulted SSH key from `secrets/`, prompts for the vault password, installs the full app list.
- `work` — nothing from `secrets/`, no vault prompt, generates a fresh ed25519 key and prints the public key to add to GitHub. Fill in `user_email` / `github_username` before the first run.

Run a profile directly with `ansible-playbook local.yml -e profile=work --ask-become-pass`.

## Software

Terminal stack: [Alacritty](https://alacritty.org) + [tmux](https://github.com/tmux/tmux/wiki) + zsh with [oh-my-zsh](https://ohmyz.sh/) and [powerlevel10k](https://github.com/romkatv/powerlevel10k) (MesloLGS NF font). Window manager: [AeroSpace](https://github.com/nikitabobko/AeroSpace). Editor: VS Code.

The full list of Homebrew packages, casks, npm globals and VS Code extensions lives in `vars/apps-config.yml`; per-profile extras in `vars/profiles/`.
