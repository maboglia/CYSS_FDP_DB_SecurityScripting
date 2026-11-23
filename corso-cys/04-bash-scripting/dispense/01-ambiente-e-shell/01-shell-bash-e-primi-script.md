# 01 – Ambiente, shell Bash e primi script

<text>Durata indicativa: 60 minuti · Livello: introduttivo</text>

## Obiettivi di apprendimento
Al termine della lezione lo studente sa distinguere terminale, shell e Bash; riconosce
la struttura di uno script; verifica l'interprete disponibile; crea, rende eseguibile
e avvia un semplice file `.sh`; distingue un percorso assoluto da uno relativo.

## Prerequisiti e ambiente
È richiesta familiarità di base con file, directory e terminale. Gli esempi sono pensati
per Linux con Bash. Su Windows si può utilizzare WSL oppure una macchina Linux predisposta.
Verificare prima dell'attività:

```bash
bash --version
command -v bash
pwd
```

## 1. Terminale, shell e interprete (10 minuti)
Il **terminale** è il programma che offre una finestra testuale; la **shell** è il
programma che legge e interpreta i comandi. Bash (Bourne Again SHell) è una shell
diffusa nei sistemi GNU/Linux. La shell interattiva esegue i comandi digitati; uno
script Bash raccoglie più comandi in un file che può essere riutilizzato.

Un comando può essere un programma esterno (`ls`, `grep`) oppure una funzionalità
integrata nella shell (`cd`, `read`, `export`). Per riconoscere un comando:

```bash
type cd
type grep
command -v bash
```

## 2. Anatomia di uno script (15 minuti)
Uno script è un file di testo. La prima riga, detta **shebang**, indica quale interprete
utilizzare quando il file viene avviato direttamente:

```bash
#!/usr/bin/env bash
# Commento: le righe che iniziano con # non vengono eseguite
printf 'Benvenuto nel laboratorio Bash!\\n'
```

`#!/usr/bin/env bash` cerca Bash attraverso `PATH`. Le righe successive contengono
istruzioni; i commenti spiegano intenzione e comportamento. Preferire `printf` per
un output formattato e prevedibile.

## 3. Creazione ed esecuzione (15 minuti)
Salvare il codice in `primo_script.sh`. Poi:

```bash
chmod +x primo_script.sh
./primo_script.sh
```

In alternativa:

```bash
bash primo_script.sh
```

Nel primo caso il file deve avere il permesso di esecuzione e una shebang valida.
Nel secondo caso si invoca Bash esplicitamente: non è necessario il bit eseguibile.
Se compare `Permission denied`, controllare i permessi con `ls -l`. Se compare
`command not found`, verificare il percorso e il nome del file.

## 4. Directory corrente e percorsi (10 minuti)
`pwd` mostra la directory corrente. Un percorso assoluto parte da `/`; un percorso
relativo viene interpretato rispetto alla directory corrente. `.` indica la directory
corrente, `..` quella superiore. La directory corrente influenza i percorsi relativi
usati dallo script: per questo gli script più robusti spesso calcolano esplicitamente
le directory di lavoro o accettano percorsi come argomenti.

## 5. Laboratorio guidato (10 minuti)
1. Aprire la cartella del repository.
2. Eseguire `bash --version` e `command -v bash`.
3. Aprire `codice/01-ambiente-e-shell/01-primo-script.sh`.
4. Eseguirlo con `bash`, poi renderlo eseguibile e avviarlo direttamente.
5. Modificare il messaggio e aggiungere una riga con la directory corrente.

## Collegamento ai file di codice
- `codice/01-ambiente-e-shell/01-primo-script.sh` – primo script, shebang, commenti e output.
- `codice/02-comandi-fondamentali/02-comandi-laboratorio.sh` – primi comandi e navigazione.

## Verifica dell'apprendimento
1. Qual è la differenza tra terminale e shell?
2. A cosa serve la shebang?
3. Qual è la differenza tra `bash script.sh` e `./script.sh`?
4. Che cosa restituisce `pwd`?

**Compito breve:** creare `info-ambiente.sh` che stampi versione Bash, utente e directory
corrente. Non modificare file di sistema e lavorare nella cartella del corso.
