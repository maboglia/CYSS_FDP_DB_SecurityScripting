# Esercitazioni — Modulo 08: Gestione delle Eccezioni

Le esercitazioni di questo modulo consentono di mettere in pratica i concetti relativi all'intercettazione degli errori, alla costruzione di eccezioni di dominio personalizzate, al ciclo completo `try/except/else/finally`, al chaining e alla creazione di Context Manager per la gestione sicura delle risorse.

---

## 1. Livello 1: Fondamenti (Sintassi e Tipi di Eccezione)

### Esercizio 1.1 — Lettura Sicura di un Numero Intero
Scrivi una funzione `leggi_intero_sicuro(prompt: str) -> int` che richieda all'utente l'inserimento di un numero intero. Se l'utente inserisce una stringa non convertibile, la funzione deve mostrare un messaggio di errore e ripresentare la richiesta all'infinito finché non viene fornito un valore intero valido.

### Esercizio 1.2 — Calcolatrice Divisione con Gestione Multipla
Crea una funzione `dividi_valori(a: str, b: str) -> float` che accetti due argomenti stringa provenienti da un modulo o da un input utente. La funzione deve:
1. Convertire entrambi i valori in `float`.
2. Calcolare la divisione `a / b`.
3. Intercettare specificamente `ValueError` (se la conversione fallisce) e `ZeroDivisionError` (se `b` è zero), restituendo un opportuno messaggio esplicativo o gestendo l'eccezione.

---

## 2. Livello 2: Flusso Completo e Rilancio (`else`, `finally`, `raise`)

### Esercizio 2.1 — Validatore di Portafoglio Cripto
Scrivi una funzione `preleva_cripto(saldo_attuale: float, importo: float) -> float` che:
- Verifichi se l'importo da prelevare è positivo (`importo > 0`). In caso contrario, sollevi `ValueError("L'importo del prelievo deve essere positivo.")`.
- Verifichi se il saldo è sufficiente (`saldo_attuale >= importo`). In caso contrario, sollevi `ValueError("Saldo insufficiente per completare la transazione.")`.
- Utilizzi la struttura `try/except/else/finally` per simulare la registrazione del tentativo di transazione nel file di audit (nel blocco `finally`).

### Esercizio 2.2 — Exception Chaining nei Servizi di Certificazione
Scrivi una funzione `autentica_token(token: str) -> dict` che accetti una stringa token. Se la stringa non è in formato JSON valido (usa `json.loads`), intercetta il `json.JSONDecodeError` e rilancia una nuova eccezione `PermissionError("Token di autenticazione malformato")` utilizzando la clausola `from e` per preservare il contesto originale dell'errore.

---

## 3. Livello 3: Eccezioni Personalizzate e Context Manager

### Esercizio 3.1 — Gerarchia di Eccezioni per un Modulo e-Commerce
Definisci una gerarchia di eccezioni di dominio per una piattaforma di e-commerce:
- `EcommerceError(Exception)`: eccezione base per la piattaforma.
- `ProductNotFoundError(EcommerceError)`: sollevata quando un prodotto cercato nel catalogo non esiste.
- `OutofStockError(EcommerceError)`: sollevata quando la quantità ordinata supera le scorte disponibili.

Crea una classe `CatalogoProdotto` che gestisce un dizionario di prodotti e scorte, e implementa un metodo `ordina_prodotto(codice: str, quantita: int)` che utilizzi le tue eccezioni personalizzate.

### Esercizio 3.2 — Context Manager Personalizzato `SafeLock` 
Implementa una classe `SafeLock` che funzioni come Context Manager tramite i metodi `__enter__` e `__exit__`.
- Quando si entra nel blocco `with`, deve simulare l'acquisizione di un lock esclusivo di sicurezza ("LOCK ACQUISITO").
- Quando si esce dal blocco `with` (sia in caso di completamento normale che di eccezione), deve garantire il rilascio del lock ("LOCK RILASCIATO") e stampare a log se si è verificato un errore, senza sopprimerlo (deve restituire `False`).

---

## 4. Livello 4: Sfida Integrata — Vault di Sicurezza e Motore di Audit Transazioni

### Descrizione della Sfida
Progetta e implementa un sistema di **Audit e Gestione della Sicurezza di un Vault Cifrato** (`VaultSecurityEngine`).

Il sistema deve:
1. **Definire una gerarchia di eccezioni personalizzate**:
   - `VaultSecurityError(Exception)`
   - `AuthenticationFailedError(VaultSecurityError)`
   - `VaultLockedError(VaultSecurityError)`
   - `InvalidPayloadError(VaultSecurityError)`
