# 05 — Le Funzioni in Python

Nelle sezioni precedenti abbiamo appreso come memorizzare dati nelle variabili, controllare il flusso di esecuzione tramite condizioni e cicli, e organizzare le informazioni mediante le strutture dati native (`list`, `tuple`, `set`, `dict`). 

Man mano che i programmi crescono in dimensione e complessità, la scrittura di codice sequenziale porta inevitabilmente a duplicazioni, difficoltà di manutenzione e scarsa leggibilità. Le **funzioni** rappresentano il meccanismo fondamentale di astrazione e modularizzazione nei linguaggi di programmazione moderni.

---

## 1. Perché servono le funzioni?

Nel contesto dell'ingegneria del software, la duplicazione del codice è considerata una delle principali fonti di bug e debito tecnico. Le funzioni consentono di applicare il principio **DRY (Don't Repeat Yourself)**.

Una funzione permette di:
* **Raggruppare istruzioni correlate**: dare un nome unico a una sequenza di operazioni.
* **Riutilizzare il codice**: eseguire la stessa logica in punti diversi del programma senza duplicare il codice.
* **Isolare il contesto**: creare uno spazio di memoria riservato (scope) per ridurre le interferenze con altre parti del programma.
* **Scomporre la complessità**: dividere un problema articolato in sottoproblemi più piccoli e verificabili autonomamente (*divide et impera*).

### Sintassi base e chiamata

In Python una funzione si definisce mediante la parola chiave `def`, seguita dal nome della funzione, dalle parentesi tonde `()` e dai due punti `:`. Il blocco di codice sottostante deve essere indentato di 4 spazi.

```python
def saluta():
    """Stampa un messaggio di benvenuto standard."""
    print("Benvenuto nel corso di Programmazione e Scripting!")

# Chiamata della funzione
saluta()
```

---

## 2. Parametri e Argomenti

È fondamentale distinguere la terminologia:
* **Parametri**: Le variabili definite nella firma della funzione (es. `nome` e `ruolo`).
* **Argomenti**: I valori reali passati alla funzione al momento della chiamata (es. `"Alice"` e `"Admin"`).

```python
def mostra_profilo(nome, ruolo):
    print(f"Utente: {nome} | Ruolo assegnato: {ruolo}")

# Chiamata con argomenti posizionali
mostra_profilo("Alice", "Administrator")
```

### Argomenti Posizionali vs Keyword Arguments

Gli argomenti possono essere passati in due modalità:
1. **Posizionale**: L'ordine degli argomenti determina l'associazione ai parametri.
2. **Keyword (per nome)**: Si specifica esplicitamente il nome del parametro durante la chiamata. Questo elimina la dipendenza dall'ordine.

```python
# Argomenti per nome (Keyword arguments)
mostra_profilo(ruolo="Analyst", nome="Bob")
```

> **Regola sintattica**: Gli argomenti posizionali devono **sempre** precedere gli argomenti keyword nella chiamata di una funzione.

### Parametri con Valori Predefiniti (Default Values)

È possibile specificare valori predefiniti per i parametri. Se l'argomento non viene fornito durante la chiamata, verrà utilizzato il valore di default.

```python
def imposta_connessione(host="127.0.0.1", porta=8080, ssl=True):
    protocollo = "https" if ssl else "http"
    return f"{protocollo}://{host}:{porta}"

print(imposta_connessione())                      # Usa tutti i default
print(imposta_connessione("192.168.1.10"))        # Sovrascrive host
print(imposta_connessione(porta=9000, ssl=False)) # Sovrascrive porta e ssl
```

> **Attenzione**: I parametri con valore predefinito devono essere messi **dopo** i parametri privi di valore predefinito nella firma della funzione.

### La Trappola dei Valori Predefiniti Mutabili

Uno degli errori più insidiosi in Python riguarda l'utilizzo di oggetti mutabili (`list`, `dict`, `set`) come valori predefiniti per i parametri.

#### Il problema
Il valore predefinito viene valutato **una sola volta** quando la funzione viene definita (al caricamento del modulo), non a ogni chiamata.

```python
# ERRORE CONCETTUALE
def aggiungi_log(messaggio, registro=[]):
    registro.append(messaggio)
    return registro

print(aggiungi_log("Avvio sistema"))      # ['Avvio sistema']
print(aggiungi_log("Connessione OK"))    # ['Avvio sistema', 'Connessione OK'] (INATTESO!)
```

