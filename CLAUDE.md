# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal macOS development environment bootstrap playbook using Ansible. It automates the complete setup of a macOS machine with development tools, applications, shell configuration, and system preferences.

## Common Commands

```bash
# Full bootstrap (installs Homebrew, pip, Ansible, then runs playbook)
chmod +x bootstrap.sh && ./bootstrap.sh

# Run playbook directly (requires Ansible installed)
ansible-playbook local.yml --ask-become-pass --ask-vault-pass

# Run specific tags only
ansible-playbook local.yml --tags "apps" --ask-become-pass --ask-vault-pass
ansible-playbook local.yml --tags "ssh,git,terminal" --ask-become-pass --ask-vault-pass
```

Available tags: `ssh`, `git`, `node`, `terminal`, `macos`, `apps`, `window-manager`, `dotfiles`

## Architecture

**Entry Point**: `local.yml` - Main playbook targeting localhost, includes all task files with tags

**Task Modules** (`tasks/`):
- Each task file handles one aspect of setup (SSH, Git, Node, terminal, macOS defaults, apps, window manager, dotfiles)
- Tasks use tags for selective execution
- Most tasks use `become: true` for privilege escalation
- Homebrew tasks run as current user (no `become_user`) since Homebrew is designed to run without sudo

**Variables** (`vars/`):
- `personal.yml` - User config (username, github, dotfiles path, SSH key paths)
- `apps-config.yml` - Lists of Homebrew packages, casks, npm packages, VSCode extensions
- `osx-config.yml` - macOS system defaults (100+ preferences)

**Key Patterns**:
- Uses `include_tasks` with tag inheritance
- Dotfiles managed via GNU stow (cloned to `~/.dotfiles`)
- Window manager (yabai) requires SIP modification on M1 Macs (see README)

**Secrets**: Uses Ansible Vault for sensitive data in `secrets/` directory
