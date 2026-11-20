# Modulo 3: Python — 04. Collezioni e Strutture Dati

## 1. Perché servono le Strutture Dati?

Nei moduli precedenti abbiamo esplorato l'uso di singoli valori (interi, float, stringhe, booleani) e il controllo del flusso di esecuzione. Tuttavia, nei programmi reali — e in particolar modo negli script di sicurezza, analisi di rete e gestione di basi di dati — la gestione di informazioni correlate richiede l'uso di **collezioni di dati**.

Invece di creare variabili separate per ogni elemento:
```python
user1 = "alice"
user2 = "bob"
user3 = "charlie"
```

Le strutture dati trasformano un insieme di informazioni correlate in un'unica entità manipolabile e iterabile:
```python
users = ["alice", "bob", "charlie"]
```

L'obiettivo fondamentale dell'ingegneria del software non è memorizzare elenchi di metodi, ma saper rispondere alla domanda: **"Qual è la struttura dati più adatta per rappresentare ed elaborare questo specifico problema?"**

---

## 2. Le Quattro Strutture Fondamentali a Confronto

Python mette a disposizione quattro strutture dati integrate principali:

| Struttura | Ordinata | Modificabile (Mutabile) | Duplicati Ammessi | Accesso Principale | Costruttore Vuoto |
| :--- | :---: | :---: | :---: | :--- | :--- |
| **`list`** | **Sì** | **Sì** | **Sì** | Indice posizionale (`list[0]`) | `[]` oppure `list()` |
| **`tuple`** | **Sì** | **No** | **Sì** | Indice posizionale (`tuple[0]`) | `()` oppure `tuple()` |
| **`set`** | **No** | **Sì** | **No** | Appartenenza (`x in set`) | `set()` *(non `{}`)* |
| **`dict`** | **Sì** *(dalla 3.7+)* | **Sì** | **No** *(chiavi uniche)* | Chiave univoca (`dict["key"]`) | `{}` oppure `dict()` |

### Regole pratiche di scelta:
- **`list`**: *"Mi interessa preservare l'ordine sequenziale degli elementi e la possibilità di modificarli."*
- **`tuple`**: *"Mi interessa l'ordine posizionale, ma la collezione rappresenta un record immutabile."*
- **`set`**: *"Devo verificare velocemente l'appartenenza o eliminare duplicati, l'ordine non conta."*
- **`dict`**: *"Ogni valore deve essere associato in modo univoco a una chiave di ricerca."*

---

## 3. Le Liste (`list`)

Una lista è una sequenza ordinata e mutabile di elementi eterogenei.

```python
# Creazione di liste
numbers = [10, 20, 30, 40]
mixed = [1, "admin", True, 3.14]
empty_list = list()
```

### 3.1 Accesso, Slicing ed Aliasing

Gli elementi delle liste sono accessibili tramite indice `0-based` o indici negativi:

```python
ips = ["192.168.1.1", "10.0.0.1", "172.16.0.1"]

print(ips[0])   # "192.168.1.1"
print(ips[-1])  # "172.16.0.1" (ultimo elemento)

# Slicing: ips[start:stop:step]
sub_ips = ips[0:2] # ["192.168.1.1", "10.0.0.1"]
```

#### Attenzione all'Aliasing (Assegnazione vs Copia Superficiale)
In Python, l'assegnazione tra liste **non crea un nuovo oggetto**, ma copia il riferimento in memoria:

```python
a = [1, 2, 3]
b = a  # Aliasing: b punta alla STESSA memoria di a

b.append(4)
print(a)  # Output: [1, 2, 3, 4] -> a è stata modificata!

# Per creare una copia indipendente (Shallow Copy):
b_copy = a.copy()
# Oppure: b_copy = a[:] oppure b_copy = list(a)
```

### 3.2 Modifica e Manipolazione delle Liste

#### Aggiunta di elementi
- **`append(val)`**: Aggiunge `val` in coda come singolo elemento.
- **`insert(idx, val)`**: Inserisce `val` all'indice specificato `idx`.
- **`extend(iterable)`**: Estende la lista concatenando ciascun elemento dell'iterabile.

