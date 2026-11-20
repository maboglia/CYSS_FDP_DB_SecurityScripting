# 03 — Cicli e Iterazioni

In questa lezione affronteremo le **strutture di controllo iterative**, note comunemente come **cicli** o *loops*. Se le condizioni (`if`, `elif`, `else`) consentono a un programma di prendere decisioni e deviare il percorso esecutivo, i cicli permettono di **ripetere blocchi di istruzioni** in modo automatizzato, efficiente e controllato.

L'iterazione è uno dei pilastri fondamentali della programmazione e dello scripting: dalla scansione dei record di un database all'analisi riga per riga di file di log di sicurezza, dall'elaborazione batch di file al polling di servizi di rete.

---

## 1. Introduzione alle Strutture Iterative

In un flusso di esecuzione sequenziale, le istruzioni vengono eseguite dall'alto verso il basso, una sola volta. Nella pratica dello sviluppo software, sorge continuamente la necessità di applicare la medesima logica a una serie di dati o di ripetere un'azione finché una determinata condizione non viene soddisfatta.

Python offre due costrutti principali per gestire la ripetizione:

1. **Ciclo `for`**: Utilizzato prevalentemente per l'iterazione definita su sequenze o oggetti **iterabili** (liste, tuple, stringhe, dizionari, range, file).
2. **Ciclo `while`**: Utilizzato per la ripetizione indefinita o basata su condizione, in cui il ciclo prosegue finché una determinata espressione booleana rimane `True`.

Ad essi si affiancano le istruzioni di controllo del flusso (`break`, `continue`, la clausola `else` applicata ai cicli) e strumenti integrati per il tracciamento degli indici (`enumerate()`) o la combinazione di sequenze (`zip()`).

---

## 2. Il Ciclo `for` e la Funzione `range()`

### 2.1 Sintassi e Meccanica del `for`

