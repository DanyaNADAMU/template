#!/bin/sh
set -e

TARGET="$1"

if [ -z "$TARGET" ] || [ ! -d "$TARGET/.git" ]; then
    echo "Usage: $0 /path/to/target/git-repo"
    exit 1
fi

TEMPLATE_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "==> Retrofitting $TARGET to standard baseline..."

# 1. Copy hooks
mkdir -p "$TARGET/.githooks"
cp "$TEMPLATE_DIR/.githooks/post-commit" "$TARGET/.githooks/"
cp "$TEMPLATE_DIR/.githooks/pre-push" "$TARGET/.githooks/"
chmod +x "$TARGET/.githooks/post-commit" "$TARGET/.githooks/pre-push"

# 2. Copy CI workflow
mkdir -p "$TARGET/.github/workflows"
cp "$TEMPLATE_DIR/.github/workflows/ots-cron.yml" "$TARGET/.github/workflows/"

# 3. Copy signers & security policy
cp "$TEMPLATE_DIR/.allowed_signers" "$TARGET/.allowed_signers"
[ ! -f "$TARGET/SECURITY.md" ] && cp "$TEMPLATE_DIR/SECURITY.md" "$TARGET/SECURITY.md"

# 4. Activate hooks in git
(cd "$TARGET" && git config core.hooksPath .githooks)

echo "==> Retrofit completed! Files added to $TARGET. Activate with a commit."
