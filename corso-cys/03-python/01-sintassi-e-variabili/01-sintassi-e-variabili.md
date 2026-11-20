# Modulo 3: Python — 01. Sintassi e Variabili

Benvenuti al primo modulo dedicato alla programmazione in **Python**. In questa dispensa affronteremo i concetti fondamentali del linguaggio: dall'ambiente di esecuzione e la gestione delle variabili, fino all'utilizzo dei tipi di dato base, degli operatori aritmetici, delle stringhe, delle conversioni di tipo e della formattazione dell'output con le f-string.

---

## 1. Introduzione a Python e Ambiente di Esecuzione

### 1.1 Che cos'è Python?
Python è un linguaggio di programmazione ad alto livello, multipiattaforma e a tipizzazione dinamica:
* **Ad alto livello**: offre un'astrazione elevata rispetto all'hardware del computer, permettendo di concentrarsi sulla risoluzione dei problemi anziché sulla gestione manuale della memoria.
* **Multipiattaforma**: lo stesso codice Python può essere eseguito su Windows, Linux e macOS.
* **A tipizzazione dinamica**: non è necessario dichiarare esplicitamente il tipo di una variabile prima di assegnarle un valore. Python determina il tipo a partire dal valore assegnato a runtime.

```python
# In Python i tipi vengono determinati automaticamente
age = 25          # int (intero)
name = "Mario"    # str (stringa)
price = 9.90      # float (numero decimale)
```

> **Nota didattica sull'esecuzione**: L'implementazione standard di Python (CPython) compila il codice sorgente in una forma intermedia chiamata *bytecode*, che viene poi eseguita dall'interprete Python (Virtual Machine).

### 1.2 REPL vs File `.py`
Python mette a disposizione due modalità principali di lavoro:
1. **REPL (Read-Eval-Print Loop)**: la console interattiva in cui ogni istruzione viene letta, valutata e mostrata immediatamente. È ideale per esperimenti veloci e verifiche di piccoli blocchi di codice.
2. **File `.py`**: file di testo contenenti lo script completo. Permettono di conservare, modificare, riutilizzare e condividere il programma.

```text
>>> 2 + 3
5
>>> print("Ciao Python")
Ciao Python
```

### 1.3 Stile Pythonico e Leggibilità
Uno dei principi guida di Python è la **leggibilità**. La scelta dei nomi delle variabili deve comunicare immediatamente il significato dei dati.

```python
# Codice meno espressivo:
a = 7.50
b = 4
c = a * b

# Codice chiaro e "pythonico":
item_price = 7.50
item_quantity = 4
total_cost = item_price * item_quantity
```

---

## 2. Variabili e Assegnazione

### 2.1 L'operatore di assegnazione (`=`)
Una **variabile** è un nome associato a un valore memorizzato nella memoria del computer. Per creare o aggiornare una variabile si utilizza l'operatore di assegnazione `=`.

```python
name = "Mario"
age = 25

print(name)
print(age)
```

> **Attenzione**: L'operatore `=` in Python non significa "uguale a" in senso matematico, ma va letto come: **"assegna il valore a destra alla variabile a sinistra"**.

### 2.2 Riassegnazione delle variabili
Poiché le variabili associano nomi a valori, una variabile può cambiare valore e tipo nel corso del programma:

```python
score = 10
print(score)  # Output: 10

score = 20
print(score)  # Output: 20
```

### 2.3 Regole di Naming e Convenzioni
I nomi delle variabili devono rispettare precise regole sintattiche:
* Possono contenere **lettere** (a-z, A-Z), **numeri** (0-9) e il carattere di sottolineatura (`_`).
* **Non possono iniziare con un numero** (es. `2items` è un errore sintattico).
* **Non possono contenere trattini (`-`)** o spazi (il trattino viene interpretato come operatore di sottrazione).
* Python è **case-sensitive**: `item`, `Item` e `ITEM` sono tre variabili distinte.
* Non si possono utilizzare le **parole chiave riservate** del linguaggio (`if`, `else`, `for`, `while`, `class`, `return`, `import`, ecc.) né sovrascrivere funzioni integrate come `print` o `type`.

```python
# Nomi validi
item_name = "Apple"
_price = 0.99
item1_quantity = 10

# Convenzione standard: snake_case
user_name = "Alice"
total_price = 15.75
items_in_stock = 230
```

---

## 3. Tipi di Dato Fondamentali e Type Hints

### 3.1 I quattro tipi base
Ogni valore in Python appartiene a un tipo di dato. I quattro tipi fondamentali sono:

