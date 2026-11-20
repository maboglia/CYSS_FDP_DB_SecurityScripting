# Esercitazioni: Modulo 05 — Le Funzioni in Python

La seguente scheda comprende esercitazioni pratiche organizzate in quattro livelli di difficoltà crescente, progettate per consolidare la conoscenza teorica delle funzioni in Python, della gestione dei parametri, dello scope e della progettazione funzionale.

---

## Livello 1: Sintassi Base, Parametri e Valori di Ritorno

### Esercizio 1.1 — Calcolatore di Statistiche Base
Scrivi una funzione chiamata `calcola_statistiche(numeri: list) -> tuple` che prenda in ingresso una lista di numeri reali e restituisca una tupla contenente tre valori: il valore minimo, il valore massimo e la media aritmetica. Se la lista è vuota, la funzione deve restituire `(None, None, 0.0)`.

### Esercizio 1.2 — Correzione del Bug del Default Mutabile
Analizza il seguente codice difettoso e spiega perché presenta un comportamento errato in chiamate successive. Riscrivilo applicando il pattern idiomatico corretto con `None`.

```python
# CODICE CON BUG DA CORREGGERE
def registra_evento(evento: str, log_sistema: list = []):
    log_sistema.append(evento)
    return log_sistema
```

### Esercizio 1.3 — Formattatore di Indirizzi e Porte
Scrivi una funzione `formatta_endpoint(host: str, porta: int = 80, ssl: bool = False) -> str` che restituisca l'URL formattato dell'endpoint (es. `https://localhost:443` oppure `http://localhost:80`). Testa la funzione invocandola sia con argomenti posizionali sia con keyword arguments.

### Esercizio 1.4 — Validatore di Criteri di Robustezza Stringa
Scrivi una funzione `valida_stringa_accesso(chiave: str, min_lunghezza: int = 8) -> bool` che restituisca `True` se la stringa soddisfa tutti i seguenti criteri:
* Lunghezza maggiore o uguale a `min_lunghezza`.
* Contiene almeno una lettera maiuscola e una minuscola.
* Contiene almeno un numero.

---

## Livello 2: Parametri Avanzati, Unpacking e Scope

### Esercizio 2.1 — Calcolatore di Media Ponderata con `*args`
Scrivi una funzione `calcola_media_pesata(*coppie_valore_peso) -> float` che accetti un numero variabile di tuple nella forma `(voto, peso)` e restituisca la media ponderata. Se la somma dei pesi è 0 o non vengono passati argomenti, restituisci `0.0`.

### Esercizio 2.2 — Generatore di Header HTTP con `**kwargs`
Scrivi una funzione `costruisci_headers(host: str, id_sessione: str, **custom_headers) -> dict` che generi un dizionario di header HTTP. La funzione deve obbligatoriamente impostare `"Host"` e `"Session-ID"`, e aggiungere tutti gli header supplementari passati in `kwargs`, convertendo i nomi delle chiavi in *Title-Case* (es. `user_agent` -> `User-Agent`).

### Esercizio 2.3 — Controllo della Firma: Positional-Only e Keyword-Only
Definisci una funzione `autentica_utente(username, credenziale, /, *, tenta_mfa=False, origine="locale")` in cui `username` e `credenziale` siano **positional-only**, mentre `tenta_mfa` e `origine` siano **keyword-only**. Scrivi tre chiamate di test valide e due chiamate errate commentate che generano `TypeError`.

### Esercizio 2.4 — Simulatore di Registro Ingressi con `nonlocal`
Scrivi una funzione `crea_gate_accesso(nome_gate: str)` che restituisca una funzione interna `registra_passaggio(valido: bool) -> dict`. La funzione interna deve mantenere il conteggio dei passaggi validi e di quelli rifiutati tramite `nonlocal` e restituire ad ogni chiamata un dizionario con lo stato aggiornato del gate.

---

## Livello 3: Programmazione Funzionale, Ricorsione e Decoratori

### Esercizio 3.1 — Filtro e Trasformazione Log con `map` e `filter`
Dato un elenco di record di log rappresentati come stringhe nella forma `"TIMESTAMP|LIVELLO|MESSAGGIO"`:
1. Usa `filter()` per isolare solo i log di livello `"ERROR"` o `"CRITICAL"`.
2. Usa `map()` e una funzione `lambda` per estrarre una tupla `(TIMESTAMP, MESSAGGIO)` da ciascun record filtrato.

### Esercizio 3.2 — Somma Ricorsiva di Liste Annidate
Scrivi una funzione ricorsiva `somma_ricorsiva(struttura)` che accetti una lista che può contenere numeri interi oppure altre liste annidate a qualsiasi livello di profondità, e restituisca la somma totale di tutti i numeri presenti.
*Esempio*: `somma_ricorsiva([1, [2, 3], [4, [5, 6]]])` deve restituire `21`.

### Esercizio 3.3 — Decoratore di Controllo Accessi (`@richiede_ruolo`)
Scrivi un decoratore parametrizzato `@richiede_ruolo(ruolo_richiesto: str)` che accetti come argomento il ruolo necessario per eseguire una funzione. La funzione decorata riceverà un argomento keyword `utente_corrente` (dizionario con chiave `"ruolo"`). Se il ruolo dell'utente non corrisponde a quello richiesto, il decoratore deve sollevare un'eccezione `PermissionError` senza eseguire la funzione.

