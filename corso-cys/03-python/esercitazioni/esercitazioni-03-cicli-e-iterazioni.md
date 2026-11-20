# Esercitazioni: Cicli e Iterazioni

La seguente raccolta di esercitazioni è strutturata in livelli di difficoltà crescente per consolidare l'utilizzo dei cicli `for`, `while`, delle funzioni d'appoggio (`range`, `enumerate`, `zip`) e delle istruzioni di controllo del flusso (`break`, `continue`, `else`).

---

## Livello 1: Sintassi e Basi

### Esercizio 1.1: Generazione Intervalli con `range()`
Scrivi un programma che utilizzi il ciclo `for` e la funzione `range()` per svolgere i seguenti compiti:
1. Stampare i numeri interi da 1 a 15 inclusi su una sola riga separati da uno spazio.
2. Stampare tutti i numeri dispari compresi tra 20 e 40.
3. Stampare un conto alla rovescia da 10 a 0, seguito dalla stringa `"START!"`.

### Esercizio 1.2: Conteggio Caratteri Specifici
Data la stringa `text = "cybersecurity analyst"`, scrivi un ciclo `for` che provveda a:
1. Contare quante volte compare la lettera `'s'`.
2. Contare quante sono le vocali totali presenti nella stringa (`a, e, i, o, u`).

### Esercizio 1.3: Ciclo `while` con Sommatore
Chiedi all'utente di inserire numeri interi positivi da tastiera. 
- Il ciclo `while` deve continuare ad accumulare la somma dei numeri inseriti.
- L'inserimento termina quando l'utente digita il valore `0`.
- Al termine, il programma deve stampare la somma totale accumulata.

---

## Livello 2: Intermedio — Logica di Controllo e Iterazione Avanzata

### Esercizio 2.1: Numerazione con `enumerate()` e Filtraggio con `continue`
Data la lista di indirizzi IP:
```python
ip_addresses = ["192.168.1.1", "0.0.0.0", "10.0.0.254", "127.0.0.1", "0.0.0.0", "172.16.0.1"]
```
Scrivi un programma che iteri sulla lista usando `enumerate(..., start=1)`:
- Se l'indirizzo IP è `"0.0.0.0"`, la scansione deve ignorarlo usando l'istruzione `continue` (stampando un messaggio di avviso).
- Per gli altri IP validi, stampa l'indice di posizione e l'IP formattato.

### Esercizio 2.2: Ricerca Sicura con `for ... else`
Data una lista di log contenente gli esiti delle autenticazioni ad un sistema:
```python
auth_logs = ["FAIL", "FAIL", "SUCCESS", "FAIL", "SUCCESS"]
```
Scrivi un programma che ricerchi il primo tentativo riuscito (`"SUCCESS"`):
- Non appena trova `"SUCCESS"`, deve stampare `"Autenticazione riuscita al tentativo N"` e interrompere il ciclo con `break`.
- Se nella lista non è presente alcun `"SUCCESS"`, deve sfruttare la clausola `else` del ciclo `for` per stampare `"ALERT: Nessun accesso riuscito identificato nei log"`.

### Esercizio 2.3: Iterazione su Dizionari di Servizio
Dato il seguente dizionario contenente servizi di rete ed il relativo stato:
```python
network_services = {
    "HTTP": "RUNNING",
    "FTP": "STOPPED",
    "SSH": "RUNNING",
    "SMTP": "STOPPED",
    "DNS": "RUNNING"
}
```
Utilizza un ciclo `for` ed il metodo `.items()` per:
1. Stampare solo i servizi che si trovano nello stato `"RUNNING"`.
2. Contare ed evidenziare quanti servizi sono attualmente `"STOPPED"`.

---

## Livello 3: Avanzato — Cicli Annidati e Strutture Dati

