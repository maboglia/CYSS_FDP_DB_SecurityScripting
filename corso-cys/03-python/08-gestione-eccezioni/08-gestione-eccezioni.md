# Modulo 08 — Gestione delle Eccezioni

La gestione delle eccezioni è un pilastro fondamentale nella costruzione di software robusto, affidabile e manutenibile. Un programma professionale non può limitarsi a funzionare nei casi ideali (*happy path*), ma deve prevedere, intercettare e gestire con grazia tutte le situazioni anomale che si possono verificare a runtime: input dell'utente non validi, risorse indisponibili, errori di rete o violazioni delle regole di dominio.

In questo modulo esploreremo la meccanica interna delle eccezioni in Python, la loro gerarchia, le strutture sintattiche di controllo (`try`, `except`, `else`, `finally`), le tecniche per generare e incatenare eccezioni, la creazione di eccezioni di dominio personalizzate, il confronto tra le filosofie EAFP e LBYL, la gestione sicura delle risorse con i Context Manager e gli anti-pattern da evitare assolutamente nella produzione del codice.

---

## 1. Introduzione alla Gestione degli Errori

### 1.1 Errore di Sintassi vs Eccezione a Runtime

In Python è essenziale distinguere nettamente tra due grandi categorie di problemi:

1. **Errori di Sintassi (`SyntaxError`)**: si verificano durante la fase di *parsing* del codice, prima ancora che il programma venga eseguito. Derivano da una violazione delle regole grammaticali del linguaggio (parentesi non chiuse, due punti mancanti, indentazione errata). Gli errori di sintassi **non possono essere catturati** tramite blocchi `try/except`: devono essere corretti dallo sviluppatore nel codice sorgente.

```python
# SyntaxError: mancavano i due punti ':' alla fine dell'if
if True
    print("Errore di sintassi")
```

2. **Eccezioni a Runtime (`Exception`)**: si verificano quando il codice è sintatticamente corretto, ma l'interprete incontra un'operazione che non può portare a termine durante l'esecuzione (es. divisione per zero, conversione di una stringa alfa-numerica in numero, accesso a un indice fuori intervallo). Le eccezioni interrompono il normale flusso di esecuzione se non vengono intercettate.

```python
# Sintassi corretta, ma genera ValueError durante l'esecuzione
numero = int("abc")
```

---

### 1.2 Anatomia di un'Eccezione non Gestita (Il Traceback)

Quando un'eccezione si verifica e non viene intercettata, Python arresta l'esecuzione del programma e stampa a schermo un **Traceback**. Il Traceback va letto dal basso verso l'alto:

```text
Traceback (most recent call last):
  File "main.py", line 12, in <module>
    calcola_media(dati)
  File "main.py", line 5, in calcola_media
    return somma / len(valori)
ZeroDivisionError: division by zero
```

- **Ultima riga**: mostra il tipo di eccezione (`ZeroDivisionError`) e la descrizione del problema (`division by zero`).
- **Righe precedenti**: mostrano lo *stack delle chiamate* (Call Stack), indicando i file, le funzioni e i numeri di riga attraversati fino al punto esatto dell'errore.

---

## 2. Il Costrutto `try ... except`

### 2.1 Sintassi Fondamentale e Meccanica di Esecuzione

L'istruzione `try` permette di isolare un blocco di codice potenziale fonte di errori, mentre la clausola `except` ne definisce la strategia di recupero.

```python
try:
    valore = int(input("Inserisci un numero intero: "))
    risultato = 100 / valore
    print(f"Risultato: {risultato}")
except ValueError:
    print("Errore: Non hai inserito un numero intero valido.")
except ZeroDivisionError:
    print("Errore: Impossibile dividere per zero.")
```

