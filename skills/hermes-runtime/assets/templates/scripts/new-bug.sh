#!/usr/bin/env bash
set -euo pipefail

title="${1:-}"

if [ -z "$title" ]; then
  echo "Usage: hermes/scripts/new-bug.sh \"short title\""
  exit 1
fi

mkdir -p hermes/memory/bugs

next=$(find hermes/memory/bugs -maxdepth 1 -name 'BUG-[0-9][0-9][0-9]-*.md' 2>/dev/null \
  | sed -E 's/.*BUG-([0-9]{3})-.*/\1/' \
  | sort -n \
  | tail -1)

if [ -z "$next" ]; then
  number="001"
else
  number=$(printf "%03d" "$((10#$next + 1))")
fi

slug=$(printf "%s" "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//')
target="hermes/memory/bugs/BUG-${number}-${slug}.md"

cp hermes/memory/bugs/TEMPLATE.md "$target"
sed -i.bak "s/# BUG-XXX: <title>/# BUG-${number}: ${title}/" "$target"
rm -f "${target}.bak"

echo "$target"
