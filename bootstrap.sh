#!/usr/bin/env bash
set -e

# Usage: ./bootstrap.sh [personal|work]   (default: personal)
PROFILE="${1:-personal}"

# Check for Homebrew and install it
if ! command -v brew &>/dev/null; then
	echo "Installing homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ -f /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /usr/local/bin/brew ]]; then
	eval "$(/usr/local/bin/brew shellenv)"
fi

# Always run Homebrew's ansible: a stray pip/CLT ansible on PATH ships an old
# community.general that fails on already-installed Homebrew formulas.
if ! brew list --versions ansible &>/dev/null; then
	echo "Installing ansible..."
	brew install ansible
fi
ANSIBLE_PLAYBOOK="$(brew --prefix)/bin/ansible-playbook"

# One sudo prompt for both ansible's become and Homebrew adopting root-owned apps
# (the become prompt's value is not visible to tasks). Never on the command line.
read -r -s -p "sudo password: " BOOTSTRAP_SUDO_PASSWORD
echo
export BOOTSTRAP_SUDO_PASSWORD
BECOME_PASSWORD_FILE="$(mktemp)"
trap 'rm -f "$BECOME_PASSWORD_FILE"' EXIT
printf '%s' "$BOOTSTRAP_SUDO_PASSWORD" > "$BECOME_PASSWORD_FILE"

# Only the personal profile reads from the vault; the work profile must never see the vault password.
VAULT_ARGS=()
if [[ "$PROFILE" == "personal" ]]; then
	VAULT_ARGS=(--ask-vault-pass)
fi

"$ANSIBLE_PLAYBOOK" local.yml -e "profile=$PROFILE" --become-password-file "$BECOME_PASSWORD_FILE" "${VAULT_ARGS[@]}"
