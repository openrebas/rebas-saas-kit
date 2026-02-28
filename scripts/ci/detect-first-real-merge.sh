#!/usr/bin/env bash
set -euo pipefail

# Heuristic: First "real code" on main means a merge commit adding non-doc/config files.
# - Excludes: docs/**, **.md, .github/**, LICENSE, .gitignore
# - Includes: src/**, app/**, services/**, packages/**, backend/**, frontend/**, *.ts, *.js, *.py, *.go, Dockerfile

# Requires: git history available (fetch-depth: 0)

pattern_include='(src/|app/|services/|packages/|backend/|frontend/|Dockerfile$|\.(ts|tsx|js|jsx|py|go)$)'
pattern_exclude='(^docs/|/docs/|^\.github/|\.md$|^LICENSE$|^\.gitignore$)'

# Find the first commit on main that adds any include file and not excluded
first_commit=$(git rev-list --reverse origin/main | while read c; do
  if git diff --name-only "$c^" "$c" | grep -E "$pattern_include" | grep -Ev "$pattern_exclude" >/dev/null; then
    echo "$c"; break; fi; done)

if [[ -n "${first_commit:-}" ]]; then
  echo "FIRST_REAL_CODE_COMMIT=$first_commit" >> "$GITHUB_OUTPUT"
  echo "Detected first real code commit: $first_commit"
else
  echo "No real code commit detected on main yet"
fi
