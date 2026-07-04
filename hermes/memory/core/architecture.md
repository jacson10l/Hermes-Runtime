# Architecture

## Architecture Style

- Skill-pack repository with optional project-memory templates.
- Project-level Hermes memory is stored under `hermes/` when the repository explicitly opts into strict memory mode.

## System Layers

| Layer | Responsibility | Key Files |
| --- | --- | --- |
| Skill entrypoint | Defines Hermes Runtime behavior for agents that support skills. | `skills/hermes-runtime/SKILL.md` |
| References | Provides deeper workflow guidance loaded only when relevant. | `skills/hermes-runtime/references/` |
| Templates | Supplies files for approved project-memory initialization. | `skills/hermes-runtime/assets/templates/` |
| Project bootstrap | Installs or removes managed Codex, Claude Code, and Cursor project rules and optional `hermes/` memory. | `skills/hermes-runtime/scripts/hermes-project.sh` |
| Bootstrap prompts | Gives non-skill tools a lightweight way to use Hermes. | `bootstrap/` |
| Project memory | Stores this repository's strict-mode task, feature, decision, and state records. | `hermes/` |
| Agent rules | Applies the Hermes memory rule in tools that read project rules. | `.cursor/rules/hermes-memory.mdc`, `AGENTS.md` |

## Data Flow

```text
User task
  -> Read retrieval index
  -> Load relevant memory
  -> Make scoped changes
  -> Update ticket and durable memory
  -> Run checks
  -> Record verification
```

## Key Boundaries

- The reusable skill remains non-invasive by default.
- This repository's own `hermes/` directory is a project-level opt-in, not a requirement imposed on every downstream project.
- Cursor-specific behavior belongs in `.cursor/rules/`; cross-agent behavior belongs in `AGENTS.md` and Hermes memory.

## Extension Points

- Add templates under `skills/hermes-runtime/assets/templates/`.
- Add workflow guidance under `skills/hermes-runtime/references/`.
- Add project-specific memory under `hermes/memory/`.
- Add supported agent targets in `skills/hermes-runtime/scripts/hermes-project.sh`.

## Known Constraints

- Rules guide agents through prompt context; they are not runtime enforcement.
- Completion discipline depends on agents reading and following the project rules.
