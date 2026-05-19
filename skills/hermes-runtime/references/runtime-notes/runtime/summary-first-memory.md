name: summary-first-memory

version: 2.0

type: universal-runtime-skill

domain: memory-compression

purpose:
  Optimize long-term AI memory retrieval using compressed summaries.

compatible_agents:
  - Claude
  - GPT
  - Cursor
  - Windsurf
  - Gemini

triggers:
  - memory-retrieval
  - historical-context
  - long-running-project
  - retrospective-analysis

priority: high

token_budget: 250

memory_policy:
  default_source:
    - summaries
    - indexes
    - runtime

  archive_policy:
    mode: retrieval-only
    auto_injection: false

constraints:
  - summary-before-archive
  - compressed-memory-only
  - no-full-history-loading

anti_patterns:
  - full-retro-loading
  - full-adr-loading
  - full-log-injection
  - unrestricted-memory-expansion

best_practices:
  - compressed-decision-memory
  - indexed-historical-memory
  - episodic-summaries
  - retrieval-based-expansion

retrieval_tags:
  - memory
  - summaries
  - compression
  - retrieval
  - archive
