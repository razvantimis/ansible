# Razvan Timis MacOS Setup


## How to install

1. Run `chmod +x bootstrap.sh`
2. Run `./bootstrap.sh`

### Extra manual steps after bootstrap

1. **M1 Chip**: Disabling System Integrity Protection for yabai - https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection
   1. Enter recovery mode by restarting your machine and holding `power button` until the "Loading startup options" appears.
   2. On m1 run `csrutil enable --without fs --without debug --without nvram` in recovery mode terminal
   3. After reboot run `sudo nvram boot-args=-arm64e_preview_abi` in terminal
   4. And finally you can check if everything is ok by running `csrutil status` in terminal

## Software

- Terminal: [Alacritty](https://alacritty.org)
- Font: [MesloLGS NF Regular](https://github.com/romkatv/powerlevel10k-media)
- Colors: [powerlevel10k](https://github.com/romkatv/powerlevel10k)
- Shell: [ohmyz](https://ohmyz.sh/)
- Multiplexer: [tmux](https://github.com/tmux/tmux/wiki)
- Window manager: [yabai](https://github.com/koekeishiya/yabai)
- Hotkey manager: [skhd](https://github.com/koekeishiya/skhd)
- Editor: [VSCode](https://neovim.io) / [Neovim](https://neovim.io) - in progress
- macOS package manager: [Homebrew](https://brew.sh)
- npm package manager: [pnpm](https://pnpm.io/) / [yarn](https://yarnpkg.com/)

### MacOS software
- [Google Chrome](https://www.google.com/chrome/)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- [Microsoft Edge](https://www.microsoft.com/en-us/edge)
- [Slack](https://slack.com/downloads/mac)
- [Zoom](https://zoom.us/download)
- [Discord](https://discord.com/download)
- [Spotify](https://www.spotify.com/us/download/mac/)
- [Skype](https://www.skype.com/en/get-skype/download-skype-for-desktop/)
- [Docker](https://www.docker.com/products/docker-desktop)
- [Postman](https://www.postman.com/downloads/)
- [Notion](https://www.notion.so/desktop)
- [Vlc](https://www.videolan.org/vlc/download-macosx.html)
- [Vscode](https://code.visualstudio.com/download)
- [Google Drive](https://www.google.com/drive/download/)

### Npm global packages
- [pnpm](https://pnpm.io/)
- [yarn](https://yarnpkg.com/)
- [typescript](https://www.typescriptlang.org/)
- [ts-node](https://github.com/TypeStrong/ts-node)
- [eslint](https://eslint.org/)
- [prettier](https://prettier.io/)

### Terminal Tools
- [jq](https://jqlang.github.io/jq/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [rbenv](https://github.com/rbenv/rbenv)
- [pyenv](https://github.com/pyenv/pyenv)
- [terraform](https://www.terraform.io/)
- [go](https://golang.org/)
- [git](https://git-scm.com/)
- [tree](http://mama.indstate.edu/users/ice/tree/)
  
### VSCode Extensions
- [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
- [Markdown Mermaid](https://marketplace.visualstudio.com/items?itemName=vstirbu.vscode-mermaid-preview)
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [Copilot](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot)
- [Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)
- [One Dark Pro](https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme)