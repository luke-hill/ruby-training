#!/usr/bin/env bash
set -eo pipefail

# -------------------------
# Defaults
# -------------------------
NON_PROJECTS=(".github" "project_answers")
PROJECTS_DIR="${PROJECTS_DIR:-$HOME/Code/ruby-training}"
UPDATE_GEMS=0
DRY_RUN=0
VERBOSE=1

# These will vary over time potentially, so we can skip them for now to avoid noise
LARGE_PROJECTS=("game_of_life" "nim" "the-language")

SUCCESS=()
FAILED=()

# -------------------------
# Args
# -------------------------
usage() {
  cat <<EOF
Usage: $0 --ruby VERSION [options]

Required:
  --ruby VERSION        Ruby version (e.g. 3.3.10)

Options:
  --update-gems         Run bundle update --all
  --dry-run             Show actions without executing
  --quiet               Reduce output
  --projects-dir PATH   Override default projects directory

Example:
  $0 --ruby 3.3.10 --update-gems
EOF
}

RUBY_INPUT=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --ruby)
      RUBY_INPUT="$2"
      shift 2
      ;;
    --update-gems)
      UPDATE_GEMS=1
      shift
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --quiet)
      VERBOSE=0
      shift
      ;;
    --projects-dir)
      PROJECTS_DIR="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown arg: $1"
      usage
      exit 1
      ;;
  esac
done

[[ -z "$RUBY_INPUT" ]] && { echo "Missing --ruby"; exit 1; }

TARGET_RUBY_VERSION="ruby-$RUBY_INPUT"
EXPECTED_VERSION="$RUBY_INPUT"

log() {
  [[ "$VERBOSE" == "1" ]] && echo "$@"
}

run() {
  if [[ "$DRY_RUN" == "1" ]]; then
    log "[dry-run] $*"
  else
    eval "$@"
  fi
}

# -------------------------
# Load RVM
# -------------------------
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm"
elif [[ -s "/usr/share/rvm/scripts/rvm" ]]; then
  source "/usr/share/rvm/scripts/rvm"
else
  echo "ERROR: RVM not found"
  exit 1
fi

if ! type rvm | grep -q "function"; then
  echo "ERROR: RVM not loaded as function"
  exit 1
fi

# -------------------------
# Main
# -------------------------
log ""
log "Ruby target: $TARGET_RUBY_VERSION"
log "Projects: $PROJECTS_DIR"
log ""

for PROJECT in "$PROJECTS_DIR"/*; do
  [[ -d "$PROJECT" ]] || continue

  name=$(basename "$PROJECT")

  # Always skip these
  for skip in "${NON_PROJECTS[@]}"; do
    if [[ "$name" == "$skip" ]]; then
      echo "Skipping (non-project): $name"
      continue 2
    fi
  done

  # Conditionally skip large projects
  for skip in "${LARGE_PROJECTS[@]}"; do
    if [[ "$name" == "$skip" ]]; then
      echo "Skipping (large project): $name"
      continue 2
    fi
  done

  log "→ $name"

  (
    cd "$PROJECT" || exit 1

    if [[ ! -f "Gemfile" ]]; then
      log "  skipping (no Gemfile)"
      exit 0
    fi

    # -------------------------
    # Switch Ruby
    # -------------------------
    if ! rvm use "$TARGET_RUBY_VERSION"; then
      echo "FAILED: $name (rvm use failed)"
      exit 1
    fi

    hash -r

    CURRENT_VERSION=$(ruby -e 'print RUBY_VERSION')

    if [[ "$CURRENT_VERSION" != "$EXPECTED_VERSION" ]]; then
      echo "FAILED: $name (ruby mismatch $CURRENT_VERSION)"
      exit 1
    fi

    # -------------------------
    # Update files
    # -------------------------
    run "echo '$TARGET_RUBY_VERSION' > .ruby-version"

    if grep -q '^ruby' Gemfile; then
      run "ruby -i -pe '$_ = \"ruby \\\"$EXPECTED_VERSION\\\"\\n\" if \$_ =~ /^ruby /' Gemfile"
    else
      run "echo \"ruby \\\"$EXPECTED_VERSION\\\"\" >> Gemfile"
    fi

    # -------------------------
    # Bundler
    # -------------------------
    if [[ "$UPDATE_GEMS" == "1" ]]; then
      run "bundle update --all --quiet"
    fi

    run "bundle install --quiet"

    echo "SUCCESS: $name"
  ) && SUCCESS+=("$name") || FAILED+=("$name")
done

# -------------------------
# Summary
# -------------------------
echo ""
echo "===== SUMMARY ====="

echo "SUCCESS (${#SUCCESS[@]}):"
if [[ ${#SUCCESS[@]} -gt 0 ]]; then
  printf ' - %s\n' "${SUCCESS[@]}"
else
  echo " - none"
fi

echo ""
echo "FAILED (${#FAILED[@]}):"
if [[ ${#FAILED[@]} -gt 0 ]]; then
  printf ' - %s\n' "${FAILED[@]}"
else
  echo " - none"
fi
