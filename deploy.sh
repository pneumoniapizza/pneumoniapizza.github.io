#!/usr/bin/env bash
# Build the Zola site and push the output to the `pages` branch on Codeberg.
# Usage (from the project root, next to config.toml):
#   nix develop -c ./deploy.sh
# or, if zola >= 0.23 is already on your PATH:
#   ./deploy.sh
set -euo pipefail

REMOTE="ssh://git@codeberg.org/pneumoniapizza/pages.git"
BRANCH="pages"
SITE_URL="https://pneumoniapizza.codeberg.page"

cd "$(dirname "$0")"

if ! command -v zola >/dev/null 2>&1; then
  echo "zola not found. Run this with: nix develop -c ./deploy.sh" >&2
  exit 1
fi

echo "==> Building site ($(zola --version))"
rm -rf public
zola build --base-url "$SITE_URL"

if [ ! -f public/index.html ]; then
  echo "Build produced no public/index.html, aborting." >&2
  exit 1
fi

echo "==> Pushing public/ to '$BRANCH'"
cd public
git init -q -b "$BRANCH"
git add .
git commit -q -m "Deploy $(date -u '+%Y-%m-%d %H:%M:%S') UTC"
git remote add origin "$REMOTE"
git push --force origin "$BRANCH"
cd ..

echo "==> Done. Live at $SITE_URL (give it a minute)."
