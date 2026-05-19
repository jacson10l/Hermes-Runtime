# Project

## Name

Hermes Runtime

## Purpose

Hermes Runtime is a non-invasive project-memory skill pack for AI agents. It helps engineering sessions leave recoverable context about tasks, bugs, feature behavior, decisions, and verification.

## Primary Objectives

- Provide reusable project-memory guidance for AI-assisted software engineering.
- Keep memory creation explicit and scoped to the target project.
- Support stronger project modes where `hermes/` records are versioned and updated as part of completion.
- Make future AI sessions able to recover useful context quickly.

## Non-Goals

- Secretly create memory files without user approval in projects that have not initialized Hermes.
- Replace a project's existing documentation conventions unless the project explicitly chooses Hermes as the memory root.
- Treat chat history as a durable substitute for task records and verification notes.

## Core Concepts

| Concept | Description |
| --- | --- |
| Ticket | A task record under `hermes/tickets/` for meaningful requirements, investigations, reviews, refactors, deployments, and bugfixes. |
| Bug memory | A durable root-cause note under `hermes/memory/bugs/` when a bugfix produces reusable learning. |
| Feature memory | A durable behavior note under `hermes/memory/features/` when feature behavior should be recoverable later. |
| Decision memory | An ADR-style note under `hermes/memory/decisions/` for architecture or technical choices. |
| Current state | A concise project-status record under `hermes/memory/core/current-state.md`. |

## High-Level Flow

1. Read `hermes/retrieval/index.md`.
2. Load only relevant memory files for the current task.
3. Make scoped changes.
4. Update the task ticket and any applicable memory notes.
5. Verify code, checks, and documentation closure before claiming completion.

## Success Criteria

- Meaningful work leaves a recoverable ticket.
- Durable bugs, features, and decisions are captured in the right memory area.
- Verification results are recorded before completion.
- Cursor and Codex receive the same Hermes memory rule.

## AI Operating Rules

AI must:

- read Hermes retrieval and relevant memory before changing code
- keep changes scoped to the task
- update Hermes memory after meaningful work
- record verification results before claiming completion
- keep Hermes memory under `hermes/`, not under legacy `docs/`
