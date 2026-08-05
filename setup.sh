#!/usr/bin/env bash
# Wire AGENTS.md to every AI coding tool on this machine.
#
# What this does:
#   1. Copies AGENTS.md to ~/.agents/AGENTS.md (the source of truth)
#   2. Imports it from ~/.claude/CLAUDE.md (Claude Code)
#   3. Symlinks it to ~/.codex/AGENTS.md (Codex)
#   4. Symlinks it to ~/.config/opencode/AGENTS.md (OpenCode)
#
# Safe to re-run — never overwrites an existing file or link.

set -euo pipefail

AGENTS_DIR="$HOME/.agents"
AGENTS_FILE="$AGENTS_DIR/AGENTS.md"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Creating ~/.agents/"
mkdir -p "$AGENTS_DIR"
mkdir -p "$AGENTS_DIR/policies"

# Install AGENTS.md
if [ -e "$AGENTS_FILE" ]; then
  echo "    $AGENTS_FILE already exists — skipping copy"
  echo "    To update: cp $SCRIPT_DIR/AGENTS.md $AGENTS_FILE"
else
  cp "$SCRIPT_DIR/AGENTS.md" "$AGENTS_FILE"
  echo "    Installed: $AGENTS_FILE"
fi

# Install policy files
for policy in "$SCRIPT_DIR/policies/"*.md; do
  dest="$AGENTS_DIR/policies/$(basename "$policy")"
  if [ -e "$dest" ]; then
    echo "    $dest already exists — skipping copy"
  else
    cp "$policy" "$dest"
    echo "    Installed: $dest"
  fi
done

# Claude Code — import via CLAUDE.md
CLAUDE_MD="$HOME/.claude/CLAUDE.md"
mkdir -p "$HOME/.claude"
if grep -q "@~/.agents/AGENTS.md" "$CLAUDE_MD" 2>/dev/null; then
  echo "==> Claude Code: import already present in $CLAUDE_MD"
else
  cat >> "$CLAUDE_MD" <<'EOF'

# Cross-tool writing contract
# All generic agent rules live in ~/.agents/AGENTS.md.
# Edit there; this file just imports it.

@~/.agents/AGENTS.md
EOF
  echo "==> Claude Code: import added to $CLAUDE_MD"
fi

# Codex
CODEX_AGENTS="$HOME/.codex/AGENTS.md"
mkdir -p "$HOME/.codex"
if [ ! -e "$CODEX_AGENTS" ] && [ ! -L "$CODEX_AGENTS" ]; then
  ln -s "$AGENTS_FILE" "$CODEX_AGENTS"
  echo "==> Codex: symlinked $CODEX_AGENTS"
else
  echo "==> Codex: $CODEX_AGENTS already exists — skipping"
fi

# OpenCode
OPENCODE_AGENTS="$HOME/.config/opencode/AGENTS.md"
mkdir -p "$HOME/.config/opencode"
if [ ! -e "$OPENCODE_AGENTS" ] && [ ! -L "$OPENCODE_AGENTS" ]; then
  ln -s "$AGENTS_FILE" "$OPENCODE_AGENTS"
  echo "==> OpenCode: symlinked $OPENCODE_AGENTS"
else
  echo "==> OpenCode: $OPENCODE_AGENTS already exists — skipping"
fi

echo ""
echo "Done. Verify with:"
echo "  readlink $CODEX_AGENTS"
echo "  readlink $OPENCODE_AGENTS"
echo "  grep '@~/.agents/AGENTS.md' $CLAUDE_MD"
