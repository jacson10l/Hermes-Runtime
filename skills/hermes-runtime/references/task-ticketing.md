# Task Ticketing

Task records make context recoverable.

## Default Behavior

If the project already has tickets or task docs, use that structure.

If no structure exists, keep a compact task record in the final response unless the user approves creating files.

## Useful Task Record Fields

- status
- context
- goal
- changed files
- behavior changed
- verification
- memory updates
- follow-ups

## When Files Are Approved

Use the project's existing location first.

If the user chooses Hermes memory, use:

```text
hermes/tickets/YYYY-MM-DD-HHMM-short-title.md
```

If a ticket with the same timestamp and title already exists, append a numeric suffix such as `-2` or `-3`. This keeps same-day, same-topic work from colliding in multi-maintainer projects.

The optional helper script is:

```bash
skills/hermes-runtime/scripts/new-ticket.sh "short title"
```

Run helper scripts from the target project root after the user approves creating memory files.
