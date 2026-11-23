# 16 – GNU `sed` e GNU `awk` per i log

**Durata indicativa:** 60 minuti  
**Obiettivo:** filtrare, trasformare, estrarre e riepilogare dati testuali senza modificare gli originali.

## Risultati di apprendimento
- usare `sed` per stampare, eliminare o sostituire testo;
- usare `awk` per lavorare con righe e campi;
- distinguere la trasformazione di testo dall'analisi strutturata;
- produrre un piccolo riepilogo da un log dimostrativo.

## 1. `sed`: editor di flussi
`sed` legge un flusso di testo e applica comandi. Per impostazione normale stampa il risultato su standard output; l'originale non viene modificato.

```bash
sed -n '1,5p' file.log        # stampa le prime cinque righe
sed '/INFO/d' file.log        # omette le righe INFO
sed 's/ERROR/ERRORE/g' file   # sostituisce tutte le occorrenze per riga
sed -E 's/[0-9]{3}\\.[0-9]{3}\\./X.X./g' file
```

Per modifiche persistenti è necessario usare consapevolmente l'opzione `-i`; in aula si preferisce scrivere su un nuovo file e confrontare i risultati.

## 2. `awk`: righe e campi
`awk` considera ogni riga un record e separa i campi. Per impostazione predefinita usa gli spazi e i tab come separatori.

```bash
awk '{ print $1 }' file
awk '{ print $1, $2, $3 }' file
awk '{ count++ } END { print count }' file
```

Variabili predefinite importanti:
- `$0`: record completo;
- `$1`, `$2`, ...: singoli campi;
- `NF`: numero di campi del record;
- `NR`: numero progressivo del record;
- `FS`: separatore dei campi in input;
- `OFS`: separatore in output.

## 3. Applicazione al dataset
Il file `codice/16-sed-e-awk/accessi-demo.log` usa campi separati da spazi:
`timestamp livello servizio utente esito ip`.

Eseguire:
```bash
bash codice/16-sed-e-awk/26-sed-filtra-log.sh
bash codice/16-sed-e-awk/27-awk-riepilogo-accessi.sh
```

Il riepilogo conta gli esiti `FAIL` per utente. Il formato del dataset è intenzionalmente semplice; i log reali possono avere campi quotati, spazi nei messaggi e formati differenti.

## 4. Esercizi
1. Con `sed`, mostrare solo le righe contenenti `FAIL`.
2. Con `awk`, stampare utente e IP delle righe `FAIL`.
3. Contare il numero complessivo di record.
4. Ordinare il report per numero di tentativi falliti.

## 5. Verifica
- Qual è la differenza tra `sed` e `awk`?
- Che cosa rappresentano `$0`, `$1`, `NF` e `NR`?
- Perché è preferibile non modificare direttamente il log originale?

## Nota operativa
I comandi sono dimostrativi e non sostituiscono un sistema SIEM. Prima di applicarli a log reali, verificare formato, codifica, delimitatori, timezone e autorizzazioni di accesso.
