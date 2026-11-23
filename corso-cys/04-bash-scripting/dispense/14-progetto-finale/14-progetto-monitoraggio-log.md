# 14 – Progetto finale: monitoraggio e report di un file di log

<text>Durata indicativa: 60 minuti di progettazione e prima implementazione, estendibile come lavoro autonomo</text>

## Scenario
Un tecnico deve produrre un riepilogo di un file di log applicativo. Il progetto
realizza uno script Bash che riceve il percorso del file, verifica l'input, conta
alcuni livelli di evento e genera un report datato. L'attività è didattica e usa
esclusivamente file di prova.

## Obiettivi
- integrare argomenti, variabili, condizioni e cicli;
- usare `grep` e redirezioni;
- controllare errori e codici di uscita;
- produrre un report leggibile;
- documentare limiti e assunzioni.

## Requisiti funzionali
1. Ricevere il percorso del log come primo argomento.
2. Se manca l'argomento, mostrare la sintassi d'uso su stderr e terminare con codice non zero.
3. Verificare che il percorso sia un file regolare e leggibile.
4. Contare le righe contenenti `INFO`, `WARNING` ed `ERROR`.
5. Creare un report con data/ora, nome del file e conteggi.
6. Comunicare dove è stato salvato il report.

## Progettazione (10 minuti)
Individuare input, output, controlli e possibili errori:
- input assente;
- file inesistente;
- file non leggibile;
- file vuoto;
- livello non presente;
- errore durante la scrittura del report.

Definire il comportamento atteso prima di codificare.

## Implementazione guidata (25 minuti)
Aprire `codice/14-progetto-finale/23-progetto-report-log.sh`.
Analizzare in ordine:
1. controllo dell'argomento;
2. controllo del file;
3. costruzione del nome report con `date`;
4. redirezione del blocco di output;
5. conteggio dei livelli con `grep -c`;
6. messaggio conclusivo.

Eseguire:

```bash
bash codice/14-progetto-finale/23-progetto-report-log.sh \
  codice/12-bash-per-cybersecurity/log-laboratorio.txt
```

## Test e verifica (15 minuti)
Provare:
- senza argomenti;
- con un percorso inesistente;
- con il log fornito;
- con un file vuoto;
- con un file privo di uno dei livelli.

Controllare report, contenuto e codice di uscita. Non assumere che un conteggio zero
indichi un errore: può significare semplicemente che non ci sono righe corrispondenti.

## Estensioni (10 minuti o lavoro autonomo)
- estrarre una parola chiave opzionale;
- aggiungere una funzione per validazione e una per conteggio;
- scrivere la diagnostica su stderr;
- accettare una directory di destinazione per il report;
- aggiungere il numero totale di righe;
- registrare la versione dello script.

## Collegamento ai file di codice
- `codice/14-progetto-finale/23-progetto-report-log.sh` – implementazione di riferimento.
- `codice/12-bash-per-cybersecurity/log-laboratorio.txt` – dati di input.
- `codice/12-bash-per-cybersecurity/20-conta-eventi-log.sh` – esercizio propedeutico.

## Criteri di valutazione
Correttezza dei conteggi; controlli sugli input; chiarezza dell'output; gestione degli
errori; uso corretto delle virgolette; riproducibilità dei test; spiegazione dei limiti.
