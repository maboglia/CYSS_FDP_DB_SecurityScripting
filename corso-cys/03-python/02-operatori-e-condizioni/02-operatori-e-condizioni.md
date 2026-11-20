# Modulo 3: Python
## 02 — Operatori di Confronto e Strutture Condizionali

---

### Obiettivi della Lezione
Al termine di questa lezione sarai in grado di:
- Utilizzare gli operatori di confronto relazionali per confrontare valori e tipi differenti.
- Distinguere con precisione l'assegnazione (`=`), l'uguaglianza di valore (`==`) e l'identità di memoria (`is`).
- Strutturare il controllo del flusso mediante i blocchi `if`, `elif` ed `else`.
- Comprendere il ruolo fondamentale dell'indentazione in Python per definire i blocchi di codice.
- Combinare condizioni complesse con gli operatori logici `and`, `or` e `not` rispettandone la precedenza.
- Riconoscere i valori **truthy** e **falsy** ed esprimere condizioni in modo "pythonico".
- Sfruttare la **short-circuit evaluation** per scrivere codice difensivo ed evitare errori a runtime (es. `IndexError`, `AttributeError`, divisione per zero).
- Scrivere espressioni condizionali sintetiche (operatore ternario) e confronti concatenati eleganti.
- Applicare lo structural pattern matching con `match ... case` (Python 3.10+).

---

### 1. Operatori di Confronto e Uguaglianza

Le strutture di controllo permettono a un programma di prendere decisioni sulla base del valore di verità (vero o falso) delle espressioni. Il risultato di un confronto è sempre un valore booleano (`True` o `False`).

#### Operatori Relazionali
Python mette a disposizione i classici operatori di confronto:

| Operatore | Significato | Esempio | Risultato (se `a=10, b=5`) |
| :--- | :--- | :--- | :--- |
| `==` | Uguale a | `a == b` | `False` |
| `!=` | Diverso da | `a != b` | `True` |
| `>` | Maggiore di | `a > b` | `True` |
| `<` | Minore di | `a < b` | `False` |
| `>=` | Maggiore o uguale a | `a >= 10` | `True` |
| `<=` | Minore o uguale a | `b <= 4` | `False` |

```python
x = 15
y = 20

print(x < y)   # Stampa: True
print(x == y)  # Stampa: False
```

#### Diffida dal Confondere `=` e `==`
Uno degli errori più comuni per chi inizia è confondere l'operatore di assegnazione con l'operatore di confronto:
* `=` **Assegna** un valore a una variabile (`age = 20`).
* `==` **Confronta** due valori restituendo un booleano (`age == 20`).

#### Confronto tra Stringhe
In Python è possibile confrontare anche le stringhe:
```python
print("python" == "python")  # True
print("Python" == "python")  # False (distingue maiuscole e minuscole)
print("apple" < "banana")    # True (confronto in base ai codici Unicode)
```
> **Nota**: Il confronto tra stringhe avviene in ordine alfabetico/lexicografico basato sui codici dei caratteri Unicode (dove le lettere maiuscole precedono le minuscole).

#### Uguaglianza (`==`) vs Identità (`is`)
È fondamentale comprendere la differenza tra l'operatore `==` e l'operatore `is`:
* `==` verifica se due variabili hanno **lo stesso valore**.
* `is` (o `is not`) verifica se due variabili si riferiscono **allo stesso oggetto in memoria**.

```python
lista_a = [1, 2, 3]
lista_b = [1, 2, 3]

print(lista_a == lista_b)  # True (il contenuto è identico)
print(lista_a is lista_b)  # False (sono due oggetti distinti in memoria)
```
Per verificare l'uguaglianza tra dati o variabili si usa di norma `==`. L'operatore `is` viene impiegato principalmente per il confronto con `None` (`if val is None:`).

---

### 2. Strutture Condizionali: `if`, `elif`, `else`

In un programma sequenziale le istruzioni vengono eseguite dall'alto verso il basso. Le **istruzioni condizionali** consentono di deviare questo flusso prendendo decisioni in base al contesto.

```text
Flusso Lineare:        Flusso Condizionale:
   Istruzione 1               Condizione?
        │                       ├── [Vero]  ──> Ramo IF
        ▼                       └── [Falso] ──> Ramo ELSE
   Istruzione 2
```