**Flusso di esecuzione**:
1. Python esegue le istruzioni contenute nel blocco `try`.
2. Se **non si verifica alcuna eccezione**, il blocco `except` viene completamente ignorato e l'esecuzione prosegue oltre.
3. Se **si verifica un'eccezione**, l'esecuzione nel blocco `try` viene immediatamente sospesa nel punto esatto dell'errore. Python cerca una clausola `except` compatibile con il tipo di eccezione sollevata.
4. Se viene trovata una corrispondenza, viene eseguito il blocco `except` corrispondente e il programma riprende normalmente dopo il costrutto `try/except`.
5. Se non viene trovata alcuna corrispondenza, l'eccezione viene *propagata* verso la funzione chiamante (o fino all'arresto del programma).

---

### 2.2 Il Principio del Minimo Codice Protetto

Un errore comune tra i principianti è racchiudere interi blocchi di programma all'interno di un unico grande `try`. Questo rende difficile capire quale istruzione specifica abbia generato l'errore e rischia di catturare involontariamente eccezioni non previste.

```python
# ANTI-PATTERN: Blocco try troppo esteso
try:
    nome = input("Nome: ")
    eta = int(input("Età: "))
    connessione = apri_db()
    salva_utente(connessione, nome, eta)
    stampa_conferma()
except Exception:
    print("Qualcosa è andato storto")

# BUONA PRATICA: Isolare solo le operazioni a rischio
nome = input("Nome: ")

try:
    eta = int(input("Età: "))
except ValueError:
    print("Età non valida.")
    eta = 0

# La logica del DB viene gestita separatamente con le sue eccezioni
```

---

### 2.3 Gestione di Eccezioni Multiple e Cattura dell'Oggetto Eccezione

È possibile gestire più eccezioni distinte tramite blocchi `except` separati, oppure raggruppare eccezioni affini in una tupla se la risposta all'errore è identica:

```python
try:
    dati = [10, 20, 30]
    indice = int(input("Inserisci indice (0-2): "))
    valore = dati[indice]
except (ValueError, IndexError) as e:
    print(f"Errore di input o di indice non valido: {e}")
```

La clausola `as e` cattura l'**istanza dell'oggetto eccezione**, consentendo di ispezionare il messaggio d'errore originale o registrarlo all'interno dei file di log.

---

## 3. Gerarchia delle Eccezioni in Python

Tutte le eccezioni integrate in Python costituiscono un'alberatura gerarchica orientata agli oggetti con radice in `BaseException`.

```text
BaseException
 ├── SystemExit
 ├── KeyboardInterrupt
 ├── GeneratorExit
 └── Exception  <-- Radice per tutte le eccezioni applicative
      ├── ArithmeticError
      │    ├── ZeroDivisionError
      │    └── OverflowError
      ├── LookupError
      │    ├── IndexError
      │    └── KeyError
      ├── ValueError
      ├── TypeError
      ├── OSError
      │    ├── FileNotFoundError
      │    └── PermissionError
      └── RuntimeError
```

### 3.1 Distinzione tra `BaseException` ed `Exception` 

- **`BaseException`**: è la superclasse di primissimo livello. Include eccezioni di sistema come `KeyboardInterrupt` (pressione di `Ctrl+C`) e `SystemExit` (chiamata a `sys.exit()`). Non si dovrebbe mai catturare direttamente `BaseException` o usare `except:` svincolato, altrimenti l'utente non riuscirà più ad arrestare lo script con la tastiera!
- **`Exception`**: è la superclasse da cui ereditano quasi tutte le eccezioni applicative customary e built-in.

---

### 3.2 L'Ordine Critico delle Clausole `except` 

Python valuta i blocchi `except` dall'alto verso il basso ed esegue il **primo** blocco il cui tipo coincide con l'eccezione o con una sua superclasse. Per questo motivo, **le eccezioni più specifiche (sottoclassi) devono sempre precedere quelle più generiche (superclassi)**.

