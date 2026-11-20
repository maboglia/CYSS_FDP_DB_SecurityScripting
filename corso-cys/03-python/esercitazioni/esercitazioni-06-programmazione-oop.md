# Esercitazioni Modulo 06 — Programmazione Orientata agli Oggetti (OOP)

La seguente scheda contiene esercitazioni pratiche suddivise su quattro livelli di difficoltà crescente, seguite da una **Sfida Integrata finale**. Al termine della scheda sono riportate le **soluzioni ufficali complete di commenti spiegati**.

---

## Livello 1 — Sintassi di Base e Istanziamento

### Esercizio 1 (Attributi d'Istanza e Stato)
Definisci una classe `DispositivoRete` che contenga:
1. Il costruttore `__init__()` accettante `hostname` (stringa), `ip_address` (stringa) e `porte_aperte` (lista opzionale di interi, default `None`).
2. Un metodo `apri_porta(porta: int)` che aggiunge la porta alla lista se non già presente.
3. Un metodo `chiudi_porta(porta: int)` che rimuove la porta se presente.
4. Un metodo `stato()` che restituisce una stringa formattata con hostname, IP e porte aperte ordinate.

### Esercizio 2 (Attributi di Classe e Contatori)
Crea una classe `UtenteSistema` con:
1. Un attributo di classe `totale_utenti = 0`.
2. Il costruttore `__init__()` che accetta `username` e `ruolo`. Ogni volta che una nuova istanza viene creata, incrementa `totale_utenti`.
3. Un metodo di classe `@classmethod` denominato `ottieni_totale(cls)` che restituisce il numero totale di utenti creati.

### Esercizio 3 (Metodi Statici e Factory Methods)
Definisci una classe `ConfigurazioneServer` con:
1. Attributi d'istanza `host`, `port` e `timeout`.
2. Un metodo statico `@staticmethod` denominato `valida_porta(port: int) -> bool` che verifica se la porta è compresa tra `1` e `65535`.
3. Un metodo di classe `@classmethod` denominato `da_stringa(cls, connessione_str: str)` che accetta una stringa nel formato `"host:port:timeout"` (es. `"127.0.0.1:8080:30"`) e restituisce una nuova istanza validata.

---

## Livello 2 — Incapsulamento, `@property` e Dunder Methods

### Esercizio 4 (Incapsulamento e `@property`)
Crea una classe `AccountSicurezza` che gestisca la sicurezza di un account:
1. Attributi protetti/privati: `_username`, `_livello_accesso` (intero da 1 a 5), `__hash_password`.
2. Property `livello_accesso` con getter e setter. Il setter deve verificare che il livello sia un intero compreso tra 1 e 5 (sollevando `ValueError` se invalido).
3. Metodo `verifica_password(self, password_in_chiaro: str) -> bool` che controlla la password generandone l'hash semplice (puoi simulare con `hash(password_in_chiaro)`).

### Esercizio 5 (Dunder Methods: `__str__`, `__repr__`, `__eq__`, `__lt__`)
Crea una classe `PacchettoDati` che modella un pacchetto di rete:
1. Attributi: `id_pacchetto` (int), `sorgente` (str), `destinazione` (str), `dimensione_bytes` (int).
2. Implementa `__str__` per produrre: `"Pacchetto #[id] da [src] a [dst] ([size] bytes)"`.
3. Implementa `__repr__` per produrre la rappresentazione ufficiale: `"PacchettoDati(id_pacchetto=..., sorgente='...', destinazione='...', dimensione_bytes=...)"`.
4. Implementa `__eq__` per verificare l'uguaglianza basata unicamente su `id_pacchetto`.
5. Implementa `__lt__` per consentire l'ordinamento nativo in base a `dimensione_bytes`.

### Esercizio 6 (Contenitore Custom: Protocollo Sequenza)
Crea una classe `RegistroAudit` per memorizzare voci di log:
1. Inizializza una lista interna protetta `_voci`.
2. Implementa `aggiungi(voce: str)`.
3. Implementa i dunder methods `__len__`, `__getitem__` e `__contains__`.
4. Dimostra che l'istanza può essere usata con `len()`, indicizzazione `reg[0]`, controllo appartenenza `"AUTH" in reg` e iterazione con ciclo `for`.

---

## Livello 3 — Ereditarietà, Classi Astratte e Composizione

