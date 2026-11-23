#!/usr/bin/env bash
set -euo pipefail

PS3="Seleziona un'operazione: "
select scelta in "Data e ora" "Identità corrente" "Directory corrente" "Esci"; do
  case "$REPLY" in
    1) date ;;
    2) id ;;
    3) pwd ;;
    4) echo "Chiusura menu."; break ;;
    *) echo "Scelta non valida: $REPLY" ;;
  esac
done
