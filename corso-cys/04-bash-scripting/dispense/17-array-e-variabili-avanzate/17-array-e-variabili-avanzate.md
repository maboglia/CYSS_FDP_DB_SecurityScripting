# 17 – Array e variabili avanzate

**Durata indicativa:** 60 minuti  
**Obiettivo:** gestire insiemi di valori in Bash e usare dichiarazioni e variabili speciali con consapevolezza.

## 1. Variabili e dichiarazioni
Una variabile Bash non ha un tipo statico come in Python o Java. `declare` permette di dichiarare attributi; `readonly` impedisce la riassegnazione.

```bash
declare -i tentativi=0
readonly SOGLIA=5
tentativi+=1
```

`local` limita una variabile alla funzione in cui viene dichiarata. Le variabili d'ambiente si esportano con `export`.

## 2. Array indicizzati
Gli array indicizzati contengono più elementi associati a indici numerici.

```bash
utenti=("anna" "marco" "lucia")
echo "${utenti[0]}"
echo "${utenti[@]}"
echo "${#utenti[@]}"
```

Per attraversarli:
```bash
for utente in "${utenti[@]}"; do
  printf '%s\n' "$utente"
done
```

Le virgolette attorno a `"${array[@]}"` preservano gli elementi anche quando contengono spazi.

## 3. Parametri speciali
- `$#`: numero degli argomenti;
- `$@`: tutti gli argomenti, da usare normalmente come `"$@"`;
- `$0`: nome dello script;
- `$?`: stato di uscita dell'ultimo comando;
- `$$`: PID della shell corrente;
- `$!`: PID dell'ultimo processo avviato in background.

## 4. Laboratorio
Eseguire:
```bash
bash codice/17-array-e-variabili-avanzate/28-array-utenti.sh
bash codice/17-array-e-variabili-avanzate/29-parametri-speciali.sh primo "secondo valore"
```

## 5. Esercizi
1. Aggiungere due utenti all'array.
2. Stampare il numero di elementi e il contenuto completo.
3. Rendere costante il nome del report con `readonly`.
4. Modificare lo script dei parametri per rifiutare l'assenza di argomenti.

## Verifica
- Perché si scrive `"${utenti[@]}"` e non `${utenti[@]}`?
- Che differenza c'è tra `local`, `export` e `readonly`?
- Che cosa restituisce `$#`?

## Sicurezza
Non inserire password o token negli array o negli argomenti della riga di comando: gli argomenti possono essere visibili tramite strumenti di ispezione dei processi e possono finire nella cronologia della shell.
