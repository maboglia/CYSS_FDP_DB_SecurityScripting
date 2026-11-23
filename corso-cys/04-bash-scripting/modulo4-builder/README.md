# Builder repository – Modulo 4 Bash Scripting

## Contenuto
- `scripts/crea_repo.py`: legge manifesti JSON o TXT.
- `scripts/crea_repo.sh`: legge il manifesto TXT.
- `manifest/struttura-modulo4.json`: struttura completa con contenuti iniziali.
- `manifest/struttura-modulo4.txt`: formato testuale semplice compatibile con entrambi gli script.

## Python

Dalla directory `modulo4-builder`:

```bash
python3 scripts/crea_repo.py manifest/struttura-modulo4.json -o ..
```

Oppure:

```bash
python3 scripts/crea_repo.py manifest/struttura-modulo4.txt -o ..
```

Anteprima senza creare file:

```bash
python3 scripts/crea_repo.py manifest/struttura-modulo4.json -o .. --dry-run
```

Per sovrascrivere file esistenti:

```bash
python3 scripts/crea_repo.py manifest/struttura-modulo4.json -o .. --force
```

## Bash

Lo script Bash usa il manifesto testuale:

```bash
bash scripts/crea_repo.sh manifest/struttura-modulo4.txt ..
```

Per consentire la sovrascrittura:

```bash
FORCE=1 bash scripts/crea_repo.sh manifest/struttura-modulo4.txt ..
```

## Formato TXT

Ogni riga significativa è separata da TAB:

```text
DIR<TAB>dispense/01-ambiente-e-shell
FILE<TAB>README.md<TAB># Titolo\nTesto iniziale\n
```

Le righe vuote e quelle che iniziano con `#` vengono ignorate.
Il formato TXT supporta contenuti su una sola riga fisica usando `\n` e `\t`
per rappresentare newline e tabulazioni.

## Formato JSON

Il JSON contiene:
- `project`: nome della cartella radice;
- `directories`: array di percorsi relativi;
- `files`: array di oggetti con `path` e `content`.

Il generatore Python rifiuta percorsi assoluti e percorsi che tentano di uscire
dalla cartella del progetto. Per impostazione predefinita non sovrascrive file
esistenti; usa `--force` solo quando vuoi sostituire consapevolmente i contenuti.