```python
logs = ["AUTH_OK"]
logs.append("AUTH_FAIL")              # ['AUTH_OK', 'AUTH_FAIL']
logs.insert(0, "SYSTEM_START")         # ['SYSTEM_START', 'AUTH_OK', 'AUTH_FAIL']
logs.extend(["LOGOUT", "PORT_SCAN"])   # ['SYSTEM_START', 'AUTH_OK', 'AUTH_FAIL', 'LOGOUT', 'PORT_SCAN']
```

#### Rimozione di elementi
- **`remove(val)`**: Rimuove la *prima occorrenza* di `val`. Solleva `ValueError` se `val` non esiste.
- **`pop(idx=-1)`**: Rimuove e *restituisce* l'elemento all'indice `idx` (default: ultimo elemento). Solleva `IndexError` se la lista è vuota.
- **`del list[idx]`**: Rimuove l'elemento o lo slice all'indice indicato.
- **`clear()`**: Svuota completamente la lista.

```python
ports = [22, 80, 443, 8080]
ports.remove(80)         # [22, 443, 8080]
last_port = ports.pop()  # 8080; ports diventa [22, 443]
del ports[0]             # [443]
ports.clear()            # []
```

### 3.3 Ricerca ed Ordinamento

```python
services = ["ssh", "http", "https", "ssh"]

# Ricerca
print("ssh" in services)      # True
print(services.index("https")) # 2
print(services.count("ssh"))   # 2

# Ordinamento in-place (modifica la lista)
services.sort()               # ['http', 'https', 'ssh', 'ssh']
services.sort(reverse=True)   # ['ssh', 'ssh', 'https', 'http']

# Ordinamento non distruttivo (restituisce una nuova lista)
original = [3, 1, 4, 2]
sorted_list = sorted(original) # original resta [3, 1, 4, 2]
```

#### Ordinamento personalizzato con `key` e `lambda`
```python
users = [("alice", 3), ("bob", 1), ("charlie", 2)]

# Ordina in base al secondo elemento (livello di privilegio)
users.sort(key=lambda item: item[1])
# Risultato: [('bob', 1), ('charlie', 2), ('alice', 3)]
```

---

## 4. Le Tuple (`tuple`) e l'Unpacking

Una tupla è una sequenza **ordinata ma immutabile**. Una volta creata, non è possibile aggiungere, rimuovere o modificare elementi.

```python
# Creazione
server_config = ("192.168.1.100", 8080, True)
single_tuple = (42,) # Nota la virgola finale necessaria per le tuple con un solo elemento!
```

### Perché usare una Tupla?
1. **Invarianza**: Garantisce l'integrità dei dati (es. coordinate, record DB, impostazioni di rete).
2. **Efficienza**: Occupano meno memoria e hanno prestazioni di lettura superiori rispetto alle liste.
3. **Chiave nei Dizionari**: Poiché sono immutabili (e *hashable*), possono essere usate come chiavi nei dizionari (a differenza delle liste).

### Tuple Unpacking ed Extended Unpacking
L'unpacking consente di distribuire gli elementi di una tupla in variabili distinte:

```python
host, port, is_active = server_config
print(host)      # "192.168.1.100"
print(port)      # 8080

# Scambio elegante di variabili senza variabile temporanea
a, b = 10, 20
a, b = b, a      # a=20, b=10

# Extended Unpacking con l'operatore *
first, *middle, last = [10, 20, 30, 40, 50]
print(first)   # 10
print(middle)  # [20, 30, 40]
print(last)    # 50
```

### Named Tuple (`collections.namedtuple`)
Le `namedtuple` consentono di accedere agli elementi sia per indice che tramite nomi di campo leggibili:

```python
from collections import namedtuple

Header = namedtuple("Header", ["ip_src", "ip_dst", "port"])
packet = Header("10.0.0.1", "192.168.1.1", 443)

print(packet.ip_src) # "10.0.0.1"
print(packet[2])     # 443
```

---

## 5. Gli Insiemi (`set`) e le Operazioni Insiemistiche

Un `set` è una collezione **non ordinata**, **mutabile** di elementi **unici** e immutabili (*hashable*).