```python
# ERRORE LOGICO: ZeroDivisionError non verrà MAI eseguito!
try:
    risultato = 10 / 0
except ArithmeticError:
    print("Errore aritmetico generico")
except ZeroDivisionError:
    print("Divisione per zero")  # Codice irraggiungibile!

# CORRETTO: Dalla sottoclasse più specifica alla superclasse
try:
    risultato = 10 / 0
except ZeroDivisionError:
    print("Gestione specifica per la divisione per zero")
except ArithmeticError:
    print("Gestione per altri errori aritmetici")
```

---

## 4. Il Ciclo Completo: `try`, `except`, `else`, `finally` 

Python mette a disposizione una struttura di controllo a quattro blocchi per gestire ogni fase del ciclo di vita di un'operazione rischiosa.

```python
try:
    # 1. Codice a rischio eccezione
    file = open("dati.txt", "r")
    contenuto = file.read()
except FileNotFoundError:
    # 2. Eseguito SOLO se si verifica l'eccezione specificata
    print("Errore: Il file dati.txt non esiste.")
else:
    # 3. Eseguito SOLO se il blocco try si è concluso SENZA eccezioni
    print(f"File letto con successo. Dimensione: {len(contenuto)} caratteri.")
finally:
    # 4. Eseguito SEMPRE, sia in caso di successo che di eccezione (gestita o non)
    print("Fase di pulizia: chiusura delle risorse.")
```

### 4.1 La Tabella di Esecuzione del Ciclo Completo

| Scenario | `try` | `except` | `else` | `finally` |
| :--- | :---: | :---: | :---: | :---: |
| **Nessun errore** | Eseguito | Ignorato | **Eseguito** | **Eseguito** |
| **Errore intercettato** | Interrotto | **Eseguito** | Ignorato | **Eseguito** |
| **Errore NON intercettato** | Interrotto | Ignorato | Ignorato | **Eseguito** (poi crash) |

### 4.2 Interazione tra `finally` e l'istruzione `return` 

Se all'interno del blocco `try` o `except` è presente un'istruzione `return`, la clausola `finally` viene comunque eseguita **prima** che la funzione restituisca il controllo al chiamante. Se anche il blocco `finally` contiene un `return`, questo sovrascriverà qualsiasi `return` precedente (pratica da evitare).

---

## 5. Generare e Rilanciare Eccezioni (`raise`)

### 5.1 L'istruzione `raise` per la Validazione

Non dobbiamo solo catturare eccezioni: le nostre funzioni e classi devono sollevare eccezioni quando ricevono argomenti non validi o quando si verificano violazioni del dominio applicativo.

```python
def imposta_eta(eta: int) -> None:
    if not isinstance(eta, int):
        raise TypeError(f"L'età deve essere un numero intero, ricevuto: {type(eta).__name__}")
    if eta < 0 or eta > 150:
        raise ValueError(f"L'età inserita ({eta}) non è compresa nell'intervallo valido [0-150].")
    print(f"Età impostata a: {eta}")
```

---

### 5.2 Rilanciare un'Eccezione (*Re-raising*)

A volte una funzione deve intercettare un'eccezione per eseguire un'azione locale (es. registrare un log), ma deve poi consentire all'eccezione di propagarsi al chiamante per la gestione finale. In questo caso si usa l'istruzione `raise` senza argomenti dentro il blocco `except`.

```python
def elabora_transazione(importo: float) -> None:
    try:
        invia_richiesta_bancaria(importo)
    except TimeoutError as e:
        logger.error(f"Timeout durante l'invio della transazione: {e}")
        raise  # Rilancia la medesima eccezione TimeoutError verso il chiamante
```

---

### 5.3 Exception Chaining (`raise ... from`)

Quando si cattura un'eccezione di basso livello e si sceglie di trasformarla in un'eccezione applicativa ad alto livello, è fondamentale preservare la causa originale attraverso la clausola `from` (*Exception Chaining*).

```python
class DatabaseError(Exception):
    """Eccezione applicativa per errori del livello di persistenza."""
    pass

def carica_profilo_utente(user_id: int):
    try:
        # Simulazione di un errore di connessione di basso livello
        raise ConnectionRefusedError("Impossibile connettersi al socket DB")
    except ConnectionRefusedError as e:
        # Incatenamento dell'eccezione: preserva la causa originale nello stack trace
        raise DatabaseError(f"Impossibile caricare l'utente {user_id}") from e
```

