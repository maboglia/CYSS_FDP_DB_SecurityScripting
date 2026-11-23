#!/usr/bin/env bash
set -euo pipefail

tmpfile="$(mktemp "${TMPDIR:-/tmp}/bash-trap-demo.XXXXXX")"
cleanup() {
  if [[ -n "${tmpfile:-}" && -e "$tmpfile" ]]; then
    rm -f -- "$tmpfile"
    echo "Pulizia completata: file temporaneo rimosso."
  fi
}
on_int() {
  echo "Ricevuto SIGINT: termino in modo controllato."
  exit 130
}
on_term() {
  echo "Ricevuto SIGTERM: termino in modo controllato."
  exit 143
}

trap cleanup EXIT
trap on_int INT
trap on_term TERM

printf 'PID dello script: %s\n' "$$"
printf 'File temporaneo: %s\n' "$tmpfile"
echo "Premi Ctrl+C oppure invia SIGTERM da un altro terminale."
while :; do
  sleep 1
done
