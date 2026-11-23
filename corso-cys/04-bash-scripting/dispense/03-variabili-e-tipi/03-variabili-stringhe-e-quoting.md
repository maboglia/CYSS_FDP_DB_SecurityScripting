# 03 – Variabili, stringhe, ambiente e quoting

<text>Durata indicativa: 60 minuti · Livello: base</text>

## Obiettivi di apprendimento
Dichiarare e leggere variabili, comprendere che Bash tratta normalmente i valori come
stringhe, usare l'espansione delle variabili e l'aritmetica intera, distinguere apici
singoli e doppi, proteggere correttamente percorsi e valori contenenti spazi.

## 1. Assegnazione e lettura (10 minuti)
In Bash l'assegnazione non prevede spazi intorno a `=`:

```bash
nome="Ada Lovelace"
eta=25
echo "$nome"
```

`nome = "Ada"` non è un'assegnazione valida: la shell lo interpreta come un comando
chiamato `nome`. I nomi sono sensibili a maiuscole e minuscole. Per convenzione si
usano nomi descrittivi; spesso le variabili locali sono in minuscolo e le variabili
d'ambiente in maiuscolo.

## 2. Espansione e concatenazione (10 minuti)
`$nome` e `${nome}` leggono il valore. Le parentesi graffe delimitano il nome e
consentono concatenazioni non ambigue:

```bash
base="report"
estensione="txt"
file="${base}.${estensione}"
printf 'File: %s\\n' "$file"
```

La forma `${variabile:-valore}` permette di usare un valore predefinito se la variabile
non è impostata o è vuota:

```bash
destinazione="${DESTINAZIONE:-./backup}"
```

## 3. Apici e quoting (15 minuti)
Gli apici doppi permettono l'espansione delle variabili ma proteggono gli spazi.
Gli apici singoli mantengono il contenuto letterale. Senza quoting, l'espansione può
essere soggetta a word splitting e pathname expansion (globbing).

```bash
utente="Ada Lovelace"
printf '%s\\n' "$utente"
printf '%s\\n' '$utente'
```

Preferire `"$variabile"` quando si passa un valore a un comando. Per esempio:

```bash
cp -- "$sorgente" "$destinazione"
```

Senza virgolette, un percorso come `documenti del corso/file.txt` potrebbe essere
interpretato come più argomenti. Non quotare indiscriminatamente ogni costrutto:
all'interno di `[[ ... ]]` le espansioni sono gestite in modo diverso, ma mantenere
uno stile coerente rende il codice più leggibile.

## 4. Variabili d'ambiente e aritmetica (10 minuti)
`HOME`, `PATH`, `USER` sono esempi di variabili d'ambiente. `export` rende una variabile
disponibile ai processi figli:

```bash
export AMBIENTE="laboratorio"
```

Bash esegue direttamente aritmetica intera:

```bash
a=7
b=3
somma=$((a + b))
((a += 1))
```

La divisione tra interi tronca la parte decimale. Per calcoli decimali occorre uno
strumento esterno, ad esempio `awk` o `bc` se installato.

## 5. Laboratorio guidato (15 minuti)
Aprire `codice/03-variabili-e-tipi/03-variabili-quoting.sh`.
1. Eseguire lo script.
2. Cambiare il nome in un valore contenente uno spazio.
3. Aggiungere una variabile con il nome di un file.
4. Stampare il valore con apici doppi e poi singoli.
5. Calcolare il triplo di un numero con `$(( ... ))`.
6. Provare il percorso `./cartella con spazi/file.txt` in una variabile e stamparlo.

## Collegamento ai file di codice
- `codice/03-variabili-e-tipi/03-variabili-quoting.sh` – assegnazione, espansione, quoting e aritmetica.
- `codice/11-automazione-sistemistica/18-backup-txt.sh` – uso di variabili per sorgente e destinazione.

## Verifica
Perché `nome = "Ada"` non funziona come assegnazione? Quando usare `${nome}`?
Qual è la differenza tra `'...'` e `"..."`? Perché è importante quotare i percorsi?
