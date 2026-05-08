# kongōseki (金剛石)

A practice for shaping Claude Code itself. Develop a tool — hook, skill, agent, slash command, MCP server, CLAUDE.md, setting — in `mind/`. Prove it through use. Promote what survives to `~/.claude/`. The sandbox is the workshop; the implicit root is what is kept.

## Config roots

Claude Code reads user-scope configuration from a **config root**. Which directory is the root depends on the environment variable `CLAUDE_CONFIG_DIR`:

- **Implicit config root** — `~/.claude/`, active when `CLAUDE_CONFIG_DIR` is unset. Reaches every Claude session on this machine.
- **Explicit config root** — the directory `CLAUDE_CONFIG_DIR` names. Reaches only sessions that opt into it.

## Structure

- `mind/` — the student's config root. Experimental CLAUDE.md, settings.json, agents/, skills/, commands/, memory/.
- `osho/` — the teacher's config root. CLAUDE.md, agents/, skills/, commands/ that shape a session whose role is to read `mind/` from outside. Mutually exclusive with `mind/` — only one config root is active at a time.
- `.claude/` — project-scope config for this repo. Merges with whichever config root is active.
- `.mcp.json` — project-scope MCP servers.
- `bin/meditate.sh` — launcher for **meditation**: activates `mind/` as config root. The student sits with its own tools.
- `bin/dokusan.sh` — launcher for **dokusan**: activates `osho/` as config root. The teacher receives the student's words; `mind/` is read as text, not invoked.
- `scratch/` — throwaway working area.

## Two sittings

Meditation tests `mind/` from inside. Dokusan reads `mind/` from outside.

```sh
./bin/meditate.sh        # the student sits — mind/ is the config root
./bin/dokusan.sh         # the teacher sits — osho/ is the config root, mind/ is read as text
```

Either launcher accepts pass-through flags to `claude`.

## Core principle

Changes made here must not affect the implicit config root at `~/.claude/` until explicitly promoted. Develop against the explicit root, iterate, then copy or symlink proven extensions into the implicit root.

The implicit root reaches every Claude session on this machine. A change there has the blast radius of the whole machine. Promotion is therefore deliberate, not default — the work in `mind/` exists precisely so the implicit root remains undisturbed until a tool is proven worth keeping.

## When editing

- Extensions in `mind/` must not reference absolute paths into `~/.claude/`. Keep the explicit root self-contained so it remains reversible.
- When asked to **promote** something, copy or symlink from `mind/<path>` to `~/.claude/<path>` and note in the response what was promoted and by which mechanism.
- When asked to **import** something from `~/.claude/`, copy it into `mind/` so it can be iterated on under version control without touching the implicit root.
