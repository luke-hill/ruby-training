#!/usr/bin/env bash

set -e

# ---- Input handling ----

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <ruby_version> <update_gems: yes|no>"
  exit 1
fi

TARGET_RUBY_VERSION="$1"
UPDATE_GEMS="$2"

if [[ "$UPDATE_GEMS" != "yes" && "$UPDATE_GEMS" != "no" ]]; then
  echo "Second argument must be 'yes' or 'no'"
  exit 1
fi

REPOS_DIR="$HOME/projects"

# ---- Main loop ----

for repo in "$REPOS_DIR"/*; do
  if [ -d "$repo" ]; then
    echo "---- Processing $repo ----"
    cd "$repo"

    # Skip if no Gemfile
    if [ ! -f "Gemfile" ]; then
      echo "No Gemfile, skipping"
      continue
    fi

    # Create branch (optional but safer)
    git checkout -b "upgrade-ruby-$TARGET_RUBY_VERSION" 2>/dev/null || true

    # Update Ruby version
    echo "$TARGET_RUBY_VERSION" > .ruby-version

    # Install Ruby (rbenv example)
    if command -v rbenv >/dev/null 2>&1; then
      rbenv install -s "$TARGET_RUBY_VERSION"
      rbenv local "$TARGET_RUBY_VERSION"
    fi

    # Ensure bundler exists
    gem install bundler

    # Conditionally update gems
    if [ "$UPDATE_GEMS" == "yes" ]; then
      echo "Updating gems..."
      bundle update
    else
      echo "Skipping gem updates, running bundle install only..."
    fi

    # Install gems
    bundle install

    # Optional: run tests
    if [ -f "Rakefile" ]; then
      bundle exec rake || echo "Tests failed in $repo"
    fi

    # Commit changes
    git add .
    git commit -m "Upgrade Ruby to $TARGET_RUBY_VERSION ($UPDATE_GEMS gems update)" || echo "Nothing to commit"

    echo "Done with $repo"
  fi
done