#### La soluzione idiomatica
Utilizzare `None` come valore predefinito ed inizializzare l'oggetto mutabile all'interno del blocco della funzione.

```python
# SOLUZIONE CORRETTA
def aggiungi_log(messaggio, registro=None):
    if registro is None:
        registro = []
    registro.append(messaggio)
    return registro

print(aggiungi_log("Avvio sistema"))      # ['Avvio sistema']
print(aggiungi_log("Connessione OK"))    # ['Connessione OK']
```

---

## 3. Valori di Ritorno (`return`)

La parola chiave `return` ha un duplice scopo:
1. Restituire uno o più risultati al chiamante.
2. Interrompere immediatamente l'esecuzione della funzione.

```python
def calcola_sconto(prezzo: float, percentuale: float) -> float:
    if prezzo <= 0 or percentuale < 0:
        return 0.0  # Uscita anticipata in caso di input non valido
    
    sconto = prezzo * (percentuale / 100)
    return prezzo - sconto

risultato = calcola_sconto(150.0, 20.0)
print(f"Prezzo scontato: {risultato} €")
```

### Restituire Valori Multipli

In Python una funzione può restituire più valori separandoli con virgole. In realtà Python impacchetta i valori in un'unica **tupla**, che può poi essere scompattata (*tuple unpacking*) dal chiamante.

```python
def analizza_numeri(lista_valori):
    minimo = min(lista_valori)
    massimo = max(lista_valori)
    media = sum(lista_valori) / len(lista_valori)
    return minimo, massimo, media  # Restituisce una tupla

# Unpacking del risultato
val_min, val_max, val_avg = analizza_numeri([12, 45, 3, 89, 23])
print(f"Min: {val_min}, Max: {val_max}, Media: {val_avg:.2f}")
```

### Funzioni senza `return` (Procedure)

Se una funzione non contiene un'istruzione `return`, oppure se esegue un `return` senza argomenti, restituisce implicitamente l'oggetto speciale `None`.

```python
def scrivi_file(nome_file, contenuto):
    with open(nome_file, "w") as f:
        f.write(contenuto)

esito = scrivi_file("test.txt", "Hello")
print(esito)  # Stampa: None
```

> **Differenza cruciale**: `print()` mostra un valore sulla console ma restituisce `None`. `return` passa un valore al codice chiamante affinché possa essere memorizzato ed elaborato.

---

## 4. Firma Avanzata dei Parametri

Per costruire API e librerie flessibili, Python mette a disposizione meccanismi per gestire argomenti variadici e vincoli sulla modalità di chiamata.

### Argomenti Posizionali Variadici (`*args`)

L'operatore `*` prima del nome di un parametro consente alla funzione di accettare un numero arbitrario di argomenti posizionali. All'interno della funzione, `args` sarà una **tupla**.

```python
def calcola_somma(*numeri):
    totale = 0
    for n in numeri:
        totale += n
    return totale

print(calcola_somma(5, 10, 15))        # 30
print(calcola_somma(1, 2, 3, 4, 5, 6))  # 21
```

### Argomenti Keyword Variadici (`**kwargs`)

L'operatore `**` consente di accettare un numero arbitrario di argomenti passati per nome. All'interno della funzione, `kwargs` sarà un **dizionario**.

```python
def genera_query_sql(tabella, **condizioni):
    query = f"SELECT * FROM {tabella}"
    if condizioni:
        clausole = [f"{chiave} = '{valore}'" for chiave, valore in condizioni.items()]
        query += " WHERE " + " AND ".join(clausole)
    return query + ";"

print(genera_query_sql("utenti", stato="attivo", ruolo="admin"))
# Output: SELECT * FROM utenti WHERE stato = 'attivo' AND ruolo = 'admin';
```

### Unpacking di Sequenze e Dizionari nella Chiamata

Gli operatori `*` e `**` possono essere usati anche in fase di **chiamata** per scompattare iterabili o dizionari negli argomenti della funzione.

```python
def crea_punto(x, y, z):
    return f"Punto({x}, {y}, {z})"

coordinate = (10, 20, 30)
dati_dizionario = {"x": 5, "y": 15, "z": 25}

print(crea_punto(*coordinate))        # Unpacking di tupla/lista
print(crea_punto(**dati_dizionario)) # Unpacking di dizionario
```

