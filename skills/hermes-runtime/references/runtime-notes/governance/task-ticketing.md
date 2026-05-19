# Task Ticketing

Use this skill whenever starting, resuming, or closing a Hermes task.

## Purpose

Tickets make task context recoverable across AI sessions.

## When to Create a Ticket

Create a ticket when:

- code may change
- behavior may change
- a bug is investigated
- a decision is made
- deployment or release work occurs

Use:

```bash
hermes/scripts/new-ticket.sh "short title"
```

If scripts are unavailable, copy `hermes/tickets/TEMPLATE.md`.

## Ticket Lifecycle

### Start

Fill:

- status
- context
- goal
- scope

### During Work

Record:

- important findings
- changed files
- behavior changes
- blockers

### Close

Record:

- verification commands
- verification results
- memory updates
- follow-ups

Set status to `done` only when documentation closure is complete.
