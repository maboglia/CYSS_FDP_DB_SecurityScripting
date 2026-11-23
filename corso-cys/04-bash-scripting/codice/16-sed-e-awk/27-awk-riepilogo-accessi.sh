#!/usr/bin/env bash
# Conta i tentativi falliti per utente usando awk.
set -euo pipefail
DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE="${1:-$DIR/accessi-demo.log}"
[[ -r "$FILE" ]] || { echo "File non leggibile: $FILE" >&2; exit 1; }

awk '
  $5 == "FAIL" { failed[$4]++ }
  END {
    print "Tentativi falliti per utente:"
    for (user in failed) printf "%-12s %d\n", user, failed[user]
  }
' "$FILE"
