# 06 – Le strutture fondamentali degli algoritmi

Il Teorema di Böhm-Jacopini costituisce la pietra angolare dell'algoritmica moderna e della programmazione strutturata: esso dimostra formalmente che qualsiasi algoritmo, indipendentemente dalla sua complessità, può essere espresso combinando esclusivamente tre strutture di controllo fondamentali: la **sequenza**, la **selezione** e l'**iterazione**. L'adozione rigorosa di questo paradigma garantisce che ogni blocco di codice possieda un unico punto di ingresso ed un unico punto di uscita, eliminando i salti incondizionati e rendendo i programmi leggibili, verificabili e manutenibili.

---

## 1. Il Paradigma della Programmazione Strutturata e la Sequenza

La struttura di **sequenza** rappresenta il modello esecutivo più elementare. In una sequenza, le istruzioni vengono eseguite in un ordine cronologico e topologico rigido, esattamente nell'ordine in cui sono scritte, dall'alto verso il basso.

L'esecuzione di ciascun passo è strettamente subordinata al completamento con esito positivo del passo precedente. In termini di stato della macchina, la sequenza modifica lo stato della memoria passo dopo passo.

```text
// Pseudocodice: Sequenza di calcolo dell'area
INIZIO
    LEGGERE base
    LEGGERE altezza
    area <- (base * altezza) / 2
    SCRIVERE area
FINE
```

Nel diagramma di flusso, la sequenza si traduce in una catena lineare di blocchi rettangolari di elaborazione e parallelepipedi di Input/Output collegati da frecce orientate verso il basso senza ramificazioni.

---

## 2. La Struttura di Selezione: Ramificazioni Logiche e Alternative

La struttura di **selezione** (o ramificazione condizionale) consente all'esecutore di deviare dal flusso sequenziale sulla base della valutazione di una condizione booleana (vera o falsa). 

### Selezione Semplice (Ad una via)
Esegue un blocco di istruzioni solo se la condizione risulta `VERA`. Se risulta `FALSA`, il blocco viene ignorato e il flusso prosegue.

```text
SE condizione ALLORA
    Istruzioni_Vero
FINE_SE
```

### Selezione Alternativa (A due vie)
Garantisce la scelta mututamente esclusiva tra due blocchi d'azione distinti.

```text
SE condizione ALLORA
    Istruzioni_Vero
ALTRIMENTI
    Istruzioni_Falso
FINE_SE
```

### Selezione Multipla ed Annidata
Quando le decisioni dipendono da più criteri concatenati, si ricorre alla selezione annidata o ad alberi di decisione. In Python, questo modello si implementa tramite la struttura `if...elif...else`.

```python
# Esempio di selezione multipla in Python
voto = int(input("Inserisci il punteggio: "))

if voto >= 90:
    giudizio = "Eccellente"
elif voto >= 70:
    giudizio = "Buono"
elif voto >= 60:
    giudizio = "Sufficiente"
else:
    giudizio = "Insufficiente"

print("Esito:", giudizio)
```

---

## 3. La Struttura di Iterazione: Il Principio della Ripetizione

L'**iterazione** (o ciclo) permette di ripetere l'esecuzione di un blocco di istruzioni (corpo del ciclo) fino al verificarsi o al permanere di una determinata condizione logica. Esistono due macro-tipologie di iterazione:

1. **Iterazione Indeterminata**: Il numero di ripetizioni non è noto a priori e dipende dal variare dei dati durante l'esecuzione (cicli basati su condizione).
2. **Iterazione Determinata**: Il numero di ripetizioni è fisso e noto prima dell'ingresso nel ciclo (cicli basati su contatore/sequenza).

---

## 4. L'Iterazione Indeterminata: Il Ciclo WHILE e le Condizioni di Continuazione

Il ciclo `while` rappresenta la struttura iterativa **precondizionale**: la condizione di continuazione viene valutata *prima* di ogni eventuale esecuzione del corpo del ciclo.

### Caratteristiche del ciclo WHILE
* Se la condizione è `FALSA` al primo controllo, il corpo del ciclo **non viene eseguito neppure una volta**.
* Finchè la condizione si mantiene `VERA`, il corpo del ciclo viene rieseguito ciclicamente.
* Affinché il ciclo termini, l'esecuzione delle istruzioni interne deve necessariamente modificare i valori delle variabili coinvolte nella condizione, rendendola `FALSA`.

```python
# Calcolo del prodotto per somme successive tramite ciclo WHILE
moltiplicando = 5
moltiplicatore = 3

prodotto = 0
contatore = 0

while contatore < moltiplicatore:
    prodotto = prodotto + moltiplicando
    contatore = contatore + 1

print("Prodotto finale:", prodotto)
```

---

## 5. L'Iterazione Determinata: Il Ciclo FOR e la Funzione RANGE()

Il ciclo `for` in Python è progettato per scorrere sequenze di elementi (come intervalli numerici, liste o stringhe). Quando associato alla funzione integrata `range()`, implementa l'iterazione determinata standard.

### La funzione `range()`
La funzione `range()` genera una sequenza aritmetica secondo tre forme sintattiche:
* `range(stop)`: genera numeri da `0` a `stop - 1` (passo di default = 1).
* `range(start, stop)`: genera numeri da `start` a `stop - 1`.
* `range(start, stop, step)`: genera numeri da `start` a `stop - 1` incrementando di `step` ad ogni passo.

```python
# Iterazione determinata con range(start, stop, step)
for i in range(1, 10, 2):
    print("Numero dispari:", i)
```

---

## 6. Pattern Algoritmi Fondamentali: Contatori e Accumulatori

Nella costruzione degli algoritmi iterativi si impiegano due ruoli fondamentali di variabile:

