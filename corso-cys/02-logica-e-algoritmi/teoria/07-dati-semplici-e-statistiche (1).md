# 07 – Dati Semplici e Statistiche

L'elaborazione di collezioni di dati rappresenta una delle applicazioni fondamentali dell'algoritmica. Quando un programma gestisce più valori — come le temperature rilevate da un sensore, le vendite giornaliere di un negozio o i punteggi di un test — la logica di calcolo si basa sull'applicazione sistematica delle strutture di iterazione e selezione per ricavare sintesi informative e cercare elementi specifici.

In questo modulo viene analizzato come scandire sequenze di dati ed eseguire i calcoli statistici elementari (somma, conteggio, media, minimo e massimo) e la ricerca di valori tramite l'algoritmo di **Ricerca Lineare**.

---

## 1. Scansione di Sequenze di Dati

La **scansione** (o *traversal*) è il processo algoritmico mediante il quale un esecutore visita una sequenza di $N$ elementi, uno alla volta, dall'inizio alla fine, eseguendo un'operazione su ciascun valore.

### Principi della Scansione Sequenziale
Per effettuare una scansione ordinata è necessario gestire tre elementi chiave di stato:
1. **Un indice o contatore della posizione**: $i$, inizializzato al primo elemento della sequenza (convenzionalmente posizione $1$ in pseudocodice o $0$ negli array).
2. **Una condizione di ciclo**: il ciclo continua finché l'indice non supera il numero totale di elementi $N$.
3. **L'incremento dell'indice**: ad ogni iterazione, l'indice viene incrementato di $1$ per avanzare all'elemento successivo.

```text
ALGORITMO ScansioneSequenza
INPUT: N (numero di elementi), Sequenza D
INIZIO
    i <- 1
    MENTRE i <= N FAI
        Leggi D[i]
        // Elabora l'elemento corrente
        i <- i + 1
    FINE MENTRE
FINE
```

---

## 2. Calcolo di Somma, Conteggio e Media Aritmetica

La sintesi di una sequenza numerica richiede l'uso combinato di due variabili specializzate:
* **Contatore**: variabile intera incrementata di una quantità fissa ($c \leftarrow c + 1$) per registrare il numero di elementi elaborati.
* **Accumulatore**: variabile numerica incrementata di una quantità variabile ($\text{somma} \leftarrow \text{somma} + x$) per accumulare i valori numerici.

### Definizione Algoritmica della Media Aritmetica
La media aritmetica $\mu$ di una sequenza di $N$ valori $x_1, x_2, \dots, x_N$ è definita matematicamente come:

$$\mu = \frac{\sum_{i=1}^{N} x_i}{N}$$

Nel contesto di un esecutore automatico, il calcolo richiede una **guardia condizionale** per evitare l'errore critico di divisione per zero quando $N = 0$.

### Pseudocodice per Somma e Media
```text
ALGORITMO CalcoloSommaEMedia
INPUT: N, Sequenza D
OUTPUT: somma, media
INIZIO
    somma <- 0
    i <- 1
    
    MENTRE i <= N FAI
        somma <- somma + D[i]
        i <- i + 1
    FINE MENTRE
    
    SE N > 0 ALLORA
        media <- somma / N
        SCRIVI "Somma:", somma
        SCRIVI "Media:", media
    ALTRIMENTI
        SCRIVI "Errore: Sequenza vuota, impossibile calcolare la media"
    FINE SE
FINE
```

---

## 3. Algoritmi per il Calcolo di Minimo e Massimo

La ricerca del valore **Minimo** o **Massimo** all'interno di una sequenza di dati consiste nel mantenere in memoria il miglior candidato riscontrato fino a quel momento e confrontarlo con ciascun nuovo elemento letto.

### Il Problema dell'Inizializzazione
Un errore frequente nella progettazione algoritmica è l'inizializzazione arbitraria della variabile di confronto a zero o ad un valore prefissato.
* **Inizializzazione errata a 0 per il Massimo**: Se la sequenza contiene solo numeri negativi (es. $-15, -8, -32$), l'algoritmo restituirà errando $0$ come massimo, poiché $0$ non è mai stato superato dai valori negativi.
* **Regola di Inizializzazione Corretta**: La variabile `max` o `min` **deve sempre essere organizzata inizializzandola con il primo elemento della sequenza** ($D[1]$), oppure impostandola su valori di estremo teorico (es. $+\infty$ per il minimo, $-\infty$ per il massimo).

