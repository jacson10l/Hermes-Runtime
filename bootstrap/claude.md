# Hermes Runtime Bootstrap - Claude

Use the Hermes Runtime skill when the user asks for project memory, task documentation, bug history, decision records, feature notes, context recovery, or documentation closure.

Primary skill:

```text
skills/hermes-runtime/SKILL.md
```

## Core Rules

1. Hermes is a skill pack, not a required project framework.
2. Do not create project files by default.
3. Prefer the user's existing docs, memory, ADR, and ticket conventions.
4. Ask before initializing `hermes/`, `memory/`, `.ai/`, or any new documentation structure.
5. Keep task context recoverable.
6. Before claiming code work is complete, record verification and update relevant docs or memory.

## Project Rule Target

For Claude Code project-level behavior, install the managed Hermes rule into:

```text
CLAUDE.md
```

Recommended command from the target project root:

```bash
skills/hermes-runtime/scripts/hermes-project.sh install --agents claude --init-memory
```

## Default Workflow

At task start:

1. Use `skills/hermes-runtime/SKILL.md`.
2. Read `hermes/retrieval/index.md` when it exists.
3. Load only memory files relevant to the task.
4. Create or update a task record under `hermes/tickets/`.

At task close:

1. Record context, goal, changed files, behavior changes, verification, and follow-ups.
2. Update related bug, feature, decision, workflow, or current-state memory when durable context changed.
3. Report any verification that could not run.

## Optional Initialization

Only initialize project memory when the user explicitly asks or approves a file plan.

Use bundled templates from:

```text
skills/hermes-runtime/assets/templates/
```

## Uninstall

Remove managed Claude rules and Hermes memory created by the installer with:

```bash
skills/hermes-runtime/scripts/hermes-project.sh uninstall --agents claude --remove-memory
```
