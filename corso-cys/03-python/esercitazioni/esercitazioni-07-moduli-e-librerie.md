# Esercitazioni — Modulo 07: Moduli e Librerie

## Livello 1: Sintassi di Base e Moduli Standard

### Esercizio 1: Utility Matematiche e Generatore Casualità
Scrivi uno script che utilizzi il modulo `math` ed il modulo `random` per:
1. Calcolare l'area di un cerchio dato un raggio casuale compreso tra 5.0 e 15.0.
2. Calcolare il fattoriale di un numero casuale compreso tra 3 e 8.
3. Generare una password casuale di 12 caratteri prelevando elementi da lettere maiuscole, minuscole, cifre e simboli.

### Esercizio 2: Calcolatore di Scadenza e Differenze Temporali
Crea un programma che utilizzi `datetime` per:
1. Stampare la data e l'ora corrente nel formato `DD/MM/YYYY HH:MM`.
2. Chiedere all'utente la propria data di nascita (formato `YYYY-MM-DD`) e calcolare l'età esatta in giorni ed anni (approssimati).
3. Calcolare la data esatta di scadenza di una licenza software impostata a 180 giorni a partire dall'istante di esecuzione.

### Esercizio 3: Ispezione e Navigazione del File System con `pathlib`
Utilizza `pathlib.Path` per realizzare uno script che:
1. Scansioni una directory specificata (es. `/workspace/scratch`).
2. Elenchi tutti i file estraendo nome, estensione e dimensione in KB.
3. Filtri e stampi soltanto i file con estensione `.log` o `.md`.

---

## Livello 2: Moduli Custom, Entry Point e Serializzazione Dati

### Esercizio 4: Modulo Validator con `__name__ == "__main__"`
Crea un file chiamato `string_validator.py` che contenga:
1. Una funzione `is_valid_email(email: str) -> bool` che verifichi la presenza di `@` e un dominio valido con il punto.
2. Una funzione `is_strong_password(password: str) -> bool` che verifichi una lunghezza minima di 8 caratteri, la presenza di almeno una cifra e un carattere speciale.
3. Un blocco `if __name__ == "__main__":` che esegua una suite di test unitari dimostrativi sulle due funzioni quando il file viene eseguito direttamente da riga di comando.

### Esercizio 5: Convertitore da CSV a JSON per Report Audit
Scrivi un programma che:
1. Legga un file CSV chiamato `audit_access.csv` contenente i campi `timestamp`, `username`, `ip_address`, `status`.
2. Filtri solo i record aventi `status == "FAILED"`.
3. Esporti i record filtrati in un file JSON formattato `failed_logins.json` aggregando i tentativi falliti per ciascun indirizzo IP.

---

## Livello 3: Package, Logging e Configurazione

### Esercizio 6: Sistema di Logging strutturato per Operazioni I/O
Realizza uno script Python che:
1. Inizializzi un logger chiamato `"SystemAuditor"` configurato per scrivere su file `system_events.log`.
2. Definisca una funzione `process_file(file_path: str)` che tenti di aprire e leggere un file.
3. Registri un messaggio `INFO` all'inizio dell'operazione, un messaggio `WARNING` se il file supera 1MB, e un messaggio `ERROR` con `exc_info=True` se il file non esiste (`FileNotFoundError`).

---

## Livello 4: Sfida Integrata

### Sfida Integrata: "Sistema Modulare di Security Audit e Log Analysis (Log Sentinel)"

Immagina di dover costruire un'applicazione modulare professionale per l'analisi dei log di sicurezza di un server aziendale.

#### Architettura del Progetto
Crea un package chiamato `log_sentinel` strutturato nel seguente modo:

```text
log_sentinel/
├── __init__.py
├── analyzer.py
├── exporter.py
└── main.py
```

#### Requisiti dei Moduli
1.  **`analyzer.py`**:
    *   Fornisce la funzione `parse_log_line(line: str) -> dict | None`: utilizza le Espressioni Regolari (`re`) per estrarre `timestamp`, `log_level`, `ip_address`, `user` e `message`.
    *   Fornisce la funzione `detect_brute_force(events: list[dict], threshold: int = 3) -> dict[str, int]`: identifica gli IP che hanno accumulato un numero di eventi `FAILED` superiore o uguale a `threshold`. Usa `collections.Counter`.
2.  **`exporter.py`**:
    *   Fornisce la funzione `export_to_json(data: dict, output_path: Path)`: salva le anomalie rilevate in un file JSON strutturato.
    *   Fornisce la funzione `export_to_csv(events: list[dict], output_path: Path)`: salva gli eventi analizzati in un file CSV.
3.  **`main.py`**:
    *   Importa le funzionalità da `analyzer.py` ed `exporter.py`.
    *   Inizializza un logger con `logging`.
    *   Legge un file di log simulato, esegue l'analisi delle minacce, stampa il riepilogo a console e salva i report nelle directory scratch usando `pathlib`.
    *   È protetto dal blocco `if __name__ == "__main__":`.

