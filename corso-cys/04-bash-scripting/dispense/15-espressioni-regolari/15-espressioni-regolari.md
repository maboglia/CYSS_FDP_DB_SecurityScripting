# 15 – Espressioni regolari per l'analisi dei log

**Durata indicativa:** 60 minuti  
**Contesto:** Bash e strumenti GNU in ambiente Linux  
**Obiettivo:** riconoscere ed estrarre informazioni testuali da file di log usando `grep` e regex.

## Risultati di apprendimento
Al termine lo studente sa:
- distinguere una ricerca letterale da una ricerca basata su pattern;
- usare ancore, classi di caratteri e quantificatori di base;
- distinguere le espressioni regolari di base (BRE) da quelle estese (ERE);
- costruire filtri ripetibili per l'analisi di log.

## 1. Che cosa descrive una regex
Una espressione regolare descrive un modello testuale. Non è un linguaggio per interpretare il significato di una riga: individua sequenze che rispettano una struttura.

Esempi:
- `error` cerca la sequenza letterale;
- `^ERROR` cerca righe che iniziano con `ERROR`;
- `failed$` cerca righe che terminano con `failed`;
- `[0-9]` individua una cifra;
- `[[:digit:]]` è una classe POSIX per le cifre.

## 2. Metacaratteri essenziali
| Costrutto | Significato |
|---|---|
| `^` | inizio della riga |
| `$` | fine della riga |
| `.` | un carattere qualsiasi |
| `[abc]` | uno dei caratteri indicati |
| `[a-z]` | un carattere nell'intervallo |
| `[^abc]` | un carattere diverso da quelli indicati |
| `*` | zero o più ripetizioni dell'elemento precedente |
| `+` | una o più ripetizioni, in ERE |
| `?` | zero o una ripetizione, in ERE |
| `{m,n}` | da m a n ripetizioni, in ERE |

In BRE alcuni operatori hanno una forma con backslash; per gli esempi introduttivi si userà `grep -E`, che abilita le ERE.

## 3. `grep` e opzioni utili
```bash
grep "ERROR" file.log
grep -n "ERROR" file.log       # numero di riga
grep -i "error" file.log       # ignora maiuscole/minuscole
grep -v "INFO" file.log        # esclude le righe corrispondenti
grep -E "WARN|ERROR" file.log  # alternativa: WARN oppure ERROR
grep -E "^[0-9]{4}-" file.log  # righe che iniziano con un anno a 4 cifre
```

## 4. Laboratorio guidato
Aprire `codice/15-espressioni-regolari/log-demo.txt` e lanciare:
```bash
bash codice/15-espressioni-regolari/24-grep-errori.sh
bash codice/15-espressioni-regolari/25-pattern-ipv4-candidato.sh
```
Il secondo script cerca stringhe con forma simile a IPv4. È un filtro sintattico dimostrativo: **non valida** che ogni ottetto sia compreso tra 0 e 255 e non dimostra che l'indirizzo sia raggiungibile.

## 5. Attività individuale
1. Estrarre tutte le righe che contengono `failed`.
2. Cercare le righe che iniziano con una data ISO `AAAA-MM-GG`.
3. Trovare righe che contengono `WARN` oppure `ERROR`.
4. Escludere le righe `INFO` e contare quelle restanti.

## 6. Verifica
- Che differenza c'è tra `grep` e `grep -E`?
- A cosa servono `^` e `$`?
- Perché un pattern IPv4 semplice non è una validazione completa?

## Sicurezza e buone pratiche
Usare dataset di laboratorio o log autorizzati. Evitare di copiare dati personali o credenziali in file di esercitazione. Le regex vanno testate su esempi rappresentativi: un pattern troppo permissivo può produrre falsi positivi, uno troppo restrittivo può perdere eventi.
