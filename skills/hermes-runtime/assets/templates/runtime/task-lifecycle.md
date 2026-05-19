# Task Lifecycle

Every Hermes task follows the same closure path.

## 1. Load Runtime

Read:

- `hermes/runtime/README.md`
- `hermes/runtime/context-loading.md`
- `hermes/memory/core/project.md`
- `hermes/memory/core/current-state.md`

## 2. Route Memory

Load only documents relevant to the task:

- feature work: related feature docs and development workflow
- bugfix: related bug docs and debugging workflow
- architecture work: architecture, constraints, and ADRs
- release work: current state and release workflow

## 3. Create or Update Ticket

Every task needs a ticket under `hermes/tickets/`.

The ticket records:

- context
- goal
- scope
- changed files
- verification
- memory updates
- follow-ups

## 4. Do the Work

Make the smallest change that satisfies the task.

Avoid unrelated refactors. Preserve existing behavior unless the task explicitly changes it.

## 5. Verify

Run the narrowest useful verification first, then broader checks when risk requires it.

Record verification commands and results in the ticket.

## 6. Update Memory

Review and update:

- `hermes/memory/core/current-state.md`
- related feature documents
- related bug documents
- ADRs for architecture decisions
- workflow or convention docs when behavior changes

## 7. Close

The task can be called complete only after code, verification, ticket, and memory are all closed.
