#!/usr/bin/env bash
# Shebang: the kernel reads #! and uses env to locate bash on the system PATH.

# Exit on error (-e),
# treat unset variables as errors (-u),
# and propagate pipeline failures (-o pipefail).
set -euo pipefail                                                

# Resolve the repository root:
# get this script's directory (bin/),
# go up one level (..), and print the absolute path.
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)" # Runs in a subshell so the working directory is unchanged.

# Isolate the session:
# launch dokusan from repo root
# so the osho can read and edit the whole repo.
# Isolates the osho from user scoped config.
cd "$repo_root"

# Set Claude Code's config root to "kongoseki/osho/.claude/" (instead of ~/.claude/).
# Files under mind/ remain on disk as ordinary files — readable,
# editable, but not loaded as instructions for the dokusan session.
# Runs claude as a child process so the shell survives to cleanup at session end.
CLAUDE_CONFIG_DIR="$repo_root/osho/.claude" claude "$@"
