# Modulo 3: Python — Esercitazioni 04: Collezioni e Strutture Dati

Scheda di esercitazioni pratiche per il modulo **04-collezioni**. Gli esercizi sono suddivisi in quattro livelli di difficoltà crescente, seguiti dalle soluzioni ufficiali completamente commentate.

---

## Livello 1: Operazioni Base su Liste, Tuple, Set e Dizionari

### Esercizio 1.1 — Gestione di una Lista di Porte di Rete
Crea una lista denominata `common_ports` contenente i seguenti interi: `21, 22, 80, 443, 8080`.
1. Aggiungi la porta `3306` alla fine della lista usando `append()`.
2. Inserisci la porta `53` all'inizio della lista (indice 0) usando `insert()`.
3. Rimuovi la porta `80` usando `remove()`.
4. Estrai l'ultima porta inserita memorizzandola in una variabile `last_port` usando `pop()`.
5. Stampa la lista finale e il valore di `last_port`.

### Esercizio 1.2 — Verifica dell'Aliasing vs Copia
Dato il codice seguente:
```python
list_a = ["admin", "root", "operator"]
list_b = list_a
list_c = list_a.copy()

list_b.append("guest")
```
Prima di eseguire il codice, rispondi:
1. Quali elementi contiene `list_a`?
2. Quali elementi contiene `list_c`?
Verifica le tue risposte scrivendo uno script Python che stampi le tre liste e gli ID di memoria con `id()`.

### Esercizio 1.3 — Manipolazione di Tuple e Unpacking
Definisci una tupla `server_info = ("192.168.1.50", 80, "Apache/2.4", True)`.
1. Effettua l'unpacking della tupla nelle variabili `ip`, `port`, `service`, `is_online`.
2. Tenta di modificare l'IP impostando `server_info[0] = "10.0.0.1"`. Quale eccezione solleva Python e perché?
3. Scrivi un blocco `try-except` per catturare l'errore e stampare un messaggio di avviso appropriato.

### Esercizio 1.4 — Deduplicazione e Operazioni Insiemistiche su Set
Sono dati due elenchi di IP rilevati da due sensori di rete:
- Sensore A: `["10.0.0.1", "10.0.0.2", "192.168.1.1", "10.0.0.1"]`
- Sensore B: `["192.168.1.1", "172.16.0.5", "10.0.0.2"]`

1. Converti entrambi gli elenchi in insiemi (`set_a` e `set_b`) per rimuovere i duplicati.
2. Calcola l'insieme degli IP rilevati da **entrambi** i sensori (Intersezione).
3. Calcola l'insieme di **tutti** gli IP unici rilevati dalla rete (Unione).
4. Calcola l'insieme degli IP rilevati **solo dal Sensore A** (Differenza).

### Esercizio 1.5 — Gestione Anagrafica con Dizionari
Crea un dizionario `user_profile` contenente le chiavi `"username"`, `"role"`, `"email"` e `"login_attempts"`.
1. Leggi la chiave `"email"` usando il metodo `.get()`.
2. Prova a leggere la chiave `"last_login"` con `.get()`, fornendo come valore di default `"MAI"`.
3. Incrementa di 1 il valore di `"login_attempts"`.
4. Aggiungi un nuovo campo `"status"` impostandolo a `"ACTIVE"`.
5. Stampa tutte le coppie chiave-valore usando un ciclo `for` e `.items()`.

---

## Livello 2: Modifica, Ordinamento, Lambda e Comprehensions

### Esercizio 2.1 — Ordinamento Personalizzato con Lambda
È fornita una lista di tuple che rappresentano utenti ed il loro livello di rischio:
```python
users_risk = [("alice", 85), ("bob", 20), ("charlie", 95), ("david", 50)]
```
1. Ordina la lista in ordine crescente in base al punteggio di rischio utilizzando `sort()` e una funzione `lambda`.
2. Ordina la lista in ordine decrescente (dal più rischioso al meno rischioso) senza modificare la lista originale, memorizzando il risultato in `sorted_users`.

### Esercizio 2.2 — List Comprehension per il Filtraggio di Log
Data la lista di codici di stato HTTP:
```python
http_codes = [200, 404, 500, 200, 301, 502, 403, 200, 503]
```
1. Utilizza una List Comprehension per creare una lista `error_codes` contenente solo i codici $\ge 400$.
2. Utilizza una List Comprehension con un'espressione condizionale per creare una lista di stringhe `status_labels`: `"ERROR"` se il codice è $\ge 400$, altrimenti `"OK"`.

