# Context Loading

Hermes uses summary-first, relevance-first context loading.

## Required Startup Reads

At task start, read:

1. `hermes/runtime/task-lifecycle.md`
2. `hermes/memory/core/project.md`
3. `hermes/memory/core/current-state.md`
4. task-relevant memory documents

## Avoid

- full repository scans
- loading every memory file
- loading archive content unless explicitly relevant
- giant prompt dumps

## Prefer

- indexes before full documents
- current state before history
- related docs before broad searches
- structured task tickets before prose summaries
