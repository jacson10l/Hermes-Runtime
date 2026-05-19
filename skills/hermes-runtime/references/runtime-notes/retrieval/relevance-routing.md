name: relevance-routing

version: 2.0

type: universal-runtime-skill

domain: retrieval-architecture

purpose:
  Dynamically retrieve only context relevant to the active task.

compatible_agents:
  - Claude
  - GPT
  - Cursor
  - Windsurf
  - Gemini

triggers:
  - retrieval
  - context-selection
  - memory-routing
  - skill-loading

priority: critical

retrieval_strategy:
  mode: relevance-first
  expansion: incremental
  archive_access: explicit-only

constraints:
  - no-global-retrieval
  - no-full-repository-scans
  - no-unrestricted-memory-loading

anti_patterns:
  - broad-context-injection
  - irrelevant-memory-loading
  - recursive-retrieval
  - skill-overloading

best_practices:
  - relevance-scoring
  - retrieval-indexing
  - incremental-memory-expansion
  - skill-priority-routing

retrieval_tags:
  - retrieval
  - routing
  - relevance
  - indexing
  - memory
