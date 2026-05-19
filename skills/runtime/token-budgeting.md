name: token-budgeting

version: 2.0

type: universal-runtime-skill

domain: context-optimization

purpose:
  Control AI context consumption using deterministic token allocation.

compatible_agents:
  - Claude
  - GPT
  - Cursor
  - Windsurf
  - Gemini

triggers:
  - large-context
  - long-conversation
  - repository-analysis
  - context-overflow

priority: critical

token_budget_policy:
  runtime: 300
  active_task: 2000
  skills: 2000
  summaries: 1000
  diff_context: 3000

constraints:
  - hard-context-limit
  - prioritized-context-loading
  - compressed-memory-only
  - runtime-first-allocation

anti_patterns:
  - unlimited-context-growth
  - giant-system-prompts
  - unrestricted-skill-loading
  - duplicate-context-injection

best_practices:
  - incremental-context-loading
  - relevance-based-budgeting
  - compressed-state-representation
  - skill-level-token-allocation

retrieval_tags:
  - tokens
  - optimization
  - compression
  - budgeting
  - runtime