---

## Soluzioni Ufficiali

### Soluzione Esercizio 1: Utility Matematiche e Generatore Casualità
```python
import math
import random
import string

# 1. Area del cerchio
radius = random.uniform(5.0, 15.0)
area = math.pi * (radius ** 2)
print(f"Raggio: {radius:.2f} -> Area Cerchio: {area:.2f}")

# 2. Fattoriale
num = random.randint(3, 8)
fact = math.factorial(num)
print(f"Fattoriale di {num}: {fact}")

# 3. Password Generator
def generate_password(length: int = 12) -> str:
    characters = string.ascii_uppercase + string.ascii_lowercase + string.digits + "!@#$%^&*"
    return "".join(random.choice(characters) for _ in range(length))

print(f"Password Generata: {generate_password(16)}")
```

---

### Soluzione Esercizio 2: Calcolatore di Scadenza e Differenze Temporali
```python
from datetime import datetime, timedelta

# 1. Ora attuale formattata
now = datetime.now()
print(f"Data Corrente: {now.strftime('%d/%m/%Y %H:%M')}")

# 2. Età in giorni ed anni
dob_str = "1995-05-20"
dob = datetime.strptime(dob_str, "%Y-%m-%d")
age_days = (now - dob).days
age_years = age_days // 365
print(f"Età: {age_years} anni ({age_days} giorni vissuti)")

# 3. Scadenza Licenza (180 giorni)
expiry_date = now + timedelta(days=180)
print(f"Scadenza Licenza (180 gg): {expiry_date.strftime('%Y-%m-%d')}")
```

---

### Soluzione Esercizio 3: Ispezione File System con `pathlib`
```python
from pathlib import Path

target_dir = Path("/workspace/scratch")

print(f"--- Scansione Directory: {target_dir} ---")
if target_dir.exists() and target_dir.is_dir():
    for item in target_dir.iterdir():
        if item.is_file():
            size_kb = item.stat().st_size / 1024
            if item.suffix in [".log", ".md", ".json", ".csv"]:
                print(f"[MATCH] File: {item.name:<30} Estensione: {item.suffix:<6} Dimensione: {size_kb:.2f} KB")
```

---

### Soluzione Esercizio 4: Modulo Validator con `__name__ == "__main__"`
```python
# string_validator.py
import re

def is_valid_email(email: str) -> bool:
    """Verifica se la stringa ha un formato email valido."""
    pattern = r"^[\w\.-]+@[\w\.-]+\.\w+$"
    return bool(re.match(pattern, email.strip()))

def is_strong_password(password: str) -> bool:
    """Verifica requisiti di sicurezza della password."""
    if len(password) < 8:
        return False
    has_digit = any(char.isdigit() for char in password)
    has_special = any(char in "!@#$%^&*()_+-=" for char in password)
    return has_digit and has_special

if __name__ == "__main__":
    print("[*] Esecuzione test interni di string_validator.py...")
    test_emails = ["admin@company.com", "invalid-email@", "user.name@domain.it"]
    for e in test_emails:
        print(f"Email '{e}': {'VALIDA' if is_valid_email(e) else 'NON VALIDA'}")
    
    test_passwords = ["Secret123!", "short", "passwordSenzaNumero!"]
    for p in test_passwords:
        print(f"Password '{p}': {'FORTE' if is_strong_password(p) else 'DEBOLE'}")
```

---

### Soluzione Esercizio 5: Convertitore CSV -> JSON per Audit Logs
```python
import csv
import json
from collections import defaultdict
from pathlib import Path

csv_file = Path("/workspace/scratch/audit_access.csv")
json_file = Path("/workspace/scratch/failed_logins.json")

# 1. Creazione file CSV di prova
sample_data = [
    ["timestamp", "username", "ip_address", "status"],
    ["2026-11-20 10:00:01", "alice", "192.168.1.10", "SUCCESS"],
    ["2026-11-20 10:01:15", "admin", "10.0.0.55", "FAILED"],
    ["2026-11-20 10:01:20", "admin", "10.0.0.55", "FAILED"],
    ["2026-11-20 10:02:00", "bob", "192.168.1.20", "SUCCESS"],
    ["2026-11-20 10:03:10", "root", "10.0.0.55", "FAILED"],
]

with open(csv_file, "w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerows(sample_data)

# 2. Lettura, Filtraggio e Aggregazione
failed_by_ip = defaultdict(list)

with open(csv_file, "r", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    for row in reader:
        if row["status"] == "FAILED":
            failed_by_ip[row["ip_address"]].append({
                "timestamp": row["timestamp"],
                "username": row["username"]
            })

# 3. Esportazione JSON
with open(json_file, "w", encoding="utf-8") as f:
    json.dump(failed_by_ip, f, indent=4)

print(f"[+] Convertiti {len(failed_by_ip)} IP con tentativi falliti in {json_file.name}")
```