### Pseudocodice per la Ricerca del Massimo e del Minimo
```text
ALGORITMO TrovaMinimoEMassimo
INPUT: N (dove N >= 1), Sequenza D
OUTPUT: min, max
INIZIO
    min <- D[1]
    max <- D[1]
    i <- 2
    
    MENTRE i <= N FAI
        SE D[i] < min ALLORA
            min <- D[i]
        FINE SE
        
        SE D[i] > max ALLORA
            max <- D[i]
        FINE SE
        
        i <- i + 1
    FINE MENTRE
    
    SCRIVI "Valore Minimo:", min
    SCRIVI "Valore Massimo:", max
FINE
```

---

## 4. Algoritmo di Ricerca Lineare (Sequenziale)

La **Ricerca Lineare** (o sequenziale) è l'algoritmo fondamentale per verificare se un determinato valore bersaglio (*target*) è presente all'interno di una collezione non ordinata.

### Meccanismo di Funzionamento
L'algoritmo ispeziona i dati uno alla volta in ordine di posizione:
1. Inizializza un indicatore booleano `trovato <- FALSO` e l'indice $i \leftarrow 1$.
2. Ripete la scansione finché $i \le N$ e `trovato` rimane `FALSO`.
3. Se l'elemento corrente $D[i]$ è uguale al valore bersaglio `target`, imposta `trovato <- VERO` e memorizza la posizione.
4. Al termine del ciclo, controlla il valore della variabile booleana per comunicare l'esito.

### Pseudocodice per la Ricerca Lineare
```text
ALGORITMO RicercaLineare
INPUT: N, Sequenza D, target
OUTPUT: trovato, posizione
INIZIO
    trovato <- FALSO
    posizione <- -1
    i <- 1
    
    MENTRE (i <= N) E (trovato = FALSO) FAI
        SE D[i] = target ALLORA
            trovato <- VERO
            posizione <- i
        ALTRIMENTI
            i <- i + 1
        FINE SE
    FINE MENTRE
    
    SE trovato = VERO ALLORA
        SCRIVI "Elemento trovato alla posizione:", posizione
    ALTRIMENTI
        SCRIVI "Elemento non presente nella sequenza"
    FINE SE
FINE
```

---

## 5. Corrispondenza in Python

Di seguito viene mostrata la traduzione diretta dei concetti logici analizzati nella sintassi Python standard.

### Calcolo di Statistiche e Ricerca Lineare in Python
```python
def calcola_statistiche(dati):
    if not dati:
        print("Errore: lista vuota")
        return
    
    somma = 0
    minimo = dati[0]
    massimo = dati[0]
    
    for valore in dati:
        somma += valore
        if valore < minimo:
            minimo = valore
        if valore > massimo:
            massimo = valore
            
    media = somma / len(dati)
    print(f"Somma: {somma}, Media: {media:.2f}, Min: {minimo}, Max: {massimo}")

def ricerca_lineare(dati, target):
    trovato = False
    posizione = -1
    
    for i in range(len(dati)):
        if dati[i] == target:
            trovato = True
            posizione = i
            break  # Terminazione anticipata della scansione
            
    return trovato, posizione
```

---

## 6. Sintesi Concettuale e Casi Limite

La tabella seguente riassume la gestione dei casi limite e le regole di progettazione per gli algoritmi su sequenze numeriche:

| Algoritmo | Stato Iniziale Richiesto | Caso Limite Principale | Soluzione Logica |
| :--- | :--- | :--- | :--- |
| **Somma / Conteggio** | `somma = 0`, `count = 0` | Sequenza con 0 elementi | Restituire 0 senza eseguire cicli |
| **Media Aritmetica** | `somma = 0` | $N = 0$ (divisione per zero) | Controllare $N > 0$ prima della divisione |
| **Minimo / Massimo** | `min = D[1]`, `max = D[1]` | Sequenza contenente solo numeri negativi | Inizializzare sempre col primo elemento $D[1]$ |
| **Ricerca Lineare** | `trovato = FALSO`, `i = 1` | Elemento assente o duplicato | Fermarsi al primo riscontro con flag booleano |