### Esercizio 2.3 — Dictionary Comprehension per Mappatura IP-Stato
Data una lista di IP sospetti:
```python
suspicious_ips = ["192.168.1.105", "10.0.0.44", "172.16.2.8"]
```
Crea un dizionario `ip_blacklist` usando una Dictionary Comprehension in cui ogni IP è una chiave e il valore è il dizionario `{"status": "BLOCKED", "reason": "PORT_SCAN"}`.

### Esercizio 2.4 — Trasformazioni con `zip()` e `enumerate()`
Dati due elenchi paralleli:
```python
usernames = ["user_adm", "dev_01", "sec_op"]
uids = [1001, 1002, 1003]
```
1. Usa `zip()` per combinare le due liste in un dizionario `user_db` che mappa `username -> uid`.
2. Stampa un elenco numerato da 1 usando `enumerate()` che mostri il formato: `1. Utente: user_adm (UID: 1001)`.

---

## Livello 3: Strutture Annidate, Operazioni Insiemistiche e Log di Sicurezza

### Esercizio 3.1 — Analisi di una Struttura Annidata di Dispositivi
È fornita la seguente struttura di dispositivi di rete:
```python
devices = [
    {"id": "FW-01", "type": "firewall", "rules_active": 45, "status": "active"},
    {"id": "SW-01", "type": "switch", "rules_active": 0, "status": "active"},
    {"id": "RTR-01", "type": "router", "rules_active": 12, "status": "maintenance"},
    {"id": "FW-02", "type": "firewall", "rules_active": 80, "status": "active"}
]
```
1. Calcola il numero totale di regole attive (`rules_active`) in tutta la rete usando una `generator expression` e la funzione `sum()`.
2. Estrai una lista di soli `id` di dispositivi il cui tipo è `"firewall"` ed il cui stato è `"active"`.

### Esercizio 3.2 — Coda FIFO con `collections.deque`
Un sistema di gestione degli incidenti riceve segnalazioni in tempo reale.
1. Importa `deque` dal modulo `collections`.
2. Inizializza una coda `incident_queue` con i ticket `"TICKET-101"`, `"TICKET-102"`.
3. Inserisci in coda i nuovi ticket `"TICKET-103"` e `"TICKET-104"`.
4. Simula la presa in carico dei primi due ticket estrattendoli con `.popleft()`.
5. Stampa i ticket presi in carico ed il contenuto residuo della coda.

---

## Livello 4: Sfida Integrata — Analizzatore di Eventi di Sicurezza e Traffic Log

### Obiettivo della Sfida
Scrivere uno script Python completo che analizzi una sequenza di eventi di traffico di rete generati da vari host. Lo script deve elaborare i dati strutturati, rilevare anomalie di sicurezza e produrre un report sintetico.

### Dati di Input
```python
network_logs = [
    {"timestamp": "2026-11-20 10:00:01", "src_ip": "192.168.1.10", "dst_port": 80, "action": "ALLOW", "bytes": 1500},
    {"timestamp": "2026-11-20 10:00:02", "src_ip": "10.0.0.50", "dst_port": 22, "action": "BLOCK", "bytes": 0},
    {"timestamp": "2026-11-20 10:00:03", "src_ip": "192.168.1.10", "dst_port": 443, "action": "ALLOW", "bytes": 4500},
    {"timestamp": "2026-11-20 10:00:04", "src_ip": "45.33.32.156", "dst_port": 22, "action": "BLOCK", "bytes": 0},
    {"timestamp": "2026-11-20 10:00:05", "src_ip": "45.33.32.156", "dst_port": 23, "action": "BLOCK", "bytes": 0},
    {"timestamp": "2026-11-20 10:00:06", "src_ip": "45.33.32.156", "dst_port": 445, "action": "BLOCK", "bytes": 0},
    {"timestamp": "2026-11-20 10:00:07", "src_ip": "192.168.1.20", "dst_port": 80, "action": "ALLOW", "bytes": 800},
    {"timestamp": "2026-11-20 10:00:08", "src_ip": "10.0.0.50", "dst_port": 22, "action": "BLOCK", "bytes": 0}
]

known_threat_ips = {"45.33.32.156", "185.220.101.5"}
```

### Requisiti del Programma
1. **Estrazione IP Unici**: Estrarre l'insieme dei client (`src_ip`) unici presenti nei log.
2. **Identificazione Minacce**: Tramite operazioni tra `set`, individuare gli IP presenti nei log che figurano anche nell'insieme `known_threat_ips`.
3. **Calcolo Volume Traffico per IP**: Creare un dizionario che associ a ciascun `src_ip` la somma totale dei `bytes` trasferiti (solo per le azioni `"ALLOW"`).
4. **Rilevamento Port Scanning**: Rilevare gli IP che hanno subito almeno 3 azioni di tipo `"BLOCK"`.
5. **Report Finale**: Stampare un report formattato con f-string contenente le metriche elaborate.

