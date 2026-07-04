# Optional Memory Initialization

Initialize project memory only when the user asks for it or approves the plan.

## Minimal Options

### Existing Docs

Use the project's current docs structure. Add only the missing record type.

### Light Memory

Create:

```text
memory/
├── current-state.md
├── decisions/
├── features/
└── bugs/
```

### Dedicated Hermes Memory

Create:

```text
hermes/
├── memory/
├── tickets/
└── retrieval/
```

Use this only when the user wants a dedicated Hermes area.

## Template Source

Optional templates live in:

```text
skills/hermes-runtime/assets/templates/
```

Copy only the files the user approved.

Helper scripts in `skills/hermes-runtime/scripts/` can create individual records from those templates. Run them from the target project root only after approval.

## Project Bootstrap

Use project bootstrap when the user wants future AI sessions to read Hermes memory at task start and update task records or memory before completion.

Skill installation alone does not create a background hook. Bootstrap writes managed project rules that supported tools can read.

Install examples:

```bash
skills/hermes-runtime/scripts/hermes-project.sh install --agents codex --init-memory
skills/hermes-runtime/scripts/hermes-project.sh install --agents claude --init-memory
skills/hermes-runtime/scripts/hermes-project.sh install --agents cursor --init-memory
skills/hermes-runtime/scripts/hermes-project.sh install --agents codex,claude,cursor --init-memory
```

Generated agent files:

| Agent | File |
| --- | --- |
| Codex | `AGENTS.md` |
| Claude Code | `CLAUDE.md` |
| Cursor | `.cursor/rules/hermes-memory.mdc` |

When `--init-memory` is used, the installer may create:

- `hermes/.hermes-runtime-manifest`
- `hermes/retrieval/`
- `hermes/memory/`
- `hermes/tickets/`
- `hermes/scripts/`

## Uninstall

Run uninstall before deleting the skill folder.

```bash
skills/hermes-runtime/scripts/hermes-project.sh uninstall --agents codex,claude,cursor --remove-memory
```

Uninstall removes managed agent rule files or blocks. If `hermes/` was created by the installer, `--remove-memory` removes that directory too, including task tickets and memory created while using Hermes.

Use this form to keep project memory and remove only agent rules:

```bash
skills/hermes-runtime/scripts/hermes-project.sh uninstall --agents codex,claude,cursor
```

Use this form to force-delete all Hermes project memory:

```bash
skills/hermes-runtime/scripts/hermes-project.sh uninstall --agents codex,claude,cursor --purge-memory
```
