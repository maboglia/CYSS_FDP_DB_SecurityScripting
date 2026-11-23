# 12 – Bash per la cybersecurity: analisi di log e controlli difensivi

<text>Durata indicativa: 60 minuti · Livello: intermedio · Attività su dati autorizzati</text>

## Obiettivi di apprendimento
Usare strumenti Bash per cercare e contare eventi in file di log didattici, verificare
permessi, produrre un riepilogo e riconoscere i limiti di un'analisi basata su testo.

## 1. Perché Bash in cybersecurity (5 minuti)
Bash consente di concatenare strumenti già disponibili sul sistema per svolgere controlli
ripetibili. È utile per triage iniziale, raccolta di evidenze testuali e automazioni
difensive. Non sostituisce strumenti SIEM, sistemi di monitoraggio o analisi forense.

## 2. Leggere e filtrare log (15 minuti)
Un log registra eventi con informazioni come data/ora, componente, livello e messaggio.
I formati variano. In un log didattico si possono cercare parole chiave:

```bash
grep -n 'ERROR' log-laboratorio.txt
grep -i -n 'failed' log-laboratorio.txt
grep -c 'WARNING' log-laboratorio.txt
```

`-n` mostra il numero di riga; `-i` ignora maiuscole/minuscole; `-c` conta le righe
corrispondenti. Il conteggio misura righe, non necessariamente eventi distinti se una
riga contiene più occorrenze.

## 3. Riepilogo dei livelli (10 minuti)
Un ciclo può applicare la stessa ricerca a più livelli (`INFO`, `WARNING`, `ERROR`).
Il risultato può essere scritto in un report. Se `grep` non trova corrispondenze,
restituisce un codice diverso da zero: in un conteggio questo caso va gestito come
risultato pari a zero, non necessariamente come errore operativo.

## 4. Controllo dei permessi (10 minuti)
Un controllo sui permessi può evidenziare file leggibili da gruppo o altri. È un
indicatore da approfondire, non una prova automatica di vulnerabilità: occorre
considerare tipo di dato, proprietario, gruppi, contesto e policy. Il laboratorio
opera esclusivamente su una directory di test.

## 5. Limiti, integrità e autorizzazione (10 minuti)
- Usare log sintetici o dataset autorizzati.
- Non modificare l'originale; lavorare su copie quando necessario.
- Proteggere i log: possono contenere dati personali, indirizzi e identificativi.
- Una parola chiave può produrre falsi positivi e falsi negativi.
- Un evento sospetto richiede correlazione con altre evidenze.
- Non eseguire controlli su sistemi di terzi senza autorizzazione.

## 6. Laboratorio (10 minuti)
- Analizzare `codice/12-bash-per-cybersecurity/log-laboratorio.txt`.
- Eseguire `codice/12-bash-per-cybersecurity/20-conta-eventi-log.sh`.
- Modificare una copia del log e aggiungere un evento.
- Eseguire `codice/12-bash-per-cybersecurity/21-controllo-file-sensibili-demo.sh` su una directory di prova.
- Annotare quali conclusioni si possono trarre e quali no.

## Collegamento ai file di codice
- `codice/12-bash-per-cybersecurity/20-conta-eventi-log.sh` – conteggio livelli log.
- `codice/12-bash-per-cybersecurity/21-controllo-file-sensibili-demo.sh` – controllo permessi.
- `codice/12-bash-per-cybersecurity/log-laboratorio.txt` – dataset didattico.
- `codice/14-progetto-finale/23-progetto-report-log.sh` – report finale.

## Verifica
Che cosa conta `grep -c`? Perché una riga trovata non dimostra un incidente?
Quali cautele servono quando si trattano log reali?
