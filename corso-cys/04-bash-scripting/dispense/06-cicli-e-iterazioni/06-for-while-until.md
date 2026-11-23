# 06 – Cicli e iterazioni

<text>Durata indicativa: 60 minuti · Livello: intermedio</text>

## Obiettivi di apprendimento
Distinguere iterazione su una lista e iterazione condizionata; usare `for`, `while` e
`until`; controllare il ciclo con `break` e `continue`; evitare cicli infiniti e
gestire in modo sicuro nomi di file con spazi.

## 1. Concetto di iterazione (5 minuti)
Un ciclo ripete un blocco di istruzioni. È utile quando un'operazione va applicata a
più valori o finché una condizione resta vera. Ogni ciclo deve avere una condizione
di terminazione comprensibile.

## 2. Ciclo for su valori (10 minuti)
`for` visita gli elementi di una lista:

```bash
for colore in rosso verde blu; do
    printf '%s\\n' "$colore"
done
```

Le espansioni come `{1..5}` generano sequenze. In Bash è disponibile anche la forma
aritmetica `for ((inizio; condizione; aggiornamento))`.

## 3. Iterare sui file (10 minuti)
Un glob come `./*.txt` espande i nomi dei file che corrispondono al modello. Non usare
`for file in $(ls)`: gli spazi e altri caratteri nei nomi possono rompere la suddivisione.

```bash
for file in ./*.txt; do
    [[ -e "$file" ]] || continue
    printf 'File: %s\\n' "$file"
done
```

Il controllo `-e` evita di trattare il modello letterale come un file quando non ci
sono corrispondenze (con le impostazioni Bash predefinite).

## 4. while e until (15 minuti)
`while` ripete finché la condizione è vera. `until` ripete finché la condizione diventa
vera, quindi finché il test è falso:

```bash
contatore=1
while (( contatore <= 5 )); do
    printf '%s\\n' "$contatore"
    ((contatore += 1))
done
```

```bash
tentativi=0
until (( tentativi >= 3 )); do
    ((tentativi += 1))
done
```

Nel secondo esempio la condizione di uscita è raggiunta dopo tre incrementi.

## 5. break, continue e lettura file (10 minuti)
`break` interrompe il ciclo; `continue` salta alla prossima iterazione. Per leggere un
file riga per riga si usa il modello `while IFS= read -r`. La redirezione `< file`
alimenta il ciclo senza usare una pipeline che potrebbe cambiare il contesto delle
variabili in alcune configurazioni di shell.

## 6. Laboratorio (10 minuti)
- Eseguire `codice/06-cicli-e-iterazioni/08-stampa-numeri.sh`.
- Modificare l'intervallo e usare un contatore `while`.
- Eseguire `codice/06-cicli-e-iterazioni/09-leggi-file.sh` indicando `nomi.txt`.
- Aggiungere una riga con spazi e una senza newline finale; osservare il risultato.

## Collegamento ai file di codice
- `codice/06-cicli-e-iterazioni/08-stampa-numeri.sh`
- `codice/06-cicli-e-iterazioni/09-leggi-file.sh`
- `codice/11-automazione-sistemistica/19-rinomina-jpg-preview.sh` – iterazione sui file.

## Verifica
Qual è la differenza tra `while` e `until`? Perché non si dovrebbe ciclare sull'output
di `ls`? Quando usare `break` e quando `continue`?
