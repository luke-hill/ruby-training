#!/usr/bin/env bash

set -e
export rvm_silence_path_mismatch_check_flag=1

# ---- Load RVM into a shell session *as a function* ----
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm" >/dev/null 2>&1 || true
elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm" >/dev/null 2>&1 || true
elif [[ -s "/usr/share/rvm/bin/rvm" ]] ; then
  # Then try to load from a shared install
  source "/usr/share/rvm/bin/rvm" >/dev/null 2>&1 || true
else
  echo "ERROR: An RVM installation was not found. Cannot continue"
  exit 1
fi

type rvm >/dev/null 2>&1 || { echo "RVM not loaded"; exit 1; }

# ---- Prompt for inputs ----
read -p "Enter target Ruby version (e.g. 3.3.0): " TARGET_RUBY_VERSION

if [ -z "$TARGET_RUBY_VERSION" ]; then
  echo "Ruby version cannot be empty"
  exit 1
fi

read -p "Update gems? (yes/no) [no]: " UPDATE_GEMS
UPDATE_GEMS=${UPDATE_GEMS:-no}

if [[ "$UPDATE_GEMS" != "yes" && "$UPDATE_GEMS" != "no" ]]; then
  echo "Please enter 'yes' or 'no'"
  exit 1
fi

PROJECTS_DIR="$HOME/Code/ruby-training"
LARGE_PROJECTS=("game_of_life" "nim" "the-language") # Add large projects here to skip gem updates
NON_PROJECTS=(".github" "project_answers") # Add non-project directories here to skip entirely

echo ""
echo "Starting upgrade..."
echo "Ruby version: $TARGET_RUBY_VERSION"
echo "Update gems: $UPDATE_GEMS"
echo "LARGE_PROJECTS: ${LARGE_PROJECTS[*]}"
echo "NON_PROJECTS: ${NON_PROJECTS[*]}"
echo ""

# ---- Main loop ----

for PROJECT in "$PROJECTS_DIR"/*; do
  if [ -d "$PROJECT" ]; then
    name=$(basename "$PROJECT")

    # skip non-projects entirely
    for skip in "${NON_PROJECTS[@]}" "${LARGE_PROJECTS[@]}"; do
      if [[ "$name" == "$skip" ]]; then
        echo "Skipping: $name"
        continue 2 # skip outer loop iteration
      fi
    done

    echo "---- Updating $PROJECT ----"
    cd "$PROJECT"
    echo "Changing to project directory: $(pwd)"

    # Skip if no Gemfile
    if [ ! -f "Gemfile" ]; then
      echo "No Gemfile, skipping all updates and changes for project"
      continue
    fi
#
#    # Create branch (optional but safer)
#    git checkout -b "upgrade-ruby-$TARGET_RUBY_VERSION" 2>/dev/null || true

    # Update .ruby-version file
    echo "ruby-$TARGET_RUBY_VERSION" > .ruby-version

    # Update Gemfile ruby version
    if [ -f "Gemfile" ]; then
      echo "Updating Ruby version in Gemfile..."

      # Replace ruby version line if it exists
      if grep -q '^ruby ' Gemfile; then
        sed -i.bak "s/^ruby .*/ruby \'$TARGET_RUBY_VERSION\'/" Gemfile
      else
        echo "No ruby version specified in project: $PROJECT, skipping"
        continue
      fi
    fi

    # Conditionally update gems
    if [ "$UPDATE_GEMS" == "yes" ]; then
      echo "Switching to new ruby version and updating gems..."
      rvm use "ruby-$TARGET_RUBY_VERSION"
      [[ "$(ruby -v)" == *"$TARGET_RUBY_VERSION"* ]] || { echo "Ruby switch failed"; exit 1; }
      bundle update
    else
      echo "Skipping gem updates"
    fi

#    # Commit changes
#    git add .
#    git commit -m "Upgrade Ruby to $TARGET_RUBY_VERSION ($UPDATE_GEMS gems update)" || echo "Nothing to commit"

    echo "Finished updating $PROJECT"
  else
    echo "Skipping project: $PROJECT"
  fi
done
