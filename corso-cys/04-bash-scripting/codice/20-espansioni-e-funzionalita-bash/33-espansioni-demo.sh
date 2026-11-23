#!/usr/bin/env bash
set -euo pipefail

echo '--- Brace expansion: genera stringhe, non file ---'
printf '%s\n' log-{01..05}.txt

echo
echo '--- Tilde expansion ---'
printf 'Home: %s\n' ~

echo
echo '--- Command substitution ---'
oggi="$(date +%F)"
kernel="$(uname -s)"
printf 'Data: %s\nSistema: %s\n' "$oggi" "$kernel"
