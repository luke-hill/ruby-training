#!/usr/bin/env bash

export rvm_silence_path_mismatch_check_flag=1

# -------------------------
# Load RVM safely
# -------------------------
# Force load RVM as a function
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    source "$HOME/.rvm/scripts/rvm"
elif [[ -s "/usr/share/rvm/scripts/rvm" ]]; then
    source "/usr/share/rvm/scripts/rvm"
else
    echo "ERROR: Cannot find RVM scripts"
    exit 1
fi

# Critical check
if ! type rvm | grep -q "function"; then
    echo "ERROR: RVM did not load as a function"
    exit 1
fi

# -------------------------
# Prompt inputs
# -------------------------
read -p "Enter target Ruby version (e.g. 3.3.0): " TARGET_RUBY_VERSION
[[ -z "$TARGET_RUBY_VERSION" ]] && { echo "Ruby version required"; exit 1; }

read -p "Update gems? (yes/no) [no]: " UPDATE_GEMS
UPDATE_GEMS=${UPDATE_GEMS:-no}

[[ "$UPDATE_GEMS" != "yes" && "$UPDATE_GEMS" != "no" ]] && {
    echo "Must be yes or no"
    exit 1
}

TARGET_RUBY_VERSION="ruby-$TARGET_RUBY_VERSION"
EXPECTED_VERSION="${TARGET_RUBY_VERSION#ruby-}"

# -------------------------
# Config
# -------------------------
PROJECTS_DIR="$HOME/Code/ruby-training"

LARGE_PROJECTS=("game_of_life" "nim" "the-language")
NON_PROJECTS=(".github" "project_answers")

# -------------------------
# Tracking results
# -------------------------
SUCCESS=()
FAILED=()

# -------------------------
# Helpers
# -------------------------
contains() {
    local item="$1"
    shift
    for x in "$@"; do
        [[ "$x" == "$item" ]] && return 0
    done
    return 1
}

# -------------------------
# Start
# -------------------------
echo ""
echo "Starting upgrade..."
echo "Ruby: $TARGET_RUBY_VERSION"
echo "Update gems: $UPDATE_GEMS"
echo ""

# -------------------------
# Main loop
# -------------------------
for PROJECT in "$PROJECTS_DIR"/*; do
    [[ -d "$PROJECT" ]] || continue

    name=$(basename "$PROJECT")

    # -------------------------
    # Skipping rules
    # -------------------------
    if contains "$name" "${NON_PROJECTS[@]}" || contains "$name" "${LARGE_PROJECTS[@]}"; then
        echo "Skipping: $name"
        continue
    fi

    echo ""
    echo "==== Processing $name ===="

    cd "$PROJECT" || { echo "Failed to enter $name"; FAILED+=("$name"); continue; }

    # -------------------------
    # Update Gemfile
    # -------------------------
    # If there is no Gemfile → skip safely
    if [[ ! -f "Gemfile" ]]; then
        echo "No Gemfile → skipping"
        FAILED+=("$name")
        continue
    fi

    if grep -q '^ruby' Gemfile; then
        ruby -i -pe '
            $_ = "ruby \"'$EXPECTED_VERSION'\"\n" if $_ =~ /^ruby /
        ' Gemfile
    else
        echo "ruby \"$EXPECTED_VERSION\"" >> Gemfile
    fi

    # -------------------------
    # Switch Ruby via RVM
    # -------------------------
    echo "Available Rubies:"
    rvm list strings

    if ! rvm use "$TARGET_RUBY_VERSION"; then
        echo "RVM switch failed (version likely not installed or invalid)"
        FAILED+=("$name")
        continue
    fi

    # Refresh shell hash (important!)
    hash -r

    echo "Ruby path: $(which ruby)"
    echo "Ruby version: $(ruby -v)"

    # ONLY ONCE, here:
    echo "$TARGET_RUBY_VERSION" > .ruby-version

    # Debug (optional but useful)
    echo "Ruby path: $(which ruby)"
    echo "Ruby version: $(ruby -v)"

    CURRENT_VERSION=$(ruby -e 'print RUBY_VERSION')

    if [[ "$CURRENT_VERSION" != "$EXPECTED_VERSION" ]]; then
        echo "Ruby mismatch after switch (expected $EXPECTED_VERSION, got $CURRENT_VERSION)"
        FAILED+=("$name")
        continue
    fi

    echo "Using Ruby: $(ruby -v)"

    # -------------------------
    # Bundler step
    # -------------------------
    if [[ "$UPDATE_GEMS" == "yes" ]]; then
        echo "Updating gems..."
        bundle update --all || { echo "bundle update failed"; FAILED+=("$name"); continue; }
    else
        echo "Skipping gem updates"
    fi

    bundle install || { echo "bundle install failed"; FAILED+=("$name"); continue; }

    SUCCESS+=("$name")
    echo "Finished: $name"
done

# -------------------------
# Summary
# -------------------------
echo ""
echo "===== SUMMARY ====="

echo "SUCCESS (${#SUCCESS[@]}):"
printf ' - %s\n' "${SUCCESS[@]}"

echo ""
echo "FAILED (${#FAILED[@]}):"
printf ' - %s\n' "${FAILED[@]}"

echo ""
echo "Done."
