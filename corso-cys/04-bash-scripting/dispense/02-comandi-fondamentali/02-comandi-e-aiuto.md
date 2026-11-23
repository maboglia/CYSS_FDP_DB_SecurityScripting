# 02 – Comandi fondamentali e documentazione

<text>Durata indicativa: 60 minuti · Livello: introduttivo</text>

## Obiettivi di apprendimento
Saper navigare nel filesystem, elencare e ispezionare file, creare directory e file,
copiare e rinominare elementi in un'area di prova, consultare la documentazione e
riconoscere il rischio delle operazioni distruttive.

## 1. Orientarsi nel filesystem (10 minuti)
Il filesystem è organizzato ad albero. La directory radice è `/`; la home dell'utente
è spesso indicata da `~`. I comandi essenziali sono:

| Comando | Scopo |
|---|---|
| `pwd` | stampa la directory corrente |
| `ls -la` | elenca file, inclusi quelli nascosti, con dettagli |
| `cd percorso` | cambia directory |
| `cd ..` | sale di un livello |
| `cd ~` | torna alla home |

Eseguire i comandi uno alla volta e osservare come cambia il prompt o il risultato di
`pwd`.

## 2. Creare e ispezionare elementi (15 minuti)
`mkdir` crea directory; con `-p` crea anche le directory intermedie. `touch` crea un
file vuoto se non esiste. `cat` mostra il contenuto, mentre `less` consente una
consultazione interattiva. `head` e `tail` mostrano rispettivamente l'inizio e la fine.

```bash
mkdir -p laboratorio/documenti
cd laboratorio/documenti
touch appunti.txt
printf 'Prima riga\\nSeconda riga\\n' > appunti.txt
cat appunti.txt
head -n 1 appunti.txt
tail -n 1 appunti.txt
```

## 3. Copiare, spostare e rimuovere (10 minuti)
`cp sorgente destinazione` copia; `mv origine destinazione` sposta o rinomina.
`rm` elimina: non va usato alla cieca. Controllare sempre `pwd`, percorso e nomi.
Per le esercitazioni, limitare le operazioni a una directory creata appositamente.

L'opzione `--` separa le opzioni dagli argomenti: è utile quando un nome file comincia
con `-`. Le virgolette proteggono nomi con spazi:

```bash
cp -- "appunti.txt" "copia appunti.txt"
mv -- "copia appunti.txt" "copia.txt"
```

## 4. Trovare aiuto (10 minuti)
La documentazione è parte del lavoro tecnico:

```bash
man grep
grep --help
type cd
command -v bash
```

`man` apre il manuale; `--help` fornisce spesso un riepilogo; `type` distingue alias,
funzioni, builtin e programmi; `command -v` individua un comando nel `PATH`.

## 5. Laboratorio (15 minuti)
Utilizzare `codice/02-comandi-fondamentali/02-comandi-laboratorio.sh`.
1. Leggere lo script prima di eseguirlo.
2. Eseguirlo dalla cartella del codice.
3. Individuare dove crea `laboratorio_bash`.
4. Modificare il testo inserito nel file.
5. Aggiungere un comando `head` o `tail`.
6. Rispondere: perché è importante sapere qual è la directory corrente?

## Collegamento ai file di codice
- `codice/02-comandi-fondamentali/02-comandi-laboratorio.sh` – navigazione, creazione e lettura.
- `codice/01-ambiente-e-shell/01-primo-script.sh` – esecuzione di uno script.

## Verifica
Descrivere la differenza tra `cp` e `mv`; spiegare cosa fa `mkdir -p`; indicare due
modi per consultare l'aiuto di `grep`; motivare perché `rm` richiede attenzione.

**Esercizio individuale:** predisporre una directory `prova_comandi` con due file di testo,
copiarne uno, rinominarlo e visualizzare il contenuto senza uscire dall'area di prova.
