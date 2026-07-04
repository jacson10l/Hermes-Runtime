# Current State

## Current Focus

- Establishing strict-but-concise Hermes memory closure for this repository.
- Keeping the Cursor Project Rule and Codex-facing agent rule aligned.
- Providing explicit host-level bootstrap and uninstall for supported AI tools.

## Recently Completed

- Initialized project-level Hermes memory under `hermes/`.
- Added the always-on Cursor Project Rule at `.cursor/rules/hermes-memory.mdc`.
- Added `AGENTS.md` so Codex and other markdown-aware agents can apply the same rule.
- Added `hermes-project.sh` for managed Codex, Claude Code, and Cursor project rule installation/uninstall.
- Added collision-resistant ticket names using date, time, and numeric suffixes.

## Active Problems

| Problem | Status | Notes |
| --- | --- | --- |
| Hermes cannot force every external agent by itself | mitigated | Use versioned rules and project memory closure checks to make compliance explicit. |
| Skill-only install is not a session-start/session-end hook | mitigated | README and bootstrap docs now distinguish skill-only usage from project bootstrap rule installation. |

## Pending Decisions

- None.

## Next Steps

1. Keep future meaningful work recorded under `hermes/tickets/`.
2. Add bug, feature, or decision memory only when the task creates durable context.
3. Consider package-level install/uninstall hooks if Hermes Runtime becomes a plugin.

## AI Notes

- `current-state.md` should record project status changes, active problems, and next steps. It should not collect fragmented chat notes.