### Parametri Positional-Only (`/`) e Keyword-Only (`*`)

È possibile obbligare chi chiama la funzione a passare determinati parametri esclusivamente per posizione o esclusivamente per nome.

* **`/` (Positional-Only)**: Tutti i parametri a sinistra del simbolo `/` possono essere passati **solo** per posizione.
* **`*` (Keyword-Only)**: Tutti i parametri a destra del simbolo `*` possono essere passati **solo** per nome.

```python
def configura_server(ip, porta, /, *, timeout=30, debug=False):
    return f"Server {ip}:{porta} [Timeout={timeout}s, Debug={debug}]"

# Chiamata corretta:
print(configura_server("192.168.1.1", 80, timeout=60))

# Chiamate NON valide:
# configura_server(ip="192.168.1.1", porta=80) # TypeError (ip e porta sono positional-only)
# configura_server("192.168.1.1", 80, 60)      # TypeError (timeout è keyword-only)
```

---

## 5. Scope e Namespace: La Regola LEGB

Lo **scope** (campo di visibilità) determina in quali parti del codice una determinata variabile è accessibile.

Python risolve i nomi delle variabili seguendo l'ordine gerarchico noto come **LEGB**:

1. **L (Local)**: Nomi definiti all'interno della funzione corrente.
2. **E (Enclosing)**: Nomi definiti negli scope delle funzioni esterne che racchiudono la funzione corrente (funzioni annidate).
3. **G (Global)**: Nomi definiti al livello principale del modulo/file.
4. **B (Built-in)**: Nomi predefiniti del linguaggio (`len`, `print`, `range`, `ValueError`).

```text
       +-----------------------------------+
       | B (Built-in)                      |
       |  +-----------------------------+  |
       |  | G (Global)                  |  |
       |  |  +-----------------------+  |  |
       |  |  | E (Enclosing)         |  |  |
       |  |  |  +-----------------+  |  |  |
       |  |  |  | L (Local)       |  |  |  |
       |  |  |  +-----------------+  |  |  |
       |  |  +-----------------------+  |  |
       |  +-----------------------------+  |
       +-----------------------------------+
```

### Modifica di Variabili Globali (`global`)

All'interno di una funzione è possibile **leggere** variabili globali. Tuttavia, se si tenta di assegnare un nuovo valore a una variabile globale senza dichiararla, Python creerà una nuova variabile locale con lo stesso nome.

Per modificare una variabile globale si utilizza la parola chiave `global`:

```python
contatore_accessi = 0

def registra_accesso():
    global contatore_accessi
    contatore_accessi += 1

registra_accesso()
registra_accesso()
print(contatore_accessi)  # 2
```

> **Buona Pratica**: L'uso della parola chiave `global` è fortemente sconsigliato nei programmi ben progettati, in quanto introduce stato globale mutabile e rende il codice difficile da verificare e da eseguire in parallelo.

### Modifica di Variabili dello Scope Esterno (`nonlocal`)

Nelle funzioni annidate, per modificare una variabile appartenente allo scope della funzione contenitrice (senza renderla globale), si utilizza `nonlocal`.

```python
def crea_contatore():
    valore = 0
    def incrementa():
        nonlocal valore
        valore += 1
        return valore
    return incrementa

mio_contatore = crea_contatore()
print(mio_contatore())  # 1
print(mio_contatore())  # 2
```

---

## 6. Documentazione e Tipizzazione

La manutenibilità del codice richiede documentazione chiara e indicazioni esplicite sui tipi di dato attesi.

### Docstring (PEP 257)

Una **Docstring** è una stringa multilinea posizionata come primissima istruzione all'interno di una funzione. Viene utilizzata da IDE, generatori di documentazione e dalla funzione integrata `help()`.

```python
def calcola_bmi(peso: float, altezza: float) -> float:
    """Calcola l'Indice di Massa Corporea (BMI).

    Args:
        peso (float): Il peso della persona in chilogrammi.
        altezza (float): L'altezza della persona in metri.

    Returns:
        float: Il valore del BMI calcolato.

    Raises:
        ValueError: Se l'altezza è minore o uguale a zero.
    """
    if altezza <= 0:
        raise ValueError("L'altezza deve essere maggiore di zero.")
    return peso / (altezza ** 2)
```

