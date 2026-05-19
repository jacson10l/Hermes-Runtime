#!/usr/bin/env bash
set -euo pipefail

scope="${1:---cached}"

code_changed=$(git diff "$scope" --name-only | grep -Ev '^(hermes/|docs/|README\.md$|LICENSE$)' || true)
doc_changed=$(git diff "$scope" --name-only | grep -E '^(hermes/memory|hermes/tickets|hermes/runtime)' || true)

if [ -n "$code_changed" ] && [ -z "$doc_changed" ]; then
  echo "Hermes check failed: code changed but Hermes memory/tickets were not updated."
  echo
  echo "Changed code files:"
  echo "$code_changed"
  echo
  echo "Update hermes/memory or hermes/tickets before completing this task."
  exit 1
fi

echo "Hermes doc sync check passed."
