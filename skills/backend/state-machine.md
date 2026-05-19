name: backend-state-machine

version: 2.0

domain: backend

description:
  Event-driven backend state machine architecture skill.

triggers:
  - state machine
  - lifecycle
  - backend state
  - transitions

dependencies:
  - architecture/event-driven

token_budget: 250

inject:
  - lifecycle-pattern
  - transition-guards
  - event-routing

constraints:
  - explicit-state-definitions
  - immutable-transitions
  - event-driven-updates

anti_patterns:
  - implicit-state-mutations
  - hidden-transitions
  - shared-mutable-state

best_practices:
  - finite-state-machines
  - centralized-state-control
  - transition-logging
  - event-driven-lifecycle

retrieval_tags:
  - backend
  - state-machine
  - lifecycle
  - transitions
