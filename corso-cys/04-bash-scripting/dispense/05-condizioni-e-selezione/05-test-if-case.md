# 05 – Condizioni, test, if e case

<text>Durata indicativa: 60 minuti · Livello: base</text>

## Obiettivi di apprendimento
Scrivere condizioni, verificare file e directory, confrontare stringhe e numeri,
combinare condizioni logiche, scegliere tra più alternative con `case`.

## 1. Perché servono le condizioni (5 minuti)
Uno script lineare esegue le istruzioni in sequenza. Le condizioni consentono di
scegliere un percorso in base a un dato: esistenza di un file, valore inserito,
numero di argomenti o risultato di un controllo.

## 2. Struttura if (15 minuti)
La forma generale è:

```bash
if condizione; then
    comandi
elif altra_condizione; then
    altri_comandi
else
    comandi_alternativi
fi
```

In Bash è comune usare `[[ ... ]]` per i test:

```bash
if [[ -f "$percorso" ]]; then
    printf 'File presente\\n'
elif [[ -d "$percorso" ]]; then
    printf 'Directory presente\\n'
else
    printf 'Percorso non trovato\\n'
fi
```

## 3. Test su file, stringhe e numeri (15 minuti)
Test frequenti:
- `-e`: il percorso esiste;
- `-f`: è un file regolare;
- `-d`: è una directory;
- `-r`, `-w`, `-x`: lettura, scrittura, esecuzione/attraversamento;
- `-z`: stringa vuota; `-n`: stringa non vuota.

Per stringhe usare `==` e `!=` dentro `[[ ... ]]`. Per interi si possono usare
`-eq`, `-ne`, `-lt`, `-le`, `-gt`, `-ge` oppure `(( ... ))`:

```bash
if (( numero % 2 == 0 )); then
    echo "pari"
fi
```

Prima di eseguire un calcolo, validare che l'input abbia il formato previsto.

## 4. Operatori logici (10 minuti)
`&&` significa AND, `||` significa OR, `!` nega una condizione. Dentro `[[ ... ]]`
si possono usare anche `&&` e `||`. Le parentesi aiutano a rendere chiara la precedenza.

Esempio: un file deve esistere **e** essere leggibile:

```bash
if [[ -f "$file" && -r "$file" ]]; then
    echo "File pronto"
fi
```

## 5. Selezione con case (5 minuti)
`case` è adatto a menu e insiemi di valori:

```bash
case "$scelta" in
    1) echo "Elenco" ;;
    2) echo "Ricerca" ;;
    *) echo "Scelta non valida" ;;
esac
```

Ogni ramo termina normalmente con `;;`; `*)` rappresenta il caso predefinito.

## 6. Laboratorio (10 minuti)
- Eseguire `codice/05-condizioni-e-selezione/06-pari-dispari.sh`.
- Provare un intero positivo, uno negativo, zero e un valore non numerico.
- Eseguire `codice/05-condizioni-e-selezione/07-menu-case.sh`.
- Aggiungere una nuova scelta oppure un giorno non lavorativo.

## Collegamento ai file di codice
- `codice/05-condizioni-e-selezione/06-pari-dispari.sh` – input e validazione numerica.
- `codice/05-condizioni-e-selezione/07-menu-case.sh` – selezione multipla con `case`.
- `codice/09-processi-e-permessi/15-verifica-permessi.sh` – test sui permessi.

## Verifica
Qual è la differenza tra `-f` e `-d`? Come si verifica una stringa vuota?
Quando è preferibile `case` a una catena di `if`? Perché validare l'input?