Se invece si desidera nascondere intenzionalmente l'eccezione sottostante (ad esempio per motivi di sicurezza o astrazione), si usa `from None`:

```python
try:
    chiave = mappa_segreta["chiave_mancante"]
except KeyError:
    raise AttributeLookupError("Accesso negato alla risorsa") from None
```

---

## 6. Eccezioni Personalizzate

Nelle applicazioni professionali non bisognerebbe dipendere esclusivamente dalle eccezioni built-in di Python (`ValueError`, `KeyError`), ma creare eccezioni di dominio ben definite che riflettono la semantica del sistema aziendale.

### 6.1 Creazione di una Gerarchia di Eccezioni di Dominio

Per definire un'eccezione personalizzata è sufficiente ereditare da `Exception` (o da una sua sottoclasse).

```python
# Superclasse generica per l'applicazione
class BankAppError(Exception):
    """Classe base per tutte le eccezioni del sistema bancario."""
    pass

class InsufficientFundsError(BankAppError):
    """Sollevata quando un conto non ha saldo sufficiente per l'operazione."""
    def __init__(self, saldo_attuale: float, importo_richiesto: float):
        self.saldo_attuale = saldo_attuale
        self.importo_richiesto = importo_richiesto
        super().__init__(
            f"Saldo insufficiente: disponibilità attuali {saldo_attuale:.2f} €, "
            f"richiesti {importo_richiesto:.2f} €."
        )

class AccountBlockedError(BankAppError):
    """Sollevata quando si tenta un'operazione su un conto bloccato."""
    pass
```

### 6.2 Utilizzo delle Eccezioni di Dominio

```python
class ContoBancario:
    def __init__(self, IBAN: str, saldo_iniziale: float):
        self.IBAN = IBAN
        self.saldo = saldo_iniziale
        self.bloccato = False

    def preleva(self, importo: float) -> None:
        if self.bloccato:
            raise AccountBlockedError(f"Il conto {self.IBAN} è bloccato.")
        if importo > self.saldo:
            raise InsufficientFundsError(self.saldo, importo)
        self.saldo -= importo
```

---

## 7. Filosofia e Modelli di Progettazione: EAFP vs LBYL

In Python esistono due filosofie di programmazione per la gestione dei casi d'errore:

### 7.1 LBYL (*Look Before You Leap*)

Consiste nel verificare preventivamente che tutte le precondizioni siano soddisfatte prima di eseguire un'operazione. È lo stile dominante in linguaggi come C o Java tradizionale.

```python
# Stile LBYL
if "chiave" in dizionario:
    valore = dizionario["chiave"]
else:
    valore = "default"
```

---

### 7.2 EAFP (*Easier to Ask Forgiveness than Permission*)

Consiste nel tentare direttamente l'operazione assumendo che abbia successo, intercettando l'eccezione qualora fallisca. **Questo è lo stile idiomatico in Python (Pythonic)**.

```python
# Stile EAFP
try:
    valore = dizionario["chiave"]
except KeyError:
    valore = "default"
```

### 7.3 Vantaggi dello Stile EAFP
1. **Prestazioni**: nei casi in cui l'operazione ha successo la stragrande maggioranza delle volte, EAFP evita l'overhead di controlli `if` ripetuti.
2. **Prevenzione di Race Conditions (TOCTOU)**: nell'accesso ai file su filesystem, verificare `if os.path.exists(path)` prima di `open(path)` lascia una finestra temporale (Time of Check to Time of Use) in cui un altro processo potrebbe cancellare il file. EAFP con `try: open(...) except FileNotFoundError:` è atomico e sicuro.

---

## 8. Gestione delle Risorse e Context Manager

### 8.1 Il Problema delle Risorse Pendenti

