#!/usr/bin/env bash
# Mostra le righe con livello ERROR o WARN.
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="${1:-$SCRIPT_DIR/log-demo.txt}"

if [[ ! -r "$LOG_FILE" ]]; then
  printf 'File non leggibile: %s\n' "$LOG_FILE" >&2
  exit 1
fi

printf '%s\n' '--- Eventi ERROR e WARN ---'
grep -En ' (ERROR|WARN) ' "$LOG_FILE" || true
printf '\nTotale eventi ERROR/WARN: '
grep -Ec ' (ERROR|WARN) ' "$LOG_FILE" || true
