# Hermes Runtime Bootstrap - Codex

Use the Hermes Runtime skill when the user asks for project memory, task documentation, bug history, decision records, feature notes, context recovery, documentation closure, or durable AI work records.

Primary skill:

```text
skills/hermes-runtime/SKILL.md
```

## Project Rule Target

For Codex project-level behavior, install the managed Hermes rule into:

```text
AGENTS.md
```

Recommended command from the target project root:

```bash
skills/hermes-runtime/scripts/hermes-project.sh install --agents codex --init-memory
```

## Default Workflow

At task start:

1. Read `hermes/retrieval/index.md` when it exists.
2. Load only memory files relevant to the task.
3. Create or update a task record under `hermes/tickets/`.

At task close:

1. Record context, goal, changed files, behavior changes, verification, and follow-ups.
2. Update related bug, feature, decision, workflow, or current-state memory when durable context changed.
3. Report any verification that could not run.

## Uninstall

Remove managed Codex rules and Hermes memory created by the installer with:

```bash
skills/hermes-runtime/scripts/hermes-project.sh uninstall --agents codex --remove-memory
```
