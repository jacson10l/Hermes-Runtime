# AI Operating Rules

## Before Work

AI must:

- read `hermes/runtime/context-loading.md`
- read `hermes/memory/core/project.md`
- read `hermes/memory/core/current-state.md`
- load only relevant feature, bug, workflow, convention, or ADR documents
- create or update a task ticket

## During Work

AI must:

- avoid unrelated refactors
- preserve existing architecture unless the task changes it
- record discovered constraints
- record root cause for bugs
- avoid logging secrets or sensitive data

## After Work

AI must:

- update `hermes/memory/core/current-state.md` when status changes
- update related feature docs
- add or update bug docs for bug fixes
- add ADRs for architecture decisions
- record verification commands and results in the ticket

## Completion Rule

Code changes without memory updates are incomplete.
