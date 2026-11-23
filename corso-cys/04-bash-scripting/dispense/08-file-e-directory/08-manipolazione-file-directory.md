# 08 – Gestione di file e directory

<text>Durata indicativa: 60 minuti · Livello: intermedio</text>

## Obiettivi di apprendimento
Cercare file e contenuti, filtrare righe, comporre strumenti Unix, iterare sui nomi
file in modo robusto, pianificare operazioni di modifica con anteprima e controlli.

## 1. Operazioni e strumenti (10 minuti)
`mkdir`, `cp`, `mv`, `rm` gestiscono la struttura; `find` cerca file in base a criteri;
`grep` seleziona righe; `sort` ordina; `uniq` individua righe adiacenti duplicate;
`cut` estrae campi delimitati; `awk` elabora record e campi; `sed` trasforma flussi
testuali. Non è necessario memorizzare ogni opzione: è essenziale saper consultare
il manuale e comporre i comandi.

## 2. Ricerca con find e grep (15 minuti)
Esempi:

```bash
find . -type f -name '*.log'
grep -n 'ERROR' applicazione.log
grep -i 'failed' auth.log
```

`find` attraversa directory; `grep` cerca testo. `-n` mostra il numero di riga,
`-i` ignora la differenza maiuscole/minuscole. Il pattern `*.log` va quotato quando
passato a `find`, perché deve essere interpretato da `find`, non espanso dalla shell.

## 3. Pipeline per riepilogare (10 minuti)
Per contare le righe che contengono una parola:

```bash
grep -c 'ERROR' applicazione.log
```

Per individuare valori ripetuti, prima ordinare:

```bash
sort utenti.txt | uniq -c
```

`uniq` confronta righe adiacenti; per questo spesso è preceduto da `sort`.

## 4. Nomi file e sicurezza (15 minuti)
I nomi possono contenere spazi, tab e caratteri speciali. Le virgolette proteggono
le espansioni; per cicli semplici si possono usare glob:

```bash
for file in ./*.txt; do
    [[ -f "$file" ]] || continue
    printf 'Esamino: %s\\n' "$file"
done
```

Per alberi complessi, `find -print0` insieme a `read -d ''` consente di delimitare
i nomi con byte NUL e gestire anche nomi contenenti newline. Non usare l'output di
`ls` come input di un ciclo.

## 5. Anteprima prima della modifica (10 minuti)
Rinominare o cancellare molti file è un'operazione ad alto impatto. Prima si mostra
l'azione prevista; solo dopo aver controllato l'elenco si abilita la modifica.
Il principio è applicabile a pulizia, spostamento, backup e trasformazioni in batch.

## Laboratorio e collegamenti
1. `codice/08-file-e-directory/12-cerca-testo.sh`: eseguire la ricerca e modificare la parola.
2. `codice/08-file-e-directory/13-righe-maiuscole.sh`: verificare le righe che iniziano con maiuscola.
3. Dati: `codice/08-file-e-directory/testo-laboratorio.txt`.
4. Estensione: cercare file `.log` sotto una directory di test con `find`.

## Collegamento ai file di codice
- `codice/08-file-e-directory/12-cerca-testo.sh`
- `codice/08-file-e-directory/13-righe-maiuscole.sh`
- `codice/11-automazione-sistemistica/19-rinomina-jpg-preview.sh`

## Verifica
Perché `uniq` viene spesso preceduto da `sort`? Qual è il ruolo di `find` rispetto a
`grep`? Perché un ciclo basato su `$(ls)` è fragile? Che cosa significa dry-run?
