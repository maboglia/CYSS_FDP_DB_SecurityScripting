# Modulo 03 — Python

Questo repository contiene i materiali didattici e gli appunti di laboratorio dedicati al **Modulo 03: Python**, parte integrante del corso universitario in **Fondamenti di Programmazione, Basi di Dati e Scripting per la Sicurezza**.

> 📌 **Nota sui materiali e fonti**:
> Tutti gli appunti, le dispense teoriche e la struttura degli esercizi presenti in questo modulo sono liberamente tratti dal libro **"Python Maledetto"**.
> È possibile consultare l'intero materiale originale, gli aggiornamenti ed ulteriori risorse di approfondimento direttamente sul repository ufficiale del corso disponibile su GitHub: **[Repo Corso Python su GitHub]**.

---

## 📚 Struttura del Modulo

Il percorso didattico è articolato in **8 sezioni progressive**, pensate per accompagnare lo studente dalla sintassi base fino alla progettazione di codice modulare, orientato agli oggetti e robusto. Ogni cartella contiene la dispensa teorica e una scheda separata di esercitazioni graduate.

---

### 01. Sintassi e Variabili (`01-sintassi-e-variabili`)
- **Descrizione**: Introduzione al linguaggio Python, all'ambiente di esecuzione REPL e alla scrittura dei primi script `.py`.
- **Contenuti principali**: Variabili e convenzioni di naming (`snake_case`), tipi di dato fondamentali (`int`, `float`, `str`, `bool`), annotazioni di tipo (*type hints*), operatori aritmetici, immutabilità e manipolazione avanzata delle stringhe (slicing e principali metodi), f-string, conversioni di tipo (*casting*) e gestione dell'input utente con `input()`.

---

### 02. Operatori e Condizioni (`02-operatori-e-condizioni`)
- **Descrizione**: Studio del controllo del flusso di esecuzione mediante strutture decisionali e valutazione di espressioni logiche.
- **Contenuti principali**: Operatori relazionali e di confronto (`==` vs `is`), sintassi `if`, `elif` ed `else`, l'importanza dell'indentazione, operatori logici (`and`, `or`, `not`) e relativa precedenza, concetti di valori *truthy* e *falsy*, la *short-circuit evaluation*, confronti concatenati, espressione condizionale (operatore ternario) e *structural pattern matching* con `match ... case`.

---

### 03. Cicli e Iterazioni (`03-cicli-e-iterazioni`)
- **Descrizione**: Meccanismi per la ripetizione di blocchi di codice e l'attraversamento efficiente di strutture dati.
- **Contenuti principali**: Il ciclo `for` e la funzione `range()`, iterazione su stringhe e dizionari, gestione degli indici con `enumerate()`, controllo del ciclo mediante `break` e `continue`, il costrutto `for ... else`, distinzione tra iterabili ed iteratori (`iter()`, `next()`), funzioni helper (`any()`, `all()`, `zip()`), il ciclo `while`, prevenzione dei cicli infiniti e analisi della complessità temporale dei cicli annidati ($\mathcal{O}(n)$, $\mathcal{O}(n^2)$).

---

### 04. Collezioni (`04-collezioni`)
- **Descrizione**: Analisi completa e comparativa delle strutture dati integrate in Python per la gestione di insiemi di informazioni correlate.
- **Contenuti principali**: Studio dettagliato di `list`, `tuple`, `set` e `dict`. Concetti di mutabilità, aliasing e copie superficiali (`.copy()`). Insiemi e operazioni algebriche insiemistiche (`union`, `intersection`, `difference`). Inizio dell'uso delle *comprehensions* (`list`, `set`, `dict`) e *generator expressions* per l'efficienza della memoria. Unpacking (`*` e `**`), `collections.namedtuple`, `map()`, `filter()`, Stack (LIFO) e Queue (FIFO).

---

