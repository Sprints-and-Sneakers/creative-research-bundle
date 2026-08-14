#!/usr/bin/env bash
# Rebuilds the per-skill zip files in dist/.
#
# claude.ai requires each uploaded zip to contain exactly one skill folder as its
# single top-level entry, so every skill gets its own zip. Run this after editing
# any skill, then commit the updated dist/ folder.

set -euo pipefail
cd "$(dirname "$0")"

rm -rf dist
mkdir -p dist

for dir in skills/*/; do
  name=$(basename "$dir")
  (cd skills && zip -q -r "../dist/${name}.zip" "$name" -x '.*' -x '__MACOSX/*')
  echo "built dist/${name}.zip"
done

echo
echo "Done. $(ls dist | wc -l | tr -d ' ') zips in dist/"