2. **Implementare un Context Manager `AuditLogger`**:
   - Apre un registro simulato di audit all'ingresso (`__enter__`).
   - Registra ogni operazione e ogni eccezione verificatasi nell'uscita (`__exit__`), garantendo la chiusura formale della sessione di audit.
3. **Implementare la classe `VaultSession`**:
   - Mantiene lo stato di tentativi falliti (max 3 tentativi prima di bloccare il vault con `VaultLockedError`).
   - Implementa un metodo `sblocca_vault(pin: str)`.
   - Implementa un metodo `estrai_payload(payload_cifrato: str)` che decodifica la stringa e solleva `InvalidPayloadError` (incatenata da `ValueError` o `TypeError` tramite `raise ... from`) se il payload è alterato.

---

## Soluzioni Ufficiali Commentate

```python
import json
import logging

logging.basicConfig(level=logging.INFO, format="%(asctime)s [%(levelname)s] %(message)s")

# ==========================================
# 1. LIVELLO 1: SOLUZIONI
# ==========================================

def leggi_intero_sicuro(prompt: str) -> int:
    """Richiede un intero all'utente finché non ne viene fornito uno valido."""
    while True:
        try:
            valore_input = input(prompt)
            return int(valore_input)
        except ValueError:
            print("❌ Errore: Valore non valido. Inserisci un numero intero (es. 42).")

def dividi_valori(a: str, b: str) -> float:
    """Converte e divide due stringhe gestendo ValueError e ZeroDivisionError."""
    try:
        val_a = float(a)
        val_b = float(b)
        return val_a / val_b
    except ValueError as e:
        print(f"❌ Errore di conversione: Impossibile convertire i valori in numeri ({e})")
        raise
    except ZeroDivisionError:
        print("❌ Errore matematico: Impossibile dividere un valore per zero!")
        raise


# ==========================================
# 2. LIVELLO 2: SOLUZIONI
# ==========================================

def preleva_cripto(saldo_attuale: float, importo: float) -> float:
    """Esegue un prelievo con ciclo try/except/else/finally."""
    print(f"\n--- Avvio procedura prelievo: {importo:.2f} € ---")
    esito = False
    try:
        if importo <= 0:
            raise ValueError("L'importo del prelievo deve essere strettamente positivo.")
        if importo > saldo_attuale:
            raise ValueError(f"Saldo insufficiente ({saldo_attuale:.2f} € disponibile).")
    except ValueError as err:
        print(f"❌ Errore durante la validazione: {err}")
        raise
    else:
        saldo_attuale -= importo
        esito = True
        print(f"✅ Prelievo completato con successo. Nuovo saldo: {saldo_attuale:.2f} €")
        return saldo_attuale
    finally:
        stato_log = "SUCCESS" if esito else "FAILED"
        print(f"🔒 [AUDIT LOG] Transazione registrata nel registro di sicurezza. Stato: {stato_log}")

def autentica_token(token: str) -> dict:
    """Verifica il token JSON applicando l'Exception Chaining (raise ... from)."""
    try:
        dati_token = json.loads(token)
        return dati_token
    except json.JSONDecodeError as err:
        raise PermissionError("Accesso negato: Il token fornito è malformato o non valido.") from err


# ==========================================
# 3. LIVELLO 3: SOLUZIONI
# ==========================================

# Esercizio 3.1: Gerarchia di Eccezioni e-Commerce
class EcommerceError(Exception):
    """Base exception for e-commerce domain."""
    pass

class ProductNotFoundError(EcommerceError):
    def __init__(self, codice_prodotto: str):
        super().__init__(f"Prodotto non trovato nel catalogo: '{codice_prodotto}'")

class OutofStockError(EcommerceError):
    def __init__(self, codice_prodotto: str, richiesti: int, disponibili: int):
        super().__init__(f"Scorta insufficiente per '{codice_prodotto}': richiesti {richiesti}, disponibili {disponibili}")

class CatalogoProdotto:
    def __init__(self):
        self._prodotti = {
            "PROD01": {"nome": "Laptop Pro", "scorta": 5},
            "PROD02": {"nome": "Mouse Wireless", "scorta": 0}
        }

    def ordina_prodotto(self, codice: str, quantita: int):
        if codice not in self._prodotti:
            raise ProductNotFoundError(codice)
        
        scorta_attuale = self._prodotti[codice]["scorta"]
        if quantita > scorta_attuale:
            raise OutofStockError(codice, quantita, scorta_attuale)
        
        self._prodotti[codice]["scorta"] -= quantita
        print(f"✅ Ordine di {quantita}x {self._prodotti[codice]['nome']} confermato!")


# Esercizio 3.2: Context Manager SafeLock
class SafeLock:
    def __init__(self, risorsa_id: str):
        self.risorsa_id = risorsa_id

    def __enter__(self):
        print(f"🔑 [LOCK] Acquisizione lock di sicurezza per la risorsa: {self.risorsa_id}")
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        if exc_type:
            print(f"⚠️ [LOCK] Errore rilevato durante l'esecuzione ({exc_type.__name__}: {exc_val})")
        print(f"🔓 [LOCK] Rilascio lock di sicurezza per la risorsa: {self.risorsa_id}")
        return False  # Non sopprime l'eccezione, la lascia propagare


# ==========================================
# 4. LIVELLO 4: SOLUZIONE SFIDA INTEGRATA
# ==========================================

class VaultSecurityError(Exception):
    """Superclasse eccezioni del Vault."""
    pass

class AuthenticationFailedError(VaultSecurityError):
    pass

class VaultLockedError(VaultSecurityError):
    pass

class InvalidPayloadError(VaultSecurityError):
    pass


class AuditLogger:
    """Context manager per l'audit sicuro delle operazioni sul Vault."""
    def __init__(self, session_id: str):
        self.session_id = session_id

    def __enter__(self):
        logging.info(f"--- [AUDIT START] Inizio sessione sicura: {self.session_id} ---")
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        if exc_type is not None:
            logging.error(f"❌ [AUDIT END] Sessione {self.session_id} chiusa con ERRORE: {exc_type.__name__} - {exc_val}")
        else:
            logging.info(f"✅ [AUDIT END] Sessione {self.session_id} chiusa con SUCCESSO.")
        return False  # Propaga l'eccezione


class VaultSession:
    MAX_TENTATIVI = 3
    PIN_CORRETTO = "9942"

    def __init__(self, vault_id: str):
        self.vault_id = vault_id
        self.tentativi_falliti = 0
        self.bloccato = False
        self.autenticato = False

    def sblocca_vault(self, pin: str) -> bool:
        if self.bloccato:
            raise VaultLockedError(f"Il Vault '{self.vault_id}' è definitivamente bloccato per sicurezza!")

        if pin != self.PIN_CORRETTO:
            self.tentativi_falliti += 1
            if self.tentativi_falliti >= self.MAX_TENTATIVI:
                self.bloccato = True
                raise VaultLockedError(f"Raggiunto il limite massimo di tentativi. Vault '{self.vault_id}' bloccato!")
            raise AuthenticationFailedError(f"PIN errato! Tentativo {self.tentativi_falliti}/{self.MAX_TENTATIVI}")

        self.autenticato = True
        self.tentativi_falliti = 0
        print(f"🔓 Vault '{self.vault_id}' sbloccato con successo!")
        return True

    def decodifica_payload(self, payload_raw: str) -> dict:
        if not self.autenticato:
            raise AuthenticationFailedError("Impossibile estrarre il payload: Sessione non autenticata!")
        
        try:
            # Tenta di parsare una stringa JSON
            dati = json.loads(payload_raw)
            if "segreto" not in dati:
                raise KeyError("Campo obbligatorio 'segreto' mancante nel payload.")
            return dati
        except (json.JSONDecodeError, KeyError) as e:
            raise InvalidPayloadError("Payload corrotto o non conforme agli standard di sicurezza.") from e


# Demo di esecuzione della sfida integrata
if __name__ == "__main__":
    print("\n=== DEMO SFIDA INTEGRATA: VAULT SECURITY ENGINE ===")
    
    vault = VaultSession(vault_id="VAULT-ALPHA-01")

    # Scenario 1: Tentativo di sblocco con PIN errato
    with AuditLogger(session_id="SESS-001"):
        try:
            vault.sblocca_vault("0000")
        except AuthenticationFailedError as e:
            print(f"Intercettato in UI: {e}")

    # Scenario 2: Sblocco corretto ed estrazione payload corrotto
    with AuditLogger(session_id="SESS-002"):
        try:
            vault.sblocca_vault("9942")
            payload_invalid = '{"dati_generici": 123}'  # Mancante il campo 'segreto'
            vault.decodifica_payload(payload_invalid)
        except InvalidPayloadError as e:
            print(f"Intercettato errore di payload: {e}")
            print(f"Causa originale (Chaining): {e.__cause__}")
```
