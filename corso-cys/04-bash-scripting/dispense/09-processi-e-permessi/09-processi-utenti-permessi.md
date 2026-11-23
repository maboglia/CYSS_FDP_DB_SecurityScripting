# 09 – Processi, utenti e permessi

<text>Durata indicativa: 60 minuti · Livello: intermedio</text>

## Obiettivi di apprendimento
Leggere i permessi Unix, verificare le autorizzazioni effettive, riconoscere PID e
processi, usare strumenti di osservazione e comprendere l'invio di segnali in sicurezza.

## 1. Utenti e permessi (15 minuti)
I permessi di un file sono organizzati per proprietario, gruppo e altri. Le tre
autorizzazioni fondamentali sono:
- `r` (read): lettura;
- `w` (write): scrittura;
- `x` (execute): esecuzione per file; attraversamento per directory.

`ls -l` mostra una rappresentazione simbolica. Ad esempio `-rwxr-x---` indica un file
regolare, lettura/scrittura/esecuzione per il proprietario, lettura/esecuzione per il
gruppo e nessun permesso per gli altri.

`chmod u+x script.sh` aggiunge l'esecuzione al proprietario. La forma numerica usa
valori 4 (r), 2 (w), 1 (x): `750` corrisponde a `rwxr-x---`.

## 2. Verificare i permessi (10 minuti)
In uno script si possono usare test come `-r`, `-w`, `-x`. Il risultato dipende
dall'utente che esegue il controllo e dalle regole del sistema. Per una directory,
`x` significa poter attraversare la directory, non "eseguire" un programma.

## 3. Processi e identificatori (10 minuti)
Un processo è un programma in esecuzione. Ogni processo ha un PID; PPID identifica
il processo padre. `ps` mostra processi e informazioni; `top` offre una vista
dinamica; `pgrep` ricerca processi per nome. `$$` è il PID della shell corrente,
`$PPID` quello del processo padre.

## 4. Segnali e terminazione (10 minuti)
`kill PID` invia normalmente SIGTERM, che chiede al processo di terminare. SIGKILL
(`kill -9 PID`) forza la terminazione e non permette al processo di gestire una
chiusura ordinata. Non terminare processi sconosciuti o di sistema: identificare
prima PID, comando e proprietario.

## 5. Laboratorio (15 minuti)
- Eseguire `codice/09-processi-e-permessi/14-informazioni-processi.sh`.
- Eseguire `codice/09-processi-e-permessi/15-verifica-permessi.sh` su un file e su una directory.
- Creare uno script di prova e confrontare `ls -l` prima e dopo `chmod u+x`.
- Osservare i propri processi con `ps -u "$USER" -o pid,comm`.

## Collegamento ai file di codice
- `codice/09-processi-e-permessi/14-informazioni-processi.sh`
- `codice/09-processi-e-permessi/15-verifica-permessi.sh`
- `codice/01-ambiente-e-shell/01-primo-script.sh` – permessi di esecuzione.

## Verifica
Che differenza c'è tra permesso `x` su file e su directory? Che cos'è un PID?
Perché SIGTERM è normalmente preferibile a SIGKILL?