```python
# Creazione
allowed_ips = {"192.168.1.1", "10.0.0.5"}
empty_set = set() # Attenzione: {} crea un dizionario vuoto!

# Rimozione automatica dei duplicati
raw_logs = ["10.0.0.1", "10.0.0.2", "10.0.0.1", "10.0.0.3"]
unique_ips = set(raw_logs) # {'10.0.0.1', '10.0.0.2', '10.0.0.3'}
```

### Operazioni sui Set
- **`add(elem)`**: Aggiunge un elemento.
- **`update(iterable)`**: Aggiunge molteplici elementi.
- **`remove(elem)`**: Rimuove l'elemento (solleva `KeyError` se assente).
- **`discard(elem)`**: Rimuove l'elemento in modo sicuro (nessun errore se assente).

### Operazioni Insiemistiche Matematiche
I `set` forniscono operatori e metodi ad altissima velocità per l'analisi comparativa dei dati:

```python
admin_users = {"alice", "bob", "charlie"}
logged_in_users = {"bob", "charlie", "david"}

# 1. Unione (|) -> Tutti gli utenti presenti in almeno un insieme
all_users = admin_users | logged_in_users  # {'alice', 'bob', 'charlie', 'david'}

# 2. Intersezione (&) -> Utenti admin attualmente connessi
active_admins = admin_users & logged_in_users # {'bob', 'charlie'}

# 3. Differenza (-) -> Admin non connessi
offline_admins = admin_users - logged_in_users # {'alice'}

# 4. Differenza Simmetrica (^) -> Utenti che non sono sia admin che connessi
exclusive_users = admin_users ^ logged_in_users # {'alice', 'david'}
```

---

## 6. I Dizionari (`dict`) e Strutture Annidate

Un dizionario è una collezione di coppie **chiave-valore**. Le chiavi devono essere uniche ed immutabili (stringhe, numeri, tuple), mentre i valori possono essere di qualsiasi tipo.

```python
server = {
    "hostname": "srv-sec-01",
    "ip": "10.0.0.254",
    "services": ["ssh", "wireguard"],
    "active": True
}
```

### 6.1 Lettura Sicura con `get()` e Manipolazione

L'accesso diretto `server["port"]` solleva `KeyError` se la chiave non esiste. È preferibile usare `.get()`:

```python
# .get(chiave, valore_default)
port = server.get("port", 22) # Restituisce 22 poiché "port" non esiste
```

#### Inserimento, Modifica e Rimozione
```python
server["port"] = 2222                 # Inserimento / Aggiornamento
services = server.pop("services")      # Rimuove la chiave e restituisce il valore
del server["active"]                  # Rimuove la chiave
server.clear()                        # Svuota il dizionario
```

### 6.2 Iterare sui Dizionari

```python
user_roles = {"alice": "admin", "bob": "analyst", "charlie": "guest"}

# Iterare sulle chiavi (comportamento default)
for user in user_roles:
    print(user)

# Iterare sui valori
for role in user_roles.values():
    print(role)

# Iterare su coppie (chiave, valore) con .items()
for user, role in user_roles.items():
    print(f"Utente {user} ha ruolo {role}")
```

### 6.3 Strutture Dati Annidate
Nel mondo reale i dati sono spesso organizzati in liste di dizionari o dizionari annidati:

```python
network_devices = [
    {
        "id": "dev-01",
        "type": "router",
        "interfaces": {"eth0": "192.168.1.1", "eth1": "10.0.0.1"}
    },
    {
        "id": "dev-02",
        "type": "firewall",
        "interfaces": {"eth0": "192.168.1.254"}
    }
]

# Accedere all'IP eth0 del router
router_eth0 = network_devices[0]["interfaces"]["eth0"] # "192.168.1.1"
```

---

## 7. Comprehensions e Generatori

Le **Comprehensions** forniscono una sintassi concisa e pythonica per creare collezioni trasformando ed filtrando iterabili.

### 7.1 List Comprehension
Sintassi: `[espressione for elemento in iterabile if condizione]`

```python
# Approccio tradizionale con for
squares = []
for x in range(10):
    if x % 2 == 0:
        squares.append(x**2)

# Equivalente con List Comprehension
squares = [x**2 for x in range(10) if x % 2 == 0]
# [0, 4, 16, 36, 64]
```

### 7.2 Dictionary & Set Comprehension

