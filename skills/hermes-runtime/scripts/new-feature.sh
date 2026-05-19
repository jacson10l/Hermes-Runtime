#!/usr/bin/env bash
set -euo pipefail

title="${1:-}"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
template_root="$(cd "${script_dir}/../assets/templates" && pwd)"

if [ -z "$title" ]; then
  echo "Usage: hermes/scripts/new-feature.sh \"feature name\""
  exit 1
fi

slug=$(printf "%s" "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//')
target="hermes/memory/features/${slug}.md"

if [ -e "$target" ]; then
  echo "Feature doc already exists: $target"
  exit 1
fi

mkdir -p hermes/memory/features
cp "${template_root}/memory/features/TEMPLATE.md" "$target"
sed -i.bak "s/# Feature: <name>/# Feature: ${title}/" "$target"
rm -f "${target}.bak"

echo "$target"
