name: agent-governance

version: 2.0

type: universal-runtime-skill

domain: agent-governance

purpose:
  Define deterministic multi-agent execution boundaries.

compatible_agents:
  - Claude
  - GPT
  - Cursor
  - Windsurf
  - Gemini

triggers:
  - multi-agent
  - task-execution
  - architecture-review
  - implementation
  - qa

priority: high

agent_roles:
  architect:
    responsibilities:
      - architecture
      - system-boundaries
      - adr-decisions

  implementer:
    responsibilities:
      - implementation
      - minimal-modifications
      - constraint-following

  reviewer:
    responsibilities:
      - anti-pattern-detection
      - regression-checking
      - consistency-validation

  qa:
    responsibilities:
      - edge-case-testing
      - failure-simulation
      - regression-validation

constraints:
  - role-boundary-enforcement
  - no-cross-role-overreach
  - deterministic-execution

anti_patterns:
  - uncontrolled-agent-behavior
  - architecture-drift
  - role-collision
  - undefined-responsibilities

best_practices:
  - explicit-agent-boundaries
  - deterministic-role-execution
  - review-first-validation
  - isolated-agent-responsibilities

retrieval_tags:
  - agents
  - governance
  - execution
  - architecture
