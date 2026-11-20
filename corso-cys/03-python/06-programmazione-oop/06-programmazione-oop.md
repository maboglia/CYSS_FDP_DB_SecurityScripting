# Modulo 06 — Programmazione Orientata agli Oggetti (OOP)

La **Programmazione Orientata agli Oggetti (OOP, Object-Oriented Programming)** è uno dei principali paradigmi di programmazione e progettazione del software. In Python, l'OOP non rappresenta un vincolo rigido ma un potente insieme di strumenti per strutturare applicazioni complesse, favorendo il riutilizzo del codice, la manutenibilità, la chiarezza concettuale e l'incapsulamento dei dati.

---

## 1. Introduzione al Paradigma OOP

Nel paradigma **procedurale** o **imperativo**, il codice è organizzato attorno a sequenze di istruzioni e funzioni separate che manipolano dati esterni (strutture dati o variabili sciolte). 

Nel paradigma **orientato agli oggetti**, il software viene modellato attorno ad **entità autonome (gli oggetti)** che combinano in un unico blocco:
* **Stato (Dati)**: rappresentato dagli *attributi* (variabili legate all'oggetto).
* **Comportamento (Azioni)**: rappresentato dai *metodi* (funzioni appartenenti all'oggetto).
* **Regole d'integrità**: logica che stabilisce come e quando lo stato interno può essere letto o modificato.

### Classi e Istanze

* **Classe**: È il modello concettuale (il "progetto" o *blueprint*) che definisce la struttura, le proprietà e le azioni che caratterizzeranno un certo tipo di dato.
* **Istanza (o Oggetto)**: È un'entità concreta e individuale creata in memoria a partire dalla ricetta della classe.

In Python, le classi definiscono nuovi **tipi personalizzati**.

```python
# Definizione di una classe minima
class DispositivoRete:
    pass

# Creazione di due istanze distinte
dev1 = DispositivoRete()
dev2 = DispositivoRete()

print(type(dev1))               # Output: <class '__main__.DispositivoRete'>
print(isinstance(dev1, DispositivoRete)) # Output: True
print(dev1 is dev2)             # Output: False (sono oggetti distinti in memoria)
```

#### Naming Convention
Per convenzione (PEP 8), i nomi delle classi in Python utilizzano la notazione **`PascalCase`** (es. `ContoBancario`, `AnalizzatoreLog`, `DispositivoRete`), differenziandosi dalle funzioni e variabili che usano lo `snake_case`.

---

## 2. Anatomia di una Classe: Attributi, Metodi e `self`

### Il parametro `self`

Nelle definizioni dei metodi di istanza, il primo parametro deve **sempre essere `self`**.

`self` rappresenta l'**istanza corrente** su cui il metodo è stato invocato. Quando si chiama un metodo su un oggetto (es. `oggetto.metodo(arg1)`), Python traduce implicitamente la chiamata in `Classe.metodo(oggetto, arg1)`, passando l'oggetto stesso come primo argomento.

```python
class Server:
    def accendi(self):
        print("Server avviato correttamente.")

s = Server()
s.accendi()  # Equivalente a Server.accendi(s)
```

### Il Costruttore `__init__()`

Il metodo speciale `__init__()` è l'**inizializzatore d'istanza**. Viene eseguito automaticamente subito dopo che Python ha creato l'oggetto in memoria. Il suo compito principale è definire e impostare lo stato iniziale dell'oggetto mediante gli **attributi d'istanza**.

```python
class Server:
    def __init__(self, hostname: str, ip_address: str, ram_gb: int = 16):
        # Attributi d'istanza
        self.hostname = hostname
        self.ip_address = ip_address
        self.ram_gb = ram_gb
        self.attivo = False

    def avvia(self):
        self.attivo = True
        print(f"Server {self.hostname} ({self.ip_address}) in esecuzione.")

    def stato(self):
        stato_str = "Attivo" if self.attivo else "Spento"
        return f"[{self.hostname}] IP: {self.ip_address} | RAM: {self.ram_gb}GB | Stato: {stato_str}"

# Istanziazione con argomenti
srv1 = Server("srv-web-01", "192.168.1.10", 32)
srv2 = Server("srv-db-01", "192.168.1.20")

print(srv1.stato())
srv1.avvia()
print(srv1.stato())
```

### Attributi di Istanza vs Attributi di Classe

* **Attributi di Istanza**: Appartengono a *una specifica istanza*. Ogni oggetto possiede la propria copia indipendente salvata nel proprio dizionario interno `__dict__`.
* **Attributi di Classe**: Sono definiti all'interno del corpo della classe (fuori dai metodi). Sono **condivisi da tutte le istanze** della classe.

```python
class UtenteSistema:
    # Attributo di classe (condiviso da tutti gli utenti)
    dominio_di_default = "azienda.local"
    totale_utenti = 0

    def __init__(self, username: str):
        # Attributi d'istanza
        self.username = username
        # Incrementiamo il contatore di classe
        UtenteSistema.totale_utenti += 1

u1 = UtenteSistema("alice")
u2 = UtenteSistema("bob")

print(u1.dominio_di_default)  # Output: azienda.local
print(u2.dominio_di_default)  # Output: azienda.local
print(UtenteSistema.totale_utenti) # Output: 2
```

#### Trappola della Mutabilità negli Attributi di Classe
Se un attributo di classe è **mutabile** (es. una lista o un dizionario) e viene modificato in-place tramite un'istanza, la modifica si rifletterà su tutte le altre istanze!

```python
# ERRORE COMUNE
class ServerGroup:
    server_list = [] # ERRORE: Lista mutabile condivisa a livello di classe!

    def add_server(self, name):
        self.server_list.append(name) # Modifica la lista condivisa!

g1 = ServerGroup()
g2 = ServerGroup()
g1.add_server("web-01")
print(g2.server_list) # Output: ['web-01'] (Involontario!)

# SOLUZIONE CORRETTA
class ServerGroupCorretto:
    def __init__(self):
        self.server_list = [] # Ogni istanza ha la propria lista indipendente
```

---

## 3. Tipologie di Metodi: Istanza, Classe e Statici

In Python esistono tre tipi fondamentali di metodi all'interno di una classe:

1. **Metodi di Istanza (`self`)**:
   * Accettano `self` come primo parametro.
   * Possono leggere e modificare lo stato dell'istanza e accedere alla classe tramite `type(self)`.
2. **Metodi di Classe (`@classmethod`)**:
   * Decorati con `@classmethod`.
   * Accettano `cls` (la classe stessa) come primo parametro invece di `self`.
   * Utilizzati principalmente come **Factory Methods** (costruttori alternativi) o per manipolare lo stato a livello di classe.
3. **Metodi Statici (`@staticmethod`)**:
   * Decorati con `@staticmethod`.
   * Non ricevono né `self` né `cls` in automatico.
   * Sono funzioni pure o utility logicamente collegate alla classe ma che non accedono direttamente al suo stato o a quello delle sue istanze.

```python
import re

class IndirizzoIP:
    def __init__(self, ip: str):
        if not self.valida_ip(ip):
            raise ValueError(f"Indirizzo IP non valido: {ip}")
        self.ip = ip

    # 1. Metodo di istanza
    def ottieni_ottetti(self) -> list[int]:
        return [int(part) for part in self.ip.split(".")]

    # 2. Metodo statico: utilità pura che non richiede lo stato della classe
    @staticmethod
    def valida_ip(ip: str) -> bool:
        pattern = r"^((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)\.){3}(25[0-5]|(2[0-4]|1\d|[1-9]|)\d)$"
        return bool(re.match(pattern, ip))

    # 3. Metodo di classe: Factory method per creare un'istanza da un intero a 32 bit
    @classmethod
    def da_intero(cls, ip_int: int) -> "IndirizzoIP":
        octet1 = (ip_int >> 24) & 255
        octet2 = (ip_int >> 16) & 255
        octet3 = (ip_int >> 8) & 255
        octet4 = ip_int & 255
        ip_str = f"{octet1}.{octet2}.{octet3}.{octet4}"
        return cls(ip_str)

# Utilizzo delle tre tipologie
print(IndirizzoIP.valida_ip("192.168.1.1")) # Metodo statico (True)

ip_obj1 = IndirizzoIP("10.0.0.1")          # Costruttore standard
print(ip_obj1.ottieni_ottetti())            # Metodo d'istanza ([10, 0, 0, 1])

ip_obj2 = IndirizzoIP.da_intero(3232235521) # Factory method (192.168.0.1)
print(ip_obj2.ip)                           # Output: 192.168.0.1
```

---

## 4. Incapsulamento, Protezione dei Dati e `@property`

L'**Incapsulamento** è il principio secondo cui i dati interni di un oggetto devono essere protetti da accessi o modifiche dirette non autorizzate, fornendo un'interfaccia controllata per interagire con essi.

### Naming Conventions di Protezione in Python

Diversamente da linguaggi come Java o C++, Python non possiede parole chiave rigide come `private` o `protected`. Si affida a convenzioni ed elevata trasparenza:

1. **Un Underscore (`_attributo`) — "Protetto"**:
   * Indica agli sviluppatori che l'attributo o metodo è **ad uso interno** della classe o delle sue sottoclassi. Non impedisce l'accesso dall'esterno, ma segnala di non accedervi direttamente.
2. **Due Underscore (`__attributo`) — "Privato" (Name Mangling)**:
   * Attiva il meccanismo di *Name Mangling*: Python rinomina internamente l'attributo trasformandolo in `_NomeClasse__attributo`. Serve a prevenire sovrascritture accidentali dell'attributo nelle sottoclassi.

```python
class AccountUtente:
    def __init__(self, username: str, password_hash: str):
        self.username = username             # Pubblico
        self._tentativi_falliti = 0           # Protetto (convenzione)
        self.__password_hash = password_hash # Privato (Name Mangling)

acc = AccountUtente("admin", "hash_segreto_123")
print(acc.username)                 # OK: admin
print(acc._tentativi_falliti)       # Possibile ma sconsigliato
# print(acc.__password_hash)        # AttributeError!
print(acc._AccountUtente__password_hash) # Accessibile tramite Name Mangling
```

### Il decoratore `@property`

Per implementare **getter e setter** in modo elegante ed esplicito (senza costringere l'utente a chiamare metodi verbose come `get_saldo()` e `set_saldo()`), Python mette a disposizione il decoratore **`@property`**.

```python
class SensoreTemperatura:
    def __init__(self, celsius: float = 0.0):
        self._celsius = celsius  # Dato protetto

    # GETTER: permette di accedere a s.celsius come se fosse un attributo
    @property
    def celsius(self) -> float:
        return self._celsius

    # SETTER: intercetta l'assegnazione s.celsius = valore e applica validazione
    @celsius.setter
    def celsius(self, valore: float):
        if valore < -273.15:
            raise ValueError("Temperatura al di sotto dello zero assoluto!")
        self._celsius = valore

    # PROPERTY CALCOLATA (di sola lettura)
    @property
    def fahrenheit(self) -> float:
        return (self._celsius * 9/5) + 32

s = SensoreTemperatura(25.0)
print(s.celsius)     # Accesso tramite getter (25.0)
print(s.fahrenheit)  # Property calcolata (77.0)

s.celsius = 30.0     # Assegnazione intercettata dal setter
print(s.fahrenheit)  # Output: 86.0

# s.fahrenheit = 100 # AttributeError: can't set attribute (sola lettura)
```

---

## 5. Metodi Speciali (*Dunder Methods*) e Overloading

I metodi speciali (detti anche *dunder methods* per via del doppio underscore `__metodo__`) permettono alle classi personalizzate di integrarsi nativamente con gli operatori e le funzioni integrate di Python (`print()`, `len()`, `+`, `==`, `in`, `for`, ecc.).

### Rappresentazione: `__str__` vs `__repr__`

* **`__str__(self)`**: Restituisce una rappresentazione in formato stringa **orientata all'utente** (leggibile e chiara). Invocata da `str()`, `print()`, e f-strings.
* **`__repr__(self)`**: Restituisce una rappresentazione **non ambigua per sviluppatori** (idealmente codice Python valido per ricreare l'oggetto). Invocata da `repr()` e nella console/REPL.

```python
class PortaLogica:
    def __init__(self, ID: int, porta: int, protocollo: str):
        self.ID = ID
        self.porta = porta
        self.protocollo = protocollo.upper()

    def __str__(self) -> str:
        return f"Servizio {self.protocollo} su Porta {self.porta}"

    def __repr__(self) -> str:
        return f"PortaLogica(ID={self.ID}, porta={self.porta}, protocollo='{self.protocollo}')"

p = PortaLogica(1, 443, "https")
print(str(p))  # Output: Servizio HTTPS su Porta 443
print(repr(p)) # Output: PortaLogica(ID=1, porta=443, protocollo='HTTPS')
```

### Confronto e Uguaglianza: `__eq__` e Operatori Relazionali

Di default, `obj1 == obj2` confronta l'identità in memoria (`is`). Sovrascrivendo `__eq__`, definiamo l'**uguaglianza di valore**.

```python
class PacchettoRete:
    def __init__(self, src_ip: str, dst_ip: str, payload_size: int):
        self.src_ip = src_ip
        self.dst_ip = dst_ip
        self.payload_size = payload_size

    def __eq__(self, altro: object) -> bool:
        if not isinstance(altro, PacchettoRete):
            return NotImplemented
        return (self.src_ip, self.dst_ip, self.payload_size) == (altro.src_ip, altro.dst_ip, altro.payload_size)

    def __lt__(self, altro: "PacchettoRete") -> bool:
        # Consente l'ordinamento basato sulla dimensione del payload
        if not isinstance(altro, PacchettoRete):
            return NotImplemented
        return self.payload_size < altro.payload_size

p1 = PacchettoRete("10.0.0.1", "10.0.0.2", 512)
p2 = PacchettoRete("10.0.0.1", "10.0.0.2", 512)
p3 = PacchettoRete("10.0.0.1", "10.0.0.2", 1024)

print(p1 == p2) # Output: True (stesso valore, anche se oggetti diversi)
print(p1 < p3)  # Output: True
```

### Overloading degli Operatori Aritmetici

| Operatore | Metodo Speciale | Operatore Inverso |
| :--- | :--- | :--- |
| `+` | `__add__(self, other)` | `__radd__(self, other)` |
| `-` | `__sub__(self, other)` | `__rsub__(self, other)` |
| `*` | `__mul__(self, other)` | `__rmul__(self, other)` |
| `/` | `__truediv__(self, other)` | `__rtruediv__(self, other)` |
| `//` | `__floordiv__(self, other)` | `__rfloordiv__(self, other)` |

### Contenitori Personalizzati (Protocollo Sequenza/Mappa)

Implementando i metodi `__len__`, `__getitem__`, `__setitem__` e `__contains__`, una classe personalizzata si comporta esattamente come una lista o un dizionario integrato:

```python
class RegistroEventi:
    def __init__(self):
        self._eventi = []

    def aggiungi(self, evento: str):
        self._eventi.append(evento)

    def __len__(self) -> int:
        return len(self._eventi)

    def __getitem__(self, index: int) -> str:
        return self._eventi[index]

    def __contains__(self, evento: str) -> bool:
        return evento in self._eventi

reg = RegistroEventi()
reg.aggiungi("AUTH_SUCCESS")
reg.aggiungi("FILE_ACCESS")

print(len(reg))               # Output: 2 (chiama __len__)
print(reg[0])                 # Output: AUTH_SUCCESS (chiama __getitem__)
print("AUTH_SUCCESS" in reg)  # Output: True (chiama __contains__)

for evt in reg:               # Iterabile grazie a __getitem__ / __iter__
    print("->", evt)
```

---

## 6. Ereditarietà e Gerarchie di Classi

L'**Ereditarietà** è il meccanismo mediante il quale una nuova classe (**sottoclasse** o classe derivata) acquisisce attributi e metodi di una classe esistente (**superclasse** o classe base), potendo estenderli o modificarli.

Rappresenta una relazione di tipo **IS-A** ("è un"). Ad esempio: un `Firewall` *IS-A* (è un) `DispositivoRete`.

### Sintassi di Base e `super()`

La funzione `super()` viene utilizzata per invocare i metodi della superclasse dall'interno della sottoclasse, garantendo il corretto concatenamento dell'inizializzazione.

```python
# Superclasse Base
class DispositivoRete:
    def __init__(self, hostname: str, ip_address: str):
        self.hostname = hostname
        self.ip_address = ip_address
        self.attivo = True

    def descrizione(self) -> str:
        return f"{self.hostname} ({self.ip_address})"

# Sottoclasse Derivata
class Firewall(DispositivoRete):
    def __init__(self, hostname: str, ip_address: str, regole_max: int = 100):
        # Invocazione del costruttore della superclasse tramite super()
        super().__init__(hostname, ip_address)
        self.regole_max = regole_max
        self.regole = []

    # Method Overriding: Sovrascrittura ed estensione del metodo della superclasse
    def descrizione(self) -> str:
        base_desc = super().descrizione()
        return f"[FIREWALL] {base_desc} | Regole caricate: {len(self.regole)}/{self.regole_max}"

fw = Firewall("fw-perimetrale", "10.0.0.254", 500)
print(fw.descrizione()) # Output: [FIREWALL] fw-perimetrale (10.0.0.254) | Regole caricate: 0/500
```

### La radice universale: `object`
In Python 3, tutte le classi ereditano implicitamente dalla classe base **`object`**. Metodi come `__eq__`, `__str__`, e `__repr__` appartengono originariamente ad `object`.

---

## 7. Ereditarietà Multipla, MRO e il Diamond Problem

Python supporta l'**ereditarietà multipla**, ossia la possibilità per una classe di ereditare direttamente da più superclassi.

```python
class DispositivoHardware:
    def boot(self):
        print("Hardware Booting...")

class ServizioRete:
    def avvia_servizio(self):
        print("Servizio di rete avviato.")

class RouterAvanzato(DispositivoHardware, ServizioRete):
    pass

r = RouterAvanzato()
r.boot()
r.avvia_servizio()
```

### Method Resolution Order (MRO) e C3 Linearization

Quando si eredita da più classi che definiscono lo stesso metodo, Python deve stabilire una priorità d'esecuzione univoca. Questo ordine è chiamato **MRO (Method Resolution Order)** e viene calcolato mediante l'algoritmo **C3 Linearization**.

È possibile ispezionare l'MRO di qualsiasi classe tramite il metodo `.mro()` o l'attributo `__mro__`.

```python
print(RouterAvanzato.mro())
# Output: [<class 'RouterAvanzato'>, <class 'DispositivoHardware'>, <class 'ServizioRete'>, <class 'object'>]
```

### Il Diamond Problem (Problema del Diamante)

Il problema del diamante si verifica quando due classi (B e C) ereditano da A, e una quarta classe (D) eredita sia da B che da C.

```text
    A
   / \
  B   C
   \ /
    D
```

Se `super()` viene usato correttamente in tutta la gerarchia, l'algoritmo MRO garantisce che ogni classe nella catena sia visitata **una ed una sola volta**, prevenendo l'esecuzione duplicata del costruttore base di A.

---

## 8. Classi Astratte, Polimorfismo e Duck Typing

### Classi Astratte (modulo `abc`)

Una **Classe Astratta (Abstract Base Class - ABC)** è una classe che definisce un'interfaccia o contratto comune per un insieme di sottoclassi, ma che **non può essere istanziata direttamente**.

Si crea ereditando da `abc.ABC` e decorando i metodi obbligatori con `@abstractmethod`.

```python
from abc import ABC, abstractmethod

class ModuloAutenticazione(ABC):
    
    @abstractmethod
    def autentica(self, credenziali: dict) -> bool:
        pass

    @abstractmethod
    def revoca_accesso(self, user_id: str) -> None:
        pass

class AutenticazioneLDAP(ModuloAutenticazione):
    def __init__(self, server_ldap: str):
        self.server_ldap = server_ldap

    def autentica(self, credenziali: dict) -> bool:
        print(f"Connessione a {self.server_ldap} per {credenziali.get('user')}")
        return True

    def revoca_accesso(self, user_id: str) -> None:
        print(f"Accesso revocato su LDAP per {user_id}")

ldap_auth = AutenticazioneLDAP("ldap://10.0.0.5")
print(isinstance(ldap_auth, ModuloAutenticazione)) # True
```

### Polimorfismo e Duck Typing

Il **Polimorfismo** è la capacità di trattare oggetti di tipo diverso mediante un'unica interfaccia omogenea.

In Python, oltre al polimorfismo classico basato sull'ereditarietà, si applica ampiamente il **Duck Typing**:
> *"Se cammina come una anatra e starnazza come una anatra, allora per me è una anatra."*

In base al Duck Typing, a una funzione non interessa il tipo o la gerarchia formale dell'oggetto passato, ma soltanto che l'oggetto metta a disposizione i metodi o gli attributi richiesti.

```python
class LoggerFile:
    def log(self, messaggio: str):
        print(f"[FILE LOG] {messaggio}")

class LoggerConsole:
    def log(self, messaggio: str):
        print(f"[CONSOLE LOG] {messaggio}")

class LoggerSyslog:
    def log(self, messaggio: str):
        print(f"[SYSLOG] {messaggio}")

# Funzione polimorfica basata su Duck Typing
def notifica_evento(logger_obj, testo: str):
    # La funzione richiede solo che logger_obj possegga un metodo .log()
    logger_obj.log(testo)

# Tre oggetti privi di ereditarietà comune
loggers = [LoggerFile(), LoggerConsole(), LoggerSyslog()]

for l in loggers:
    notifica_evento(l, "Tentativo di accesso fallito")
```

---

## 9. Progettazione OOP: Ereditarietà vs Composizione

Un errore di progettazione molto frequente consiste nell'abusare dell'ereditarietà per riutilizzare il codice. 

Un principio guida fondamentale dell'ingegneria del software sancisce:
> **"Favorisci la composizione rispetto all'ereditarietà"** (*Favor composition over inheritance*).

* **Ereditarietà (IS-A)**: Utilizzare solo quando esiste una vera relazione concettuale di sottotipo (es. `Un Cane è un Animale`). Crea un accoppiamento forte tra superclasse e sottoclasse.
* **Composizione (HAS-A)**: Un oggetto complesso viene costruito **aggregando al suo interno altri oggetti** autonomi che ne gestiscono specifiche funzionalità (es. `Un Computer ha una CPU`, `Ha una Scheda di Rete`).

### Esempio di Composizione

```python
class MotoreCifratura:
    def cifra(self, testo: str) -> str:
        return f"CIFRATO[{testo[::-1]}]"

class ModuloInvioRete:
    def invia(self, dati: str):
        print(f"Invio pacchetto sulla rete: {dati}")

# Sistema di Comunicazione Sicura tramite Composizione (HAS-A)
class CanaleSicuro:
    def __init__(self, cifratore: MotoreCifratura, trasmettitore: ModuloInvioRete):
        # Invece di ereditare, aggreghiamo i componenti come attributi
        self.cifratore = cifratore
        self.trasmettitore = trasmettitore

    def invia_messaggio_sicuro(self, messaggio: str):
        testo_cifrato = self.cifratore.cifra(messaggio)
        self.trasmettitore.invia(testo_cifrato)

# Assemblaggio dinamico e modulare dei componenti
cifr = MotoreCifratura()
tx = ModuloInvioRete()
canale = CanaleSicuro(cifr, tx)
canale.invia_messaggio_sicuro("PasswordSegreta123")
```

---

## 10. Data Classes (`@dataclass`)

Introdotte con la PEP 557 in Python 3.7, le **Dataclass** (`from dataclasses import dataclass`) semplificano la creazione di classi nate principalmente per memorizzare dati, generando automaticamente i metodi boilerplate `__init__()`, `__repr__()`, `__eq__()` ed altri.

```python
from dataclasses import dataclass, field
from datetime import datetime

@dataclass(order=True, frozen=False)
class EventoSicurezza:
    timestamp: datetime
    livello_rischio: int = field(compare=True) # Usato nei confronti (order=True)
    sorgente_ip: str = field(compare=False)
    descrizione: str = field(compare=False)
    
    # Per i campi mutabili occorre usare default_factory!
    tag: list[str] = field(default_factory=list, compare=False)

    def __post_init__(self):
        # Eseguito automaticamente subito dopo l'__init__ generato dalla dataclass
        if self.livello_rischio < 1 or self.livello_rischio > 5:
            raise ValueError("Il livello di rischio deve essere compreso tra 1 e 5.")

e1 = EventoSicurezza(datetime.now(), 4, "192.168.1.50", "Port scan rilevato", ["FW", "ALERT"])
e2 = EventoSicurezza(datetime.now(), 2, "10.0.0.1", "Login fallito", ["AUTH"])

print(e1)           # Output generato da __repr__ automaticamente
print(e1 > e2)      # Output: True (confronto basato su livello_rischio grazie a order=True)
```

### Opzioni Fondamentali di `@dataclass`

* **`frozen=True`**: Rende le istanze immutabili (ogni tentativo di modifica agli attributi solleverà `FrozenInstanceError`). Permette anche l'uso degli oggetti come chiavi in un dizionario o elementi di un `set`.
* **`default_factory`**: Obbligatorio in `field()` per attributi mutabili come `list` o `dict` (es. `field(default_factory=list)`).
* **`__post_init__()`**: Metodo speciale per effettuare validazioni o calcoli derivati dopo l'auto-generazione degli attributi.

---

## 11. Principi di Architettura ed Anti-pattern Comuni

### Principio di Singola Responsabilità (SRP)
Ogni classe dovrebbe avere **una ed una sola responsabilità** ben definita. Una classe non dovrebbe occuparsi contemporaneamente dell'interfaccia utente, della logica di business, dell'accesso alla rete e del salvataggio su disco.

### Sintesi degli Errori Comuni in OOP

1. **Dimenticare `self` nei metodi**: Solleva un errore di argomento posizionale mancante all'invocazione.
2. **Attributi mutabili a livello di classe**: Definire `lista = []` nel corpo della classe invece che in `__init__` provoca la condivisione dello stato tra tutte le istanze.
3. **Mancata invocazione di `super().__init__()` nelle sottoclassi**: Porta a stati incompleti o ad `AttributeError` nell'accesso ai dati della superclasse.
4. **Abuso dell'Ereditarietà**: Utilizzare l'ereditarietà al solo scopo di riutilizzare poche righe di codice quando non sussiste una relazione IS-A. Usare invece la **Composizione**.
5. **Nomi di classe in minuscolo**: Non rispettare la convenzione `PascalCase` rende difficile distinguere le classi dalle funzioni o variabili.
6. **Property con effetti collaterali complessi**: Usare `@property` per operazioni pesanti in termini di calcolo o I/O di rete crea l'aspettativa ingannevole di un semplice accesso ad un attributo in memoria.
