#!/usr/bin/env bash
set -euo pipefail

title="${1:-}"

if [ -z "$title" ]; then
  echo "Usage: hermes/scripts/new-ticket.sh \"short title\""
  exit 1
fi

slug=$(printf "%s" "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//')
date=$(date +%F)
target="hermes/tickets/${date}-${slug}.md"

if [ -e "$target" ]; then
  echo "Ticket already exists: $target"
  exit 1
fi

mkdir -p hermes/tickets
cp hermes/tickets/TEMPLATE.md "$target"
sed -i.bak "s/# Ticket: <title>/# Ticket: ${title}/" "$target"
rm -f "${target}.bak"

echo "$target"