### Type Hints (PEP 484)

I **Type Hints** permettono di specificare i tipi attesi per i parametri e il tipo del valore restituito. Non vengono verificati a tempo di esecuzione da Python (che rimane a tipizzazione dinamica), ma vengono analizzati da strumenti di analisi statica come `mypy` e dagli IDE.

```python
from typing import List, Dict, Optional

def filtra_utenti_attivi(utenti: List[Dict[str, str]], ruolo_filtro: Optional[str] = None) -> List[str]:
    risultato: List[str] = []
    for u in utenti:
        if u.get("stato") == "attivo":
            if ruolo_filtro is None or u.get("ruolo") == ruolo_filtro:
                risultato.append(u["username"])
    return risultato
```

---

## 7. First-Class Functions e Programmazione Funzionale

In Python le funzioni sono **oggetti di prima classe** (*First-Class Citizens*). Ciò significa che una funzione può essere:
* Assegnata a una variabile.
* Passata come argomento a un'altra funzione.
* Restituita come valore di ritorno da una funzione.
* Memorizzata in strutture dati (liste, dizionari).

```python
def applica_trasformazione(valore: float, operazione) -> float:
    return operazione(valore)

def raddoppia(x: float) -> float:
    return x * 2

print(applica_trasformazione(15.0, raddoppia))  # 30.0
```

### Funzioni Anonime: `lambda`

La parola chiave `lambda` permette di definire funzioni anonime (senza nome) in un'unica riga. La sintassi è:
`lambda parametri: espressione`

```python
# Funzione standard
def quadrato(x):
    return x ** 2

# Equivalente lambda
quadrato_lambda = lambda x: x ** 2

print(quadrato_lambda(6))  # 36
```

Le `lambda` sono utili per brevi trasformazioni una tantum, ad esempio come chiave di ordinamento:

```python
studenti = [("Anna", 28), ("Luca", 22), ("Marco", 30)]
# Ordina la lista di tuple in base all'età (secondo elemento, indice 1)
studenti_ordinati = sorted(studenti, key=lambda s: s[1])
print(studenti_ordinati)  # [('Luca', 22), ('Anna', 28), ('Marco', 30)]
```

### Funzioni di Ordine Superiore (`map` e `filter`)

Le funzioni di ordine superiore (*Higher-Order Functions*) sono funzioni che prendono altre funzioni come argomenti.

* **`map(funzione, iterabile)`**: Applica la funzione a ogni elemento dell'iterabile.
* **`filter(funzione, iterabile)`**: Sostituisce l'iterabile mantenendo solo gli elementi per cui la funzione restituisce `True`.

```python
numeri = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Raddoppia tutti i numeri con map
raddoppiati = list(map(lambda x: x * 2, numeri))

# Filtra solo i numeri pari con filter
pari = list(filter(lambda x: x % 2 == 0, numeri))

print(f"Raddoppiati: {raddoppiati}")
print(f"Pari: {pari}")
```

> **Confronto con le Comprehension**: In Python moderno, la *list comprehension* è spesso preferita a `map()` e `filter()` per chiarezza e leggibilità:
> `[x * 2 for x in numeri]` e `[x for x in numeri if x % 2 == 0]`.

---

## 8. Closure e Decoratori

### Closure

Una **Closure** (chiusura) è una funzione annidata che conserva l'accesso alle variabili dello scope esterno (*enclosing scope*) anche dopo che la funzione esterna ha terminato la propria esecuzione.

```python
def crea_moltiplicatore(fattore: float):
    def moltiplica(numero: float) -> float:
        return numero * fattore  # 'fattore' viene ricordato dalla closure
    return moltiplica

triplica = crea_moltiplicatore(3)
print(triplica(10))  # 30
print(triplica(5))   # 15
```

### Decoratori

Un **Decoratore** è una funzione che prende una funzione come argomento, ne estende o modifica il comportamento senza alterarne il codice sorgente, e restituisce una nuova funzione.

La sintassi `@nome_decoratore` è uno zucchero sintattico (*syntactic sugar*) per: `funzione = nome_decoratore(funzione)`.

