# ADR-002: Host Rule Bootstrap And Uninstall Manifest

## Status

accepted

## Date

2026-07-04

## Context

Users expected Hermes Runtime to make future AI sessions read prior project memory at startup and record changed files, verification, and next steps at completion. The existing skill-only model was intentionally non-invasive and did not install project rules or memory files. Users also need uninstall behavior that removes files created by Hermes, and multi-maintainer projects need ticket names that avoid same-day collisions.

## Decision

Add an explicit project bootstrap script:

```text
skills/hermes-runtime/scripts/hermes-project.sh
```

The script writes managed rule blocks to supported project-level agent files:

- Codex: `AGENTS.md`
- Claude Code: `CLAUDE.md`
- Cursor: `.cursor/rules/hermes-memory.mdc`

The script can also initialize a project-local `hermes/` skeleton and write `hermes/.hermes-runtime-manifest`.

Uninstall uses managed block markers and the manifest to remove generated content. If the installer created the `hermes/` root, `--remove-memory` removes the entire root so tickets and memory created while using Hermes are cleaned up. If `hermes/` pre-existed, uninstall removes manifest-managed files only unless the user passes `--purge-memory`.

Ticket helpers now use:

```text
YYYY-MM-DD-HHMM-short-title.md
```

and append numeric suffixes for repeated titles in the same minute.

## Alternatives Considered

- Rely only on skill metadata: rejected because skill installation does not guarantee every session starts or closes with Hermes memory.
- Modify only README/bootstrap prompts: rejected because users need a repeatable install/uninstall path.
- Always delete `hermes/` on uninstall: rejected because some projects may already have their own Hermes memory before running the installer.
- Keep date-only ticket naming: rejected because same-day, same-title work can collide in multi-maintainer projects.

## Consequences

Positive:

- Users have an explicit opt-in path for Codex, Claude Code, and Cursor project rules.
- README lists generated files and uninstall behavior.
- Uninstall can clean generated files without blindly deleting unrelated project content.
- Ticket names are more collision-resistant.

Negative:

- This is still prompt/rule-based behavior, not a background daemon.
- Users must run uninstall before deleting the skill folder if they want the installer to clean project files.
- Claude Code integration targets `CLAUDE.md`; a future package may add deeper `.claude/` integration if needed.

## Follow-ups

- Consider packaging-level install/uninstall hooks if Hermes Runtime becomes a plugin rather than a copied skill folder.