---

## Livello 4: Sfida Integrata — Pipeline di Audit e Analisi Log di Sistema

### Obiettivo
Realizzare un sistema modulare per la scansione, il filtraggio e l'aggregazione di log di eventi di sistema.

### Requisiti del Programma
1. **Parsing dei Record**: Definire una funzione `parsifica_log(linea_log: str) -> dict` che converta una riga del log (es. `"2026-11-20 04:15:00 | SVR01 | 443 | ALLOW | 1540"`) in un dizionario strutturato con chiavi `timestamp`, `nodo`, `porta`, `azione` (`ALLOW`/`BLOCK`), e `byte_trasferiti`.
2. **Decoratore di Audit (`@traccia_audit`)**: Creare un decoratore che stampi a console l'inizio dell'analisi, il numero di record elaborati e il tempo di esecuzione impiegato.
3. **Funzione di Filtraggio Generica**: Scrivere una funzione `filtra_eventi(log_parsificati: list, *criteri_predicati) -> list` che accetti una lista di log e un numero arbitrario di funzioni filtro (predicati `lambda` o standard) e restituisca solo i log che soddisfano **tutti** i criteri passati.
4. **Aggregatore di Statistiche**: Scrivere una funzione `genera_report_sicurezza(log_filtrati: list) -> dict` che utilizzi le opportune strutture dati per restituire:
   * Totale byte trasferiti tra gli eventi consentiti (`ALLOW`).
   * Insieme (`set`) dei nodi unici bloccati (`BLOCK`).
   * Conteggio degli eventi per porta di destinazione.

---

## Soluzioni Ufficiali Commentate

