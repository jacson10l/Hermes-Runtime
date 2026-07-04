---
name: hermes-runtime
description: Use when the user wants AI project memory, task documentation, decision records, bug history, feature notes, context recovery, or "document everything" behavior without forcing a project structure. This skill keeps engineering context recoverable and only creates project files when the user explicitly asks to initialize memory.
---

# Hermes Runtime

Hermes Runtime is a project-memory skill for AI agents.

Use it to keep task, bug, feature, and decision context recoverable while staying non-invasive by default.

## Core Rule

Do not create a `hermes/`, `memory/`, `.ai/`, or docs structure unless the user explicitly asks to initialize project memory or approves the file plan.

By default, operate as a skill:

- route existing context
- document conclusions in the conversation
- recommend memory updates
- use existing project documentation when present
- ask before adding new project files

## Workflow

1. Detect existing memory locations.
   Look for `hermes/`, `memory/`, `.ai/`, `docs/`, `decisions/`, `adr/`, `tickets/`, or project-specific agent instructions.

2. Route context.
   Read only the minimum relevant docs. See `references/memory-routing.md`.

3. Track the task.
   If the project already has tickets or memory files, use them. If not, keep a concise task record in the response unless the user approves creating files. See `references/task-ticketing.md`.

4. Close documentation.
   Before claiming completion, verify whether code, tests, task record, and memory updates are all closed. See `references/documentation-closure.md`.

5. Initialize only on request.
   If the user asks to initialize Hermes memory, present the file plan first. Use `assets/templates/` or the helper scripts in `scripts/` only after approval.

6. Bootstrap host rules only on request.
   If the user wants Hermes to run at the start and end of future sessions, explain that skill installation alone is not a background hook. Use `scripts/hermes-project.sh` to install managed rules for Codex, Claude, or Cursor after approval. See `references/initialization.md`.

## Optional References

- `references/agents/` contains optional role guidance.
- `references/runtime-notes/` contains legacy runtime notes for context engineering, governance, retrieval, and domain examples.

Load these only when relevant.

## Non-Invasive Defaults

- Prefer existing documentation structure over creating a new one.
- Prefer a small task note over a full directory tree.
- Do not copy templates into the project automatically.
- Do not run helper scripts unless the user explicitly wants project files created.
- Do not block small read-only answers on memory initialization.

## When User Asks To Initialize Memory

Propose the least intrusive option:

1. Use existing project docs if they exist.
2. Use a single `memory/` directory if the project already has that convention.
3. Use `hermes/` only when the user wants a dedicated Hermes memory area.

Show the exact files before creating them.

For supported project-level integrations, the installer can write managed rule blocks to:

- Codex: `AGENTS.md`
- Claude Code: `CLAUDE.md`
- Cursor: `.cursor/rules/hermes-memory.mdc`

The same installer can uninstall those blocks and remove Hermes memory it created.

## Completion Standard

For code-changing work, completion requires:

- changed behavior is implemented
- verification is run or the gap is documented
- relevant context is recoverable
- existing memory/docs are updated when present
- new memory files are created only if approved

If documentation is missing, say what is missing and either update existing docs or ask for approval to initialize memory.