### Esercizio 7 (Ereditarietà e `super()`)
1. Crea la superclasse `DispositivoRete` con `hostname` e `ip`.
2. Crea la sottoclasse `Router` che eredita da `DispositivoRete`, aggiungendo l'attributo `tabella_routing` (dizionario `destinazione -> next_hop`).
3. Sovrascrivi il metodo `descrizione()` chiamando `super().descrizione()` ed integrando il numero di rotte presenti nella tabella.

### Esercizio 8 (Classi Astratte e Contratti di Interfaccia)
1. Importa `abc` e crea la classe astratta `ModuloScansione(ABC)` con i metodi astratti `@abstractmethod`: `esegui_scansione(self, target: str) -> dict` e `genera_report(self) -> str`.
2. Implementa due sottoclassi concrete: `ScannerPorte` e `ScannerVulnerabilita`.
3. Verifica che tentando di istanziare direttamente `ModuloScansione` venga sollevato un `TypeError`.

### Esercizio 9 (Composizione vs Ereditarietà)
1. Crea una classe `MotoreCifratura` con metodo `cifra(testo: str) -> str` e `decifra(testo: str) -> str`.
2. Crea una classe `LoggerFile` con metodo `scrivi_log(messaggio: str)`.
3. Crea una classe `AgenteSicurezza` che **compone** (tramite attributi d'istanza) sia un `MotoreCifratura` che un `LoggerFile`. Implementa un metodo `registra_evento_sicuro(testo: str)` che cifra il testo e lo invia al logger.

---

## Livello 4 — Dataclasses e Modelli Avanzati

### Esercizio 10 (Dataclasses Avanzate)
Utilizza `@dataclass` per definire la classe `RegolaFirewall`:
1. Campi: `id_regola` (int), `azione` (str: `"ALLOW"` o `"DENY"`), `ip_sorgente` (str), `porta_destinazione` (int), `tag` (list di stringhe).
2. Usa `field(default_factory=list)` per il campo `tag`.
3. Imposta `order=True` consentendo l'ordinamento primario su `id_regola`.
4. Utilizza `__post_init__()` per convalidare che `azione` sia strettamente `"ALLOW"` o `"DENY"`.

---

## Sfida Integrata — Sistema RBAC & Audit di Sicurezza (Security Subsystem)

### Obiettivo
Progettare un sottosistema ad oggetti per la gestione dell'Autenticazione, dei Ruoli (RBAC - Role-Based Access Control) e del Registro Audit per un'infrastruttura aziendale.

### Requisiti dell'Architettura
1. **Classe Astratta `EntitaAutenticabile(ABC)`**:
   * Definisce il metodo astratto `@abstractmethod def verifica_permesso(self, permesso: str) -> bool:`.
2. **Classe `Ruolo`**:
   * Attributi: `nome` (str), `permessi` (set di stringhe).
   * Metodo `ha_permesso(permesso: str) -> bool`.
3. **Classe `UtenteAziendale(EntitaAutenticabile)`**:
   * Attributi: `user_id` (str), `username` (str), `_password_hash` (str), `ruoli` (lista di oggetti `Ruolo`).
   * Metodo `aggiungi_ruolo(ruolo: Ruolo)`.
   * Implementazione polimorfica di `verifica_permesso(permesso: str)`: verifica se almeno uno dei ruoli dell'utente possiede il permesso richiesto.
4. **Dataclass `LogAudit`**:
   * Attributi: `timestamp` (`datetime`), `user_id` (str), `azione` (str), `esito` (bool).
   * Immutabile (`frozen=True`).
5. **Classe `GestoreSicurezza` (Composizione)**:
   * Contiene una lista di `UtenteAziendale` e una lista/registro di `LogAudit`.
   * Metodo `esegui_azione_utente(user_id: str, azione: str, permesso_richiesto: str) -> bool`:
     - Cerca l'utente per `user_id`.
     - Verifica se possiede il permesso.
     - Registra un oggetto `LogAudit` nell'audit log con l'esito della verifica.
     - Restituisce `True` se l'azione è autorizzata, `False` altrimenti.

---

## Soluzioni Ufficiali Commentate

```python
# ==========================================
# SOLUZIONI LIVELLO 1
# ==========================================

# Esercizio 1
class DispositivoRete:
    def __init__(self, hostname: str, ip_address: str, porte_aperte: list[int] = None):
        self.hostname = hostname
        self.ip_address = ip_address
        # Risoluzione corretta della trappola del default mutabile
        self.porte_aperte = porte_aperte if porte_aperte is not None else []

    def apri_porta(self, porta: int):
        if porta not in self.porte_aperte:
            self.porte_aperte.append(porta)

    def chiudi_porta(self, porta: int):
        if porta in self.porte_aperte:
            self.porte_aperte.remove(porta)

    def stato(self) -> str:
        porte_sort = sorted(self.porte_aperte)
        return f"{self.hostname} ({self.ip_address}) | Porte Aperte: {porte_sort}"

# Test Esercizio 1
dev = DispositivoRete("sw-core-01", "10.0.0.1")
dev.apri_porta(80)
dev.apri_porta(22)
print(dev.stato()) # sw-core-01 (10.0.0.1) | Porte Aperte: [22, 80]


# Esercizio 2
class UtenteSistema:
    totale_utenti = 0 # Attributo di classe condiviso

    def __init__(self, username: str, ruolo: str):
        self.username = username
        self.ruolo = ruolo
        UtenteSistema.totale_utenti += 1

    @classmethod
    def ottieni_totale(cls) -> int:
        return cls.totale_utenti

u1 = UtenteSistema("alice", "Admin")
u2 = UtenteSistema("bob", "Analyst")
print("Totale utenti:", UtenteSistema.ottieni_totale()) # 2


# Esercizio 3
class ConfigurazioneServer:
    def __init__(self, host: str, port: int, timeout: int):
        if not self.valida_porta(port):
            raise ValueError(f"Porta non valida: {port}")
        self.host = host
        self.port = port
        self.timeout = timeout

    @staticmethod
    def valida_porta(port: int) -> bool:
        return 1 <= port <= 65535

    @classmethod
    def da_stringa(cls, connessione_str: str) -> "ConfigurazioneServer":
        host, port_str, timeout_str = connessione_str.split(":")
        return cls(host, int(port_str), int(timeout_str))

cfg = ConfigurazioneServer.da_stringa("192.168.1.100:8443:60")
print(f"Host: {cfg.host}, Port: {cfg.port}, Timeout: {cfg.timeout}")


# ==========================================
# SOLUZIONI LIVELLO 2
# ==========================================

# Esercizio 4
class AccountSicurezza:
    def __init__(self, username: str, livello_accesso: int, password_in_chiaro: str):
        self._username = username
        self.livello_accesso = livello_accesso # Chiama il setter per la validazione!
        self.__hash_password = str(hash(password_in_chiaro))

    @property
    def livello_accesso(self) -> int:
        return self._livello_accesso

    @livello_accesso.setter
    def livello_accesso(self, valore: int):
        if not isinstance(valore, int) or not (1 <= valore <= 5):
            raise ValueError("Il livello di accesso deve essere un intero compreso tra 1 e 5.")
        self._livello_accesso = valore

    def verifica_password(self, password_in_chiaro: str) -> bool:
        return str(hash(password_in_chiaro)) == self.__hash_password

acc = AccountSicurezza("admin", 4, "Secret123!")
print("Accesso valido:", acc.verifica_password("Secret123!")) # True


# Esercizio 5
class PacchettoDati:
    def __init__(self, id_pacchetto: int, sorgente: str, destinazione: str, dimensione_bytes: int):
        self.id_pacchetto = id_pacchetto
        self.sorgente = sorgente
        self.destinazione = destinazione
        self.dimensione_bytes = dimensione_bytes

    def __str__(self) -> str:
        return f"Pacchetto #{self.id_pacchetto} da {self.sorgente} a {self.destinazione} ({self.dimensione_bytes} bytes)"

    def __repr__(self) -> str:
        return (f"PacchettoDati(id_pacchetto={self.id_pacchetto}, sorgente='{self.sorgente}', "
                f"destinazione='{self.destinazione}', dimensione_bytes={self.dimensione_bytes})")

    def __eq__(self, altro: object) -> bool:
        if not isinstance(altro, PacchettoDati):
            return NotImplemented
        return self.id_pacchetto == altro.id_pacchetto

    def __lt__(self, altro: "PacchettoDati") -> bool:
        if not isinstance(altro, PacchettoDati):
            return NotImplemented
        return self.dimensione_bytes < altro.dimensione_bytes

p1 = PacchettoDati(101, "10.0.0.1", "10.0.0.2", 1500)
p2 = PacchettoDati(102, "10.0.0.1", "10.0.0.2", 64)
print(p1)
print(p2 < p1) # True


# Esercizio 6
class RegistroAudit:
    def __init__(self):
        self._voci = []

    def aggiungi(self, voce: str):
        self._voci.append(voce)

    def __len__(self) -> int:
        return len(self._voci)

    def __getitem__(self, index: int) -> str:
        return self._voci[index]

    def __contains__(self, voce: str) -> bool:
        return any(voce in item for item in self._voci)

audit = RegistroAudit()
audit.aggiungi("LOGIN_OK - user: alice")
audit.aggiungi("LOGIN_FAIL - user: root")
print("Voci totali:", len(audit))
print("Contiene FAIL?", "LOGIN_FAIL" in audit)


# ==========================================
# SOLUZIONI LIVELLO 3
# ==========================================

# Esercizio 7
class DispositivoReteBase:
    def __init__(self, hostname: str, ip: str):
        self.hostname = hostname
        self.ip = ip

    def descrizione(self) -> str:
        return f"{self.hostname} ({self.ip})"

class Router(DispositivoReteBase):
    def __init__(self, hostname: str, ip: str):
        super().__init__(hostname, ip)
        self.tabella_routing = {}

    def aggiungi_rotta(self, rete_dest: str, next_hop: str):
        self.tabella_routing[rete_dest] = next_hop

    def descrizione(self) -> str:
        base_desc = super().descrizione()
        return f"[ROUTER] {base_desc} | Rotte attive: {len(self.tabella_routing)}"

r = Router("rtr-border-01", "192.168.1.1")
r.aggiungi_rotta("10.0.0.0/8", "192.168.1.254")
print(r.descrizione())


# Esercizio 8
from abc import ABC, abstractmethod

class ModuloScansione(ABC):
    @abstractmethod
    def esegui_scansione(self, target: str) -> dict:
        pass

    @abstractmethod
    def genera_report(self) -> str:
        pass

class ScannerPorte(ModuloScansione):
    def __init__(self):
        self._risultati = {}

    def esegui_scansione(self, target: str) -> dict:
        self._risultati = {target: [22, 80, 443]}
        return self._risultati

    def genera_report(self) -> str:
        return f"Scansione Porte completata: {self._risultati}"

sp = ScannerPorte()
sp.esegui_scansione("10.0.0.1")
print(sp.genera_report())


# Esercizio 9
class MotoreCifratura:
    def cifra(self, testo: str) -> str:
        return f"ENC[{testo[::-1]}]"

    def decifra(self, testo: str) -> str:
        return testo.replace("ENC[", "").replace("]", "")[::-1]

class LoggerFile:
    def scrivi_log(self, messaggio: str):
        print(f"[LOG WRITE] {messaggio}")

class AgenteSicurezza:
    def __init__(self, cifratore: MotoreCifratura, logger: LoggerFile):
        # COMPOSIZIONE: aggregazione dei due oggetti componenti
        self.cifratore = cifratore
        self.logger = logger

    def registra_evento_sicuro(self, testo: str):
        cifrato = self.cifratore.cifra(testo)
        self.logger.scrivi_log(cifrato)

agente = AgenteSicurezza(MotoreCifratura(), LoggerFile())
agente.registra_evento_sicuro("Accesso Riservato")


# ==========================================
# SOLUZIONI LIVELLO 4
# ==========================================

# Esercizio 10
from dataclasses import dataclass, field

@dataclass(order=True)
class RegolaFirewall:
    id_regola: int = field(compare=True)
    azione: str = field(compare=False)
    ip_sorgente: str = field(compare=False)
    porta_destinazione: int = field(compare=False)
    tag: list[str] = field(default_factory=list, compare=False)

    def __post_init__(self):
        self.azione = self.azione.upper()
        if self.azione not in ("ALLOW", "DENY"):
            raise ValueError("L'azione deve essere 'ALLOW' oppure 'DENY'.")

rf1 = RegolaFirewall(10, "allow", "192.168.1.0/24", 80, ["HTTP"])
rf2 = RegolaFirewall(5, "deny", "0.0.0.0/0", 23, ["TELNET"])
print(rf1)
print(rf2 < rf1) # True (confronto basato su id_regola: 5 < 10)


# ==========================================
# SOLUZIONE SFIDA INTEGRATA (RBAC & AUDIT SUBSYSTEM)
# ==========================================

from datetime import datetime

# 1. Classe Astratta
class EntitaAutenticabile(ABC):
    @abstractmethod
    def verifica_permesso(self, permesso: str) -> bool:
        pass

# 2. Classe Ruolo
class Ruolo:
    def __init__(self, nome: str, permessi: set[str] = None):
        self.nome = nome
        self.permessi = permessi if permessi is not None else set()

    def aggiungi_permesso(self, permesso: str):
        self.permessi.add(permesso)

    def ha_permesso(self, permesso: str) -> bool:
        return permesso in self.permessi

# 3. Classe UtenteAziendale
class UtenteAziendale(EntitaAutenticabile):
    def __init__(self, user_id: str, username: str, password_in_chiaro: str):
        self.user_id = user_id
        self.username = username
        self._password_hash = str(hash(password_in_chiaro))
        self.ruoli: list[Ruolo] = []

    def aggiungi_ruolo(self, ruolo: Ruolo):
        if ruolo not in self.ruoli:
            self.ruoli.append(ruolo)

    def verifica_permesso(self, permesso: str) -> bool:
        # Polimorfismo: verifica se ALMENO UN ruolo possiede il permesso
        return any(r.ha_permesso(permesso) for r in self.ruoli)

# 4. Dataclass LogAudit Immutabile
@dataclass(frozen=True)
class LogAudit:
    timestamp: datetime
    user_id: str
    azione: str
    esito: bool

# 5. GestoreSicurezza (Composizione)
class GestoreSicurezza:
    def __init__(self):
        self._utenti: dict[str, UtenteAziendale] = {}
        self._audit_log: list[LogAudit] = []

    def registra_utente(self, utente: UtenteAziendale):
        self._utenti[utente.user_id] = utente

    def esegui_azione_utente(self, user_id: str, azione: str, permesso_richiesto: str) -> bool:
        utente = self._utenti.get(user_id)
        esito = False

        if utente is not None:
            esito = utente.verifica_permesso(permesso_richiesto)

        # Registrazione immutabile nell'audit log
        log_entry = LogAudit(
            timestamp=datetime.now(),
            user_id=user_id,
            azione=azione,
            esito=esito
        )
        self._audit_log.append(log_entry)
        return esito

    def mostra_audit_log(self):
        print("
--- REGISTRO AUDIT DI SICUREZZA ---")
        for log in self._audit_log:
            stato = "AUTORIZZATO" if log.esito else "NEGATO"
            print(f"[{log.timestamp.strftime('%Y-%m-%d %H:%M:%S')}] User: {log.user_id} | Azione: {log.azione} -> {stato}")

# DEMO COMPLETA DELLA SFIDA INTEGRATA
if __name__ == "__main__":
    # Creazione Ruoli
    r_sec_analyst = Ruolo("Security Analyst", {"READ_LOGS", "SCAN_NETWORK"})
    r_admin = Ruolo("SysAdmin", {"READ_LOGS", "SCAN_NETWORK", "REBOOT_SERVER", "MODIFY_FIREWALL"})

    # Creazione Utenti
    u_alice = UtenteAziendale("USR01", "alice", "Pass123!")
    u_alice.aggiungi_ruolo(r_sec_analyst)

    u_bob = UtenteAziendale("USR02", "bob", "AdminPass456!")
    u_bob.aggiungi_ruolo(r_admin)

    # Inizializzazione Gestore (Composizione)
    sec_mgr = GestoreSicurezza()
    sec_mgr.registra_utente(u_alice)
    sec_mgr.registra_utente(u_bob)

    # Esecuzione ed Inizio Audit
    print("Alice tenta SCAN_NETWORK:", sec_mgr.esegui_azione_utente("USR01", "Scansione Rete", "SCAN_NETWORK")) # True
    print("Alice tenta MODIFY_FIREWALL:", sec_mgr.esegui_azione_utente("USR01", "Modifica Regole FW", "MODIFY_FIREWALL")) # False

    print("Bob tenta MODIFY_FIREWALL:", sec_mgr.esegui_azione_utente("USR02", "Modifica Regole FW", "MODIFY_FIREWALL")) # True

    # Stampa Registro Audit
    sec_mgr.mostra_audit_log()
```
