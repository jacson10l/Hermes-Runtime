# Feature: Strict Documentation Closure

## Status

active

## Summary

This repository uses strict-but-concise Hermes memory closure for meaningful engineering work. Each meaningful requirement, bugfix, investigation, refactor, deployment, or review should leave a recoverable task record and any durable bug, feature, or decision memory that applies.

## Behavior

- Project memory lives under `hermes/`.
- A task record is created or updated under `hermes/tickets/` for meaningful work.
- Verification results are recorded before claiming completion.
- Bug root causes with future value go under `hermes/memory/bugs/`.
- Durable feature behavior goes under `hermes/memory/features/`.
- Architecture or technical decisions go under `hermes/memory/decisions/`.
- Project status changes go under `hermes/memory/core/current-state.md`.
- Fragmented chat notes do not belong in `current-state.md`.

## Agent Entry Points

- Cursor: `.cursor/rules/hermes-memory.mdc`
- Codex and other markdown-aware agents: `AGENTS.md`
- Hermes retrieval: `hermes/retrieval/index.md`

## Verification Expectations

Before completion, agents should confirm:

- code or content changes are complete
- relevant checks have run, or any skipped checks are documented
- ticket updates are complete
- applicable bug, feature, decision, and current-state memory updates are complete