A differenza di linguaggi come C o Java (dove il ciclo `for` classico richiede l'inizializzazione di un contatore, una condizione di arresto e un incremento manuale), in Python il `for` è concepito come un **iteratore di sequenza** (*for-each*). 

La sintassi fondamentale è:

```python
for variabile in iterabile:
    # blocco di istruzioni indentato
```

Ad ogni iterazione, Python estrae automaticamente il successivo elemento dall'iterabile e lo assegna alla `variabile`, eseguendo il blocco sottostante. Non occorre gestire manualmente gli indici.

#### Esempio: Iterazione su una lista di numeri
```python
numbers = [10, 20, 30, 40]

for number in numbers:
    print(f"Valore corrente: {number}")
```

**Output:**
```text
Valore corrente: 10
Valore corrente: 20
Valore corrente: 30
Valore corrente: 40
```

---

### 2.2 Generare Sequenze Numeriche con `range()`

La funzione integrata `range()` genera una sequenza immutabile di numeri interi ed è lo strumento principale per eseguire un ciclo un numero prefissato di volte.

`range()` viene invocata con tre forme sintattiche:

1. `range(stop)`: Genera interi da `0` fino a `stop - 1` (il limite superiore è **escluso**).
2. `range(start, stop)`: Genera interi da `start` a `stop - 1`.
3. `range(start, stop, step)`: Genera interi da `start` a `stop - 1`, incrementando (o decrementando) di `step`.

#### Esempi di utilizzo di `range()`

```python
# 1. Singolo parametro: da 0 a 4
for i in range(5):
    print(i, end=" ")
print()  # Output: 0 1 2 3 4

# 2. Start e Stop: da 1 a 5
for i in range(1, 6):
    print(i, end=" ")
print()  # Output: 1 2 3 4 5

# 3. Con passo (step) positivo: numeri pari da 2 a 10
for i in range(2, 11, 2):
    print(i, end=" ")
print()  # Output: 2 4 6 8 10

# 4. Con passo negativo: conto alla rovescia da 5 a 1
for i in range(5, 0, -1):
    print(i, end=" ")
print()  # Output: 5 4 3 2 1
```

> **Nota di efficienza**: In Python 3, `range()` non crea immediatamente tutti i numeri in memoria sotto forma di lista, ma genera ogni valore **on-demand** (lazy evaluation), garantendo un consumo di memoria costante $\mathcal{O}(1)$ indipendentemente dall'ampiezza dell'intervallo.

---

## 3. Iterazione su Stringhe e Sequenze

Poiché le stringhe in Python sono sequenze ordinate di caratteri, anch'esse sono a tutti gli effetti oggetti **iterabili**.

### Esempio 1: Scansione carattere per carattere
```python
word = "Python"

for letter in word:
    print(letter.upper(), end="-")
# Output: P-Y-T-H-O-N-
```

### Esempio 2: Conteggio e analisi di caratteri (es. conteggio vocali)
```python
text = "Scripting per la Sicurezza"
vowels = "aeiouAEIOU"
vowel_count = 0

for char in text:
    if char in vowels:
        vowel_count += 1

print(f"Totale vocali trovate: {vowel_count}")
# Output: Totale vocali trovate: 9
```

---

## 4. Tracciare la Posizione con `enumerate()`

In molti scenari è necessario conoscere non solo il valore dell'elemento corrente, ma anche il suo **indice di posizione** all'interno della sequenza.

Un anti-pattern comune dei principianti consiste nell'usare `range(len(sequenza))`:

```python
# Anti-pattern (poco pythonico)
hosts = ["192.168.1.1", "192.168.1.5", "10.0.0.1"]
for i in range(len(hosts)):
    print(f"Host #{i}: {hosts[i]}")
```

La soluzione moderna e idonea allo stile "pythonico" è l'utilizzo di `enumerate()`, che restituisce a ogni passo una tupla contenente `(indice, elemento)`:

```python
# Approccio Pythonico con enumerate()
hosts = ["192.168.1.1", "192.168.1.5", "10.0.0.1"]

for index, host in enumerate(hosts, start=1):
    print(f"Server #{index}: {host}")
```

**Output:**
```text
Server #1: 192.168.1.1
Server #2: 192.168.1.5
Server #3: 10.0.0.1
```

---

## 5. Iterare sui Dizionari

I dizionari (`dict`) consentono diverse modalità di iterazione a seconda delle informazioni che si desidera estrarre.

```python
services = {
    "SSH": 22,
    "HTTP": 80,
    "HTTPS": 443,
    "MySQL": 3306
}

# 1. Iterazione predefinita (sulle chiavi)
for service in services:
    print(f"Servizio: {service}")

# 2. Iterazione sui soli valori (.values())
for port in services.values():
    print(f"Porta aperta: {port}")

# 3. Iterazione contemporanea su chiavi e valori (.items()) - Consigliato
for service, port in services.items():
    print(f"Servizio {service} in ascolto sulla porta {port}")
```

---

## 6. Controllo del Flusso nei Cicli: `break` e `continue`

Per alterare il normale ciclo di vita di un meccansimo iterativo si utilizzano le parole chiave `break` e `continue`.

### 6.1 `break`: Interruzione Anticipata
L'istruzione `break` **interrompe immediatamente** l'esecuzione dell'intero ciclo, trasferendo il controllo del programma alla prima istruzione al di fuori di esso.

```python
# Ricerca del primo indirizzo IP sospetto
log_ips = ["192.168.1.10", "10.0.0.4", "172.16.0.99", "192.168.1.15"]
malicious_ip = "172.16.0.99"

for ip in log_ips:
    if ip == malicious_ip:
        print(f"[ALERTA] Minaccia individuata: {ip}! Interruzione scansione.")
        break
    print(f"Verificato IP sicuro: {ip}")
```

**Output:**
```text
Verificato IP sicuro: 192.168.1.10
Verificato IP sicuro: 10.0.0.4
[ALERTA] Minaccia individuata: 172.16.0.99! Interruzione scansione.
```

### 6.2 `continue`: Salto dell'Iterazione Corrente
L'istruzione `continue` **salta la parte rimanente** del corpo del ciclo per la sola iterazione corrente e passa immediatamente alla successiva.

```python
# Filtraggio di pacchetti o valori non validi
packet_sizes = [64, -1, 128, 0, 1500, -5]

for size in packet_sizes:
    if size <= 0:
        print(f"[WARN] Dimensione pacchetto non valida ({size}), salto...")
        continue
    print(f"Elaborazione pacchetto valido di {size} byte.")
```

**Output:**
```text
Elaborazione pacchetto valido di 64 byte.
[WARN] Dimensione pacchetto non valida (-1), salto...
Elaborazione pacchetto valido di 128 byte.
[WARN] Dimensione pacchetto non valida (0), salto...
Elaborazione pacchetto valido di 1500 byte.
[WARN] Dimensione pacchetto non valida (-5), salto...
```

---

## 7. Il Costrutto `for ... else`

Una caratteristica peculiare di Python è la possibilità di associare una clausola `else` a un ciclo `for` (o `while`).

> **Regola fondamentale**: Il blocco `else` collegato a un ciclo viene eseguito **esclusivamente se il ciclo termina in modo naturale** (ossia se ha attraversato tutti gli elementi senza incontrare alcuna istruzione `break`).

### Esempio: Controllo Integrità File / Ricerca
```python
hashes_whitelist = ["a1b2c3", "d4e5f6", "789abc"]
target_hash = "ffffffff"

for file_hash in hashes_whitelist:
    if file_hash == target_hash:
        print("Hash trovato nella whitelist!")
        break
else:
    print("Hash NON presente nella whitelist: file potenzialmente malevolo.")
```

---

## 8. Concetti Avanzati: Iterabili, Iteratori e Funzioni Integrati

### 8.1 Differenza tra Iterabile e Iteratore
- **Iterabile**: Qualsiasi oggetto capace di restituire i propri elementi uno alla volta quando passato alla funzione `iter()`. Esempi: `list`, `str`, `tuple`, `dict`, `set`.
- **Iteratore**: L'oggetto stato risultante che mantiene la posizione corrente e restituisce il valore successivo tramite `next()`. Quando gli elementi terminano, l'invocazione di `next()` solleva l'eccezione `StopIteration`.

```python
data = [1, 2, 3]
it = iter(data)  # Creazione manuale dell'iteratore

print(next(it))  # Output: 1
print(next(it))  # Output: 2
print(next(it))  # Output: 3
# next(it) solleverebbe ora StopIteration
```

Il ciclo `for` in Python automatizza internamente questo preciso meccanismo gestendo in modo trasparente l'eccezione `StopIteration`.

### 8.2 Funzioni Utili per Iterabili: `any()`, `all()`, `zip()`

Python mette a disposizione funzioni ad alto livello per operare rapidamente su sequenze iterabili:

- `all(iterable)`: Ritorna `True` se **tutti** gli elementi dell'iterabile sono valutati come *truthy*.
- `any(iterable)`: Ritorna `True` se **almeno un** elemento dell'iterabile è valutato come *truthy*.
- `zip(*iterables)`: Aggrega elementi da ciascun iterabile in parallelo, restituendo tuple composte dai corrispondenti elementi.

```python
# Esempio con zip()
usernames = ["admin", "analyst", "guest"]
status = ["Active", "Active", "Disabled"]

for user, st in zip(usernames, status):
    print(f"Utente: {user:<10} Status: {st}")

# Esempio con all() e any()
check_flags = [True, True, False]
print(all(check_flags))  # False (non tutti sono True)
print(any(check_flags))  # True (almeno uno è True)
```

---

## 9. Il Ciclo `while` e la Gestione delle Condizioni

Il ciclo `while` ripete l'esecuzione di un blocco di codice finché una specifica **condizione booleana** rimane vera.

Sintassi:
```python
while condizione:
    # istruzioni
```

### 9.1 Aggiornamento del Controllo
A differenza del ciclo `for`, il `while` **non incrementa o aggiorna automaticamente** le variabili di controllo. L'aggiornamento della stato deve avvenire esplicitamente all'interno del corpo del ciclo.

```python
counter = 1

while counter <= 5:
    print(f"Tentativo #{counter}")
    counter += 1  # Incremento fondamentale per evitare cicli infiniti
```

---

## 10. Cicli Infiniti e Pattern di Input dell'Utente

Se la condizione di un ciclo `while` rimane permanentemente `True` (o se ci si dimentica di aggiornarne la variabile di controllo), il programma entra in un **ciclo infinito**.

In ambiente CLI o terminale, un ciclo infinito si interrompe manualmente con la combinazione di tasti `Ctrl + C` (che invia un segnale di `KeyboardInterrupt`).

### Pattern Standard: Menu Interattivo / Polling

Nel software di sistema e negli script di sicurezza è frequente definire volontariamente un ciclo infinito `while True`, controllandone l'uscita tramite `break` al verificarsi di un input specifico:

```python
while True:
    command = input("Inserisci comando (status/scan/exit): ").strip().lower()
    
    if command == "exit":
        print("Chiusura sessione di lavoro...")
        break
    elif command == "status":
        print("[OK] Sistema operativo e protetto.")
    elif command == "scan":
        print("[INFO] Scansione in corso...")
    else:
        print("[ERR] Comando non riconosciuto.")
```

---

## 11. Cicli Annidati e Strutture Multidimensionali (Matrici)

Un ciclo annidato (*nested loop*) si verifica quando un blocco iterativo è inserito all'interno di un altro ciclo.

### 11.1 Meccanica dei Cicli Annidati
Per ogni singola iterazione del ciclo esterno, il ciclo interno viene eseguito **completamente** da capo.

```python
for i in range(1, 4):         # Ciclo esterno (righe)
    for j in range(1, 4):     # Ciclo interno (colonne)
        print(f"({i},{j})", end=" ")
    print()                   # A capo a fine riga
```

**Output:**
```text
(1,1) (1,2) (1,3) 
(2,1) (2,2) (2,3) 
(3,1) (3,2) (3,3) 
```

### 11.2 Scansione di Matrici e Griglie
I cicli annidati sono indispensabili per elaborare matrici di dati o strutture bidimensionali (ad esempio pixel di un'immagine o tabelle di database).

```python
matrix = [
    [10, 20, 30],
    [40, 50, 60],
    [70, 80, 90]
]

for row_idx, row in enumerate(matrix):
    for col_idx, value in enumerate(row):
        print(f"Elemento al punto [{row_idx}][{col_idx}] = {value}")
```

> **Attenzione alle istruzioni `break` nei cicli annidati**: Un'istruzione `break` interrompe **solamente** il ciclo immediato all'interno del quale è posizionata, non i cicli genitore esterni.

---

## 12. Complessità Computazionale nei Cicli

La strutturazione dei cicli influisce direttamente sulle prestazioni temporali di uno script o di un algoritmo.

| Struttura | Complessità Temporale | Esempio e Descrizione |
| :--- | :--- | :--- |
| **Singolo ciclo (`for` / `while`)** | $\mathcal{O}(n)$ | Scansione di una lista di $n$ elementi. Il tempo cresce in modo direttamente proporzionale a $n$. |
| **Due cicli annidati su $n$** | $\mathcal{O}(n^2)$ | Confronto di ogni elemento di una lista con tutti gli altri elementi. Se $n=1000$, le operazioni diventano $1.000.000$. |
| **Tre cicli annidati su $n$** | $\mathcal{O}(n^3)$ | Calcolo su matrici tridimensionali o grafi complessi. Crescita cubica estremamente onerosa. |

*Regola di Progettazione*: Evitare l'annidamento profondo di cicli su grandi moli di dati. Laddove possibile, utilizzare strutture dati ottimizzate (come gli insiemi `set` o i dizionari `dict` che garantiscono ricerche in $\mathcal{O}(1)$).

---

## 13. Guida alla Scelta: `for` vs `while`

Per determinare quale costrutto iterativo utilizzare, fare riferimento alle seguenti linee guida:

- **Utilizzare `for` quando**:
  - Si deve elaborare una collezione di dati esistente (liste, tuple, dizionari, stringhe).
  - Il numero di iterazioni è noto a priori o prefissato tramite `range()`.
  - Si ricerca la massima leggibilità e uno stile idiomatico Python.

- **Utilizzare `while` when**:
  - La ripetizione deve continuare finché una condizione logica dinamica rimane vera.
  - Non è possibile prevedere a priori il numero esatto di iterazioni (es. attesa di una risposta di rete, lettura da stream di dati, menu utente).
  - Si implementano cicli di polling o servizi demone in esecuzione continua.
