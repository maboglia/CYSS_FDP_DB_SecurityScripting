#!/usr/bin/env bash
set -euo pipefail

printf 'Script: %s\n' "$0"
printf 'Numero argomenti: %s\n' "$#"
if (( $# == 0 )); then
  echo 'Uso: bash 29-parametri-speciali.sh argomento1 [argomento2 ...]' >&2
  exit 2
fi

indice=1
for argomento in "$@"; do
  printf 'Argomento %d: <%s>\n' "$indice" "$argomento"
  ((indice+=1))
done
