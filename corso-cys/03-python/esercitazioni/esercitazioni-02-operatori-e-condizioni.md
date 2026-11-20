# Modulo 3: Python
## Scheda Esercitazioni — 02: Operatori di Confronto e Strutture Condizionali

---

### Livello 1 — Base

#### Esercizio 1 — Assegnazione vs Confronto e Stringhe
Dati i seguenti frammenti di codice:
1. Spiega la differenza tra `x = 10` e `x == 10`.
2. Qual è il risultato booleano delle espressioni `"admin" == "Admin"` e `"ssh" < "telnet"`? Motiva la risposta.

#### Esercizio 2 — Controllo Parità e Positività
Scrivi uno script che definisca una variabile intera `number = 14`.
Utilizzando `if ... else`:
1. Verifichi e stampi se il numero è **positivo** (maggiore di zero), **negativo** o **zero**.
2. Verifichi e stampi se il numero è **pari** oppure **dispari** (utilizzando l'operatore resto `%`).

#### Esercizio 3 — Valutazione di Precedenza Logica
Senza eseguire il codice in Python, determina il valore booleano finale delle seguenti espressioni:
```python
a = True or False and False
b = (True or False) and False
c = not False and (True or False)
```
Verifica successivamente le tue risposte con l'interprete Python.

#### Esercizio 4 — Identificazione Valori Truthy e Falsy
Indica quali dei seguenti valori sono valutati come `False` (Falsy) e quali come `True` (Truthy) in un contesto booleano:
```python
v1 = 0
v2 = "0"
v3 = ""
v4 = []
v5 = None
v6 = [0]
```

---

### Livello 2 — Intermedio

#### Esercizio 5 — Classificazione Porte di Rete (`if ... elif ... else`)
Nelle reti informatiche, le porte TCP/UDP sono divise in tre intervalli:
* `1` - `1024`: Porte note (Well-Known Ports)
* `1025` - `49151`: Porte registrate (Registered Ports)
* `49152` - `65535`: Porte dinamiche/private (Dynamic/Private Ports)

Scrivi un programma che accetti una variabile `port = 8080` e stampi a quale categoria appartiene. Se la porta è fuori dall'intervallo 1–65535, deve stampare `"Porta non valida"`.

#### Esercizio 6 — Monitoraggio Risorse di Sistema
Un sistema di monitoraggio deve generare allarmi in base all'uso di CPU e RAM:
* Se `cpu_usage > 90` oppure `ram_usage > 90`: Stampa `"ALLARME CRITICO: Risorse quasi esaurite!"`
* Altrimenti, se `cpu_usage > 70` and `ram_usage > 70`: Stampa `"ATTENZIONE: Carico di lavoro elevato."`
* Altrimenti: Stampa `"Stato del sistema: Normale."`

Testa il codice impostando `cpu_usage = 75` e `ram_usage = 80`.

#### Esercizio 7 — Refactoring con Confronti Concatenati
Riscrivi il seguente codice utilizzando i **confronti concatenati** per renderlo più leggibile e pythonico:
```python
ip_first_octet = 192

if ip_first_octet >= 192 and ip_first_octet <= 223:
    print("Indirizzo di Classe C")
```

#### Esercizio 8 — Operatore Ternario per lo Stato del Servizio
Data la variabile `active_connections = 0`, utilizza un'**espressione condizionale (operatore ternario)** su una singola riga per assegnare alla variabile `server_status` la stringa `"ATTIVO"` se `active_connections > 0`, altrimenti `"INATTIVO"`. Stampa il risultato.

---

### Livello 3 — Avanzato

#### Esercizio 9 — Controllo Difensivo con Short-Circuiting
Data una lista di indirizzi IP `allowed_ips = []` (vuota) e la variabile `user_ip = "192.168.1.50"`, scrivi una condizione che:
1. Verifichi che `allowed_ips` **non sia vuota**.
2. Solo se non è vuota, verifichi se `allowed_ips[0] == user_ip`.
Mostra come la short-circuit evaluation impedisca il verificarsi dell'errore `IndexError` anche quando la lista è vuota.

#### Esercizio 10 — Gestione Comandi Scripting con `match ... case`
Realizza uno script per la gestione di un servizio di rete mediante la struttura `match ... case` (Python 3.10+).
Data la variabile `command = "restart"`:
* `"start"` $\rightarrow$ Stampa `"Avvio del servizio in corso..."`
* `"stop"` $\rightarrow$ Stampa `"Arresto del servizio in corso..."`
* `"restart"` o `"reload"` $\rightarrow$ Stampa `"Riavvio e ricaricamento configurazione..."`
* `"status"` $\rightarrow$ Stampa `"Verifica stato del servizio..."`
* Qualsiasi altro valore (`_`) $\rightarrow$ Stampa `"Comando non riconosciuto."`

#### Esercizio 11 — Valutazione e Assegnazione con Operandi Logici (`or` / `and`)
Senza usare l'istruzione `if`, sfrutta il comportamento degli operatori `or` ed `and` per:
1. Assegnare a `final_username` il valore della variabile `input_name` (se non vuota), oppure `"guest"` come valore predefinito se `input_name` è una stringa vuota `""`.
2. Assegnare a `log_action` il valore `"LOG_RECORDED"` se `is_logging_enabled` è `True`, oppure `False` se `is_logging_enabled` è `False`.

#### Esercizio 12 — Matrice Autorizzazioni Sicurezza
Un utente richiede di accedere a un'area riservata. L'accesso è consentito se:
* L'utente è `"admin"`.
* OPPURE se l'utente è `"analyst"`, possiede `token_valid == True` E l'indirizzo `user_ip` inizia con `"10.0."` (puoi usare `.startswith("10.0.")`).

Testa la condizione con `user = "analyst"`, `token_valid = True`, `user_ip = "10.0.4.15"`.

---

### Livello 4 — Sfida Integrata

#### Sfida Integrata: "Filtro di Sicurezza ed Esecuzione Comandi Firewalled"
Crea uno script Python completo che simuli un **Firewall applicativo / Gateway di Sicurezza**.

Il programma deve ricevere un dizionario o una serie di variabili che rappresentano una richiesta di rete:
```python
request_ip = "10.0.1.50"
request_port = 443
user_role = "operator"
auth_token = "SEC-8842"
command = "SCAN"
payload_size_mb = 12.5
```

Il filtro deve eseguire i seguenti controlli in sequenza:

1. **Validazione dell'Indirizzo IP e della Porta**:
   - L'IP non deve essere nullo né vuoto (usa il controllo truthy).
   - La porta deve rientrare nell'intervallo valido `1 <= request_port <= 65535` (usa i confronti concatenati). Se fuori intervallo, blocca con l'errore: `"ERRORE: Porta fuori intervallo valido."`

2. **Verifica Autenticazione e Autorizzazione (Short-Circuit & Logic)**:
   - L'accesso è autorizzato se:
     - `user_role == "admin"`
     - OPPURE `user_role == "operator"` AND `auth_token` ha una lunghezza di almeno 8 caratteri (`len(auth_token) >= 8`) AND `payload_size_mb <= 50.0`.
   - Se l'autorizzazione fallisce, stampa `"ACCESSO NEGATO: Credenziali o dimensioni payload non valide."` e termina i controlli.

3. **Esecuzione Comando via Structural Pattern Matching (`match ... case`)**:
   Se la richiesta supera i controlli al punto 1 e 2, analizza il `command`:
   - `"STATUS"` $\rightarrow$ Stampa `"[OK 200] Stato sistema: Operativo."`
   - `"SCAN"` $\rightarrow$ Stampa `"[OK 200] Avvio scansione sulla porta {request_port} per IP {request_ip}."`
   - `"FLUSH"` $\rightarrow$ Se `user_role == "admin"` stampa `"[OK 200] Svuotamento cache eseguito."`, altrimenti `"[FORBIDDEN 403] Solo admin può eseguire FLUSH."`
   - `_` $\rightarrow$ Stampa `"[BAD REQUEST 400] Comando non supportato: {command}"`

---

### Soluzioni Ufficiali Commentate

#### Soluzione Esercizio 1
```python
# 1. x = 10 assegna il valore 10 alla variabile x.
#    x == 10 confronta il valore contenuto in x con 10 e restituisce un booleano (True o False).

# 2. "admin" == "Admin" -> False (Python distingue maiuscole e minuscole).
#    "ssh" < "telnet" -> True (in ordine Unicode, 's' viene prima di 't').
```

#### Soluzione Esercizio 2
```python
number = 14

# Controllo Positività
if number > 0:
    print("Il numero è positivo.")
elif number < 0:
    print("Il numero è negativo.")
else:
    print("Il numero è zero.")

# Controllo Parità
if number % 2 == 0:
    print("Il numero è pari.")
else:
    print("Il numero è dispari.")
```

#### Soluzione Esercizio 3
```python
# a = True or (False and False) -> True or False -> True
a = True or False and False

# b = (True or False) and False -> True and False -> False
b = (True or False) and False

# c = (not False) and (True or False) -> True and True -> True
c = not False and (True or False)

print(f"a: {a}, b: {b}, c: {c}")
```

#### Soluzione Esercizio 4
```python
# v1 = 0        -> Falsy (intero zero)
# v2 = "0"      -> Truthy (stringa non vuota!)
# v3 = ""       -> Falsy (stringa vuota)
# v4 = []       -> Falsy (lista vuota)
# v5 = None     -> Falsy (valore nullo)
# v6 = [0]      -> Truthy (lista contenente un elemento)
```

#### Soluzione Esercizio 5
```python
port = 8080

if 1 <= port <= 1024:
    print("Porta Well-Known (nota)")
elif 1025 <= port <= 49151:
    print("Porta Registrata")
elif 49152 <= port <= 65535:
    print("Porta Dinamica/Privata")
else:
    print("Porta non valida")
```

#### Soluzione Esercizio 6
```python
cpu_usage = 75
ram_usage = 80

if cpu_usage > 90 or ram_usage > 90:
    print("ALLARME CRITICO: Risorse quasi esaurite!")
elif cpu_usage > 70 and ram_usage > 70:
    print("ATTENZIONE: Carico di lavoro elevato.")
else:
    print("Stato del sistema: Normale.")
```

#### Soluzione Esercizio 7
```python
ip_first_octet = 192

# Forma con confronto concatenato:
if 192 <= ip_first_octet <= 223:
    print("Indirizzo di Classe C")
```

#### Soluzione Esercizio 8
```python
active_connections = 0

server_status = "ATTIVO" if active_connections > 0 else "INATTIVO"
print(f"Stato del server: {server_status}")
```

#### Soluzione Esercizio 9
```python
allowed_ips = []
user_ip = "192.168.1.50"

# Grazie alla short-circuit evaluation, se allowed_ips è vuota (falsy),
# Python si ferma e non valuta allowed_ips[0], evitando IndexError.
if allowed_ips and allowed_ips[0] == user_ip:
    print("Accesso IP consentito")
else:
    print("Verifica IP fallita o lista IP vuota")
```

#### Soluzione Esercizio 10
```python
command = "restart"

match command:
    case "start":
        print("Avvio del servizio in corso...")
    case "stop":
        print("Arresto del servizio in corso...")
    case "restart" | "reload":
        print("Riavvio e ricaricamento configurazione...")
    case "status":
        print("Verifica stato del servizio...")
    case _:
        print("Comando non riconosciuto.")
```

#### Soluzione Esercizio 11
```python
input_name = ""
is_logging_enabled = True

# 1. Fallback con 'or': se input_name è "", restituisce "guest"
final_username = input_name or "guest"

# 2. Guard con 'and': se is_logging_enabled è True, restituisce "LOG_RECORDED"
log_action = is_logging_enabled and "LOG_RECORDED"

print(f"Username: {final_username}, Logging: {log_action}")
```

#### Soluzione Esercizio 12
```python
user = "analyst"
token_valid = True
user_ip = "10.0.4.15"

is_authorized = (user == "admin") or (user == "analyst" and token_valid and user_ip.startswith("10.0."))

if is_authorized:
    print("Accesso all'area riservata autorizzato.")
else:
    print("Accesso negato.")
```

#### Soluzione Esercizio 13 — Soluzione Sfida Integrata
```python
request_ip = "10.0.1.50"
request_port = 443
user_role = "operator"
auth_token = "SEC-8842"
command = "SCAN"
payload_size_mb = 12.5

# 1. Validazione IP e Porta
if not request_ip:
    print("ERRORE: Indirizzo IP non fornito o nullo.")
elif not (1 <= request_port <= 65535):
    print("ERRORE: Porta fuori intervallo valido.")
else:
    # 2. Controllo Autenticazione e Autorizzazione
    is_admin = (user_role == "admin")
    is_valid_operator = (
        user_role == "operator"
        and auth_token is not None
        and len(auth_token) >= 8
        and payload_size_mb <= 50.0
    )

    if not (is_admin or is_valid_operator):
        print("ACCESSO NEGATO: Credenziali o dimensioni payload non valide.")
    else:
        # 3. Esecuzione Comando con Match-Case
        match command:
            case "STATUS":
                print("[OK 200] Stato sistema: Operativo.")
            case "SCAN":
                print(f"[OK 200] Avvio scansione sulla porta {request_port} per IP {request_ip}.")
            case "FLUSH":
                if user_role == "admin":
                    print("[OK 200] Svuotamento cache eseguito.")
                else:
                    print("[FORBIDDEN 403] Solo admin può eseguire FLUSH.")
            case _:
                print(f"[BAD REQUEST 400] Comando non supportato: {command}")
```