### 05. Funzioni (`05-funzioni`)
- **Descrizione**: Principi di astrazione, modularizzazione e riuso del codice secondo il paradigma DRY (*Don't Repeat Yourself*).
- **Contenuti principali**: Definizione di funzioni con `def`, parametri posizionali e keyword, risoluzione dell'anti-pattern dei default mutabili (`None`), `return` multiplo e tuple unpacking, parametri variadici (`*args` e `**kwargs`), firme rigide con *positional-only* (`/`) e *keyword-only* (`*`), scope delle variabili e regola **LEGB** (`global` e `nonlocal`), documentazione tramite *docstring* (PEP 257) e *type hints* (PEP 484), lambda, funzioni di ordine superiore, *closures*, decoratori (`@functools.wraps`) e ricorsione.

---

### 06. Programmazione OOP (`06-programmazione-oop`)
- **Descrizione**: Progettazione e modellazione del software secondo il paradigma della Programmazione Orientata agli Oggetti (Object-Oriented Programming).
- **Contenuti principali**: Concetto di classe e istanza, il parametro `self`, il costruttore `__init__()`, attributi d'istanza e di classe. Distinzione tra metodi d'istanza, metodi di classe (`@classmethod` come *factory methods*) e metodi statici (`@staticmethod`). Incapsulamento (`_` e `__`), gestione dello stato tramite `@property`. Metodi speciali *dunder* (`__str__`, `__repr__`, `__eq__`, overloading operatori). Ereditarietà singola e multipla, **MRO** (Method Resolution Order), classi astratte (`abc.ABC`), polimorfismo, Duck Typing, composizione ed utilizzo pratico delle `@dataclass`.

---

### 07. Moduli e Librerie (`07-moduli-e-librerie`)
- **Descrizione**: Organizzazione del codice su più file, architettura a pacchetti e riutilizzo dell'ecosistema di librerie Python.
- **Contenuti principali**: Distinzione tra moduli, package, librerie e framework. Sintassi di `import` e prevenzione dell'inquinamento del namespace. Il guardiano `if __name__ == "__main__":`. Esplorazione approfondita della Standard Library (`math`, `random`, `datetime`, `pathlib`, `os`, `sys`, `collections`, `re`, `csv`, `json`, `logging`). Creazione di package con `__init__.py` e import relativi. Gestione degli ambienti virtuali (`venv`), pacchetti esterni via `pip`, file `requirements.txt` e sicurezza nelle dipendenze.

---

### 08. Gestione Eccezioni (`08-gestione-eccezioni`)
- **Descrizione**: Tecniche per rendere il software robusto, sicuro e tollerante agli errori durante l'esecuzione.
- **Contenuti principali**: Distinzione tra errori di sintassi (`SyntaxError`) ed eccezioni a runtime. Lettura e interpretazione del Traceback. Struttura del costrutto `try ... except ... else ... finally`. Gerarchia delle eccezioni (`BaseException` vs `Exception`) e corretto ordine di cattura. Sollevamento manuale con `raise`, *re-raising* ed *Exception Chaining* (`raise ... from`). Creazione di eccezioni di dominio personalizzate. Paradigmi di programmazione **EAFP** (*Easier to Ask Forgiveness than Permission*) e **LBYL** (*Look Before You Leap*). Gestione sicura delle risorse con il costrutto `with` e creazione di Context Manager (`__enter__` / `__exit__`).

---

## 🛠️ Come Utilizzare questo Repository

1. **Percorso Teorico**: Consulta i file `.md` principali all'interno di ciascuna cartella numerata (es. `01-sintassi-e-variabili/01-sintassi-e-variabili.md`).
2. **Esercitazioni Pratiche**: Per ciascun argomento è disponibile una scheda di esercizi dedicata (`esercitazioni-XX-....md`), organizzata su 4 livelli di difficoltà crescente e completata da tutte le soluzioni commentate.
3. **Esecuzione del Codice**: Si consiglia di clonare il repository ed eseguire gli esempi e le esercitazioni in un ambiente virtuale Python 3 aggiornato.

```bash
# Esempio di esecuzione di uno script
python3 01-sintassi-e-variabili/script_esempio.py
```
