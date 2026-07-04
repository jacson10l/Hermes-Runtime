# Feature: Host Project Bootstrap

## Purpose

Let users opt into project-level Hermes behavior for supported AI tools instead of assuming skill installation creates a background hook.

## Behavior

Hermes Runtime has two installation layers:

- Skill-only installation: makes `skills/hermes-runtime/SKILL.md` available when the AI tool invokes or is asked to use it.
- Project bootstrap installation: writes managed project rules and optionally creates project-local Hermes memory so future sessions are prompted to load memory at task start and update records before completion.

The bootstrap script is:

```text
skills/hermes-runtime/scripts/hermes-project.sh
```

Supported agent targets:

| Target | Managed file |
| --- | --- |
| `codex` | `AGENTS.md` |
| `claude` | `CLAUDE.md` |
| `cursor` | `.cursor/rules/hermes-memory.mdc` |

When `--init-memory` is used, the installer creates a `hermes/` skeleton with retrieval, runtime, memory, ticket, template, and helper-script files. It writes `hermes/.hermes-runtime-manifest` to track installer-owned content.

Uninstall removes managed rule blocks or files. With `--remove-memory`, it removes `hermes/` entirely when the installer created that root. With `--purge-memory`, it always removes `hermes/`.

## Inputs

- Command: `install` or `uninstall`
- Agent targets: `codex`, `claude`, `cursor`, or a comma-separated combination
- Optional project name
- Optional memory flags: `--init-memory`, `--remove-memory`, `--purge-memory`

## Outputs

- Managed agent rule files or blocks.
- Optional project-local `hermes/` memory skeleton.
- Collision-resistant task ticket filenames.

## Key Files

- `skills/hermes-runtime/scripts/hermes-project.sh`
- `skills/hermes-runtime/scripts/new-ticket.sh`
- `skills/hermes-runtime/assets/templates/scripts/new-ticket.sh`
- `README.md`
- `bootstrap/codex.md`
- `bootstrap/claude.md`
- `bootstrap/cursor.md`
- `skills/hermes-runtime/references/initialization.md`

## Dependencies

- POSIX-like shell environment with Bash.
- Standard Unix tools used by the scripts: `awk`, `grep`, `find`, `sed`, `perl`, `mktemp`, `cp`, `rm`, and `rmdir`.

## Edge Cases

- Existing agent files are preserved; Hermes removes and replaces only its managed block.
- Agent files created entirely by Hermes are deleted on uninstall.
- If `hermes/` existed before install, `--remove-memory` removes only manifest-managed memory files; `--purge-memory` is required to delete the entire directory.
- Repeated ticket titles in the same minute receive numeric suffixes.

## Testing

Run:

```bash
bash skills/hermes-runtime/tests/test-hermes-scripts.sh
for f in skills/hermes-runtime/scripts/*.sh skills/hermes-runtime/assets/templates/scripts/*.sh skills/hermes-runtime/tests/*.sh; do bash -n "$f"; done
```

## History

- 2026-07-04: Added host project bootstrap, uninstall cleanup, generated-content README documentation, and collision-resistant ticket naming.