#### L'istruzione `if` e la Regola dell'Indentazione
L'istruzione `if` esegue il blocco di codice sottostante solo se la condizione associata è vera.

```python
port = 22

if port == 22:
    print("Porta SSH identificata.")
    print("Avvio scansione di sicurezza...")
```

> **L'Indentazione in Python**: A differenza di altri linguaggi che usano parentesi graffe `{ }`, Python utilizza l'**indentazione** (di norma **4 spazi**) per definire i blocchi di codice. I due punti `:` al termine della condizione indicano l'inizio del blocco indentato.

```python
if True:
    print("Questa riga è nel blocco if")
print("Questa riga viene eseguita SEMPRE (fuori dal blocco if)")
```

#### L'istruzione `if ... else`
Quando si desidera gestire sia l'eventualità in cui la condizione sia vera, sia quella in cui sia falsa, si utilizza la clausola `else`:

```python
user_role = "guest"

if user_role == "admin":
    print("Accesso completo autorizzato.")
else:
    print("Accesso limitato alla modalità lettura.")
```

#### Scelte Multiple con `if ... elif ... else`
Quando vi sono più di due alternative mutually exclusive, si inseriscono uno o più blocchi `elif` (abbreviazione di *else if*):

```python
score = 85

if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
else:
    grade = "F"

print(f"Valutazione: {grade}")  # Valutazione: B
```

> **L'ordine conta**: Python valuta le condizioni dall'alto verso il basso. Non appena trova una condizione vera, esegue il relativo blocco e ignora tutti i successivi `elif` ed `else`. È buona norma posizionare prima le condizioni più restrittive o specifiche.

---

### 3. Operatori Logici e Precedenza

Per costruire condizioni composte si combinano più confronti mediante gli operatori logici: `and`, `or`, `not`.

#### La Tavola della Verità Sintetica

| Operatore | Descrizione | Regola |
| :--- | :--- | :--- |
| `and` | E logico | Restituisce `True` **solo se tutte** le condizioni sono vere. |
| `or` | O logico | Restituisce `True` se **almeno una** condizione è vera. |
| `not` | Negazione | Inverte il valore di verità (`True` diventa `False` e viceversa). |

```python
is_admin = True
has_2fa = False

# and
print(is_admin and has_2fa)  # False

# or
print(is_admin or has_2fa)   # True

# not
print(not has_2fa)            # True
```

#### Ordine di Precedenza degli Operatori Logici
Quando un'espressione contiene diversi operatori logici, Python li valuta rispettando il seguente ordine di priorità:
1. `not` (priorità massima)
2. `and`
3. `or` (priorità minima)

L'espressione `True or False and False` viene valutata come `True or (False and False)` $\rightarrow$ `True`.
Per evitare ambiguità e rendere il codice leggibile, è consigliabile **usare sempre le parentesi tonde** nelle condizioni composte:

```python
age = 25
is_employee = True
has_badge = False

if (is_employee and has_badge) or age >= 65:
    print("Accesso consentito")
```

---

### 4. Truthy, Falsy e Short-Circuit Evaluation

#### Valori Truthy e Falsy
In Python qualsiasi oggetto può essere valutato direttamente all'interno di una condizione booleana, senza dover effettuare un confronto esplicito (`if x == True:`).

Sono valutati come **Falsy** (falsi):
* Il valore booleano `False`
* Il valore nullo `None`
* Il numero intero `0` e il float `0.0`
* La stringa vuota `""`
* Le collezioni vuote: lista `[]`, tupla `()`, dizionario `{}`, insieme `set()`

Tutti gli altri valori e collezioni non vuote sono valutati come **Truthy** (veri).

```python
# Modello Pythonico per verificare se una lista o stringa contiene elementi:
username = "admin"
logs = ["log1.txt", "log2.txt"]

if username:
    print(f"Utente attivo: {username}")

if logs:
    print(f"Trovati {len(logs)} file di log da analizzare.")
```

#### Short-Circuit Evaluation (Valutazione a Corto Circuito)
Python valuta le espressioni logiche in modo intelligente da sinistra verso destra e si interrompe non appena il risultato finale è matematicamente certo:
* **Con `and`**: Se il primo operando è *falsy*, Python **non valuta** il secondo operando (il risultato sarà certamente falso).
* **Con `or`**: Se il primo operando è *truthy*, Python **non valuta** il secondo operando (il risultato sarà certamente vero).

