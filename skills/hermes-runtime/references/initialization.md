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
