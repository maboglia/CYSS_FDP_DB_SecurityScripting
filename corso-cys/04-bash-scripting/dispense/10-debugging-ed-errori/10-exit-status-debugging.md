# 10 – Exit status, gestione degli errori e debugging

<text>Durata indicativa: 60 minuti · Livello: intermedio</text>

## Obiettivi di apprendimento
Interpretare il codice di uscita, gestire input e operazioni fallite, inviare diagnostica
su stderr, controllare la sintassi e tracciare l'esecuzione di uno script.

## 1. Exit status (10 minuti)
Ogni comando restituisce un codice numerico. Per convenzione `0` indica successo,
un valore diverso da zero indica una condizione di errore o un esito particolare.
`$?` contiene il codice dell'ultimo comando eseguito: va letto subito, perché il
comando successivo lo sostituisce.

```bash
cp origine.txt copia.txt
esito=$?
printf 'Codice: %s\\n' "$esito"
```

È spesso più chiaro verificare direttamente il comando:

```bash
if cp -- "$sorgente" "$destinazione"; then
    echo "Copia completata"
else
    echo "Copia fallita" >&2
fi
```

## 2. stdout e stderr per la diagnostica (10 minuti)
I messaggi ordinari vanno su stdout; errori e diagnostica su stderr:

```bash
printf 'Operazione completata\\n'
printf 'Errore: file non trovato\\n' >&2
```

Un messaggio su stderr resta separabile dall'output da elaborare o salvare.

## 3. Validazione e codici di uscita (10 minuti)
Controllare gli argomenti prima di usarli: numero corretto, file esistente, permessi
necessari, formato atteso. `exit 1` termina lo script segnalando un errore; `exit 0`
indica il completamento corretto. Documentare eventuali codici distinti.

## 4. Strumenti di debugging (15 minuti)
- `bash -n script.sh`: controlla la sintassi senza eseguire il programma;
- `bash -x script.sh`: mostra i comandi mentre vengono eseguiti;
- `set -x`: abilita il trace da un punto dello script;
- `set -u`: segnala espansioni di variabili non impostate;
- `set -o pipefail`: fa sì che una pipeline restituisca un errore se fallisce un comando al suo interno.

`set -e` può interrompere lo script in contesti non intuitivi (ad esempio condizioni,
liste di comandi e pipeline): non sostituisce controlli espliciti. Usarlo solo dopo
aver compreso il comportamento previsto.

## 5. Laboratorio (15 minuti)
- Eseguire `codice/10-debugging-ed-errori/16-controllo-errori-copia.sh` senza argomenti.
- Creare `origine.txt` e ripetere la copia.
- Controllare la sintassi con `bash -n`.
- Eseguire con `bash -x` e osservare le istruzioni.
- Provare un percorso di destinazione non scrivibile, se disponibile in un ambiente di test.

## Collegamento ai file di codice
- `codice/10-debugging-ed-errori/16-controllo-errori-copia.sh`
- `codice/10-debugging-ed-errori/17-debug-sintassi.sh`
- `codice/14-progetto-finale/23-progetto-report-log.sh`

## Verifica
Quando è utile `$?`? Perché si preferisce spesso `if comando; then`?
Qual è la differenza tra `bash -n` e `bash -x`? A cosa serve `pipefail`?
