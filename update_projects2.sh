#!/usr/bin/env bash

export rvm_silence_path_mismatch_check_flag=1

# -------------------------
# Load RVM safely
# -------------------------
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
    # First try to load from a user install
    source "$HOME/.rvm/scripts/rvm" >/dev/null 2>&1
elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
    # Then try to load from a root install
    source "/usr/local/rvm/scripts/rvm" >/dev/null 2>&1
elif [[ -s "/usr/share/rvm/bin/rvm" ]] ; then
    # Then try to load from a shared install
    source "/usr/share/rvm/bin/rvm" >/dev/null 2>&1
else
    echo "ERROR: An RVM installation was not found. Cannot continue"
    exit 1
fi

type rvm >/dev/null 2>&1 || { echo "ERROR: RVM failed to load"; exit 1; }

# -------------------------
# Prompt inputs
# -------------------------
read -p "Enter target Ruby version (e.g. 3.3.0): " RUBY_INPUT
[[ -z "$RUBY_INPUT" ]] && { echo "Ruby version required"; exit 1; }

TARGET_RUBY_VERSION="ruby-$RUBY_INPUT"

read -p "Update gems? (yes/no) [no]: " UPDATE_GEMS
UPDATE_GEMS=${UPDATE_GEMS:-no}

[[ "$UPDATE_GEMS" != "yes" && "$UPDATE_GEMS" != "no" ]] && {
    echo "Must be yes or no"
    exit 1
}

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

    # skip rules
    if contains "$name" "${NON_PROJECTS[@]}" || contains "$name" "${LARGE_PROJECTS[@]}"; then
        echo "Skipping: $name"
        continue
    fi

    echo ""
    echo "==== Processing $name ===="

    cd "$PROJECT" || { echo "Failed to enter $name"; FAILED+=("$name"); continue; }

    # no Gemfile → skip safely
    if [[ ! -f "Gemfile" ]]; then
        echo "No Gemfile → skipping"
        FAILED+=("$name")
        continue
    fi

    # -------------------------
    # Update Ruby version files
    # -------------------------
    echo "$TARGET_RUBY_VERSION" > .ruby-version

    if grep -q '^ruby ' Gemfile; then
    ruby -i -pe '
        $_ = "ruby \"'$TARGET_RUBY_VERSION'\"\n" if $_ =~ /^ruby /
        ' Gemfile
    else
        echo "ruby \"$TARGET_RUBY_VERSION\"" >> Gemfile
    fi

    # -------------------------
    # Switch Ruby via RVM
    # -------------------------
    # নিশ্চিত Ruby is installed
    rvm install "$TARGET_RUBY_VERSION" --skip-existing

    # Use it and make it default for this shell
    if ! rvm use "$TARGET_RUBY_VERSION" --default >/dev/null 2>&1; then
        echo "RVM switch failed"
        FAILED+=("$name")
        continue
    fi

    # Refresh shell hash (important!)
    hash -r

    # Debug (optional but useful)
    echo "Ruby path: $(which ruby)"
    echo "Ruby version: $(ruby -v)"

    # verify correct ruby is active
    if ! ruby -v | grep -q "$TARGET_RUBY_VERSION"; then
        echo "Ruby mismatch after switch"
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
