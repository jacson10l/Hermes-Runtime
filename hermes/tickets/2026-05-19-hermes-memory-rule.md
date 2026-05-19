# Ticket: Add strict Hermes memory rule

## Status

done

## Context

The project had Hermes Runtime templates and bootstrap prompts, but no project-level `hermes/` memory instance or versioned rule forcing future Cursor/Codex sessions to update memory for meaningful work.

## Goal

Version a strict-but-concise Hermes memory rule so future meaningful requirements, bugs, investigations, refactors, deployments, and reviews create or update recoverable Hermes records.

## Scope

In scope:

- Add project-level Hermes memory under `hermes/`.
- Add a Cursor Project Rule.
- Add a Codex-readable project rule.
- Record the durable feature behavior and technical decision.

Out of scope:

- Changing Hermes Runtime skill behavior for downstream projects.
- Adding runtime enforcement beyond project rules and memory closure.

## Changes

Files changed:

- `AGENTS.md`
- `.cursor/rules/hermes-memory.mdc`
- `hermes/retrieval/index.md`
- `hermes/memory/core/project.md`
- `hermes/memory/core/current-state.md`
- `hermes/memory/core/architecture.md`
- `hermes/memory/features/strict-documentation-closure.md`
- `hermes/memory/decisions/ADR-001-hermes-memory-rule.md`
- `hermes/tickets/2026-05-19-hermes-memory-rule.md`

Behavior changed:

- Cursor receives an always-on project rule for Hermes memory closure.
- Codex and other agents that read `AGENTS.md` receive the same rule.
- Future meaningful tasks have a project-level place to record tickets and durable memory.

## Verification

Commands run:

```bash
find hermes .cursor -type f | sort
for f in hermes/retrieval/index.md hermes/memory/core/project.md hermes/memory/core/current-state.md hermes/memory/core/architecture.md hermes/memory/features/strict-documentation-closure.md hermes/memory/decisions/ADR-001-hermes-memory-rule.md hermes/tickets/2026-05-19-hermes-memory-rule.md AGENTS.md .cursor/rules/hermes-memory.mdc; do test -f "$f" || exit 1; done; echo ok
tmp=$(mktemp); sed '1,6d' .cursor/rules/hermes-memory.mdc > "$tmp"; diff -u AGENTS.md "$tmp"; rm "$tmp"
rg -n "pending|TODO|<title>|<project-name>|YYYY-MM-DD" hermes AGENTS.md .cursor/rules/hermes-memory.mdc | grep -v 'rg -n' || true
git status --short
```

Results:

```text
The expected Hermes, Cursor rule, and AGENTS files exist.
AGENTS.md and .cursor/rules/hermes-memory.mdc have matching rule text after removing Cursor frontmatter.
Placeholder scan found no remaining template placeholders or unresolved markers outside the recorded verification command.
git status showed these new task files plus unrelated pre-existing untracked files: Hermes_runtime_guide.md and outputs/.
```

## Memory Updates

Updated:

- [x] current-state.md
- [x] feature doc
- [ ] bug doc
- [x] ADR
- [ ] workflow doc
- [ ] convention doc

Bug memory was not needed because this was not a bugfix.

## Follow-ups

- Keep rule text synchronized across `.cursor/rules/hermes-memory.mdc` and `AGENTS.md`.
