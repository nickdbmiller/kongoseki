#!/usr/bin/env bash
# Shebang: the kernel reads #! and uses env to locate bash on the system PATH.

# Exit on error (-e),
# treat unset variables as errors (-u),
# and propagate pipeline failures (-o pipefail).
set -euo pipefail

# Resolve the repository root: get this script's directory (bin/),
# go up one level (..), and print the absolute path.
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)" # Runs in a subshell so the working directory is unchanged.

# Set Claude Code's config root to "kongoseki/mind/" (instead of ~/.claude/),
# replace this shell process (exec) with claude, forwarding all arguments.
CLAUDE_CONFIG_DIR="$repo_root/mind" exec claude "$@"
