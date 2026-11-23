#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

echo '--- Confronto di elenchi ordinati con process substitution ---'
if diff -u <(sort "$DIR/elenco-a.txt") <(sort "$DIR/elenco-b.txt"); then
  echo "Gli elenchi contengono gli stessi elementi."
else
  echo "Gli elenchi sono differenti."
fi
