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
    echo "[dry-run] $*"
  else
    "$@"
  fi
}

write_file() {
  local content="$1"
  local file="$2"

  if [[ "$DRY_RUN" == "1" ]]; then
    echo "[dry-run] write '$content' -> $file"
  else
    printf "%s\n" "$content" > "$file"
  fi
}

append_file() {
  local content="$1"
  local file="$2"

  if [[ "$DRY_RUN" == "1" ]]; then
    echo "[dry-run] append '$content' -> $file"
  else
    printf "%s\n" "$content" >> "$file"
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

if ! declare -F rvm >/dev/null; then
  echo "ERROR: RVM not loaded as function"
  exit 1
fi

# -------------------------
# Main
# -------------------------
echo ""
echo "Ruby target: $TARGET_RUBY_VERSION"
echo "Projects: $PROJECTS_DIR"
echo ""

START_TIME=$(date +%s)

for PROJECT in "$PROJECTS_DIR"/*; do
  [[ -d "$PROJECT" ]] || continue

  name=$(basename "$PROJECT")

  # Always skip these
  for skip in "${NON_PROJECTS[@]}"; do
    if [[ "$name" == "$skip" ]]; then
      log "Skipping (non-project): $name"
      continue 2
    fi
  done

  # Conditionally skip large projects
  for skip in "${LARGE_PROJECTS[@]}"; do
    if [[ "$name" == "$skip" ]]; then
      log "Skipping (large project): $name"
      continue 2
    fi
  done

  LOG_FILE=$(mktemp "/tmp/${name}.XXXX.log")

  printf "→ %-30s" "$name"

  if [[ ! -f "$PROJECT/Gemfile" ]]; then
    echo " SKIP"
    continue
  fi

  (
    cd "$PROJECT" || exit 1

    # -------------------------
    # Switch Ruby
    # -------------------------
    if ! rvm use "$TARGET_RUBY_VERSION" --force; then
      echo "rvm use failed"
      exit 1
    fi

    hash -r

    CURRENT_VERSION=$(ruby -e 'print RUBY_VERSION')

    if [[ "$CURRENT_VERSION" != "$EXPECTED_VERSION" ]]; then
      echo "ruby mismatch: $CURRENT_VERSION"
      exit 1
    fi

    # -------------------------
    # Update files
    # -------------------------
    write_file "$TARGET_RUBY_VERSION" ".ruby-version"

    if grep -q '^ruby' Gemfile; then
      run sed -i.tmp "s/^ruby .*/ruby '$EXPECTED_VERSION'/" Gemfile
      run rm -f Gemfile.tmp
    else
      append_file "ruby \"$EXPECTED_VERSION\"" "Gemfile"
    fi

    # -------------------------
    # Bundler
    # -------------------------
    if [[ "$UPDATE_GEMS" == "1" ]]; then
      if [[ "$VERBOSE" == "1" ]]; then
        run bundle update --all
      else
        run bundle update --all --quiet
      fi
    fi

    if [[ "$VERBOSE" == "1" ]]; then
      run bundle install
    else
      run bundle install --quiet
    fi
  ) >"$LOG_FILE" 2>&1 && {
    SUCCESS+=("$name")

    if [[ "$DRY_RUN" == "1" ]]; then
      echo " DRY-RUN"
    else
      echo " OK"
    fi
  } || {
    FAILED+=("$name")
    echo " FAIL"
    echo ""
    echo "===== FAILED: $name ====="
    cat "$LOG_FILE"
    echo "=========================="
  }

  rm -f "$LOG_FILE"
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

END_TIME=$(date +%s)
ELAPSED=$((END_TIME - START_TIME))

echo ""
echo "Completed in ${ELAPSED}s"
