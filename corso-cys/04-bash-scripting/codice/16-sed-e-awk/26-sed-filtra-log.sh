#!/usr/bin/env bash
# Filtra il dataset senza alterare il file sorgente.
set -euo pipefail
DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE="${1:-$DIR/accessi-demo.log}"
[[ -r "$FILE" ]] || { echo "File non leggibile: $FILE" >&2; exit 1; }

echo '--- Righe con esito FAIL (sed) ---'
sed -n '/ FAIL /p' "$FILE"
echo
echo '--- Livello ERROR sostituito in output (sed) ---'
sed 's/ ERROR / CRITICAL /' "$FILE"
