#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
tmp_root="$(mktemp -d)"
trap 'rm -rf "$tmp_root"' EXIT

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

assert_exists() {
  [ -e "$1" ] || fail "expected path to exist: $1"
}

assert_not_exists() {
  [ ! -e "$1" ] || fail "expected path to be removed: $1"
}

assert_contains() {
  local file="$1"
  local text="$2"
  grep -Fq "$text" "$file" || fail "expected $file to contain: $text"
}

test_ticket_names_are_collision_resistant() {
  local project="$tmp_root/tickets"
  mkdir -p "$project"
  local log="$tmp_root/new-ticket.log"
  if ! (
    cd "$project"
    "$repo_root/skills/hermes-runtime/scripts/new-ticket.sh" "Collision Prone Task" >"$tmp_root/hermes-ticket-one.txt"
    "$repo_root/skills/hermes-runtime/scripts/new-ticket.sh" "Collision Prone Task" >"$tmp_root/hermes-ticket-two.txt"
  ) >"$log" 2>&1; then
    cat "$log" >&2
    fail "new-ticket.sh should create unique files for repeated titles"
  fi

  local first
  local second
  first="$(cat "$tmp_root/hermes-ticket-one.txt")"
  second="$(cat "$tmp_root/hermes-ticket-two.txt")"

  [ "$first" != "$second" ] || fail "expected repeated ticket titles to produce unique paths"
  [[ "$first" =~ ^hermes/tickets/[0-9]{4}-[0-9]{2}-[0-9]{2}-[0-9]{4}-collision-prone-task\.md$ ]] \
    || fail "expected first ticket to include date and HHMM timestamp, got: $first"
  assert_exists "$project/$first"
  assert_exists "$project/$second"
}

test_project_bootstrap_installs_and_uninstalls_managed_files() {
  local project="$tmp_root/bootstrap"
  mkdir -p "$project"
  local install_log="$tmp_root/install.log"
  if ! (
    cd "$project"
    "$repo_root/skills/hermes-runtime/scripts/hermes-project.sh" install --agents codex,claude,cursor --init-memory --project-name "Demo Project"
  ) >"$install_log" 2>&1; then
    cat "$install_log" >&2
    fail "hermes-project.sh install should create managed project files"
  fi

  assert_exists "$project/AGENTS.md"
  assert_exists "$project/CLAUDE.md"
  assert_exists "$project/.cursor/rules/hermes-memory.mdc"
  assert_exists "$project/hermes/retrieval/index.md"
  assert_exists "$project/hermes/memory/core/project.md"
  assert_exists "$project/hermes/.hermes-runtime-manifest"
  assert_contains "$project/AGENTS.md" "BEGIN HERMES RUNTIME MANAGED BLOCK"
  assert_contains "$project/CLAUDE.md" "BEGIN HERMES RUNTIME MANAGED BLOCK"
  assert_contains "$project/.cursor/rules/hermes-memory.mdc" "BEGIN HERMES RUNTIME MANAGED BLOCK"
  assert_contains "$project/hermes/memory/core/project.md" "Demo Project"

  local installed_ticket_log="$tmp_root/installed-new-ticket.log"
  if ! (
    cd "$project"
    hermes/scripts/new-ticket.sh "Bootstrap Ticket" >"$tmp_root/bootstrap-ticket-one.txt"
    hermes/scripts/new-ticket.sh "Bootstrap Ticket" >"$tmp_root/bootstrap-ticket-two.txt"
  ) >"$installed_ticket_log" 2>&1; then
    cat "$installed_ticket_log" >&2
    fail "installed new-ticket.sh should create unique files for repeated titles"
  fi
  [ "$(cat "$tmp_root/bootstrap-ticket-one.txt")" != "$(cat "$tmp_root/bootstrap-ticket-two.txt")" ] \
    || fail "expected installed new-ticket.sh to produce unique paths"

  local uninstall_log="$tmp_root/uninstall.log"
  if ! (
    cd "$project"
    "$repo_root/skills/hermes-runtime/scripts/hermes-project.sh" uninstall --agents codex,claude,cursor --remove-memory
  ) >"$uninstall_log" 2>&1; then
    cat "$uninstall_log" >&2
    fail "hermes-project.sh uninstall should remove managed project files"
  fi

  assert_not_exists "$project/AGENTS.md"
  assert_not_exists "$project/CLAUDE.md"
  assert_not_exists "$project/.cursor/rules/hermes-memory.mdc"
  assert_not_exists "$project/hermes"
}

test_project_bootstrap_preserves_existing_agent_files() {
  local project="$tmp_root/existing-agent"
  mkdir -p "$project"
  printf 'Existing project instructions\n' >"$project/AGENTS.md"

  (
    cd "$project"
    "$repo_root/skills/hermes-runtime/scripts/hermes-project.sh" install --agents codex
  ) >/dev/null

  assert_contains "$project/AGENTS.md" "Existing project instructions"
  assert_contains "$project/AGENTS.md" "BEGIN HERMES RUNTIME MANAGED BLOCK"

  (
    cd "$project"
    "$repo_root/skills/hermes-runtime/scripts/hermes-project.sh" uninstall --agents codex
  ) >/dev/null

  assert_exists "$project/AGENTS.md"
  assert_contains "$project/AGENTS.md" "Existing project instructions"
  if grep -Fq "BEGIN HERMES RUNTIME MANAGED BLOCK" "$project/AGENTS.md"; then
    fail "expected uninstall to remove the Hermes managed block from existing AGENTS.md"
  fi
}

test_ticket_names_are_collision_resistant
test_project_bootstrap_installs_and_uninstalls_managed_files
test_project_bootstrap_preserves_existing_agent_files

echo "Hermes script tests passed."