---

## Soluzioni Ufficiali Commentate

### Soluzioni Livello 1

#### Soluzione 1.1
```python
common_ports = [21, 22, 80, 443, 8080]

# 1. Append
common_ports.append(3306)

# 2. Insert all'inizio
common_ports.insert(0, 53)

# 3. Remove porta 80
common_ports.remove(80)

# 4. Pop ultima porta
last_port = common_ports.pop()

# 5. Stampa risultati
print("Lista finale porte:", common_ports) # [53, 21, 22, 443, 8080]
print("Ultima porta estratta (pop):", last_port) # 3306
```

#### Soluzione 1.2
```python
list_a = ["admin", "root", "operator"]
list_b = list_a
list_c = list_a.copy()

list_b.append("guest")

# Risposte:
# 1. list_a contiene ['admin', 'root', 'operator', 'guest'] perché list_b è un alias.
# 2. list_c contiene ['admin', 'root', 'operator'] perché è una copia indipendente.

print("list_a:", list_a, "ID:", id(list_a))
print("list_b:", list_b, "ID:", id(list_b)) # Stesso ID di list_a
print("list_c:", list_c, "ID:", id(list_c)) # ID differente
```

#### Soluzione 1.3
```python
server_info = ("192.168.1.50", 80, "Apache/2.4", True)

ip, port, service, is_online = server_info
print(f"Server {ip}:{port} - Servizio: {service} - Online: {is_online}")

try:
    server_info[0] = "10.0.0.1"
except TypeError as err:
    print(f"[ERRORE DI MUTABILITÀ]: Le tuple sono immutabili! Dettaglio: {err}")
```

#### Soluzione 1.4
```python
list_a = ["10.0.0.1", "10.0.0.2", "192.168.1.1", "10.0.0.1"]
list_b = ["192.168.1.1", "172.16.0.5", "10.0.0.2"]

set_a = set(list_a)
set_b = set(list_b)

intersection = set_a & set_b
union = set_a | set_b
diff_a = set_a - set_b

print("IP in entrambi i sensori (Intersezione):", intersection)
print("Tutti gli IP unici (Unione):", union)
print("IP esclusivi Sensore A (Differenza):", diff_a)
```

#### Soluzione 1.5
```python
user_profile = {
    "username": "sec_analyst",
    "role": "SOC_L1",
    "email": "analyst@company.com",
    "login_attempts": 3
}

print("Email:", user_profile.get("email"))
print("Last Login:", user_profile.get("last_login", "MAI"))

user_profile["login_attempts"] += 1
user_profile["status"] = "ACTIVE"

print("\n--- Profilo Utente Aggiornato ---")
for key, value in user_profile.items():
    print(f"{key}: {value}")
```

---

### Soluzioni Livello 2

#### Soluzione 2.1
```python
users_risk = [("alice", 85), ("bob", 20), ("charlie", 95), ("david", 50)]

# 1. In-place ordinamento crescente
users_risk.sort(key=lambda item: item[1])
print("Rischio crescente:", users_risk)

# 2. Nuova lista decrescente
sorted_users = sorted(users_risk, key=lambda item: item[1], reverse=True)
print("Rischio decrescente:", sorted_users)
```

#### Soluzione 2.2
```python
http_codes = [200, 404, 500, 200, 301, 502, 403, 200, 503]

# 1. Solo errori (>= 400)
error_codes = [code for code in http_codes if code >= 400]
print("Codici di errore:", error_codes)

# 2. Labeling OK/ERROR
status_labels = ["ERROR" if code >= 400 else "OK" for code in http_codes]
print("Etichette stato:", status_labels)
```

#### Soluzione 2.3
```python
suspicious_ips = ["192.168.1.105", "10.0.0.44", "172.16.2.8"]

ip_blacklist = {
    ip: {"status": "BLOCKED", "reason": "PORT_SCAN"}
    for ip in suspicious_ips
}

print(ip_blacklist)
```

#### Soluzione 2.4
```python
usernames = ["user_adm", "dev_01", "sec_op"]
uids = [1001, 1002, 1003]

# 1. Zip in dizionario
user_db = dict(zip(usernames, uids))
print("Database Utenti:", user_db)

# 2. Enumerate con zipping per stampa formattata
for idx, (user, uid) in enumerate(user_db.items(), start=1):
    print(f"{idx}. Utente: {user} (UID: {uid})")
```