### 1. Il Contatore
Una variabile destinata a tracciare il numero di iterazioni eseguite. Viene incrementata di una quantità costante (solitamente `1`) ad ogni ciclo.

$$\text{contatore} \leftarrow \text{contatore} + 1$$

### 2. L'Accumulatore
Una variabile destinata a memorizzare la somma progressiva o il prodotto parziale di una serie di valori dinamici elaborati durante il ciclo. Viene incrementata di una quantità variabile.

$$\text{accumulatore} \leftarrow \text{accumulatore} + \text{valore\_corrente}$$

```python
# Calcolo della media aritmetica di N valori
n = int(input("Quanti valori vuoi inserire? "))

somma_accumulata = 0  # Accumulatore
for i in range(n):
    valore = float(input(f"Inserisci il valore {i + 1}: "))
    somma_accumulata += valore  # Incremento variabile dell'accumulatore

if n > 0:
    media = somma_accumulata / n
    print("Media aritmetica:", media)
```

---

## 7. Controllo di Terminazione e Prevenzione dei Cicli Infiniti

Un **ciclo infinito** (o *loop infinito*) si verifica quando la condizione di test di un ciclo si mantiene permanentemente `VERA`. Questo rappresenta un grave difetto di progettazione (bug) che blocca l'esecutore in uno stato di attesa indefinita.

### Regole per garantire la terminazione
1. **Inizializzazione**: Le variabili che compaiono nella condizione di test devono essere inizializzate correttamente prima dell'ingresso nel ciclo.
2. **Aggiornamento interno**: All'interno del corpo del ciclo deve essere presente almeno un'istruzione che modifichi lo stato delle variabili di test verso la condizione di uscita.
3. **Guardia di sicurezza**: Nei casi in cui l'input sia imprevedibile, è opportuno inserire un limite massimo di iterazioni consentite.

```python
# Esempio di guardia di sicurezza contro cicli infiniti
tentativi = 0
max_tentativi = 5
password_corretta = "secret123"

while tentativi < max_tentativi:
    inserimento = input("Inserisci password: ")
    if inserimento == password_corretta:
        print("Accesso consentito.")
        break
    tentativi += 1
    print(f"Password errata. Tentativi rimasti: {max_tentativi - tentativi}")

if tentativi == max_tentativi:
    print("Account bloccato per troppi tentativi falliti.")
```

---

## 8. Salti di Controllo Avanzati: BREAK e CONTINUE

Sebbene la programmazione strutturata pura prediliga l'uscita da un ciclo esclusivamente tramite la condizione principale, i linguaggi moderni mettono a disposizione due istruzioni di salto controllato:

### `break`
Interrompe immediatamente l'esecuzione del ciclo e trasferisce il controllo alla prima istruzione esterna successiva al blocco iterativo.

### `continue`
Interrompe l'iterazione corrente, salta le istruzioni rimanenti del corpo del ciclo e passa immediatamente alla valutazione della condizione successiva (nel `while`) o all'elemento successivo della sequenza (nel `for`).

```python
# Filtro ed elaborazione con break e continue
for numero in range(1, 10):
    if numero == 5:
        continue  # Salta il numero 5 senza stampare
    if numero == 8:
        break     # Termina anticipatamente il ciclo al numero 8
    print("Elaborazione numero:", numero)
```

---

## 9. Tabella di Corrispondenza: Flow-Chart, Pseudocodice e Python

La seguente tabella sintetizza il passaggio dalla notazione concettuale e grafica alla sintassi formale in Python.

| Struttura Logica | Notazione Flow-Chart | Pseudocodice Standard | Sintassi Python |
| :--- | :--- | :--- | :--- |
| **Sequenza** | Blocco Rettangolare | `A <- 10`<br>`B <- 20` | `a = 10`<br>`b = 20` |
| **Selezione Semplice** | Rombo con ramo VERO/FALSO | `SE x > 0 ALLORA ... FINE_SE` | `if x > 0:` |
| **Selezione Alternativa** | Rombo a 2 uscite operative | `SE c ALLORA ... ALTRIMENTI ... FINE_SE` | `if c:`<br>`    ...`<br>`else:` |
| **Iterazione Precondizionale** | Rombo prima del blocco operativo | `MENTRE c FAI ... FINE_MENTRE` | `while c:` |
| **Iterazione Determinata** | Rombo con contatore e limite | `PER i DA 1 A N FAI ... FINE_PER` | `for i in range(n):` |

---

## 10. Verifica Concettuale ed Esercizi Guidati

### Domande di Verifica
1. *Qual è la differenza fondamentale tra una selezione ad una via ed una selezione alternativa?*
2. *Per quale motivo il ciclo `while` viene definito precondizionale e cosa comporta per l'esecuzione del corpo del ciclo se la condizione iniziale è falsa?*
3. *In che modo un accumulatore differisce da un contatore all'interno di un ciclo?*

### Esercizio Guidato: Algoritmo di Euclide (MCD)
Tradurre l'Algoritmo di Euclide per il calcolo del Massimo Comune Divisore tramite sottrazioni successive da pseudocodice a Python:

```text
// Pseudocodice Euclide per sottrazioni
INIZIO
    LEGGERE a, b
    MENTRE a != b FAI
        SE a > b ALLORA
            a <- a - b
        ALTRIMENTI
            b <- b - a
        FINE_SE
    FINE_MENTRE
    SCRIVERE a
FINE
```

```python
# Implementazione Python dell'Algoritmo di Euclide
a = int(input("Inserisci il primo numero intero positivo: "))
b = int(input("Inserisci il secondo numero intero positivo: "))

while a != b:
    if a > b:
        a = a - b
    else:
        b = b - a

print("Il Massimo Comune Divisore (M.C.D.) è:", a)
```
