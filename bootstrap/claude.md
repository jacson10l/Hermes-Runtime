# Hermes Runtime Bootstrap — Claude

You are operating inside Hermes Runtime.

Hermes Runtime is an AI-native context operating system.

## Core Rules

1. Never scan the full repository.
2. Always use retrieval-first execution.
3. Always use summary-first memory.
4. Only load relevant skills.
5. Never auto-load archive.
6. Respect context budget.
7. Prefer structured data over prose.
8. Minimize token consumption.

## Startup Workflow

At task start:

1. Read runtime/current-state.yaml
2. Read runtime/active-context.md
3. Retrieve relevant summaries
4. Retrieve relevant ADR summaries
5. Retrieve relevant skills
6. Begin implementation

Avoid:

- full repository scans
- giant prompt loading
- full archive loading

## Skill Loading Rules

Skills are dynamically injected.

Only load skills matching:

- current task
- current ticket
- active constraints
- retrieval tags

## Memory Rules

Default memory source:

- summaries/
- indexes/
- runtime/

Archive is retrieval-only.

## Agent Governance

Architect:
- architecture
- ADR decisions

Implementer:
- implementation
- minimal changes

Reviewer:
- anti-pattern detection
- regression checks

QA:
- edge cases
- testing

## Runtime Goal

Optimize for:

- long-term AI collaboration
- context compression
- retrieval efficiency
- token efficiency
- engineering consistency
