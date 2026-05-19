# Hermes Memory Rule

Before making code changes, read `hermes/retrieval/index.md` and any referenced Hermes memory files relevant to the task.

For every meaningful requirement, bugfix, investigation, refactor, deployment, or review task:

1. Create or update a task record under `hermes/tickets/`.
2. Record context, goal, changed files, behavior changes, verification, and follow-ups.
3. For bugfixes with a useful root cause, create or update `hermes/memory/bugs/`.
4. For durable feature behavior, create or update `hermes/memory/features/`.
5. For architecture or technical decisions, create or update `hermes/memory/decisions/`.
6. Update `hermes/memory/core/current-state.md` when project status, active problems, or next steps change.

Before claiming completion, verify that code changes, tests/checks, ticket updates, and relevant Hermes memory updates are all closed.

Do not use the legacy `docs/` directory as the Hermes memory root. Hermes memory belongs under `hermes/`.