```python
# ==============================================================================
# SOLUZIONI LIVELLO 1
# ==============================================================================

# Esercizio 1.1
def calcola_statistiche(numeri: list) -> tuple:
    if not numeri:
        return (None, None, 0.0)
    minimo = min(numeri)
    massimo = max(numeri)
    media = sum(numeri) / len(numeri)
    return (minimo, massimo, media)

# Esercizio 1.2
def registra_evento(evento: str, log_sistema: list = None) -> list:
    if log_sistema is None:
        log_sistema = []
    log_sistema.append(evento)
    return log_sistema

# Esercizio 1.3
def formatta_endpoint(host: str, porta: int = 80, ssl: bool = False) -> str:
    schema = "https" if ssl else "http"
    return f"{schema}://{host}:{porta}"

# Esercizio 1.4
def valida_stringa_accesso(chiave: str, min_lunghezza: int = 8) -> bool:
    if len(chiave) < min_lunghezza:
        return False
    ha_maiuscola = any(c.isupper() for c in chiave)
    ha_minuscola = any(c.islower() for c in chiave)
    ha_numero = any(c.isdigit() for c in chiave)
    return ha_maiuscola and ha_minuscola and ha_numero


# ==============================================================================
# SOLUZIONI LIVELLO 2
# ==============================================================================

# Esercizio 2.1
def calcola_media_pesata(*coppie_valore_peso) -> float:
    somma_prodotti = 0.0
    somma_pesi = 0.0
    for voto, peso in coppie_valore_peso:
        somma_prodotti += voto * peso
        somma_pesi += peso
    if somma_pesi == 0:
        return 0.0
    return somma_prodotti / somma_pesi

# Esercizio 2.2
def costruisci_headers(host: str, id_sessione: str, **custom_headers) -> dict:
    headers = {
        "Host": host,
        "Session-ID": id_sessione
    }
    for chiave, valore in custom_headers.items():
        chiave_formattata = "-".join(part.capitalize() for part in chiave.split("_"))
        headers[chiave_formattata] = str(valore)
    return headers

# Esercizio 2.3
def autentica_utente(username, credenziale, /, *, tenta_mfa=False, origine="locale"):
    return f"Autenticazione per {username} da {origine} (MFA={tenta_mfa})"

# Test validi:
autentica_utente("admin", "token_valido")
autentica_utente("admin", "token_valido", tenta_mfa=True)
autentica_utente("admin", "token_valido", origine="remota", tenta_mfa=True)

# Test Errati (Commentati):
# autentica_utente(username="admin", credenziale="123") # TypeError: Positional-only
# autentica_utente("admin", "token_valido", True)       # TypeError: Keyword-only

# Esercizio 2.4
def crea_gate_accesso(nome_gate: str):
    ingressi_validi = 0
    ingressi_rifiutati = 0

    def registra_passaggio(valido: bool) -> dict:
        nonlocal ingressi_validi, ingressi_rifiutati
        if valido:
            ingressi_validi += 1
        else:
            ingressi_rifiutati += 1
        return {
            "gate": nome_gate,
            "validi": ingressi_validi,
            "rifiutati": ingressi_rifiutati,
            "totale": ingressi_validi + ingressi_rifiutati
        }
    return registra_passaggio


# ==============================================================================
# SOLUZIONI LIVELLO 3
# ==============================================================================

# Esercizio 3.1
raw_logs = [
    "2026-11-20 08:00:01|INFO|Servizio avviato",
    "2026-11-20 08:02:15|ERROR|Connessione al DB fallita",
    "2026-11-20 08:05:30|WARNING|Memoria al 85%",
    "2026-11-20 08:10:00|CRITICAL|Eccezione di sistema rilevata"
]

log_critici = filter(lambda line: line.split("|")[1] in ("ERROR", "CRITICAL"), raw_logs)
estrazione = map(lambda line: (line.split("|")[0], line.split("|")[2]), log_critici)
risultato_log = list(estrazione)

# Esercizio 3.2
def somma_ricorsiva(struttura) -> int:
    totale = 0
    for elemento in struttura:
        if isinstance(elemento, list):
            totale += somma_ricorsiva(elemento)  # Passo ricorsivo
        elif isinstance(elemento, (int, float)):
            totale += elemento                 # Caso base per elemento numerico
    return totale

# Esercizio 3.3
from functools import wraps

def richiede_ruolo(ruolo_richiesto: str):
    def decoratore(funzione):
        @wraps(funzione)
        def wrapper(*args, **kwargs):
            utente = kwargs.get("utente_corrente")
            if not utente or utente.get("ruolo") != ruolo_richiesto:
                raise PermissionError(f"Accesso negato. Richiesto ruolo: '{ruolo_richiesto}'")
            return funzione(*args, **kwargs)
        return wrapper
    return decoratore

@richiede_ruolo("ADMIN")
def azzera_risorsa(*, utente_corrente: dict):
    return "Risorsa azzerata con successo."


# ==============================================================================
# SOLUZIONE LIVELLO 4 (SFIDA INTEGRATA)
# ==============================================================================

import time
from functools import wraps

# 1. Parsing dei log
def parsifica_log(linea_log: str) -> dict:
    parti = [p.strip() for p in linea_log.split("|")]
    return {
        "timestamp": parti[0],
        "nodo": parti[1],
        "porta": int(parti[2]),
        "azione": parti[3],
        "byte": int(parti[4])
    }

# 2. Decoratore di Audit
def traccia_audit(funzione):
    @wraps(funzione)
    def wrapper(*args, **kwargs):
        t_inizio = time.perf_counter()
        print(f"[AUDIT] Avvio elaborazione con '{funzione.__name__}'...")
        risultato = funzione(*args, **kwargs)
        t_fine = time.perf_counter()
        durata = t_fine - t_inizio
        print(f"[AUDIT] Completato in {durata:.6f}s. Elementi elaborati: {len(risultato) if isinstance(risultato, list) else 'N/D'}")
        return risultato
    return wrapper

# 3. Filtraggio generico con predicati
@traccia_audit
def filtra_eventi(log_parsificati: list, *criteri_predicati) -> list:
    risultato = []
    for log in log_parsificati:
        if all(predicato(log) for predicato in criteri_predicati):
            risultato.append(log)
    return risultato

# 4. Aggregatore di statistiche
def genera_report_sicurezza(log_filtrati: list) -> dict:
    byte_totali_allow = sum(log["byte"] for log in log_filtrati if log["azione"] == "ALLOW")
    nodi_bloccati = {log["nodo"] for log in log_filtrati if log["azione"] == "BLOCK"}
    
    conteggio_porte = {}
    for log in log_filtrati:
        porta = log["porta"]
        conteggio_porte[porta] = conteggio_porte.get(porta, 0) + 1
        
    return {
        "byte_totali_consentiti": byte_totali_allow,
        "nodi_unici_bloccati": nodi_bloccati,
        "eventi_per_porta": conteggio_porte
    }

# --- TEST COMPLETO DEL LIVELLO 4 ---
if __name__ == "__main__":
    raw_system_logs = [
        "2026-11-20 04:00:10 | SVR01 | 443 | ALLOW | 4500",
        "2026-11-20 04:01:15 | SVR02 | 8080| BLOCK | 0",
        "2026-11-20 04:02:30 | SVR01 | 80  | ALLOW | 1200",
        "2026-11-20 04:03:00 | SVR02 | 8080| BLOCK | 0",
        "2026-11-20 04:05:45 | SVR03 | 443 | ALLOW | 8900",
        "2026-11-20 04:06:12 | SVR01 | 8080| BLOCK | 0"
    ]

    # Parsing
    logs_strutturati = [parsifica_log(linea) for linea in raw_system_logs]

    # Predicati di filtro (es. Solo traffico su determinate porte)
    predicato_porte_critiche = lambda log: log["porta"] in (8080, 443)

    # Filtraggio tramite funzione decorata
    logs_filtrati = filtra_eventi(logs_strutturati, predicato_porte_critiche)

    # Generazione del report
    report = genera_report_sicurezza(logs_filtrati)
    print("\n--- REPORT FINALE ---")
    print(f"Byte totali autorizzati: {report['byte_totali_consentiti']}")
    print(f"Nodi bloccati: {report['nodi_unici_bloccati']}")
    print(f"Distribuzione per porta: {report['eventi_per_porta']}")
```