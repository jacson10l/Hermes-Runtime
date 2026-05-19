# ADR-001: Use Versioned Hermes Memory Rule

## Status

accepted

## Date

2026-05-19

## Context

The `hermes/` memory structure can define what to remember, where to store it, and how to recover context, but it cannot force Cursor or Codex to follow that workflow by itself. The project needs a stronger default that stays strict without becoming verbose.

## Decision

Use a combined enforcement convention:

- keep project memory under versioned `hermes/`
- add an always-on Cursor Project Rule in `.cursor/rules/hermes-memory.mdc`
- add `AGENTS.md` with the same Hermes Memory Rule for Codex and other markdown-aware agents
- require tickets, relevant durable memory, current-state updates, and verification closure before claiming completion

## Alternatives Considered

- Only keep `hermes/` memory files: rejected because agents may not load them consistently.
- Only use Cursor rules: rejected because Codex and other agents need the same operating rule.
- Use legacy `docs/` as the memory root: rejected because Hermes memory should have a clear dedicated root.

## Consequences

Positive:

- Cursor and Codex share the same documented completion standard.
- The rule is versioned with the repository.
- Future sessions can recover both task history and durable memory.

Negative:

- Agent compliance is still prompt-level guidance, not hard runtime enforcement.
- Meaningful tasks require an extra memory update step.

## Follow-ups

- Keep `.cursor/rules/hermes-memory.mdc` and `AGENTS.md` synchronized when the rule changes.
