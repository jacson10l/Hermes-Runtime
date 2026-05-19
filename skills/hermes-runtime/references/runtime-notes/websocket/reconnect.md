name: websocket-reconnect

version: 2.0

domain: websocket

description:
  Production-safe websocket reconnect runtime skill.

triggers:
  - websocket
  - reconnect
  - ws
  - disconnect
  - heartbeat

dependencies:
  - backend/state-machine
  - backend/event-system

token_budget: 300

inject:
  - reconnect-strategy
  - heartbeat-pattern
  - state-machine

constraints:
  - single-websocket-owner
  - exponential-backoff
  - retry-limit
  - explicit-state-transitions

anti_patterns:
  - duplicate websocket instances
  - nested reconnect loops
  - uncontrolled retries
  - silent disconnect handling

best_practices:
  - unified websocket manager
  - heartbeat monitoring
  - explicit lifecycle states
  - connection ownership isolation
  - reconnect cooldown windows

retrieval_tags:
  - websocket
  - reconnect
  - state-machine
  - realtime
  - subscriptions

failure_modes:
  - reconnect race condition
  - duplicate subscriptions
  - heartbeat desync
  - reconnect storm

recommended_patterns:
  - finite-state-machine
  - centralized event bus
  - subscription replay
  - connection ownership tracking