---

### Soluzione Esercizio 6: Logging Strutturato per Operazioni I/O
```python
import logging
from pathlib import Path

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
    handlers=[
        logging.FileHandler("/workspace/scratch/system_events.log", encoding="utf-8"),
        logging.StreamHandler()
    ]
)

logger = logging.getLogger("SystemAuditor")

def process_file(file_path: str):
    path = Path(file_path)
    logger.info(f"Inizio elaborazione file: {path.name}")
    
    if not path.exists():
        logger.error(f"File non trovato: {path.name}", exc_info=False)
        return
    
    size_mb = path.stat().st_size / (1024 * 1024)
    if size_mb > 1.0:
        logger.warning(f"File di grandi dimensioni ({size_mb:.2f} MB): {path.name}")
        
    content = path.read_text(encoding="utf-8")
    logger.info(f"Elaborazione completata per {path.name} ({len(content)} caratteri).")

# Test della funzione
process_file("/workspace/scratch/audit_access.csv")
process_file("/workspace/scratch/non_esistente.txt")
```

---

### Soluzione Sfida Integrata: "Log Sentinel" Package

#### File `log_sentinel/__init__.py`
```python
# Package Log Sentinel per l'analisi dei log di sicurezza

from .analyzer import parse_log_line, detect_brute_force
from .exporter import export_to_json, export_to_csv

__version__ = "1.0.0"
__all__ = ["parse_log_line", "detect_brute_force", "export_to_json", "export_to_csv"]
```

#### File `log_sentinel/analyzer.py`
```python
import re
from collections import Counter

LOG_PATTERN = r"(?P<timestamp>\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}) \[(?P<level>\w+)\] IP:(?P<ip>[\d\.]+) User:(?P<user>\w+) - (?P<message>.+)"

def parse_log_line(line: str) -> dict | None:
    """Esegue il parsing di una singola riga di log ritornando un dizionario o None."""
    match = re.match(LOG_PATTERN, line.strip())
    if match:
        return match.groupdict()
    return None

def detect_brute_force(events: list[dict], threshold: int = 3) -> dict[str, int]:
    """Identifica gli indirizzi IP che superano la soglia di tentativi falliti."""
    failed_ips = [
        event["ip"] for event in events 
        if "FAILED" in event.get("message", "").upper() or event.get("level") == "ERROR"
    ]
    counts = Counter(failed_ips)
    return {ip: count for ip, count in counts.items() if count >= threshold}
```

#### File `log_sentinel/exporter.py`
```python
import csv
import json
from pathlib import Path

def export_to_json(data: dict, output_path: Path) -> None:
    """Esporta un dizionario di anomalie in formato JSON."""
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4)

def export_to_csv(events: list[dict], output_path: Path) -> None:
    """Esporta una lista di eventi parsati in formato CSV."""
    if not events:
        return
    output_path.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = list(events[0].keys())
    with open(output_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(events)
```

#### File `log_sentinel/main.py`
```python
import logging
from pathlib import Path
from log_sentinel.analyzer import parse_log_line, detect_brute_force
from log_sentinel.exporter import export_to_json, export_to_csv

logging.basicConfig(level=logging.INFO, format="%(asctime)s [%(levelname)s]: %(message)s")
logger = logging.getLogger("LogSentinelMain")

RAW_LOGS = [
    "2026-11-20 12:00:01 [INFO] IP:192.168.1.10 User:alice - Login SUCCESS",
    "2026-11-20 12:01:05 [ERROR] IP:10.0.0.99 User:root - Login FAILED",
    "2026-11-20 12:01:08 [ERROR] IP:10.0.0.99 User:root - Login FAILED",
    "2026-11-20 12:01:12 [ERROR] IP:10.0.0.99 User:admin - Login FAILED",
    "2026-11-20 12:02:30 [INFO] IP:192.168.1.20 User:bob - Password change SUCCESS",
]

def main():
    logger.info("Avvio analisi sicurezza con LogSentinel...")
    
    # 1. Parsing
    parsed_events = []
    for line in RAW_LOGS:
        event = parse_log_line(line)
        if event:
            parsed_events.append(event)
            
    logger.info(f"Parsati con successo {len(parsed_events)} eventi di log.")
    
    # 2. Rilevamento Minacce
    threats = detect_brute_force(parsed_events, threshold=2)
    logger.warning(f"Rilevati {len(threats)} IP sospetti per Brute-Force: {threats}")
    
    # 3. Esportazione Report
    out_dir = Path("/workspace/scratch/log_sentinel_out")
    export_to_csv(parsed_events, out_dir / "parsed_events.csv")
    export_to_json({"brute_force_alerts": threats}, out_dir / "security_alerts.json")
    
    logger.info(f"[+] Processo completato! Report salvati in {out_dir}")

if __name__ == "__main__":
    main()
```
