#!/usr/bin/env bash
# Individua candidati IPv4 con una regex volutamente semplice.
# Non verifica l'intervallo numerico 0..255 di ciascun ottetto.
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="${1:-$SCRIPT_DIR/log-demo.txt}"

if [[ ! -r "$LOG_FILE" ]]; then
  printf 'File non leggibile: %s\n' "$LOG_FILE" >&2
  exit 1
fi

grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' "$LOG_FILE" | sort -u || true
