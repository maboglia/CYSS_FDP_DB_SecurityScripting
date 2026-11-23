#!/usr/bin/env bash
set -euo pipefail

verbose=0
file=""

while (( $# > 0 )); do
  case "$1" in
    --verbose)
      verbose=1
      shift
      ;;
    --file)
      if (( $# < 2 )); then
        echo "Errore: --file richiede un valore" >&2
        exit 2
      fi
      file="$2"
      shift 2
      ;;
    --help)
      echo "Uso: $0 [--verbose] [--file PERCORSO] [--help]"
      exit 0
      ;;
    *)
      echo "Opzione sconosciuta: $1" >&2
      exit 2
      ;;
  esac
done

(( verbose )) && echo "Modalità dettagliata attiva"
printf 'File indicato: %s\n' "${file:-nessuno}"
