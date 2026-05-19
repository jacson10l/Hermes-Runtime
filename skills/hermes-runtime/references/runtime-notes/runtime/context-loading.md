name: runtime-context-loading

version: 2.0

type: universal-runtime-skill

domain: context-engineering

purpose:
  Deterministic AI runtime context initialization.

compatible_agents:
  - Claude
  - GPT
  - Cursor
  - Windsurf
  - Gemini
  - Kiro

triggers:
  - startup
  - initialization
  - task-start
  - runtime-load
  - context-refresh

priority: critical

token_budget: 200

load_order:
  - runtime/current-state.yaml
  - runtime/active-context.md
  - retrieval/indexes
  - relevant-summaries
  - relevant-skills

constraints:
  - never-scan-full-repository
  - never-load-full-history
  - summary-first-only
  - retrieval-first-execution
  - archive-isolation

anti_patterns:
  - giant-prompt-loading
  - unrestricted-context-injection
  - full-memory-loading
  - recursive-context-expansion

best_practices:
  - lazy-loading
  - relevance-routing
  - incremental-context-expansion
  - compressed-runtime-context
  - modular-skill-injection

retrieval_tags:
  - runtime
  - context
  - initialization
  - retrieval
  - loading

execution_flow:
  - initialize-runtime
  - load-active-state
  - retrieve-relevant-memory
  - inject-relevant-skills
  - begin-task
