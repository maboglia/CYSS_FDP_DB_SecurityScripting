# 18 – Script interattivi avanzati: `select`, `shift` e argomenti

**Durata indicativa:** 60 minuti  
**Obiettivo:** costruire interfacce testuali semplici e gestire argomenti posizionali.

## 1. `select`: menu testuali
`select` presenta un elenco numerato e assegna la scelta alla variabile indicata. La scelta viene letta da standard input.

```bash
select voce in "Mostra data" "Mostra utente" "Esci"; do
  case "$REPLY" in
    1) date ;;
    2) id ;;
    3) break ;;
    *) echo "Scelta non valida" ;;
  esac
done
```

`REPLY` contiene la scelta digitata; la variabile `voce` contiene l'elemento selezionato quando la scelta è valida.

## 2. `shift`: scorrere gli argomenti
`shift` elimina il primo parametro posizionale e fa avanzare gli altri. È utile per analizzare opzioni in modo sequenziale.

```bash
while (( $# > 0 )); do
  case "$1" in
    --verbose) verbose=1 ;;
    --file)    file="$2"; shift ;;
    *)         echo "Opzione sconosciuta: $1" >&2; exit 2 ;;
  esac
  shift
done
```

Prima di usare `$2` occorre controllare che esista: l'esempio didattico completo lo fa esplicitamente.

## 3. Laboratorio
Eseguire:
```bash
bash codice/18-script-interattivi-avanzati/30-menu-select.sh
bash codice/18-script-interattivi-avanzati/31-parse-opzioni-shift.sh --verbose --file report.txt
```

## 4. Esercizi
1. Aggiungere una voce al menu.
2. Gestire una scelta non valida.
3. Aggiungere l'opzione `--help`.
4. Gestire `--file` senza valore e mostrare un messaggio d'uso.

## Verifica
- Che cosa contiene `REPLY`?
- Qual è l'effetto di `shift`?
- Perché occorre verificare il numero di argomenti prima di leggere `$2`?

## Nota
Gli script interattivi sono adatti a strumenti amministrativi locali. Per automazioni non presidiate è preferibile usare opzioni esplicite e input controllati, evitando di dipendere da risposte manuali.
