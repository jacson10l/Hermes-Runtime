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
6. Before claiming code work is complete, check whether relevant docs or memory should be updated.

## Default Workflow

At task start:

1. Use `skills/hermes-runtime/SKILL.md`.
2. Check for existing project docs and memory.
3. Load only relevant context.
4. Work within the existing project structure.
5. Close with verification and recoverable context.

## Optional Initialization

Only initialize project memory when the user explicitly asks or approves a file plan.

Use bundled templates from:

```text
skills/hermes-runtime/assets/templates/
```