---

### Soluzioni Livello 3

#### Soluzione 3.1
```python
devices = [
    {"id": "FW-01", "type": "firewall", "rules_active": 45, "status": "active"},
    {"id": "SW-01", "type": "switch", "rules_active": 0, "status": "active"},
    {"id": "RTR-01", "type": "router", "rules_active": 12, "status": "maintenance"},
    {"id": "FW-02", "type": "firewall", "rules_active": 80, "status": "active"}
]

# 1. Somma totale regole con Generator Expression
total_rules = sum(d["rules_active"] for d in devices)
print("Totale regole attive nella rete:", total_rules)

# 2. ID dei firewall attivi
active_fw_ids = [d["id"] for d in devices if d["type"] == "firewall" and d["status"] == "active"]
print("Firewall attivi:", active_fw_ids)
```

#### Soluzione 3.2
```python
from collections import deque

incident_queue = deque(["TICKET-101", "TICKET-102"])

# Inserimento in coda
incident_queue.append("TICKET-103")
incident_queue.append("TICKET-104")

# Presa in carico (FIFO)
handled_1 = incident_queue.popleft()
handled_2 = incident_queue.popleft()

print("Ticket in carico:", handled_1, "e", handled_2)
print("Coda residua:", list(incident_queue))
```

---

### Soluzione Livello 4: Sfida Integrata

```python
network_logs = [
    {"timestamp": "2026-11-20 10:00:01", "src_ip": "192.168.1.10", "dst_port": 80, "action": "ALLOW", "bytes": 1500},
    {"timestamp": "2026-11-20 10:00:02", "src_ip": "10.0.0.50", "dst_port": 22, "action": "BLOCK", "bytes": 0},
    {"timestamp": "2026-11-20 10:00:03", "src_ip": "192.168.1.10", "dst_port": 443, "action": "ALLOW", "bytes": 4500},
    {"timestamp": "2026-11-20 10:00:04", "src_ip": "45.33.32.156", "dst_port": 22, "action": "BLOCK", "bytes": 0},
    {"timestamp": "2026-11-20 10:00:05", "src_ip": "45.33.32.156", "dst_port": 23, "action": "BLOCK", "bytes": 0},
    {"timestamp": "2026-11-20 10:00:06", "src_ip": "45.33.32.156", "dst_port": 445, "action": "BLOCK", "bytes": 0},
    {"timestamp": "2026-11-20 10:00:07", "src_ip": "192.168.1.20", "dst_port": 80, "action": "ALLOW", "bytes": 800},
    {"timestamp": "2026-11-20 10:00:08", "src_ip": "10.0.0.50", "dst_port": 22, "action": "BLOCK", "bytes": 0}
]

known_threat_ips = {"45.33.32.156", "185.220.101.5"}

# 1. Estrazione IP sorgente unici
detected_ips = {log["src_ip"] for log in network_logs}

# 2. Identificazione Minacce tramite intersezione set
matched_threats = detected_ips & known_threat_ips

# 3. Calcolo volume traffico consentito per IP
traffic_per_ip = {}
for log in network_logs:
    if log["action"] == "ALLOW":
        ip = log["src_ip"]
        traffic_per_ip[ip] = traffic_per_ip.get(ip, 0) + log["bytes"]

# 4. Rilevamento sospetti Port Scan (>= 2 blocchi)
block_counts = {}
for log in network_logs:
    if log["action"] == "BLOCK":
        ip = log["src_ip"]
        block_counts[ip] = block_counts.get(ip, 0) + 1

suspicious_scanners = {ip: count for ip, count in block_counts.items() if count >= 2}

# 5. Generazione Report Formattato
print("=" * 60)
print("        REPORT DI ANALISI SICUREZZA DI RETE")
print("=" * 60)
print(f"[*] Totale Host Sorgente Unici Rilevati: {len(detected_ips)}")
print(f"[*] IP Rilevati presenti in Cyber Threat Database: {matched_threats if matched_threats else 'Nessuno'}")

print("\n[+] Volume Traffico Autorizzato per Host (Bytes):")
for ip, bytes_count in traffic_per_ip.items():
    print(f"    - Host {ip}: {bytes_count} bytes")

print("\n[!] Allarmi Port Scanning / Brute Force (Blocchi >= 2):")
for ip, count in suspicious_scanners.items():
    print(f"    - ALERT: Host {ip} bloccato {count} volte!")
print("=" * 60)
```
Target: `esercitazioni-04-collezioni.md`