Quando un programma interagisce con risorse esterne (file, connessioni di rete, socket, lock di sincronizzazione), è fondamentale garantire che la risorsa venga **sempre rilasciata**, anche in presenza di eccezioni impreviste.

```python
# METODO VECCHIO / RISCHIOSO
file = open("report.csv", "w")
try:
    file.write("dati...")
    1 / 0  # Errore grave!
finally:
    file.close()  # Garanzia di chiusura, ma verbose
```

---

### 8.2 Il Costrutto `with` e il Protocollo Context Manager

Il costrutto `with` di Python automatizza la gestione delle risorse garantendo il rilascio in modo pulito ed elegante.

```python
# METODO PYTHONIC E SICURO
with open("report.csv", "w") as file:
    file.write("dati...")
    # Il file viene chiuso AUTOMATICAMENTE all'uscita dal blocco, anche se si verificano eccezioni!
```

### 8.3 Implementare un Context Manager con `__enter__` e `__exit__` 

Un'oggetto diventa un Context Manager implementando i metodi dunder `__enter__` e `__exit__`:

```python
class ConnessioneDatabaseSimulata:
    def __init__(self, db_name: str):
        self.db_name = db_name

    def __enter__(self):
        print(f"[DB] Connessione a {self.db_name} stabilita.")
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        print(f"[DB] Chiusura della connessione a {self.db_name}.")
        if exc_type is not None:
            print(f"[DB] Si è verificata un'eccezione di tipo {exc_type.__name__}: {exc_val}")
        # Restituire True per sopprimere l'eccezione, False per lasciarla propagare
        return False

# Utilizzo
with ConnessioneDatabaseSimulata("prod_db") as db:
    print("[DB] Esecuzione query in corso...")
```

---

## 9. Anti-Pattern ed Errori Comuni nella Gestione Eccezioni

### 9.1 Silenziare le Eccezioni (`except: pass`)

L'anti-pattern più pericoloso in Python consiste nell'intercettare qualsiasi errore per poi ignorarlo silenziosamente.

```python
# ANTI-PATTERN GRAVE: Nasconde qualsiasi bug, rendendo il debugging un incubo!
try:
    calcola_stipendi()
except:
    pass
```

### 9.2 Abuso delle Eccezioni per il Controllo del Flusso Ordinario

Non usare eccezioni per gestire il normale flusso algoritmico del programma (es. per uscire da un ciclo anziché usare `break`), in quanto il sollevamento di un'eccezione comporta un costo di calcolo elevato per la creazione del frame di stack.

### 9.3 Confusione tra `assert` e `raise` 

- **`assert`**: deve essere utilizzato **esclusivamente durante lo sviluppo e il testing** per verificare invarianti interne del codice. Gli `assert` possono essere disabilitati completamente dall'interprete a runtime usando l'opzione `-O` (*optimize*).
- **`raise`**: deve essere utilizzato per la **validazione dei dati a runtime** in produzione.

```python
# ERRATO per la validazione di input dell'utente:
assert prezzo > 0, "Prezzo non valido"  # Può essere ignorato con python -O script.py!

# CORRETTO:
if prezzo <= 0:
    raise ValueError("Prezzo deve essere positivo")
```

---

## 10. Summary e Mappa Concettuale del Modulo

1. **`try`**: isola le istruzioni a rischio.
2. **`except`**: intercetta tipi di eccezioni specifici (dalle sottoclassi alle superclassi).
3. **`else`**: eseguito solo se il `try` è andato a buon fine senza errori.
4. **`finally`**: eseguito sempre per la pulizia delle risorse.
5. **`raise`**: genera o rilancia eccezioni.
6. **`raise ... from ...`**: mantiene la traccia delle cause originali degli errori.
7. **Custom Exceptions**: ereditano da `Exception` e definiscono la semantica del dominio aziendale.
8. **Context Manager (`with`)**: la tecnica idiomatica per gestire in sicurezza il ciclo di vita delle risorse.
