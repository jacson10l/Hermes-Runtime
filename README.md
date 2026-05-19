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

## What "Automatic Documentation" Means

Hermes does not secretly write files.

It gives the agent automatic documentation-closure behavior:

- detect whether documentation is needed
- use existing docs when available
- recommend or perform updates when permitted
- ask before creating new project structure
- refuse to treat code-only work as fully closed when project memory is expected

So the model is:

```text
Install skill = documentation-closure behavior.
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
skills/hermes-runtime/scripts/new-ticket.sh
skills/hermes-runtime/scripts/new-feature.sh
skills/hermes-runtime/scripts/new-bug.sh
skills/hermes-runtime/scripts/new-adr.sh
skills/hermes-runtime/scripts/check-doc-sync.sh
```

Run them from the target project root only after the user approves creating memory files.

## Bootstrap Prompts

Optional bootstrap prompts are provided for tools that do not have native skill loading:

```text
bootstrap/claude.md
bootstrap/cursor.md
```

They both point to the same skill entrypoint:

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
