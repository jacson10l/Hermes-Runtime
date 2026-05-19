#!/usr/bin/env bash
set -euo pipefail

title="${1:-}"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
template_root="$(cd "${script_dir}/../assets/templates" && pwd)"

if [ -z "$title" ]; then
  echo "Usage: hermes/scripts/new-adr.sh \"short title\""
  exit 1
fi

mkdir -p hermes/memory/decisions

next=$(find hermes/memory/decisions -maxdepth 1 -name 'ADR-[0-9][0-9][0-9]-*.md' 2>/dev/null \
  | sed -E 's/.*ADR-([0-9]{3})-.*/\1/' \
  | sort -n \
  | tail -1)

if [ -z "$next" ]; then
  number="001"
else
  number=$(printf "%03d" "$((10#$next + 1))")
fi

slug=$(printf "%s" "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//')
target="hermes/memory/decisions/ADR-${number}-${slug}.md"

cp "${template_root}/memory/decisions/ADR-TEMPLATE.md" "$target"
sed -i.bak "s/# ADR-XXX: <title>/# ADR-${number}: ${title}/" "$target"
sed -i.bak "s/YYYY-MM-DD/$(date +%F)/" "$target"
rm -f "${target}.bak"

echo "$target"
