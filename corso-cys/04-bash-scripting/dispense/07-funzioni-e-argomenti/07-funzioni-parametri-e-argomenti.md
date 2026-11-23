# 07 – Funzioni, parametri e argomenti da riga di comando

<text>Durata indicativa: 60 minuti · Livello: intermedio</text>

## Obiettivi di apprendimento
Definire funzioni, passare parametri, usare variabili locali, distinguere argomenti
posizionali e codice di uscita, progettare interfacce semplici per gli script.

## 1. Perché usare le funzioni (5 minuti)
Una funzione dà un nome a un blocco di istruzioni riutilizzabile. Riduce duplicazioni,
separa responsabilità e rende più semplice testare una parte dello script.

## 2. Definizione e chiamata (15 minuti)
La funzione viene definita prima di essere chiamata:

```bash
saluta() {
    local nome="${1:-studente}"
    printf 'Ciao, %s!\\n' "$nome"
}
saluta "Ada"
```

`$1` all'interno della funzione è il primo argomento passato alla funzione. `local`
limita la variabile alla funzione. Senza `local`, una variabile assegnata può modificare
il contesto della shell chiamante.

## 3. Argomenti dello script (15 minuti)
Per lo script:
- `$0`: nome/percorso dello script;
- `$1`, `$2`, ...: argomenti posizionali;
- `$#`: numero degli argomenti;
- `"$@"`: tutti gli argomenti, mantenendo ciascuno come elemento distinto;
- `$?`: exit status dell'ultimo comando.

Esempio di controllo:

```bash
if (( $# != 2 )); then
    printf 'Uso: %s valore1 valore2\\n' "$0" >&2
    exit 2
fi
```

Il codice 2 è qui usato per indicare un uso non corretto dello script; la convenzione
non è universale, ma è utile documentare i codici adottati.

## 4. return, stdout ed exit (10 minuti)
`return` termina una funzione e restituisce un codice numerico. Non è il meccanismo
per restituire una stringa: per produrre testo una funzione può scrivere su stdout
con `printf`. `exit` termina l'intero script. È buona pratica distinguere il risultato
testuale dal codice di successo/errore.

## 5. Laboratorio (15 minuti)
- Eseguire `codice/07-funzioni-e-argomenti/10-funzione-saluto.sh`.
- Passare un nome con uno spazio racchiudendolo tra virgolette.
- Eseguire `codice/07-funzioni-e-argomenti/11-somma-argomenti.sh` con gli argomenti `12 8`.
- Provare zero, uno, tre argomenti e un valore non numerico.
- Modificare lo script per creare una funzione `somma` e verificare i parametri.

## Collegamento ai file di codice
- `codice/07-funzioni-e-argomenti/10-funzione-saluto.sh`
- `codice/07-funzioni-e-argomenti/11-somma-argomenti.sh`
- `codice/14-progetto-finale/23-progetto-report-log.sh` – organizzazione in fasi e funzioni come estensione.

## Verifica
Che differenza c'è tra `$1` e `$@`? Perché usare `"$@"`? Che cosa restituisce `return`?
Quando è corretto usare `exit`?
