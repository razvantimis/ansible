# Razvan Timis MacOS Setup


## How to install

1. Run `chmod +x bootstrap.sh`
2. Run `./bootstrap.sh` (personal machine) or `./bootstrap.sh work` (work machine)

## Profiles

`vars/profiles/<profile>.yml` holds what differs per machine: git identity, SSH key source, extra casks.

- `personal` — vaulted SSH key from `secrets/`, prompts for the vault password, installs the full app list.
- `work` — nothing from `secrets/`, no vault prompt, generates a fresh ed25519 key and prints the public key to add to GitHub. Fill in `user_email` / `github_username` before the first run.

Run a profile directly with `ansible-playbook local.yml -e profile=work --ask-become-pass`.

## Software

- Terminal: [Alacritty](https://alacritty.org)
- Font: [MesloLGS NF Regular](https://github.com/romkatv/powerlevel10k-media)
- Colors: [powerlevel10k](https://github.com/romkatv/powerlevel10k)
- Shell: [ohmyz](https://ohmyz.sh/)
- Multiplexer: [tmux](https://github.com/tmux/tmux/wiki)
- Window manager: [AeroSpace](https://github.com/nikitabobko/AeroSpace)
- Editor: [VSCode](https://code.visualstudio.com/)
- macOS package manager: [Homebrew](https://brew.sh)
- npm package manager: [pnpm](https://pnpm.io/)

### MacOS software
- [Google Chrome](https://www.google.com/chrome/)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/) (personal only)
- [Microsoft Edge](https://www.microsoft.com/en-us/edge) (personal only)
- [Docker](https://www.docker.com/products/docker-desktop)
- [Postman](https://www.postman.com/downloads/)
- [VLC](https://www.videolan.org/vlc/download-macosx.html) (personal only)
- [VSCode](https://code.visualstudio.com/download)
- [Google Drive](https://www.google.com/drive/download/) (personal only)

### Brew packages
- [go](https://golang.org/)
- [git](https://git-scm.com/)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [stow](https://www.gnu.org/software/stow/)

### npm global packages
- [pnpm](https://pnpm.io/)
- [typescript](https://www.typescriptlang.org/)

### VSCode Extensions
- [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
- [Markdown Mermaid](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid)
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [One Dark Pro](https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme)
