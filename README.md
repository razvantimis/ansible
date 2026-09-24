# Razvan Timis MacOS Setup


## How to install

- Personal machine: `./bootstrap.sh`
- Work machine: `./bootstrap.sh work`

## Profiles

`vars/profiles/<profile>.yml` holds what differs per machine: git identity, SSH key source, extra casks.

- `personal` — vaulted SSH key from `secrets/`, prompts for the vault password, installs the full app list.
- `work` — nothing from `secrets/`, no vault prompt, generates a fresh ed25519 key and prints the public key to add to GitHub. Fill in `user_email` before the first run, or pass `-e user_email=you@naga.com`.

Run a profile directly with `ansible-playbook local.yml -e profile=work --ask-become-pass`.

## Software

- Terminal: [Alacritty](https://alacritty.org)
- Font: [Meslo Nerd Font](https://github.com/ryanoasis/nerd-fonts)
- Prompt: [powerlevel10k](https://github.com/romkatv/powerlevel10k)
- Shell: [oh-my-zsh](https://ohmyz.sh/) with [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- Multiplexer: [tmux](https://github.com/tmux/tmux/wiki)
- Window manager: [AeroSpace](https://github.com/nikitabobko/AeroSpace)
- Editor: [VSCode](https://code.visualstudio.com/)
- macOS package manager: [Homebrew](https://brew.sh)
- Runtime manager: [mise](https://mise.jdx.dev) (node, java, python, global npm CLIs)
- Containers: [colima](https://github.com/abiosoft/colima) with the Homebrew docker CLI
- Dotfiles: [stow](https://www.gnu.org/software/stow/)

### MacOS software
- [Vivaldi](https://vivaldi.com/)
- [Google Chrome](https://www.google.com/chrome/)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- [Microsoft Edge](https://www.microsoft.com/en-us/edge)
- [VLC](https://www.videolan.org/vlc/download-macosx.html)
- [VSCode](https://code.visualstudio.com/download)
- [Google Drive](https://www.google.com/drive/download/) (personal profile only)

### Brew packages
- [go](https://golang.org/)
- [git](https://git-scm.com/)
- [GitHub CLI](https://cli.github.com/)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [bun](https://bun.sh/)
- [colima](https://github.com/abiosoft/colima), [docker](https://docs.docker.com/reference/cli/docker/), [docker-compose](https://docs.docker.com/compose/), [docker-buildx](https://docs.docker.com/build/)
- [mise](https://mise.jdx.dev)

### Runtimes (via mise)
- [Node.js](https://nodejs.org/) LTS
- [Java](https://adoptium.net/) Temurin 21
- [Python](https://www.python.org/) 3

### npm global packages
- [pnpm](https://pnpm.io/)

### VSCode Extensions
- [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
- [Markdown Mermaid](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid)
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [One Dark Pro](https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme)
