# Ticket: Ticket Naming Collision Investigation

## Status

closed

## Context

The user asked whether Hermes skill retention/task records are named only by date plus a short description, and whether a multi-maintainer project could hit conflicts when multiple people pull and commit records.

Current repository evidence:

- Existing ticket naming uses `YYYY-MM-DD-short-title.md`, for example `hermes/tickets/2026-05-19-hermes-memory-rule.md`.
- Hermes Runtime skill guidance suggests `hermes/tickets/YYYY-MM-DD-short-title.md` when files are approved.
- Durable memory files are not all date-based: core memory is named by topic, feature memory by feature slug, and decision memory by ADR number plus title.

## Goal

Answer the collaboration risk clearly and record the investigation without changing runtime behavior.

## Changed Files

- `hermes/tickets/2026-07-04-ticket-naming-collision-investigation.md`

## Behavior Changes

None. This is a documentation-only investigation record.

## Findings

- Yes, date-plus-slug ticket names can collide when two maintainers create a ticket for the same topic on the same day.
- Git can merge separate files cleanly when filenames differ, so the main avoidable risk is same-path creation or concurrent edits to shared files.
- Shared memory files such as `hermes/memory/core/current-state.md` are more naturally conflict-prone because many tasks may update the same file.
- Safer multi-maintainer ticket naming should include an additional uniqueness component such as time, issue ID, branch slug, author slug, or a short random suffix.

## Recommendation

For a multi-maintainer project, prefer one of these ticket filename patterns:

- `YYYY-MM-DD-HHMM-short-title.md`
- `YYYY-MM-DD-issue-123-short-title.md`
- `YYYY-MM-DD-author-short-title.md`
- `YYYY-MM-DD-short-title-abc123.md`

The current `YYYY-MM-DD-short-title.md` pattern is acceptable for solo or low-concurrency use, but it is not ideal as the only convention for busy teams.

## Verification

- Read `hermes/retrieval/index.md`.
- Read relevant Hermes memory files:
  - `hermes/memory/core/project.md`
  - `hermes/memory/core/current-state.md`
  - `hermes/memory/decisions/ADR-001-hermes-memory-rule.md`
  - `hermes/memory/features/strict-documentation-closure.md`
- Inspected current Hermes file layout with `find hermes -maxdepth 3 -type f`.
- Read Hermes Runtime skill references for memory routing and task ticketing.

No tests were run because this investigation did not change runtime code.

## Memory Updates

- Created this task record under `hermes/tickets/`.
- Did not update `hermes/memory/core/current-state.md` because no project status, active problem, or agreed next step changed yet.
- Did not create a decision record because no naming-policy change was adopted in this task.

## Follow-ups

- Implemented in `hermes/tickets/2026-07-04-1321-host-bootstrap-uninstall-cleanup.md`.
- Current helper scripts now use `YYYY-MM-DD-HHMM-short-title.md` with numeric suffixes for repeated titles in the same minute.
