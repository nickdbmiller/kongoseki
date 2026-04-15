# kongōseki (金剛石)

This repository is a sandbox for iteratively improving Claude Code itself — hooks, skills, agents, slash commands, MCP servers, CLAUDE.md, settings.

## Config roots

Claude Code reads user-scope configuration from a **config root**. Which directory is the root depends on the environment variable `CLAUDE_CONFIG_DIR`:

- **Implicit config root** — `~/.claude/`, active when `CLAUDE_CONFIG_DIR` is unset. Reaches every Claude session on this machine.
- **Explicit config root** — the directory `CLAUDE_CONFIG_DIR` names. Reaches only sessions that opt into it.

Both are structurally identical. Only reach differs. This repo's explicit config root is `./mind/`; `bin/sandbox` activates it.

## Structure

- `mind/` — the explicit config root. Experimental CLAUDE.md, settings.json, agents/, skills/, commands/, memory/.
- `.claude/` — project-scope config for this repo. Merges with whichever config root is active.
- `.mcp.json` — project-scope MCP servers.
- `bin/sandbox` — launcher that sets `CLAUDE_CONFIG_DIR="$(pwd)/mind"` and execs `claude`.
- `scratch/` — throwaway working area.

## Core principle

Changes made here must not affect the implicit config root at `~/.claude/` until explicitly promoted. Develop against the explicit root, iterate, then copy or symlink proven extensions into the implicit root.

## When editing

- Extensions in `mind/` must not reference absolute paths into `~/.claude/`. Keep the explicit root self-contained so it remains reversible.
- When asked to **promote** something, copy or symlink from `mind/<path>` to `~/.claude/<path>` and note in the response what was promoted and by which mechanism.
- When asked to **import** something from `~/.claude/`, copy it into `mind/` so it can be iterated on under version control without touching the implicit root.
