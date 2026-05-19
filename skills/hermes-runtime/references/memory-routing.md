# Memory Routing

Load context summary-first and relevance-first.

## Always Check First

- project README
- agent instruction files
- existing `hermes/`, `memory/`, `.ai/`, `docs/`, `adr/`, or `tickets/`
- current git status when modifying code

## Feature Work

Relevant docs:

- feature notes
- architecture docs
- development workflow
- current-state or roadmap docs

## Bugfix

Relevant docs:

- bug history
- error-handling conventions
- debugging workflow
- related tickets or incidents

## Architecture Change

Relevant docs:

- architecture docs
- ADRs
- constraints
- existing design docs

## Avoid

- full documentation scans by default
- creating new memory locations without approval
- loading archives unless the current task needs historical evidence