#### Struttura di un decoratore professionale
Un decoratore pronto per l'uso professionale deve:
1. Usare `*args` e `**kwargs` nel wrapper per accettare qualsiasi firma.
2. Utilizzare `@functools.wraps` per preservare il nome e la docstring della funzione originale.

```python
import time
from functools import wraps

def cronometra(funzione):
    """Decoratore che misura il tempo di esecuzione di una funzione."""
    @wraps(funzione)
    def wrapper(*args, **kwargs):
        t_inizio = time.perf_counter()
        risultato = funzione(*args, **kwargs)
        t_fine = time.perf_counter()
        durata = t_fine - t_inizio
        print(f"[BENCHMARK] '{funzione.__name__}' eseguita in {durata:.6f} secondi.")
        return risultato
    return wrapper

@cronometra
def elabora_dati(n: int):
    """Simola un calcolo oneroso."""
    return sum(i ** 2 for i in range(n))

# Esecuzione
res = elabora_dati(1000000)
```

---

## 9. Ricorsione

Una funzione si definisce **ricorsiva** quando chiama se stessa all'interno del proprio corpo.

Ogni funzione ricorsiva deve possedere due componenti fondamentali:
1. **Caso Base (Base Case)**: La condizione di arresto che interrompe la catena di chiamate ricorsive.
2. **Passo Ricorsivo (Recursive Step)**: La riduzione del problema a una versione più piccola che avvicina l'esecuzione al caso base.

```python
def fattoriale(n: int) -> int:
    # 1. Caso base
    if n <= 1:
        return 1
    # 2. Passo ricorsivo
    return n * fattoriale(n - 1)

print(fattoriale(5))  # 120
```

### Rischio di Stack Overflow (`RecursionError`)

Ogni chiamata di funzione aggiunge uno frame allo stack di memoria della JVM/interprete (*call stack*). Se il caso base manca o non viene mai raggiunto, Python interrompe l'esecuzione sollevando un'eccezione `RecursionError` per evitare di esaurire la memoria del sistema (il limite predefinito è solitamente di 1000 chiamate ed è verificabile con `sys.getrecursionlimit()`).

---

## 10. Guida alla Progettazione di Funzioni Pulite

Per scrivere codice professionale di alta qualità, seguire questi principi guida:

1. **Principio di Singola Responsabilità (SRP)**: Una funzione deve svolgere un'unica attività ben definita e farla al meglio. Se il nome della funzione contiene la congiunzione "e" (es. `calcola_e_stampa`), la funzione probabilmente fa troppe cose e va suddivisa.
2. **Funzioni Pure (Pure Functions)**: Privilegiare funzioni che, dato lo stesso input, restituiscono sempre lo stesso output senza produrre effetti collaterali (*side effects*) sullo stato globale o sui parametri mutabili passati.
3. **Evitare la confusione tra `print` e `return`**: Usare `print()` solo per funzioni di I/O oCLI; le funzioni di calcolo ed elaborazione dati devono sempre restituire il risultato tramite `return`.
4. **Firme Chiare e Compatte**: Mantenere basso il numero di parametri (idealmente non più di 3 o 4). Se servono più dati, raggrupparli in una struttura dati (`dict`, `dataclass` o `namedtuple`).

---

## Tabella Riassuntiva della Sintassi delle Funzioni

| Sintassi / Costrutto | Descrizione | Esempio |
| :--- | :--- | :--- |
| `def f(x):` | Definizione di funzione standard | `def somma(a, b): return a + b` |
| `def f(a=10):` | Valore di parametro predefinito | `def log(msg, livello="INFO"):` |
| `def f(*args):` | Numero variabile di argomenti posizionali (Tupla) | `def calcola_media(*valori):` |
| `def f(**kwargs):` | Numero variabile di argomenti keyword (Dizionario) | `def crea_config(**opzioni):` |
| `def f(a, /, b):` | `a` è Positional-Only, `b` può essere posizionale o keyword | `def dividi(numeratore, denominatore, /):` |
| `def f(a, *, b):` | `b` è Keyword-Only | `def salva(dati, *, sovrascrivi=False):` |
| `lambda x: exp` | Funzione anonima monolinea | `lambda a, b: a if a > b else b` |
| `@decoratore` | Applicazione di un decoratore a una funzione | `@cronometra \n def esegui(): ...` |
