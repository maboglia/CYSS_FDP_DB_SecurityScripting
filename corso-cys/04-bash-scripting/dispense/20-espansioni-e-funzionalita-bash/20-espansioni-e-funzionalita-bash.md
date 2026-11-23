# 20 – Espansioni Bash: brace, tilde, comando e processo

**Durata indicativa:** 60 minuti  
**Obiettivo:** riconoscere le principali espansioni effettuate dalla shell prima dell'esecuzione dei comandi.

## 1. Ordine e significato
Bash interpreta ed espande alcune forme presenti nella riga di comando. È importante distinguere l'espansione della shell dall'interpretazione del comando eseguito.

## 2. Brace expansion
Genera più stringhe:
```bash
echo file-{a,b,c}.txt
echo capitolo-{01..05}.md
```
Non esegue un comando e non verifica che i file esistano.

## 3. Tilde expansion
La forma `~` rappresenta la directory home dell'utente; `~nomeutente` può indicare la home di un altro utente, se risolvibile.

```bash
printf '%s\n' ~
```

## 4. Command substitution
`$(comando)` sostituisce l'espressione con lo standard output del comando:
```bash
oggi="$(date +%F)"
numero_file="$(find . -maxdepth 1 -type f | wc -l)"
```
La forma moderna raccomandata è `$(...)`; i backtick sono una forma precedente e meno leggibile.

## 5. Process substitution
`<(comando)` e `>(comando)` espongono l'input/output di un processo come un nome simile a un file, tramite meccanismi dipendenti dal sistema.

Esempio:
```bash
diff <(sort elenco-a.txt) <(sort elenco-b.txt)
```
È una funzionalità di Bash e di altre shell compatibili, ma non è POSIX `sh`.

## 6. Laboratorio
Eseguire:
```bash
bash codice/20-espansioni-e-funzionalita-bash/33-espansioni-demo.sh
bash codice/20-espansioni-e-funzionalita-bash/34-confronto-process-substitution.sh
```

## 7. Esercizi
1. Generare i nomi `log-01.txt` fino a `log-10.txt` senza creare i file.
2. Salvare la data corrente in una variabile.
3. Confrontare due elenchi ordinati senza creare file intermedi, usando process substitution.
4. Ripetere il confronto creando file temporanei e confrontare leggibilità e gestione degli errori.

## Verifica
- La brace expansion controlla se i file esistono?
- Perché `$(...)` è preferibile ai backtick?
- Qual è il vantaggio della process substitution? Quale limite di portabilità introduce?

## Buone pratiche
Usare sempre le virgolette quando si espandono variabili contenenti dati (`"$variabile"`). Le espansioni non devono essere confuse con la validazione: un valore ottenuto da un comando va comunque controllato prima di usarlo in operazioni sensibili.
