# Documentation Closure

Documentation closure means future AI sessions can recover what changed and why.

## Before Claiming Completion

Check:

1. Was code changed?
2. Was verification run?
3. Did behavior, architecture, or workflow change?
4. Does the project already have docs or memory that should be updated?
5. Did the user approve creating new memory files if none exist?

## Update Rules

- Feature behavior changes should update feature docs when present.
- Bug fixes should record symptoms, root cause, fix, and verification when bug memory exists or the user approved it.
- Architecture decisions should update ADRs when present or approved.
- Current status should update roadmap/current-state docs when present.

## Non-Invasive Rule

If no documentation structure exists and the user did not ask to create one, do not create files. Summarize the recommended memory update in the final response and offer the exact file plan for approval.