### Esercizio 3.1: Generazione Tabella delle Porte (Matrice)
Si desidera simulare una matrice 4x4 che rappresenti lo stato di 16 porte di rete (dove `1` indica porta Aperta e `0` porta Chiusa):
```python
port_grid = [
    [1, 0, 1, 0],
    [0, 0, 1, 1],
    [1, 1, 0, 0],
    [0, 1, 1, 0]
]
```
Scrivi un programma con cicli `for` annidati per:
1. Stampare la griglia sotto forma di tabella formattata a righe e colonne.
2. Calcolare e stampare il numero totale di porte aperte (`1`) presenti nell'intera griglia.

### Esercizio 3.2: Accoppiamento Sequenze con `zip()` e Validazione `all()`
Date le seguenti liste parallele relative a 3 utenti di sistema:
```python
users = ["admin", "operator", "guest"]
passwords = ["Secr3t!2026", "op_pass", "1234"]
min_lengths = [8, 8, 8]
```
1. Utilizza `zip()` per iterare contemporaneamente su utenti, password e lunghezze minime, segnalando quali utenti hanno una password conforme (lunghezza >= 8).
2. Utilizza la funzione `all()` per verificare se **tutti** gli utenti rispettano il requisito di sicurezza.

---

## Livello 4: Sfida Integrata — Port Scanner & Brute-Force Rate Limiter

### Descrizione del Problema
In ambito Scripting per la Sicurezza, occorre sviluppare un modulo di analisi di rete che esegua due operazioni sequenziali:

1. **Scansione Porte (Port Scanner)**:
   - Viene fornita una lista di porte target da analizzare: `[21, 22, 23, 80, 443, 8080]`.
   - Viene fornito un dizionario delle porte note per essere bloccate dal Firewall della rete: `{23: "TELNET vietato", 8080: "Porta proxy non autorizzata"}`.
   - Il programma deve iterare sulle porte. Se la porta è nel dizionario del firewall, deve saltarla con `continue` segnalando il motivo. Per le altre porte, deve simularne l'analisi ed indicare se la porta è accessibile.

2. **Simulatore di Rate Limiting / Protezione Brute-Force**:
   - Viene simulato un tentativo di login alla porta SSH (22).
   - L'utente ha a disposizione un numero massimo di **3 tentativi** gestiti tramite un ciclo `while`.
   - Ad ogni tentativo viene richiesta l'immissione di un PIN/passphrase secretato.
   - Se il PIN inserito è corretto (`"admin2026"`), il programma stampa `"Accesso Granted"` e interrompe il ciclo immediatamente.
   - Se il PIN è errato, viene decrementato il numero di tentativi residui.
   - Se i tentativi si azzerano, la clausola `else` o la verifica finale del ciclo deve attivare l'azione di blocco: `"IP Lockout attivato per 15 minuti"`.

---

## Soluzioni Ufficiali Commentate

### Soluzione Esercizio 1.1
```python
# 1. Numeri da 1 a 15
for i in range(1, 16):
    print(i, end=" ")
print("\n")

# 2. Dispari tra 20 e 40
for i in range(21, 40, 2):
    print(i, end=" ")
print("\n")

# 3. Conto alla rovescia da 10 a 0
for i in range(10, -1, -1):
    print(i, end=" ")
print("START!")
```

### Soluzione Esercizio 1.2
```python
text = "cybersecurity analyst"
count_s = 0
count_vowels = 0
vowels = "aeiou"

for char in text.lower():
    if char == 's':
        count_s += 1
    if char in vowels:
        count_vowels += 1

print(f"Lettere 's' trovate: {count_s}")
print(f"Vocali totali trovate: {count_vowels}")
```

### Soluzione Esercizio 1.3
```python
total_sum = 0

while True:
    val = int(input("Inserisci un numero positivo (0 per terminare): "))
    if val == 0:
        break
    if val < 0:
        print("Attenzione: inserisci solo numeri positivi.")
        continue
    total_sum += val

print(f"Somma totale accumulata: {total_sum}")
```

