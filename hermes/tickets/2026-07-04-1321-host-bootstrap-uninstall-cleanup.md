# Ticket: Host Bootstrap Uninstall Cleanup

## Status

done

## Context

The user reported that installing Hermes Runtime as a skill did not make each AI session automatically read prior task memory at the beginning or write changed files, verification, and next steps at the end. The user also wanted project integrations for Codex, Claude Code, and Cursor, plus uninstall behavior that removes generated Hermes content. A prior investigation found that ticket filenames based only on date and title can collide in multi-maintainer projects.

## Goal

Hermes Runtime should provide an explicit project bootstrap path that writes managed agent rules, can initialize project-local `hermes/` memory, can uninstall generated files, documents generated content in README, and creates collision-resistant ticket names.

## Scope

In scope:

- Add a project bootstrap/uninstall script.
- Add collision-resistant ticket naming to skill and initialized-project helper scripts.
- Document generated files and uninstall behavior.
- Add bootstrap guidance for Codex, Claude Code, and Cursor.
- Add tests for ticket naming, install, and uninstall behavior.

Out of scope:

- Background daemon behavior or automatic hooks outside supported agent rule files.
- Global machine-level Codex, Claude Code, or Cursor configuration.
- Deleting non-Hermes project files during uninstall.

## Changes

Files changed:

- `README.md`
- `bootstrap/codex.md`
- `bootstrap/claude.md`
- `bootstrap/cursor.md`
- `skills/hermes-runtime/SKILL.md`
- `skills/hermes-runtime/references/initialization.md`
- `skills/hermes-runtime/references/task-ticketing.md`
- `skills/hermes-runtime/scripts/hermes-project.sh`
- `skills/hermes-runtime/scripts/new-ticket.sh`
- `skills/hermes-runtime/tests/test-hermes-scripts.sh`
- `skills/hermes-runtime/assets/templates/scripts/new-ticket.sh`
- `skills/hermes-runtime/assets/templates/memory/conventions/naming.md`
- `hermes/memory/features/host-project-bootstrap.md`
- `hermes/memory/decisions/ADR-002-host-rule-bootstrap-and-uninstall-manifest.md`
- `hermes/memory/core/architecture.md`
- `hermes/memory/core/current-state.md`
- `hermes/retrieval/index.md`

Behavior changed:

- `new-ticket.sh` now creates `YYYY-MM-DD-HHMM-short-title.md` tickets and appends `-2`, `-3`, etc. when the same title is created in the same minute.
- `hermes-project.sh install` can write managed Hermes rules to `AGENTS.md`, `CLAUDE.md`, and `.cursor/rules/hermes-memory.mdc`.
- `hermes-project.sh install --init-memory` can create a project-local `hermes/` skeleton, runtime docs, templates, and helper scripts.
- `hermes-project.sh uninstall` removes managed agent blocks or files.
- `hermes-project.sh uninstall --remove-memory` removes `hermes/` entirely when the installer created it; otherwise it removes manifest-managed memory files.
- `hermes-project.sh uninstall --purge-memory` force-removes `hermes/`.

## Verification

Commands run:

```bash
bash skills/hermes-runtime/tests/test-hermes-scripts.sh
for f in skills/hermes-runtime/scripts/*.sh skills/hermes-runtime/assets/templates/scripts/*.sh skills/hermes-runtime/tests/*.sh; do bash -n "$f"; done
git diff --check
```

Results:

```text
Hermes script tests passed.
Shell syntax checks passed with exit code 0.
git diff --check passed with exit code 0.
```

## Memory Updates

Updated:

- [x] current-state.md
- [x] feature doc
- [ ] bug doc
- [x] ADR
- [ ] workflow doc
- [x] convention doc

## Follow-ups

- Consider adding a dedicated user-facing install command wrapper if the skill is later packaged as a plugin with install hooks.
