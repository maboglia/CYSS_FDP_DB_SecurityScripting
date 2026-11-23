#!/usr/bin/env bash
# Crea il repository leggendo il manifesto testuale.
# Uso: ./crea_repo.sh [manifesto.txt] [directory-destinazione]
# FORCE=1 consente di sovrascrivere file esistenti.
set -euo pipefail

MANIFESTO="${1:-../manifest/struttura-modulo4.txt}"
DESTINAZIONE="${2:-.}"
NOME_PROGETTO="04-bash-scripting"
ROOT="$DESTINAZIONE/$NOME_PROGETTO"

if [[ ! -f "$MANIFESTO" ]]; then
    printf 'Manifesto non trovato: %s\n' "$MANIFESTO" >&2
    exit 1
fi

mkdir -p -- "$ROOT"

while IFS=$'\t' read -r tipo percorso contenuto || [[ -n "${tipo:-}" ]]; do
    [[ -z "${tipo:-}" || "$tipo" == \#* ]] && continue

    # Blocca percorsi assoluti e traversal.
    if [[ "$percorso" == /* || "$percorso" == .. || "$percorso" == ../* || "$percorso" == */../* || "$percorso" == */.. ]]; then
        printf 'Percorso non consentito: %s\n' "$percorso" >&2
        exit 1
    fi

    case "$tipo" in
        DIR)
            mkdir -p -- "$ROOT/$percorso"
            printf '[DIR]  %s\n' "$ROOT/$percorso"
            ;;
        FILE)
            [[ -n "${percorso:-}" ]] || { echo "Percorso file mancante" >&2; exit 1; }
            destinazione="$ROOT/$percorso"
            mkdir -p -- "$(dirname -- "$destinazione")"
            if [[ -e "$destinazione" && "${FORCE:-0}" != "1" ]]; then
                printf '[SKIP] File già esistente: %s\n' "$destinazione"
                continue
            fi
            # Interpreta le sequenze \n e \t del manifesto.
            printf '%b' "${contenuto:-}" > "$destinazione"
            if [[ "$destinazione" == *.sh ]]; then
                chmod +x "$destinazione"
            fi
            printf '[FILE] %s\n' "$destinazione"
            ;;
        *)
            printf 'Tipo di riga non riconosciuto: %s\n' "$tipo" >&2
            exit 1
            ;;
    esac
done < "$MANIFESTO"

printf 'Repository inizializzato in: %s\n' "$ROOT"
