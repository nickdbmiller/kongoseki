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
# launch meditation from a temp directory
# so Claude cannot read project-scope config (.claude/, CLAUDE.md, etc.)
# or git context from kongoseki. The only config it sees is mind/.
zafudir="$(mktemp -d /tmp/kongoseki-zafu.XXXXXX)"
trap 'rm -rf "$zafudir"' EXIT
cd "$zafudir"

# Set Claude Code's config root to "kongoseki/mind/.claude/" (instead of ~/.claude/).
# Runs claude as a child process so the shell survives to cleanup at session end.
CLAUDE_CONFIG_DIR="$repo_root/mind/.claude" claude "$@"