#### Uso Difensivo di Short-Circuit in Scripting e Sicurezza
La short-circuit evaluation permette di prevenire errori critici a runtime (come `IndexError`, `ZeroDivisionError` o `AttributeError` su oggetti `None`):

```python
# 1. Prevenire IndexError su liste vuote
active_tokens = []
if active_tokens and active_tokens[0] == "SECRET_KEY":
    print("Token valido")
else:
    print("Nessun token disponibile o non valido")

# 2. Prevenire AttributeError o None-Type Errors
user_object = None
if user_object is not None and user_object.is_authenticated():
    print("Utente autenticato")

# 3. Prevenire ZeroDivisionError nei calcoli
total_requests = 0
failed_requests = 5
if total_requests > 0 and (failed_requests / total_requests) > 0.1:
    print("Allarme: tasso di errore elevato")
```

#### Ritorno degli Operandi con `and` ed `or`
In Python gli operatori `and` ed `or` non restituiscono strettamente un booleano `True`/`False`, ma **l'ultimo operando valutato**. Questo consente di scrivere pattern di fallback molto usati negli script:

```python
# Pattern Fallback con 'or'
input_user = ""
db_user = input_user or "guest"
print(db_user)  # Stampa "guest" poiché "" è falsy

# Pattern Guard con 'and'
status = "OK"
result = status and "Operazione Completata"
print(result)  # Stampa "Operazione Completata"
```

---

### 5. Sintassi Avanzate ed Eleganti

#### Confronti Concatenati
In Python è possibile concatenare gli operatori di confronto esattamente come nella notazione matematica:

```python
port = 443

# Forma classica:
if port >= 1 and port <= 1024:
    print("Porta riservata / Well-known port")

# Forma concatenata (Pythonica):
if 1 <= port <= 1024:
    print("Porta riservata / Well-known port")
```

#### Espressione Condizionale (Operatore Ternario)
L'espressione condizionale permette di selezionare un valore in base a una condizione su una singola riga di codice:

```python
valore_se_vero if condizione else valore_se_falso
```

```python
status_code = 200

# Assegnazione condizionale
message = "Successo" if status_code == 200 else "Errore"
print(message)  # Successo
```
> **Quando usarlo**: Utilizzalo soltanto per assegnazioni semplici e immediate. Se la logica richiede ramificazioni multiple (`elif`), utilizza sempre il blocco `if ... elif ... else` standard per garantire la leggibilità del codice.

#### Structural Pattern Matching (`match ... case`)
A partire da Python 3.10+, la struttura `match ... case` consente di effettuare il pattern matching su valori discreti, offrendo una sintassi più chiara rispetto a lunghe sequenze di `elif`.

```python
http_status = 404

match http_status:
    case 200:
        print("OK: Richiesta completata con successo.")
    case 301 | 302:
        print("Reindirizzamento.")
    case 403:
        print("Accesso Negato (Forbidden).")
    case 404:
        print("Risorsa non trovata (Not Found).")
    case _:
        print(f"Codice di stato non gestito: {http_status}")
```

Il simbolo `_` (underscore) agisce da valore predefinito (wildcard/default case), analogo al blocco `else`.

---

### Summary Checklist
- [x] Utilizzi `=` per l'assegnazione e `==` per verificare l'uguaglianza dei valori.
- [x] Impieghi l'indentazione costante di 4 spazi per delimitare i blocchi condizionali.
- [x] Sfrutti `if`, `elif`, `else` organizzando le condizioni dalla più restrittiva alla più generale.
- [x] Conosci la precedenza degli operatori logici (`not` > `and` > `or`) ed usi le parentesi nei casi complessi.
- [x] Riconosci i valori *falsy* (`False`, `None`, `0`, `""`, `[]`, `{}`) e scrivi verifiche booleane sintetiche.
- [x] Sfrutti la *short-circuit evaluation* per proteggere lo script da errori di indice, divisioni per zero o accessi a variabili nulle.
- [x] Utilizzi i confronti concatenati (`a <= x <= b`) e l'operatore ternario per un codice pulito ed elegante.
