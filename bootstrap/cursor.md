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

## Optional Initialization

If the user asks to initialize Hermes memory, show the file plan first and use only approved templates from:

```text
skills/hermes-runtime/assets/templates/
```