### Soluzione Esercizio 2.1
```python
ip_addresses = ["192.168.1.1", "0.0.0.0", "10.0.0.254", "127.0.0.1", "0.0.0.0", "172.16.0.1"]

for idx, ip in enumerate(ip_addresses, start=1):
    if ip == "0.0.0.0":
        print(f"Posizione {idx}: [AVVISO] Indirizzo non valido (0.0.0.0), scarto...")
        continue
    print(f"Posizione {idx}: IP Attivo -> {ip}")
```

### Soluzione Esercizio 2.2
```python
auth_logs = ["FAIL", "FAIL", "SUCCESS", "FAIL", "SUCCESS"]

for attempt_num, status in enumerate(auth_logs, start=1):
    if status == "SUCCESS":
        print(f"Autenticazione riuscita al tentativo #{attempt_num}")
        break
else:
    print("ALERT: Nessun accesso riuscito identificato nei log")
```

### Soluzione Esercizio 2.3
```python
network_services = {
    "HTTP": "RUNNING",
    "FTP": "STOPPED",
    "SSH": "RUNNING",
    "SMTP": "STOPPED",
    "DNS": "RUNNING"
}

stopped_count = 0

print("--- Servizi Attivi ---")
for service, state in network_services.items():
    if state == "RUNNING":
        print(f"[ONLINE] Servizio {service}")
    elif state == "STOPPED":
        stopped_count += 1

print(f"\nTotale servizi inattivi (STOPPED): {stopped_count}")
```

### Soluzione Esercizio 3.1
```python
port_grid = [
    [1, 0, 1, 0],
    [0, 0, 1, 1],
    [1, 1, 0, 0],
    [0, 1, 1, 0]
]

open_ports_count = 0

print("--- Mappa Stato Porte (1=Open, 0=Closed) ---")
for row in port_grid:
    for status in row:
        print(status, end="  ")
        if status == 1:
            open_ports_count += 1
    print()  # Nuova riga per la matrice

print(f"\nNumero totale di porte aperte rilevate: {open_ports_count}")
```

### Soluzione Esercizio 3.2
```python
users = ["admin", "operator", "guest"]
passwords = ["Secr3t!2026", "op_pass", "1234"]
min_lengths = [8, 8, 8]

validity_flags = []

for u, p, m in zip(users, passwords, min_lengths):
    is_valid = len(p) >= m
    validity_flags.append(is_valid)
    status_str = "VALIDA" if is_valid else "NON VALIDA (troppo corta)"
    print(f"Utente '{u}': Password {status_str}")

all_compliant = all(validity_flags)
print(f"\nTutti gli account rispettano la policy di sicurezza? {all_compliant}")
```

### Soluzione Sfida Integrata
```python
# Parte 1: Scansione Porte
target_ports = [21, 22, 23, 80, 443, 8080]
blocked_by_firewall = {
    23: "TELNET vietato da policy aziendale",
    8080: "Porta proxy non autorizzata"
}

print("=== PARTE 1: SCANSIONE PORTE DI RETE ===")
for port in target_ports:
    if port in blocked_by_firewall:
        reason = blocked_by_firewall[port]
        print(f"Porta {port:<4} -> [FIREWALL BLOCKED] Motivo: {reason}")
        continue
    print(f"Porta {port:<4} -> [OK] Scansione completata. Porta accessibile.")

print("\n" + "="*45 + "\n")

# Parte 2: Simulatore Rate Limiting (Brute-Force Protection)
print("=== PARTE 2: AUTENTICAZIONE SSH CON RATE LIMITER ===")
CORRECT_PIN = "admin2026"
max_attempts = 3
attempts_left = max_attempts

while attempts_left > 0:
    entered_pin = input(f"Tentativi rimasti [{attempts_left}/{max_attempts}]. Inserisci Passphrase SSH: ").strip()
    
    if entered_pin == CORRECT_PIN:
        print("\n[SUCCESS] Autenticazione riuscita! Accesso alla shell accordato.")
        break
    else:
        attempts_left -= 1
        print(f"[FAILED] Credenziale errata.")
else:
    print("\n[SECURITY ALERT] Numero massimo di tentativi superato!")
    print("[ACTION] L'indirizzo IP chiamante è stato bloccato (Lockout 15 min).")
```