```python
# Set Comprehension (elimina duplicati e applica trasformazione)
words = ["ADMIN", "User", "admin", "GUEST", "guest"]
clean_roles = {w.lower() for w in words} # {'admin', 'user', 'guest'}

# Dictionary Comprehension
ips = ["192.168.1.1", "10.0.0.1"]
ip_status = {ip: "ACTIVE" for ip in ips}
# {'192.168.1.1': 'ACTIVE', '10.0.0.1': 'ACTIVE'}
```

### 7.3 Generator Expression (Efficienza della Memoria)
Sostituendo le parentesi quadre `[]` con le tonde `()`, si ottiene un **Generator Expression**. Un generatore non crea l'intera lista in memoria, ma calcola i valori *on-demand*:

```python
# List comprehension: Alloca 1.000.000 di elementi in RAM
large_list = [x * 2 for x in range(1000000)]

# Generator expression: Consumo di memoria quasi zero!
large_gen = (x * 2 for x in range(1000000))

print(next(large_gen)) # 0
print(next(large_gen)) # 2

# Nota: un generatore si consuma man mano che viene iterato!
```

---

## 8. Funzioni Helper per Collezioni & Unpacking Avanzato

### 8.1 `zip()`, `map()` e `filter()`

- **`zip(*iterables)`**: Combina in parallelo elementi di più iterabili in tuple.
- **`map(function, iterable)`**: Applica una funzione a ciascun elemento.
- **`filter(function, iterable)`**: Filtra gli elementi mantenendo quelli per cui la funzione restituisce `True`.

```python
users = ["alice", "bob", "charlie"]
ports = [22, 80, 443]

# Creare un dizionario associando gli elementi in parallelo con zip()
user_ports = dict(zip(users, ports))
# {'alice': 22, 'bob': 80, 'charlie': 443}

# map e filter
numbers = [1, 2, 3, 4, 5, 6]
evens = list(filter(lambda x: x % 2 == 0, numbers)) # [2, 4, 6]
squared = list(map(lambda x: x**2, evens))           # [4, 16, 36]
```

### 8.2 Unpacking negli Argomenti con `*` e `**`

- **`*` (Positional Unpacking)**: Decomprime una lista/tupla in argomenti posizionali.
- **`**` (Keyword Unpacking)**: Decomprime un dizionario in argomenti con nome.

```python
def setup_connection(host, port, use_ssl):
    print(f"Connessione a {host}:{port} (SSL: {use_ssl})")

config_tuple = ("10.0.0.1", 443, True)
setup_connection(*config_tuple)

config_dict = {"host": "10.0.0.1", "port": 443, "use_ssl": True}
setup_connection(**config_dict)
```

---

## 9. Strutture LIFO e FIFO (Stack e Queue)

- **Stack (LIFO - Last In, First Out)**: Gestito in Python tramite una semplice `list` usando `.append()` per il push e `.pop()` per il pop.
- **Queue (FIFO - First In, First Out)**: L'uso di `list.pop(0)` è inefficiente (complessità $\mathcal{O}(n)$). Si utilizza `collections.deque` che offre rimozioni in coda e in testa ad alta velocità ($\mathcal{O}(1)$).

```python
from collections import deque

# Queue (FIFO)
job_queue = deque(["task1", "task2", "task3"])
job_queue.append("task4")      # Enqueue
current_job = job_queue.popleft() # Dequeue -> "task1"
```

---

## 10. Sintesi: Tabella di Selezione Rapida

| Scenario di Utilizzo | Struttura Consigliata | Motivazione Tecnico-Architetturale |
| :--- | :--- | :--- |
| Sequenza ordinata di pacchetti o log | `list` | Supporta l'ordine temporale e la modifica dinamica. |
| Coordinate GPS, tuple di configurazione DB | `tuple` | Garantisce l'immutabilità dei dati ed è usabile come chiave dict. |
| Insieme di IP univoci bloccati dal Firewall | `set` | Test d'appartenenza istantaneo ($\mathcal{O}(1)$) ed elisione duplicati. |
| Anagrafica utente, configurazione di un servizio | `dict` | Associazione rapida per chiave univoca con valori di tipo libero. |
| Coda di elaborazione pacchetti / task scheduler | `collections.deque` | Operazioni di inserimento ed estrazione in testa/coda in tempo costante. |
