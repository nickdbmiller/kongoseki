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

> A whetstone for iteratively sharpening `Claude Code` itself — hooks, skills, agents, commands, MCP servers, `CLAUDE.md`, and settings — developed against an explicit `config root`, and promoted to the implicit `config root` only when proven.

## Setup

> [!IMPORTANT] 
> Requires a [`Claude` account](https://claude.ai/login) and [`Claude Code`](https://code.claude.com/docs/en/overview) installed.

Add the repo's `bin/` directory to your `$PATH` to make commands available:

```sh
# In your shell profile (~/.zshrc, ~/.bashrc, etc.)
export PATH="$PATH:/path/to/kongoseki/bin"
```

Reload your shell, then invoke from anywhere:
```sh
source ~/.zshrc
meditate
```

## Meditation

> Meditation is a contemplative discourse. The practice of training the `./mind` for attention and awareness to achieve a stable state.

This repo provides an explicit `config root` at `./mind` and a launcher to activate it.

Meditation sessions see `./mind` as their `config root` and run in a temporary folder, erased afer each session.

No other configuration or context is loaded, allowing for a clean surface on which to improve.

## Config Root

`Claude Code` reads user-scoped configuration (`CLAUDE.md`, `settings.json`, `agents/`, `skills/`, `commands/`, `memory/`) from a directory called `config root`.

The environment variable `CLAUDE_CONFIG_DIR` controls which directory acts as the root for a `Claude` session:

- **Implicit `config root`** — `~/.claude/`
  - active when `CLAUDE_CONFIG_DIR` is unset.
  - Reaches every `Claude` session across every project.
- **Explicit `config root`** — any directory `CLAUDE_CONFIG_DIR` names
  - Reaches ***only*** the sessions that opt into it.

Both are structurally identical, the only difference is scope.

## Isolation

`Claude Code` reads configuration from multiple sources:
  - `config root`, loaded explicitly 
  - Working directory (any directory `claude` is launched from)
  - `git` context (if working directory is a `git` repo)
  - ***Walking through every parent directory up to `/root`***

Setting `CLAUDE_CONFIG_DIR` replaces only the first source. The rest are determined by the working directory.

`meditate` closes this gap. It sets `CLAUDE_CONFIG_DIR` to `./mind` and launches `Claude` from an empty `tmp` directory. This means that the parent directory walk won't find any additional config. No `.claude/`. No `settings.json`. No `CLAUDE.md`. The session reads configuration from one place only: `./mind`.

One root. Nothing inherited. A clean surface.

## What is `./mind`?

Four things gathered:
- What Claude knows (`CLAUDE.md`)
- How Claude behaves (`settings.json`)
- What Claude remembers (`/memory`)
- Claude's tools (`/agents`, `/skills`, `/commands`)

`./mind` is trainable. Versioned. Reversible.

An experimental space for Claude. Analogous to user scoped Claude, in a vacuum.

## Layers

```
.claude/           # project-scope config for kongoseki
.mcp.json          # project-scope MCP servers
scratch/           # throwaway files for experiments
bin/               # scripts and utilities
```

```
mind/              # explicit `config root` (CLAUDE_CONFIG_DIR target)
├── CLAUDE.md      # experimental global instructions
├── settings.json  # experimental settings
├── agents/        # experimental subagents
├── skills/        # experimental skills
├── commands/      # experimental slash commands
└── memory/        # auto-memory output
```

## Workflow

1. **Understand** what you are improving:
    - `meditate` (develop extensions inside `./mind`)
    - Polish the stone (improve `kongoseki/`)
2. **Meditate** until it works.
3. **Commit** to the repo.
4. **Promote** the files from `/mind` to implicit config at `~/.claude/`
    - Copy or symlink
    - Symlinking lets honing in this repo extend across every project at once.