| Tipo | Nome | Descrizione | Esempio |
| :--- | :--- | :--- | :--- |
| `int` | Intero | Numeri interi positivi o negativi | `42`, `-3` |
| `float` | Virgolamobile | Numeri decimali (separatore il punto `.`) | `9.99`, `3.14` |
| `str` | Stringa | Sequenza di caratteri racchiusa tra apici | `"Python"`, `'Milk'` |
| `bool` | Booleano | Valore di verità (attenzione alle maiuscole) | `True`, `False` |

```python
age = 25             # int
price = 9.99         # float (usare il punto, non la virgola)
product = "Milk"     # str
is_available = True  # bool
```

### 3.2 Ispezione con `type()`
La funzione integrata `type()` restituisce il tipo effettivo di un valore o di una variabile:

```python
print(type(25))        # <class 'int'>
print(type(3.14))      # <class 'float'>
print(type("Python"))  # <class 'str'>
print(type(True))      # <class 'bool'>
```

### 3.3 Introduzione ai Type Hints
In Python moderno è possibile aggiungere annotazioni esplicite di tipo (**type hints**). Queste indicazioni migliorano la documentazione del codice e l'analisi statica negli IDE, pur non modificando la natura dinamica di Python a runtime:

```python
age: int = 25
price: float = 9.99
name: str = "Mario"
is_active: bool = True
```

---

## 4. Operatori Aritmetici e Calcoli

Python mette a disposizione tutti gli operatori matematici fondamentali:

| Operatore | Significato | Esempio | Risultato |
| :---: | :--- | :---: | :---: |
| `+` | Somma | `5 + 2` | `7` |
| `-` | Sottrazione | `5 - 2` | `3` |
| `*` | Moltiplicazione | `5 * 2` | `10` |
| `/` | Divisione (restituisce sempre un `float`) | `5 / 2` | `2.5` |
| `//` | Divisione intera (quoziente intero) | `7 // 3` | `2` |
| `%` | Resto / Modulo | `7 % 3` | `1` |
| `**` | Potenza | `2 ** 3` | `8` |

### 4.1 Esempi pratici e applicazione del modulo (`%`)
L'operatore modulo `%` è particolarmente utile per verificare se un numero è pari o dispari (se `number % 2` è uguale a `0`, il numero è pari):

```python
a = 7
b = 3

print("Divisione float:", a / b)   # 2.3333333333333335
print("Divisione intera:", a // b) # 2
print("Resto (modulo):", a % b)    # 1
print("Potenza:", a ** b)          # 343
```

### 4.2 Precedenza degli operatori
Python rispetta le regole algebriche tradizionali. È possibile usare le parentesi tonde `()` per rendere esplicito l'ordine di valutazione:

```python
result1 = 10 + 5 * 2    # 20 (moltiplicazione prioritaria)
result2 = (10 + 5) * 2  # 30 (parentesi prioritarie)
```

---

## 5. Stringhe: Manipolazione, Slicing e Metodi

Una **stringa** è una sequenza immutabile di caratteri.

### 5.1 Caratteri speciali, Escape Sequence e Raw String
È possibile inserire caratteri speciali utilizzando il simbolo di escape `\`:
* `\n`: nuova riga
* `\t`: tabulazione
* `\"` o `\'`: virgolette o apici all'interno della stringa
* `\\`: backslash reale

```python
print("Prima riga\nSeconda riga")
print("Articolo:\tLatte\tPrezzo:\t1.50 €")
print("Ha detto: \"Python è fantastico\"")

# Raw string: disabilita l'interpretazione delle sequenze di escape (utile per percorsi Windows)
path = r"C:\Users\Studente\Documenti"
print(path)
```

### 5.2 Concatenazione e Ripetizione
* **Concatenazione (`+`)**: unisce due o più stringhe.
* **Ripetizione (`*`)**: ripete una stringa per un numero intero di volte.

```python
first = "Hello"
second = "World"
full_message = first + " " + second  # "Hello World"

repeat_text = "Ha" * 3               # "HaHaHa"
```

