# Hermes Runtime

**Repository description:** A non-invasive project-memory skill pack for AI agents that keeps tasks, bugs, decisions, and feature context recoverable.

Hermes Runtime is a universal skill for AI-assisted software engineering. It helps an AI agent remember what happened, why it happened, and what must be updated before work is considered complete.

It is intentionally **not** a required project framework:

- it does not create project files by default
- it does not require a `hermes/` directory
- it uses existing `docs/`, `memory/`, `.ai/`, `adr/`, or ticket conventions first
- it initializes project memory only when the user explicitly asks and approves the file plan

## Why

AI coding sessions often lose context between tasks:

- bugs get fixed without root-cause memory
- architecture decisions disappear into chat history
- feature behavior changes without a durable note
- future agents must rediscover the same project facts

Hermes Runtime gives agents a lightweight closure discipline:

> Every task should leave recoverable context.

## What Hermes Does

Hermes guides the AI agent to:

- route existing project memory before work
- keep task context recoverable
- identify when bug, feature, or ADR records are needed
- update existing docs when the project already has them
- avoid creating new files unless the user approves
- verify documentation closure before claiming completion

## Install

Install or copy the skill folder:

```text
skills/hermes-runtime/
```

The skill entrypoint is:

```text
skills/hermes-runtime/SKILL.md
```

If your AI tool supports local skills, install this folder as a skill. If it does not, ask the AI to read `skills/hermes-runtime/SKILL.md` before starting work.

Skill-only installation does not edit your project. It only makes the Hermes Runtime workflow available when the AI tool chooses or is asked to use the skill.

For automatic project-level startup and completion rules, run the project bootstrap script from the target project root:

```bash
skills/hermes-runtime/scripts/hermes-project.sh install \
  --agents codex,claude,cursor \
  --init-memory \
  --project-name "My Project"
```

You can install only one agent target:

```bash
skills/hermes-runtime/scripts/hermes-project.sh install --agents codex --init-memory
```

Agent targets write managed rule blocks to:

| Agent target | Generated project file |
| --- | --- |
| `codex` | `AGENTS.md` |
| `claude` | `CLAUDE.md` |
| `cursor` | `.cursor/rules/hermes-memory.mdc` |

`--init-memory` also creates a project-local Hermes memory skeleton under `hermes/`.

The bootstrap script always creates `hermes/.hermes-runtime-manifest` so uninstall can distinguish Hermes-managed files from pre-existing project files.

## Generated Content

When installed with all agent targets and `--init-memory`, Hermes Runtime may create:

```text
AGENTS.md
CLAUDE.md
.cursor/rules/hermes-memory.mdc
hermes/.hermes-runtime-manifest
hermes/retrieval/index.md
hermes/retrieval/routing-rules.md
hermes/runtime/
hermes/memory/core/
hermes/memory/conventions/
hermes/memory/workflows/
hermes/memory/bugs/TEMPLATE.md
hermes/memory/features/TEMPLATE.md
hermes/memory/decisions/ADR-TEMPLATE.md
hermes/tickets/TEMPLATE.md
hermes/scripts/
```

If an agent rule file already exists, Hermes appends a managed block instead of replacing the whole file. Uninstall removes only the managed block unless the file was created entirely by Hermes Runtime.

## Uninstall

Run uninstall before deleting the skill folder:

```bash
skills/hermes-runtime/scripts/hermes-project.sh uninstall \
  --agents codex,claude,cursor \
  --remove-memory
```

This removes managed agent rule files or blocks. If `hermes/` was created by the installer, `--remove-memory` removes that directory too, including tickets and memory records created while using Hermes.

If you want to keep project memory but remove only agent rules, omit `--remove-memory`:

```bash
skills/hermes-runtime/scripts/hermes-project.sh uninstall --agents codex,claude,cursor
```

To force-remove all Hermes project memory regardless of manifest ownership:

```bash
skills/hermes-runtime/scripts/hermes-project.sh uninstall --agents codex,claude,cursor --purge-memory
```

## Quick Use

For normal non-invasive use:

```text
Use the Hermes Runtime skill for this task.
Keep context recoverable, but do not create project files unless I explicitly approve it.
```

For code changes:

```text
Use Hermes Runtime.
Before you finish, verify the change and tell me what project memory or docs should be updated.
Use existing docs if they exist. Ask before creating new files.
```

For read-only analysis:

```text
Use Hermes Runtime in read-only mode.
Analyze the issue and produce a recoverable task note in your answer.
Do not modify files.
```

## Full Project Memory Mode

If you want behavior closer to a complete Hermes project management system, explicitly initialize project memory:

```text
Initialize Hermes memory for this project.
Show me the file plan first and use the least intrusive structure.
```

The agent should then propose one of these options:

1. use the project's existing docs
2. create a small `memory/` directory
3. create a dedicated `hermes/` directory only if requested

After initialization, future tasks can use:

```text
Use Hermes Runtime for all work in this project.
Create or update task memory, bug notes, feature notes, ADRs, and current state when applicable.
```

The project bootstrap script installs this instruction pattern directly into supported agent rule files so future sessions know to read `hermes/retrieval/index.md` at task start and update tickets or memory before completion.

## What "Automatic Documentation" Means

Hermes does not secretly write files.

Skill-only installation gives the agent documentation-closure behavior when the skill is used:

- detect whether documentation is needed
- use existing docs when available
- recommend or perform updates when permitted
- ask before creating new project structure
- refuse to treat code-only work as fully closed when project memory is expected

Project bootstrap installation is more explicit: it writes agent rules and optional `hermes/` files so supported tools are prompted at task start and task close. It is still not a background daemon; the AI must read and follow the generated project rules.

So the model is:

```text
Install skill = documentation-closure behavior when invoked.
Run project bootstrap = agent startup/completion rules plus optional `hermes/` memory.
Initialize memory = full project memory system.
```

## Skill Structure

```text
skills/hermes-runtime/
├── SKILL.md
├── references/
│   ├── memory-routing.md
│   ├── task-ticketing.md
│   ├── documentation-closure.md
│   ├── initialization.md
│   ├── agents/
│   └── runtime-notes/
├── scripts/
└── assets/
    └── templates/
```

`SKILL.md` is the public entrypoint. Reference files are loaded only when needed.

## Optional Helper Scripts

Helper scripts are bundled for approved project-memory initialization:

```text
skills/hermes-runtime/scripts/hermes-project.sh
skills/hermes-runtime/scripts/new-ticket.sh
skills/hermes-runtime/scripts/new-feature.sh
skills/hermes-runtime/scripts/new-bug.sh
skills/hermes-runtime/scripts/new-adr.sh
skills/hermes-runtime/scripts/check-doc-sync.sh
```

Run them from the target project root only after the user approves creating memory files.

## Bootstrap Prompts

Optional bootstrap prompts are provided for tools that do not have native skill loading or when you prefer manual setup:

```text
bootstrap/codex.md
bootstrap/claude.md
bootstrap/cursor.md
```

They all point to the same skill entrypoint:

```text
skills/hermes-runtime/SKILL.md
```

## Suggested GitHub Topics

```text
ai-agents
ai-coding
codex-skills
claude-skills
project-memory
context-engineering
software-engineering
documentation
adr
agentic-workflows
```

## Vision

Hermes Runtime aims to make AI-assisted engineering recoverable:

```text
Every task can explain what happened.
Every bug can explain why it happened.
Every decision can explain why it was made.
Every future AI session can recover the useful context.
```
