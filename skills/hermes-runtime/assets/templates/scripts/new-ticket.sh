#!/usr/bin/env bash
set -euo pipefail

title="${1:-}"

if [ -z "$title" ]; then
  echo "Usage: hermes/scripts/new-ticket.sh \"short title\""
  exit 1
fi

slug=$(printf "%s" "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//')
if [ -z "$slug" ]; then
  slug="ticket"
fi

timestamp=$(date +%F-%H%M)
base="hermes/tickets/${timestamp}-${slug}"
target="${base}.md"

if [ -e "$target" ]; then
  counter=2
  while [ -e "${base}-${counter}.md" ]; do
    counter=$((counter + 1))
  done
  target="${base}-${counter}.md"
fi

mkdir -p hermes/tickets
cp hermes/tickets/TEMPLATE.md "$target"
sed -i.bak "s/# Ticket: <title>/# Ticket: ${title}/" "$target"
rm -f "${target}.bak"

echo "$target"
