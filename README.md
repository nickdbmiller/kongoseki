# Kongōseki — 金剛石, the diamond stone.

```
The blade that cuts illusion returns to the stone.

  The stone hones the blade.

    The blade polishes the stone.

        A crucible.

            A dojo.

                A mirror polishing itself.

 Before the first strike, what edge was already there?
```

> A whetstone for iteratively sharpening Claude Code itself — hooks, skills, agents, commands, MCP servers, CLAUDE.md, and settings — developed against an explicit config root, and promoted to the implicit config root only when proven.

## Config Root

Claude Code reads user-scoped configuration (CLAUDE.md, settings.json, agents/, skills/, commands/, memory/) from a directory called the **config root**.

The environment variable `CLAUDE_CONFIG_DIR` controls which directory acts as the root for a Claude session:

- **Implicit config root** — `~/.claude/`, active when `CLAUDE_CONFIG_DIR` is unset. Reaches every Claude session across every project.
- **Explicit config root** — any directory `CLAUDE_CONFIG_DIR` names. Reaches only the sessions that opt into it.

Both are structurally identical, the only difference is scope.

## Meditation

> Meditation is a contemplative discourse. The practice of training the `./mind` for attention and awareness to achieve a stable state.

This repo provides an explicit config root at `./mind` and a launcher to activate it. Meditation sessions see `./mind` as their config root. The implicit config root at `~/.claude/` is not loaded, allowing for a clear surface on which to improve.

Invoke this command to begin:
```sh
./bin/meditate.sh
```

## What is `./mind`?

Four things gathered:
- What Claude knows (`CLAUDE.md`)
- How Claude behaves (`settings.json`)
- What Claude remembers (`/memory`)
- Claude's tools (`/agents`, `/skills`, `/commands`)

`./mind` is trainable. Versioned. Reversible.

An experimental space for Claude. Analogous to user scoped Claude, in a vacuum.

> This `./mind` is not mind. It is not Buddha. It is not things.

## Layers

The space in which meditation occurs. A vessel. A sitting pad.

```
.claude/           # tools for honing Claude
└── settings.json  # project-scope config for kongoseki

.mcp.json          # project-scope MCP servers
scratch/           # throwaway files for experiments
bin/meditate.sh    # launcher that activates the explicit config root
```

The rough diamond. To be focused and polished.

```
mind/              # explicit config root (CLAUDE_CONFIG_DIR target)
├── CLAUDE.md      # experimental global instructions
├── settings.json  # experimental settings
├── agents/        # experimental subagents
├── skills/        # experimental skills
├── commands/      # experimental slash commands
└── memory/        # auto-memory output
```

## Workflow

1. **Understand** what you are improving:
    - Hone the blade (develop extensions inside `/mind`)
    - Polish the stone (improve `kongoseki/`)
2. **Meditate** until it works.
3. **Commit** to the repo.
4. **Promote** the files from `/mind` to implicit config at `~/.claude/`
    - Copy or symlink
    - Symlinking lets honing in this repo extend across every project at once.
