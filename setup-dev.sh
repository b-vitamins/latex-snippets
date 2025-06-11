#!/bin/bash
set -euo pipefail

# setup-dev.sh - Prepare development environment for latex-snippets
# This script installs required packages and tangles snippets.org
# to ensure snippet files are up to date. Run once with network
# access. After completion the repository can be used offline.

# Ensure running as root
if [[ $EUID -ne 0 ]]; then
  echo "Please run as root" >&2
  exit 1
fi

APT_PACKAGES=(emacs-nox elpa-yasnippet git curl tar)

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y "${APT_PACKAGES[@]}"

# Install tempel and its dependency compat from GNU ELPA
TEMPEL_VER="1.4"
COMPAT_VER="30.1.0.0"
TMP_DIR=$(mktemp -d)
curl -L "https://elpa.gnu.org/packages/tempel-${TEMPEL_VER}.tar" -o "$TMP_DIR/tempel.tar"
curl -L "https://elpa.gnu.org/packages/compat-${COMPAT_VER}.tar" -o "$TMP_DIR/compat.tar"
install -d /usr/local/share/emacs/site-lisp/tempel
install -d /usr/local/share/emacs/site-lisp/compat
tar -xf "$TMP_DIR/tempel.tar" -C /usr/local/share/emacs/site-lisp/tempel --strip-components=1
tar -xf "$TMP_DIR/compat.tar" -C /usr/local/share/emacs/site-lisp/compat --strip-components=1
rm -r "$TMP_DIR"

# Tangle snippets.org to update org-mode files
if [[ -f "snippets.org" ]]; then
  emacs --batch -Q -l org --eval "(setq org-confirm-babel-evaluate nil)" \
        --eval "(org-babel-tangle-file \"snippets.org\")"
fi

echo "Development environment setup complete."
