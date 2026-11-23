#!/usr/bin/env bash
set -euo pipefail

readonly CORSO="CYS"
utenti=("anna" "marco rossi" "lucia")

printf 'Corso: %s\n' "$CORSO"
printf 'Numero utenti: %d\n' "${#utenti[@]}"
for utente in "${utenti[@]}"; do
  printf -- '- %s\n' "$utente"
done

utenti+=("nuovo_utente")
printf 'Dopo inserimento: %s elementi\n' "${#utenti[@]}"
