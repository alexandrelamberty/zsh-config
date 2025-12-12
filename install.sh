#!/usr/bin/env bash
# ZSH configuration installation via GNU Stow.

set -euo pipefail

PACKAGE="config"
TARGET="$HOME"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STOW_FLAGS=("-v")

usage() {
  cat <<'EOF'
Usage: install.sh [--dry-run] [--quiet]

Options:
  --dry-run   Show what would change without touching the filesystem.
  --quiet     Suppress verbose Stow output.
  -h, --help  Show this message.
EOF
}

log() {
  printf '[install] %s\n' "$*"
}

require_stow() {
  if ! command -v stow >/dev/null 2>&1; then
    printf 'Error: GNU Stow is not installed.\n' >&2
    exit 1
  fi
}

DRY_RUN=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)
      DRY_RUN=true
      STOW_FLAGS+=("-n")
      ;;
    --quiet)
      STOW_FLAGS=("${STOW_FLAGS[@]/-v/}")
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      usage >&2
      exit 1
      ;;
  esac
  shift
done

require_stow

if [[ ! -d "$SCRIPT_DIR/$PACKAGE" ]]; then
  printf 'Error: package directory "%s/%s" not found.\n' "$SCRIPT_DIR" "$PACKAGE" >&2
  exit 1
fi

remove_path() {
  local path="$1"
  if [[ -e "$path" || -L "$path" ]]; then
    if [[ "$DRY_RUN" == true ]]; then
      log "Would remove $path"
    else
      rm -rf "$path"
      log "Removed $path"
    fi
  fi
}

log "Unstowing previous installation (if any)"
if ! stow -d "$SCRIPT_DIR" -Dt "$TARGET" "${STOW_FLAGS[@]}" "$PACKAGE"; then
  log "Package was not previously stowed, continuing"
fi

log "Removing legacy files"
remove_path "$TARGET/.zshrc"
remove_path "$TARGET/.config/zsh"

log "Deploying new stow package"
if [[ "$DRY_RUN" == true ]]; then
  log "Dry run: skipping actual stow operation"
else
  stow -d "$SCRIPT_DIR" -St "$TARGET" "${STOW_FLAGS[@]}" "$PACKAGE"
fi

log "Done."
