# Hermes Runtime Bootstrap - Cursor

Use the Hermes Runtime skill when the user asks for project memory, task documentation, bug history, decision records, feature notes, context recovery, or documentation closure.

Primary skill:

```text
skills/hermes-runtime/SKILL.md
```

## Rules

- Hermes is a skill pack, not a required project framework.
- Do not create project files by default.
- Prefer existing project docs and conventions.
- Ask before initializing new memory directories.
- Keep engineering context recoverable.
- Treat documentation closure as part of completion when code or behavior changes.

## Project Rule Target

For Cursor project-level behavior, install the managed Hermes rule into:

```text
.cursor/rules/hermes-memory.mdc
```

Recommended command from the target project root:

```bash
skills/hermes-runtime/scripts/hermes-project.sh install --agents cursor --init-memory
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

## Optional Initialization

If the user asks to initialize Hermes memory, show the file plan first and use only approved templates from:

```text
skills/hermes-runtime/assets/templates/
```

## Uninstall

Remove managed Cursor rules and Hermes memory created by the installer with:

```bash
skills/hermes-runtime/scripts/hermes-project.sh uninstall --agents cursor --remove-memory
```