### 5.3 Indicizzazione e Lunghezza (`len`)
Ogni carattere occupa una posizione identificata da un **indice** che parte da `0`. Gli indici negativi permettono di accedere ai caratteri partendo dalla fine (`-1` indica l'ultimo carattere).

```text
 Stringa:  P   y   t   h   o   n
 Indici +: 0   1   2   3   4   5
 Indici -:-6  -5  -4  -3  -2  -1
```

```python
word = "Python"

print("Lunghezza:", len(word))  # Output: 6
print("Primo carattere:", word[0])   # Output: 'P'
print("Ultimo carattere:", word[-1]) # Output: 'n'
```

### 5.4 Slicing (`[start:end:step]`)
Lo **slicing** permette di estrarre porzioni di una sequenza. La sintassi è `stringa[start:end:step]`:
* `start`: indice iniziale (incluso).
* `end`: indice finale (escluso).
* `step`: passo dell'estrazione.

```python
text = "Programmazione"

print(text[0:4])   # "Prog" (indici 0, 1, 2, 3)
print(text[:7])    # "Program" (da inizio fino all'indice 6)
print(text[7:])    # "mazione" (dall'indice 7 fino alla fine)
print(text[::2])   # Prende un carattere ogni due
print(text[::-1])  # Inverte la stringa ("enoizammargorP")
```

### 5.5 Metodi principali delle stringhe
Le stringhe sono **immutabili**: i metodi non modificano la stringa originale, ma restituiscono una nuova stringa trasformata.

```python
text = "  Python è Potente  "

print(text.upper())        # "  PYTHON È POTENTE  "
print(text.lower())        # "  python è potente  "
print(text.strip())        # "Python è Potente" (rimuove spazi iniziali e finali)
print(text.replace("Potente", "Fantastico")) # Sostituisce sottostringa
print(text.find("Potente")) # Restituisce l'indice di inizio (o -1 se assente)
print(text.count("e"))     # Conta le occorrenze
print("report.pdf".endswith(".pdf")) # True (verifica estensione)
```

---

## 6. Input dell'Utente, Conversione di Tipi (Casting) e f-string

### 6.1 Acquisire dati con `input()`
La funzione `input()` interrompe l'esecuzione e attende l'inserimento da parte dell'utente.

> **Regola fondamentale**: `input()` restituisce **sempre** una stringa (`str`), anche se l'utente digita solo cifre numeriche.

```python
name = input("Inserisci il tuo nome: ")
print("Ciao,", name)
```

### 6.2 Conversione dei Tipi (Casting)
Per eseguire calcoli con i dati acquisiti da `input()`, è necessario convertire la stringa nel tipo numerico appropriato (`int()` o `float()`):

```python
# Errore comune senza casting:
# age = input("Età: ")
# print(age + 1) -> TypeError

# Corretto con casting esplicito:
age = int(input("Inserisci l'età: "))
next_year_age = age + 1

price = float(input("Inserisci il prezzo unitario: "))
quantity = int(input("Inserisci la quantità: "))
total = price * quantity
```

### 6.3 Formattazione dell'output con le f-string
Le **f-string** (stringhe formattate prefissate da `f`) permettono di incorporare variabili ed espressioni direttamente tra parentesi graffe `{}`:

```python
name = "Anna"
age = 25
price = 12.5

# Espressioni e variabili dentro f-string
print(f"Ciao {name}, tra 5 anni avrai {age + 5} anni.")

# Formattazione numerica: :.2f imposta 2 cifre decimali
print(f"Totale da pagare: {price:.2f} €")
```

---

## 7. Errori Comuni da Riconoscere

1. **`NameError`**: si verifica quando si tenta di utilizzare una variabile prima di averla definita.
   ```python
   print(total_cost) # NameError se total_cost non è stata assegnata
   ```
2. **`TypeError`**: si verifica quando si tenta un'operazione tra tipi incompatibili (es. concatenare stringa e numero senza casting).
   ```python
   print("Età: " + 25) # TypeError -> Usare f-string o str(25)
   ```
3. **`ValueError`**: si verifica quando una funzione di casting riceve una stringa non convertibile in numero.
   ```python
   number = int("abc") # ValueError
   ```
4. **`IndexError`**: si verifica quando si tenta di accedere a un indice diretto non presente nella stringa.
   ```python
   word = "Hi"
   print(word[5]) # IndexError
   ```

---

## 8. Riepilogo del Modulo

* Python è a tipizzazione dinamica; i tipi base sono `int`, `float`, `str` e `bool`.
* L'assegnazione si effettua con `=`; le variabili si nominano in `snake_case`.
* Le operazioni aritmetiche comprendono divisione float `/`, divisione intera `//`, modulo `%` e potenza `**`.
* Le stringhe sono sequenze immutabili indicizzate a partire da `0`, supportano lo slicing `[start:end:step]` e metodi di trasformazione.
* `input()` legge dati da tastiera sotto forma di `str`; per i calcoli è necessario effettuare il casting con `int()` o `float()`.
* Le **f-string** sono lo strumento standard per formattare testo e numeri con precisione (es. `{valore:.2f}`).
