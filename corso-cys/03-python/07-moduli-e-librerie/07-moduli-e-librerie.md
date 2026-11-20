# Modulo 07 — Moduli e Librerie

## 1. Architettura e Organizzazione del Codice

Nello sviluppo di software professionale, la gestione della complessità è una delle sfide principali. Man mano che un'applicazione cresce, inserire tutto il codice in un singolo file rende la manutenzione difficile, aumenta il rischio di errori e impedisce il riutilizzo efficiente dei componenti.

Python affronta questa sfida fornendo un sistema gerarchico di organizzazione del codice suddiviso in quattro livelli:

*   **Modulo**: Un singolo file con estensione `.py` contenente definizioni di funzioni, classi, variabili ed istruzioni eseguibili.
*   **Package**: Una cartella contenente uno o più moduli organizzati gerarchicamente, contraddistinta (nelle strutture tradizionali e formalizzate) dalla presenza di un file `__init__.py`.
*   **Libreria**: Una collezione organizzata di moduli e package progettata per risolvere uno specifico dominio di problemi (es. manipolazione di date, analisi dati, comunicazioni di rete).
*   **Framework**: Un'architettura software completa che fornisce la struttura portante di un'applicazione (innescando l'Inversione del Controllo o *Hollywood Principle*: "Non chiamarci tu, ti chiameremo noi").

### Vantaggi della Modularità
1.  **Riusabilità**: Una funzione scritta in un modulo può essere importata e riutilizzata in decine di progetti differenti senza duplicare il codice.
2.  **Isolamento dei Namespace**: Ogni modulo definisce il proprio spazio dei nomi (*namespace*). Variabili o funzioni con lo stesso nome in moduli diversi non entrano in conflitto.
3.  **Manutenibilità**: Modificare la logica interna di un modulo non impatta il resto dell'applicazione, a patto che l'interfaccia pubblica (API) rimanga invariata.
4.  **Lavoro in Team**: Sviluppatori diversi possono lavorare in parallelo su moduli indipendenti del medesimo progetto.

---

## 2. Creazione e Importazione dei Moduli

### 2.1 Creare un Modulo Personalizzato
Creare un modulo in Python è estremamente semplice: basta salvare un file con estensione `.py`.

Supponiamo di creare un file chiamato `security_utils.py`:

```python
# security_utils.py
# Modulo di utilità per operazioni di sicurezza di base

import secrets
import string

def generate_token(length: int = 32) -> str:
    """Genera un token crittograficamente sicuro di lunghezza specificata."""
    alphabet = string.ascii_letters + string.digits
    return ''.join(secrets.choice(alphabet) for _ in range(length))

def sanitize_input(text: str) -> str:
    """Rimuove spazi vuoti e caratteri potenzialmente pericolosi."""
    return text.strip().replace("<script>", "").replace("</script>", "")
```

### 2.2 Le Sintassi di Importazione
Per utilizzare le funzioni di `security_utils.py` in un altro script (es. `app.py`), Python offre diverse forme di importazione.

#### Formato 1: `import modulo`
Importa l'intero modulo. I suoi membri rimangono confinati nel namespace del modulo e richiedono il prefisso.

```python
import security_utils

token = security_utils.generate_token(16)
clean = security_utils.sanitize_input("  admin  ")
print(f"Token: {token}")
```

#### Formato 2: `import modulo as alias`
Importa il modulo assegnandogli un alias locale. Molto utile per abbreviare nomi di moduli lunghi o librerie standard (es. `import numpy as np`).

```python
import security_utils as sec

token = sec.generate_token(16)
```

#### Formato 3: `from modulo import nome`
Importa attributi o funzioni specifiche direttamente nel namespace corrente. Non è più necessario utilizzare il prefisso del modulo.

```python
from security_utils import generate_token, sanitize_input

token = generate_token(24)
clean = sanitize_input("<script>alert('xss')</script>")
```

#### Formato 4: `from modulo import nome as alias`
Importa un elemento specifico rinominandolo localmente per evitare conflitti di nome nello script corrente.

```python
from security_utils import generate_token as create_nonce

nonce = create_nonce(12)
```

#### Formato 5: `from modulo import *` (Anti-pattern da evitare)
Importa tutti i simboli pubblici del modulo nello spazio dei nomi corrente.

```python
# DA EVITARE
from security_utils import *
```

> **Avvertenza di Sicurezza e Qualità**: L'uso di `from modulo import *` causa il fenomeno noto come **Namespace Pollution** (inquinamento dello spazio dei nomi). Rende oscuro l'origine delle funzioni, rischia di sovrascrivere silenziosamente variabili o funzioni built-in esistenti ed ostacola gli strumenti automatici di analisi statica (*linters*).

---

### 2.3 Meccanismo Interno dell'Import
Quando Python esegue un'istruzione `import modulo`:
1.  **Ricerca nel Cache**: Controlla se il modulo è già stato caricato in `sys.modules`. In tal caso, riutilizza l'oggetto modulo già residente in memoria.
2.  **Ricerca nei Percorsi**: Se il modulo non è in cache, Python cerca il file `.py` lungo i percorsi definiti nella lista `sys.path` (che include la cartella corrente dello script, le directory della libreria standard e le cartelle `site-packages` delle librerie terze parti).
3.  **Compilazione ed Esecuzione**: Il codice sorgente viene compilato in bytecode (`.pyc` memorizzato nella cartella `__pycache__`) ed **eseguito interamente da cima a fondo** per popolare il namespace del modulo.

---

## 3. Moduli Executable e Punto di Ingresso: `__name__ == "__main__"`

Quando un file Python viene eseguito direttamente dalla riga di comando (es. `python main.py`), l'interprete assegna alla variabile speciale `__name__` la stringa `"__main__"`.

Se invece il file viene importato all'interno di un altro script (es. `import main`), la variabile `__name__` assume come valore il nome del modulo stesso (es. `"main"`).

Questo comportamento permette di creare file **dual-use**: script che funzionano sia come librerie importabili, sia come programmi eseguibili stand-alone.

```python
# scanner.py

def scan_target(target_ip: str) -> bool:
    """Simula una scansione di rete su un IP target."""
    print(f"[*] Scansione di {target_ip} in corso...")
    # Logica di scansione...
    return True

def main():
    """Funzione principale eseguita solo in modalità stand-alone."""
    import sys
    target = sys.argv[1] if len(sys.argv) > 1 else "127.0.0.1"
    success = scan_target(target)
    print(f"[+] Scansione completata con esito: {success}")

if __name__ == "__main__":
    main()
```

### Perché usare `if __name__ == "__main__":`?
Senza questo blocco di protezione, qualsiasi codice posizionato a livello globale nello script verrebbe eseguito immediatamente al momento dell'importazione in altri file, causando effetti collaterali indesiderati.

---

## 4. La Python Standard Library (I Moduli Fondamentali)

Python viene distribuito secondo la filosofia *"Batteries Included"*: mette a disposizione una vasta libreria di moduli standard pronti all'uso senza dover installare pacchetti esterni.

### 4.1 Matematica e Statistica: `math`, `random`, `statistics`

```python
import math
import random
import statistics

# math: funzioni matematiche avanzate
print(math.sqrt(64))         # 8.0
print(math.ceil(4.2))        # 5
print(math.floor(4.8))       # 4
print(math.pi)               # 3.141592653589793

# random: generazione pseudocasuale
print(random.randint(1, 10)) # Intero casuale tra 1 e 10 inclusi
items = ["SSH", "HTTP", "FTP", "DNS"]
print(random.choice(items))  # Selezione casuale di un elemento
random.shuffle(items)        # Mescola la lista in-place
print(items)

# Riproducibilità con il SEED (fondamentale in testing e simulazioni)
random.seed(42)

# statistics: calcoli statistici su collezioni
data = [10, 20, 20, 30, 40, 50]
print(statistics.mean(data))   # Media: 28.33
print(statistics.median(data)) # Mediana: 25.0
print(statistics.stdev(data))  # Deviazione standard
```

---

### 4.2 Gestione del Tempo: `datetime`

Il modulo `datetime` gestisce date, orari, fusi orari e intervalli di tempo.

```python
from datetime import datetime, date, timedelta

# Data ed ora attuali
now = datetime.now()
print(f"Adesso: {now}")
print(f"Anno: {now.year}, Mese: {now.month}, Giorno: {now.day}")

# Formattazione (datetime -> stringa): strftime
formatted = now.strftime("%Y-%m-%d %H:%M:%S")
print(f"Data formattata: {formatted}")

# Parsing (stringa -> datetime): strptime
date_str = "2026-11-20 14:30:00"
parsed_date = datetime.strptime(date_str, "%Y-%m-%d %H:%M:%S")
print(f"Data parsata: {parsed_date}")

# Aritmetica con i tempi: timedelta
yesterday = now - timedelta(days=1)
future_expiry = now + timedelta(days=90, hours=12)
print(f"Scadenza Certificato: {future_expiry}")
```

---

### 4.3 Sistema Operativo e Interprete: `os` e `sys`

```python
import os
import sys

# os: interazione con l'ambiente del sistema operativo
print(f"Directory Corrente: {os.getcwd()}")
print(f"Variabile d'ambiente PATH: {os.getenv('PATH', 'Non definita')}")

# sys: informazioni e parametri dell'interprete Python
print(f"Versione di Python: {sys.version}")
print(f"Argomenti da riga di comando: {sys.argv}")
print(f"Percorsi di ricerca moduli (sys.path): {sys.path[:2]}")

# Uscita programmata dallo script con codice di stato (0 = successo, >0 = errore)
# sys.exit(0)
```

---

### 4.4 Manipolazione Moderna dei Percorsi: `pathlib.Path`

Rispetto al vecchio modulo `os.path`, `pathlib` offre un'interfaccia ad oggetti pulita, portabile e cross-platform per operare su file e directory.

```python
from pathlib import Path

# Inizializzazione del percorso
base_dir = Path("/workspace/scratch")
config_file = base_dir / "config" / "settings.json" # Operatore / per comporre percorsi

# Proprietà dei percorsi
print(f"Nome file: {config_file.name}")         # settings.json
print(f"Estensione: {config_file.suffix}")      # .json
print(f"Cartella padre: {config_file.parent}")  # /workspace/scratch/config

# Verifiche ed operazioni
if not config_file.parent.exists():
    config_file.parent.mkdir(parents=True, exist_ok=True)

# Scrittura e Lettura rapida
config_file.write_text('{"debug": true, "port": 8080}', encoding="utf-8")
content = config_file.read_text(encoding="utf-8")
print(f"Contenuto file: {content}")

# Scansione directory con glob patterns
for py_file in Path(".").glob("*.py"):
    print(f"Trovato script Python: {py_file}")
```

---

### 4.5 Gestione Avanzata di File e Strutture: `shutil` e `collections`

```python
import shutil
from collections import Counter, defaultdict, deque

# shutil: Operazioni su file ad alto livello (copia, spostamento, archiviazione)
# shutil.copy("sorgente.txt", "destinazione.txt")
# shutil.rmtree("cartella_da_eliminare")

# collections.Counter: Conteggio automatico degli elementi
log_levels = ["INFO", "ERROR", "INFO", "WARNING", "ERROR", "ERROR"]
counts = Counter(log_levels)
print(counts)                      # Counter({'ERROR': 3, 'INFO': 2, 'WARNING': 1})
print(counts.most_common(1))       # [('ERROR', 3)]

# collections.defaultdict: Dizionario con valore predefinito automatico
ip_tracker = defaultdict(int)
ip_tracker["192.168.1.1"] += 1
print(ip_tracker["192.168.1.1"])  # 1
print(ip_tracker["10.0.0.1"])     # 0 (non solleva KeyError!)

# collections.deque: Coda a due uscite ad alte prestazioni O(1)
buffer = deque(maxlen=3)
buffer.extend([1, 2, 3])
buffer.append(4)                   # Elimina 1 mantenendo maxlen=3
print(buffer)                      # deque([2, 3, 4], maxlen=3)
```

---

### 4.6 Espressioni Regolari: `re`

Il modulo `re` fornisce strumenti di Pattern Matching per l'analisi e la validazione del testo.

```python
import re

log_entry = "2026-11-20 10:15:30 [ERROR] User admin failed login from IP 192.168.1.50"

# re.search(): Cerca il primo match nel testo
ip_pattern = r"(?:\d{1,3}\.){3}\d{1,3}"
match = re.search(ip_pattern, log_entry)
if match:
    print(f"IP Estratto: {match.group()}")

# Gruppi di cattura con parentesi
pattern_completo = r"\[(?P<level>ERROR|WARNING|INFO)\] User (?P<user>\w+) failed"
match_grp = re.search(pattern_completo, log_entry)
if match_grp:
    print(f"Livello: {match_grp.group('level')}, Utente: {match_grp.group('user')}")

# re.sub(): Sostituzione basata su pattern (es. Anonimizzazione IP)
masked_log = re.sub(ip_pattern, "XXX.XXX.XXX.XXX", log_entry)
print(f"Log Sanificato: {masked_log}")
```

---

### 4.7 Formati di Scambio Dati: `csv` e `json`

#### Operazioni su File CSV
```python
import csv
from pathlib import Path

csv_path = Path("/workspace/scratch/users.csv")

# Scrittura CSV con DictWriter
data = [
    {"username": "alice", "role": "admin", "uid": 1001},
    {"username": "bob", "role": "developer", "uid": 1002}
]

with open(csv_path, mode="w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=["username", "role", "uid"])
    writer.writeheader()
    writer.writerows(data)

# Lettura CSV con DictReader
with open(csv_path, mode="r", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    for row in reader:
        print(f"Utente: {row['username']} (UID: {row['uid']})")
```

#### Operazioni su Data Interchange JSON
```python
import json

payload = {
    "status": "success",
    "timestamp": "2026-11-20T14:00:00",
    "nodes": ["node1", "node2"],
    "active": True,
    "meta": None
}

# Python dict -> Stringa JSON (dumps)
json_str = json.dumps(payload, indent=4)
print(f"JSON String:
{json_str}")

# Stringa JSON -> Python dict (loads)
parsed_payload = json.loads(json_str)
print(f"Nodo recuperato: {parsed_payload['nodes'][0]}")

# Scrittura diretta su file (dump) e Lettura da file (load)
json_path = Path("/workspace/scratch/config.json")
with open(json_path, "w", encoding="utf-8") as f:
    json.dump(payload, f, indent=2)

with open(json_path, "r", encoding="utf-8") as f:
    data_from_file = json.load(f)
```

---

### 4.8 Logging Professionale: `logging`

L'uso di `print()` per tracciare lo stato delle applicazioni in produzione è una cattiva pratica. Il modulo `logging` fornisce un sistema flessibile per registrare eventi con livelli di gravità differenti.

Livelli standard di log (in ordine di gravità crescente):
1.  `DEBUG`: Dettagli diagnostici minuziosi.
2.  `INFO`: Conferma del normale funzionamento delle operazioni.
3.  `WARNING`: Segnalazione di un evento imprevisto o problema futuro.
4.  `ERROR`: Errore grave che impedisce l'esecuzione di una funzione.
5.  `CRITICAL`: Errore critico che causa il blocco immediato dell'applicazione.

```python
import logging

# Configurazione base del logger
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
    handlers=[
        logging.FileHandler("/workspace/scratch/app.log", encoding="utf-8"),
        logging.StreamHandler() # Output anche su console
    ]
)

logger = logging.getLogger("SecurityAudit")

logger.info("Modulo di audit inizializzato con successo.")
logger.warning("Tentativo di accesso con credenziali deboli rilevato.")
try:
    val = 10 / 0
except ZeroDivisionError:
    logger.error("Errore durante il calcolo delle metriche", exc_info=True)
```

---

## 5. Strutturazione in Package e Import Relativi

Quando il numero di moduli cresce, è necessario organizzarli in cartelle gerarchiche chiamate **Package**.

### 5.1 Struttura di un Package
Consideriamo la seguente alberatura di progetto:

```text
my_security_pkg/
├── __init__.py
├── scanner.py
├── parsers/
│   ├── __init__.py
│   ├── log_parser.py
│   └── network_parser.py
└── utils/
    ├── __init__.py
    └── crypto.py
```

### 5.2 Il File `__init__.py` e l'attributo `__all__`
Il file `__init__.py` indica a Python che la directory deve essere trattata come un package importabile.

Esso può contenere codice di inizializzazione del package e definire la variabile `__all__`, che controlla quali simboli o moduli esportare pubblicamente.

```python
# my_security_pkg/__init__.py
# Inizializzazione del package my_security_pkg

from .scanner import scan_target
from .utils.crypto import generate_token

__version__ = "1.0.0"
__all__ = ["scan_target", "generate_token", "__version__"]
```

### 5.3 Import Relativi
All'interno dei moduli appartenenti ad un package, è possibile utilizzare gli **import relativi** basati sulla sintassi del punto:
*   `.` (cartella corrente)
*   `..` (cartella padre)

```python
# my_security_pkg/parsers/log_parser.py
from ..utils.crypto import generate_token # Importa dal modulo padre utils
from .network_parser import parse_pcap    # Importa dal modulo fratello
```

---

## 6. Gestione delle Dipendenze Esterne, Ambienti Virtuali e Sicurezza

### 6.1 Gestione Pacchetti con `pip`
`pip` è il gestore ufficiale di pacchetti per Python, utilizzato per scaricare e gestire librerie dal repository **PyPI (Python Package Index)**.

Comandi fondamentali da terminale:
```bash
# Installare un pacchetto
pip install requests

# Installare una versione specifica
pip install requests==2.31.0

# Aggiornare un pacchetto
pip install --upgrade requests

# Esportare le dipendenze in un file requirements.txt
pip freeze > requirements.txt

# Installare tutte le dipendenze da un file di requisiti
pip install -r requirements.txt
```

---

### 6.2 Ambienti Virtuali (`venv`)
Un **Ambiente Virtuale** è un ambiente Python isolato che possiede la propria installazione dell'interprete e la propria cartella `site-packages`.

#### Perché sono Indispensabili?
Evitano conflitti tra progetti diversi che richiedono versioni incompatibili della stessa libreria e prevengono la contaminazione dell'ambiente di sistema.

#### Workflow Operativo da Terminale
```bash
# 1. Creare l'ambiente virtuale (es. chiamato 'venv')
python3 -m venv venv

# 2. Attivare l'ambiente (Linux/macOS)
source venv/bin/activate

# Attivare l'ambiente (Windows PowerShell)
# .\venv\Scripts\Activate.ps1

# 3. Verificare che l'ambiente sia attivo (il prompt mostra (venv))
which python3

# 4. Disattivare l'ambiente al termine del lavoro
deactivate
```

---

### 6.3 Panoramica sull'Ecosistema Esterno
Mentre la Standard Library copre la maggior parte delle esigenze di base, l'ecosistema PyPI offre librerie specializzate per ogni ambito:

*   **HTTP e Networking**: `requests`, `httpx` (comunicazione client HTTP sincrona ed asincrona).
*   **Web Frameworks**: `Flask` (micro-framework essenziale), `FastAPI` (prestazioni elevate con type validation automatica), `Django` (framework full-stack "batteries-included").
*   **Data Science e Machine Learning**: `numpy` (calcolo vettoriale e matriciale), `pandas` (strutture dati Dataframe per analisi tabellari), `scikit-learn`, `torch`, `tensorflow`.

---

### 6.4 Sicurezza nella Gestione delle Dipendenze
1.  **Typosquatting**: Attacchi basati sulla registrazione di pacchetti con nomi simili a quelli famosi (es. `reqeusts` invece di `requests`). Verificare sempre l'ortografia del pacchetto prima di eseguire `pip install`.
2.  **Pinning delle Dipendenze**: Nei file `requirements.txt` di produzione, specificare sempre la versione esatta di ogni libreria (`rich==13.7.0`) per garantire la riproducibilità delle build.
3.  **Vulnerability Scanning**: Utilizzare strumenti di audit come `pip-audit` o `safety` per rilevare vulnerabilità note presenti nelle librerie terze parti installate.

---

## 7. Anti-Pattern ed Errori Comuni

### Errore 1: Shadowing di Moduli Standard
Creare un file script personalizzato con lo stesso nome di un modulo della libreria standard (es. salvare un file chiamato `random.py` o `math.py`).
*   **Conseguenza**: Quando si esegue `import random`, Python importerà il file locale anziché la libreria standard, causando `AttributeError` catastrofici.

### Errore 2: Import Circolari (*Circular Imports*)
Si verifica quando `modulo_A` importa `modulo_B` e contemporaneamente `modulo_B` importa `modulo_A`.
*   **Soluzione**: Ristrutturare il codice spostando le dipendenze condivise in un terzo modulo `modulo_C`, oppure spostare l'istruzione `import` all'interno della funzione specifica che la utilizza (import locale).

### Errore 3: Modifica Indebita di `sys.path`
Aggiungere percorsi assoluti hardcoded in `sys.path` all'interno dello script (`sys.path.append("/Users/mario/my_libs")`).
*   **Soluzione**: Usare i package ed installarli in modalità modificabile (`pip install -e .`) oppure impostare la variabile d'ambiente `PYTHONPATH`.
