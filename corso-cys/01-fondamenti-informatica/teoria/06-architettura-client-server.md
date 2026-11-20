# 06 – Architettura client-server

## 1. Obiettivi didattici

Al termine della lezione lo studente sarà in grado di:

- Comprendere il funzionamento dell'architettura client-server.
- Distinguere il ruolo del client e del server.
- Descrivere il modello di comunicazione richiesta/risposta.
- Comprendere il funzionamento del protocollo HTTP.
- Riconoscere i principali metodi HTTP e i codici di stato.
- Comprendere le differenze tra architetture monolitiche e architetture a livelli.
- Identificare i livelli Presentation, Application e Data.
- Comprendere il ruolo delle API nella comunicazione tra applicazioni.
- Interpretare dati strutturati in formato JSON.
- Distinguere autenticazione e autorizzazione.
- Comprendere il ruolo di TLS nella protezione delle comunicazioni.
- Comprendere l'importanza della validazione degli input.
- Individuare i principali rischi di sicurezza nelle applicazioni client-server.

---

## 2. Introduzione all'architettura client-server

L'architettura client-server è un modello di progettazione e comunicazione nel quale due componenti assumono ruoli differenti:

- Il client richiede un servizio o una risorsa.
- Il server riceve la richiesta, la elabora e restituisce una risposta.

La comunicazione avviene attraverso una rete e utilizza protocolli definiti.

### 2.1 Il client

Il client è un dispositivo o un'applicazione che richiede un servizio a un server.

Esempi:

- Browser Web.
- Applicazione mobile.
- Applicazione desktop.
- Client di posta elettronica.
- Programma Python che interroga un'API.
- Applicazione gestionale.

Il client può:

- Inviare richieste.
- Trasmettere dati.
- Ricevere risposte.
- Visualizzare informazioni.
- Gestire l'interazione con l'utente.

### 2.2 Il server

Il server è un sistema che mette a disposizione risorse o servizi per altri dispositivi o applicazioni.

Può essere un computer fisico, una macchina virtuale, un container o un servizio cloud.

Il server può:

- Ricevere richieste.
- Verificare le autorizzazioni.
- Elaborare dati.
- Interrogare un database.
- Eseguire operazioni applicative.
- Restituire risposte.
- Registrare eventi nei log.

Esempi:

| Tipologia | Funzione |
| --- | --- |
| Web Server | Distribuisce contenuti Web |
| Application Server | Esegue la logica applicativa |
| Database Server | Gestisce la persistenza dei dati |
| Mail Server | Gestisce la posta elettronica |
| DNS Server | Risolve i nomi di dominio |
| File Server | Condivide file e documenti |

### 2.3 Il modello richiesta/risposta

Il funzionamento di base è il seguente:

```text
       CLIENT                         SERVER
         |                               |
         |                               |
         |-------- RICHIESTA ----------->|
         |                               |
         |                         ELABORAZIONE
         |                               |
         |                         EVENTUALE ACCESSO
         |                         AL DATABASE
         |                               |
         |<--------- RISPOSTA -----------|
         |                               |
```

Esempio: un utente apre il browser e visita un sito Web.

1. Il browser richiede una risorsa al server.
2. Il server riceve la richiesta.
3. Il server elabora la richiesta.
4. Se necessario, interroga un database.
5. Il server prepara una risposta.
6. Il browser riceve e visualizza il contenuto.

### 2.4 Un esempio concreto

Consideriamo un'applicazione per la gestione dei mezzi aziendali.

L'utente inserisce una targa:

```text
Targa: AB123CD
```

Il client invia una richiesta al server.

Il server:

1. Riceve la targa.
2. Verifica che il formato sia valido.
3. Cerca il mezzo nel database.
4. Recupera i dati.
5. Restituisce le informazioni al client.

La comunicazione potrebbe essere realizzata attraverso un'API REST.

---

## 3. Comunicazione tra client e server

Per comunicare, client e server devono utilizzare protocolli condivisi.

Un protocollo definisce le regole che permettono a due sistemi di scambiare informazioni.

Tra i principali protocolli utilizzati nelle architetture client-server troviamo:

- HTTP e HTTPS.
- TCP.
- UDP.
- DNS.
- SSH.
- SMTP.
- WebSocket.

### 3.1 Il protocollo HTTP

HTTP (Hypertext Transfer Protocol) è un protocollo applicativo utilizzato per trasferire risorse attraverso una rete.

È alla base della comunicazione Web.

HTTP viene utilizzato per:

- Richiedere pagine Web.
- Trasmettere dati.
- Comunicare con API REST.
- Inviare informazioni ai server.
- Ricevere risposte da applicazioni remote.

HTTP utilizza un modello richiesta/risposta.

### 3.2 Struttura di una richiesta HTTP

Una richiesta HTTP comprende generalmente:

1. Metodo.
2. URI o percorso della risorsa.
3. Versione del protocollo.
4. Header.
5. Eventuale body.

Esempio:

```http
GET /api/mezzi/15 HTTP/1.1
Host: localhost:8000
Accept: application/json
Authorization: Bearer TOKEN
```

Interpretazione:

| Elemento | Significato |
| --- | --- |
| GET | Metodo HTTP |
| /api/mezzi/15 | Percorso della risorsa |
| HTTP/1.1 | Versione del protocollo |
| Host | Host destinatario |
| Accept | Formato di risposta accettato |
| Authorization | Informazioni di autenticazione |

In questo esempio il client richiede il mezzo identificato dal valore `15`.

### 3.3 Struttura di una risposta HTTP

Il server restituisce una risposta composta da:

1. Versione del protocollo.
2. Codice di stato.
3. Descrizione dello stato.
4. Header.
5. Eventuale body.

Esempio:

```http
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 65

{
    "id": 15,
    "targa": "AB123CD",
    "modello": "Fiat Ducato"
}
```

Il codice `200` indica che la richiesta è stata elaborata correttamente.

### 3.4 Header HTTP

Gli header contengono informazioni aggiuntive sulla richiesta o sulla risposta.

Alcuni header importanti:

| Header | Funzione |
| --- | --- |
| Host | Identifica l'host destinatario |
| Content-Type | Indica il formato del contenuto |
| Accept | Indica i formati accettati dal client |
| Authorization | Contiene credenziali o token |
| User-Agent | Identifica il client |
| Content-Length | Indica la dimensione del body |
| Cache-Control | Definisce direttive di caching |
| Origin | Identifica l'origine di una richiesta |
| Cookie | Trasmette cookie al server |
| Set-Cookie | Permette al server di impostare cookie |

### 3.5 Metodi HTTP

I metodi HTTP indicano l'operazione richiesta dal client.

| Metodo | Funzione | Esempio |
| --- | --- | --- |
| GET | Recupera una risorsa | Leggere un mezzo |
| POST | Invia dati o crea una risorsa | Inserire un nuovo mezzo |
| PUT | Sostituisce una risorsa | Aggiornare un mezzo |
| PATCH | Modifica parzialmente una risorsa | Modificare la targa |
| DELETE | Elimina una risorsa | Eliminare un mezzo |
| HEAD | Richiede gli header senza il contenuto | Verificare una risorsa |
| OPTIONS | Richiede le opzioni di comunicazione | Verificare i metodi supportati |

Esempio di operazioni su una risorsa:

```text
GET     /api/mezzi/15
POST    /api/mezzi
PUT     /api/mezzi/15
PATCH   /api/mezzi/15
DELETE  /api/mezzi/15
```

Questa organizzazione è tipica delle API REST.

### 3.6 Proprietà dei metodi HTTP

Due proprietà importanti sono:

**Safe**

Un metodo è considerato safe quando è progettato per non modificare lo stato della risorsa sul server.

GET è un esempio di metodo safe.

**Idempotent**

Un metodo è idempotente quando eseguire più volte la stessa richiesta produce lo stesso effetto previsto sullo stato della risorsa.

Esempi:

- GET: idempotente.
- PUT: idempotente.
- DELETE: idempotente.
- POST: generalmente non idempotente.
- PATCH: dipende dall'operazione implementata.

Queste proprietà sono importanti per progettare API affidabili e gestire correttamente retry e comunicazioni interrotte.

---

## 4. Codici di stato HTTP

Il server utilizza i codici di stato per comunicare l'esito della richiesta.

I codici HTTP sono suddivisi in cinque categorie.

| Categoria | Intervallo | Significato |
| --- | --- | --- |
| 1xx | 100–199 | Informazioni |
| 2xx | 200–299 | Successo |
| 3xx | 300–399 | Reindirizzamento |
| 4xx | 400–499 | Errore lato client |
| 5xx | 500–599 | Errore lato server |

### 4.1 Codici più utilizzati

| Codice | Descrizione | Significato |
| ---: | --- | --- |
| 200 | OK | Richiesta completata |
| 201 | Created | Risorsa creata |
| 202 | Accepted | Richiesta accettata per elaborazione |
| 204 | No Content | Richiesta completata senza contenuto |
| 301 | Moved Permanently | Reindirizzamento permanente |
| 302 | Found | Reindirizzamento temporaneo |
| 304 | Not Modified | Risorsa non modificata |
| 400 | Bad Request | Richiesta non valida |
| 401 | Unauthorized | Autenticazione richiesta o non valida |
| 403 | Forbidden | Operazione non autorizzata |
| 404 | Not Found | Risorsa non trovata |
| 405 | Method Not Allowed | Metodo non supportato per la risorsa |
| 409 | Conflict | Conflitto con lo stato della risorsa |
| 422 | Unprocessable Content | Contenuto non elaborabile semanticamente |
| 429 | Too Many Requests | Troppe richieste |
| 500 | Internal Server Error | Errore interno |
| 502 | Bad Gateway | Risposta non valida da un server a monte |
| 503 | Service Unavailable | Servizio temporaneamente non disponibile |
| 504 | Gateway Timeout | Timeout del server a monte |

### 4.2 Differenza tra 401 e 403

Questa distinzione è importante per la sicurezza.

**401 Unauthorized**

Il client non ha fornito credenziali valide oppure deve autenticarsi.

Esempio:

```text
Accesso a /api/profilo senza token valido.
```

**403 Forbidden**

Il client è autenticato, ma non dispone dei permessi necessari.

Esempio:

```text
Un utente standard tenta di accedere a una funzione riservata agli amministratori.
```

### 4.3 Perché i codici HTTP sono importanti?

I codici di stato permettono al client di capire come gestire la risposta.

Esempi:

- `200`: visualizzare i dati.
- `201`: confermare la creazione.
- `400`: segnalare una richiesta non valida.
- `401`: richiedere l'autenticazione.
- `403`: segnalare permessi insufficienti.
- `404`: informare che la risorsa non esiste.
- `500`: gestire un errore del server.

Una corretta gestione degli errori evita che il client debba interpretare risposte ambigue.

---

## 5. Architetture applicative

Le applicazioni possono essere organizzate secondo differenti architetture.

La scelta dipende da:

- Complessità.
- Numero di utenti.
- Necessità di scalabilità.
- Manutenibilità.
- Sicurezza.
- Distribuzione dei componenti.

### 5.1 Architettura monolitica

In un'architettura monolitica le principali funzionalità applicative sono sviluppate e distribuite come un'unica applicazione.

```text
        APPLICAZIONE MONOLITICA
    ______________________________
   |                              |
   |  Interfaccia utente          |
   |  Logica applicativa          |
   |  Accesso ai dati             |
   |______________________________|
                 |
                 v
              DATABASE
```

Vantaggi:

- Semplicità iniziale.
- Distribuzione relativamente semplice.
- Facilità di sviluppo per applicazioni piccole.

Svantaggi:

- Crescita della complessità.
- Maggiore difficoltà nel modificare singole componenti.
- Possibili difficoltà di scalabilità selettiva.
- Maggiore impatto dei problemi sull'intera applicazione.

Un monolite ben progettato può comunque essere manutenibile, sicuro e adatto anche ad applicazioni complesse.

### 5.2 Architettura a due livelli (Two-Tier)

L'architettura a due livelli separa il client dal server dei dati.

```text
       CLIENT
    _____________
   |             |
   | Interfaccia |
   | Logica      |
   |_____________|
         |
         |
         v
      DATABASE
```

Il client contiene parte della logica applicativa e comunica direttamente con il database.

Esempio:

Un'applicazione desktop installata sui computer aziendali che accede direttamente a un database centralizzato.

Limiti:

- Distribuzione della logica sui client.
- Difficoltà di aggiornamento.
- Necessità di gestire credenziali database sui client.
- Maggiore esposizione del database.

### 5.3 Architettura a tre livelli (Three-Tier)

L'architettura a tre livelli separa:

1. Presentation Layer.
2. Application Layer.
3. Data Layer.

```text
          CLIENT
       Presentation
              |
              v
       APPLICATION SERVER
         Application
              |
              v
         DATABASE
           Data
```

**Presentation Layer**

Gestisce l'interazione con l'utente.

Esempi:

- Browser.
- Applicazione mobile.
- Interfaccia desktop.

**Application Layer**

Contiene la logica applicativa.

Si occupa di:

- Elaborazione delle richieste.
- Regole di business.
- Validazione.
- Autenticazione e autorizzazione.
- Coordinamento dell'accesso ai dati.

**Data Layer**

Gestisce la persistenza delle informazioni.

Esempi:

- PostgreSQL.
- MySQL.
- MongoDB.
- Sistemi di archiviazione.

### 5.4 Vantaggi dell'architettura a tre livelli

- Separazione delle responsabilità.
- Maggiore manutenibilità.
- Possibilità di aggiornare i componenti indipendentemente.
- Maggiore controllo degli accessi.
- Possibilità di scalare separatamente i livelli.
- Riduzione dell'esposizione diretta del database.

### 5.5 Architettura a livelli e sicurezza

La separazione dei livelli consente di applicare controlli differenti.

Esempio:

| Livello | Controlli di sicurezza |
| --- | --- |
| Presentation | Validazione preliminare, gestione sessione |
| Application | Autenticazione, autorizzazione, validazione server-side |
| Data | Privilegi minimi, query parametrizzate, backup |

**Attenzione:** la validazione eseguita dal client migliora l'esperienza utente, ma non è sufficiente per garantire la sicurezza. Il server deve sempre verificare i dati ricevuti.

---

## 6. API – Application Programming Interface

Un'API è un'interfaccia che permette a un'applicazione di utilizzare funzionalità o dati messi a disposizione da un altro sistema.

Le API definiscono:

- Operazioni disponibili.
- Parametri richiesti.
- Formato dei dati.
- Modalità di autenticazione.
- Risposte previste.
- Eventuali errori.

Le API permettono a sistemi differenti di comunicare senza conoscere necessariamente i dettagli interni delle rispettive implementazioni.

### 6.1 Esempio di API

Consideriamo un'applicazione per la gestione dei mezzi aziendali.

Il server espone alcune operazioni:

| Metodo | Endpoint | Funzione |
| --- | --- | --- |
| GET | `/api/mezzi` | Elenco dei mezzi |
| GET | `/api/mezzi/15` | Dettaglio di un mezzo |
| POST | `/api/mezzi` | Inserimento di un mezzo |
| PUT | `/api/mezzi/15` | Sostituzione dei dati |
| DELETE | `/api/mezzi/15` | Eliminazione di un mezzo |

Il client utilizza questi endpoint per interagire con il sistema.

### 6.2 API REST

REST (Representational State Transfer) è uno stile architetturale per la progettazione di sistemi distribuiti.

Un'API REST utilizza tipicamente:

- Risorse identificate da URI.
- Metodi HTTP.
- Rappresentazioni delle risorse.
- Comunicazioni stateless.
- Codici di stato HTTP.

Esempio:

```text
GET /api/utenti/10
```

Identifica la risorsa relativa all'utente con ID 10.

Una richiesta REST stateless non richiede che il server mantenga lo stato della sessione applicativa del client tra una richiesta e l'altra. Ogni richiesta deve contenere le informazioni necessarie per essere elaborata, come le credenziali o il token quando richiesti.

### 6.3 Endpoint

Un endpoint è un punto di accesso a una funzionalità esposta da un'API.

Esempio:

```text
https://api.example.com/api/mezzi/15
```

Componenti:

- Protocollo: HTTPS.
- Host: api.example.com.
- Percorso: `/api/mezzi/15`.

Un endpoint può accettare uno o più metodi HTTP.

### 6.4 API e cybersecurity

Le API rappresentano un punto di ingresso importante nelle applicazioni moderne.

Una API non adeguatamente protetta può esporre:

- Dati personali.
- Informazioni aziendali.
- Funzionalità amministrative.
- Operazioni sui database.
- Servizi interni.

Tra i rischi principali:

- Accessi non autorizzati.
- Mancata verifica dei permessi sulle singole risorse.
- Esposizione eccessiva dei dati.
- Input non validati.
- Abuso delle API.
- Mancanza di limiti alle richieste.

La sicurezza delle API deve essere progettata fin dall'inizio.

---

## 7. JSON – JavaScript Object Notation

JSON è un formato testuale utilizzato per rappresentare e scambiare dati strutturati.

È molto diffuso nelle API REST.

Caratteristiche:

- Formato leggibile.
- Indipendente dal linguaggio di programmazione.
- Struttura semplice.
- Supporto a oggetti e array.
- Facilmente elaborabile da Python, JavaScript, Java e altri linguaggi.

### 7.1 Struttura JSON

JSON utilizza:

- Oggetti.
- Array.
- Stringhe.
- Numeri.
- Booleani.
- Valore null.

Esempio:

```json
{
    "id": 15,
    "targa": "AB123CD",
    "modello": "Fiat Ducato",
    "anno": 2022,
    "attivo": true,
    "proprietario": null
}
```

### 7.2 Oggetti JSON

Un oggetto JSON è delimitato da parentesi graffe.

```json
{
    "nome": "Mario",
    "cognome": "Rossi",
    "ruolo": "admin"
}
```

Ogni proprietà è composta da una coppia chiave-valore.

### 7.3 Array JSON

Un array è una sequenza ordinata di elementi.

```json
{
    "utenti": [
        {
            "id": 1,
            "nome": "Mario"
        },
        {
            "id": 2,
            "nome": "Anna"
        }
    ]
}
```

### 7.4 JSON e Python

Python mette a disposizione il modulo standard `json`.

Conversione da dizionario Python a JSON:

```python
import json

utente = {
    "id": 1,
    "nome": "Mario",
    "ruolo": "admin"
}

# Converte il dizionario in una stringa JSON
risultato = json.dumps(utente, indent=4)

print(risultato)
```

Conversione da JSON a dizionario Python:

```python
import json

json_string = '''
{
    "id": 1,
    "nome": "Mario",
    "ruolo": "admin"
}
'''

utente = json.loads(json_string)

print(utente["nome"])
print(utente["ruolo"])
```

### 7.5 Differenza tra JSON e dizionario Python

JSON è un formato di scambio dati, mentre un dizionario è una struttura dati di Python.

| JSON | Python |
| --- | --- |
| Oggetto | `dict` |
| Array | `list` |
| Stringa | `str` |
| Numero intero | `int` |
| Numero decimale | `float` |
| Booleano | `bool` |
| null | `None` |

Attenzione ad alcune differenze sintattiche:

JSON:

```json
{
    "attivo": true,
    "proprietario": null
}
```

Python:

```python
{
    "attivo": True,
    "proprietario": None
}
```

---

## 8. Autenticazione e autorizzazione

La sicurezza di un'applicazione client-server richiede di controllare chi accede al sistema e quali operazioni può eseguire.

Sono due concetti distinti:

- Autenticazione.
- Autorizzazione.

### 8.1 Autenticazione

L'autenticazione è il processo attraverso il quale un sistema verifica l'identità di un soggetto.

In altre parole:

**Chi sei?**

Esempi:

- Username e password.
- Certificati digitali.
- Token.
- Autenticazione a più fattori.
- Biometria.

Esempio:

```text
UTENTE
   |
   v
Inserimento username e password
   |
   v
SERVER
   |
   v
Verifica delle credenziali
   |
   v
Autenticazione riuscita
```

### 8.2 Autorizzazione

L'autorizzazione determina quali risorse e operazioni un soggetto autenticato può utilizzare.

In altre parole:

**Che cosa puoi fare?**

Esempio:

| Ruolo | Visualizzare utenti | Modificare utenti | Eliminare utenti |
| --- | --- | --- | --- |
| Admin | Sì | Sì | Sì |
| Operatore | Sì | Sì | No |
| Utente | Solo dati propri | Solo dati propri | No |

### 8.3 Differenza tra autenticazione e autorizzazione

| Autenticazione | Autorizzazione |
| --- | --- |
| Verifica l'identità | Verifica i permessi |
| Chi sei? | Che cosa puoi fare? |
| Login | Controllo degli accessi |
| Credenziali | Ruoli e permessi |

Un utente può essere autenticato correttamente ma non avere il diritto di accedere a una determinata risorsa.

### 8.4 Autenticazione tramite token

Molte API utilizzano token per identificare le richieste successive all'autenticazione.

Esempio di header HTTP:

```http
Authorization: Bearer eyJhbGciOi...
```

Il client trasmette il token al server.

Il server verifica:

- Validità.
- Scadenza.
- Firma, se prevista dal formato.
- Identità associata.
- Eventuali autorizzazioni.

Il token non deve essere considerato automaticamente sicuro solo perché è presente nella richiesta.

Deve essere protetto, verificato e trasmesso attraverso un canale cifrato.

### 8.5 JWT – JSON Web Token

JWT è un formato standard per rappresentare informazioni trasmesse tra soggetti in forma di token.

Un JWT compatto è composto da tre parti:

```text
HEADER.PAYLOAD.SIGNATURE
```

- Header: contiene informazioni sull'algoritmo e sul tipo di token.
- Payload: contiene le informazioni o dichiarazioni (*claims*).
- Signature: permette di verificare l'integrità e l'autenticità del token secondo lo schema utilizzato.

Esempio concettuale di payload:

```json
{
    "sub": "utente123",
    "role": "admin",
    "exp": 1900000000
}
```

**Attenzione:** un JWT firmato non è necessariamente cifrato. Il payload di un JWT compatto firmato è normalmente leggibile da chiunque ne possieda il contenuto. Non bisogna inserire password o informazioni segrete nel payload.

### 8.6 Controllo degli accessi e RBAC

RBAC (Role-Based Access Control) è un modello di controllo degli accessi basato sui ruoli.

I permessi vengono associati ai ruoli, mentre gli utenti vengono associati ai ruoli.

Esempio:

```text
UTENTE
   |
   v
RUOLO
   |
   v
PERMESSI
   |
   v
RISORSE ACCESSIBILI
```

Questo modello semplifica la gestione degli accessi in applicazioni con molti utenti.

È importante verificare i permessi anche a livello di singola risorsa, non soltanto in base al ruolo generale dell'utente.

---

## 9. TLS e sicurezza delle comunicazioni

Quando un client comunica con un server attraverso una rete, i dati potrebbero essere intercettati o modificati.

Per proteggere la comunicazione si utilizza TLS (Transport Layer Security).

TLS è un protocollo crittografico che fornisce:

- Riservatezza.
- Integrità.
- Autenticazione del server attraverso certificati digitali.
- Possibile autenticazione del client, se configurata.

### 9.1 HTTP e HTTPS

HTTP trasmette i dati senza fornire autonomamente cifratura e autenticazione crittografica del server.

HTTPS è HTTP utilizzato attraverso una connessione protetta da TLS.

```text
HTTP
CLIENT -------------------- SERVER
       Dati non cifrati


HTTPS
CLIENT ===== TLS ========= SERVER
       Comunicazione protetta
```

HTTPS utilizza normalmente la porta TCP 443.

### 9.2 Il certificato digitale

Il server HTTPS presenta un certificato digitale.

Il certificato contiene informazioni come:

- Identità del soggetto.
- Nome del dominio.
- Chiave pubblica.
- Periodo di validità.
- Autorità di certificazione.
- Firma digitale.

Il browser verifica il certificato e la relativa catena di fiducia.

### 9.3 Handshake TLS

Durante l'avvio di una connessione TLS, client e server eseguono una procedura di negoziazione.

In forma semplificata:

```text
CLIENT                         SERVER
   |                              |
   |-------- ClientHello -------->|
   |                              |
   |<------- ServerHello ---------|
   |<------- Certificato ---------|
   |                              |
   |   Verifica certificato       |
   |                              |
   |<==== Negoziazione chiavi ====>|
   |                              |
   |====== DATI CIFRATI =========>|
```

Nelle versioni moderne di TLS il dettaglio del protocollo è più articolato. TLS 1.3 utilizza un handshake ottimizzato e meccanismi crittografici aggiornati.

### 9.4 Cosa protegge TLS?

TLS protegge il contenuto della comunicazione e consente al client di verificare l'identità del server attraverso il certificato.

Non garantisce però:

- Che l'applicazione sia priva di vulnerabilità.
- Che il server non sia compromesso.
- Che l'utente sia autorizzato a eseguire qualsiasi operazione.
- Che i dati ricevuti siano corretti dal punto di vista applicativo.

TLS è quindi una componente della sicurezza, non una soluzione completa.

### 9.5 Verificare una connessione HTTPS con Linux

Utilizzare `curl`:

```bash
curl -I https://example.com
```

Per visualizzare informazioni dettagliate:

```bash
curl -v https://example.com
```

Per analizzare il certificato:

```bash
openssl s_client -connect example.com:443 -servername example.com
```

Il parametro `-servername` permette di inviare il nome del server tramite SNI.

---

## 10. Validazione degli input

La validazione degli input è il processo attraverso il quale un'applicazione verifica che i dati ricevuti siano conformi alle regole previste.

È un controllo fondamentale per la sicurezza.

I dati possono provenire da:

- Form HTML.
- Applicazioni mobile.
- API REST.
- File.
- Database esterni.
- Altri servizi.
- Utenti non autenticati.

**Principio fondamentale: non fidarsi mai dei dati ricevuti dal client.**

Il client può essere manipolato e le richieste possono essere inviate direttamente al server senza utilizzare l'interfaccia grafica prevista.

### 10.1 Validazione lato client

La validazione lato client viene eseguita nel browser o nell'applicazione che invia i dati.

Esempio HTML:

```html
<input
    type="email"
    name="email"
    required
>
```

Il browser può verificare che il campo sia compilato e che il valore abbia una struttura compatibile con un indirizzo email.

Vantaggi:

- Migliora l'esperienza utente.
- Riduce gli errori di compilazione.
- Permette controlli immediati.

Limiti:

- Può essere aggirata.
- Non protegge direttamente il server.
- Non deve essere considerata una misura di sicurezza sufficiente.

### 10.2 Validazione lato server

La validazione lato server viene eseguita dall'applicazione che riceve i dati.

Deve essere sempre presente quando i dati influenzano operazioni, accessi o persistenza.

Esempi di controlli:

- Tipo del dato.
- Lunghezza.
- Formato.
- Intervallo numerico.
- Valori ammessi.
- Presenza di campi obbligatori.
- Coerenza tra campi.
- Permessi dell'utente sulla risorsa.

### 10.3 Esempio Python

Supponiamo di ricevere l'età di un utente.

```python
eta = input("Inserisci l'età: ")

try:
    eta = int(eta)

    if 0 <= eta <= 120:
        print("Valore valido")
    else:
        print("Età non valida")

except ValueError:
    print("Devi inserire un numero intero")
```

Il programma verifica:

1. Che il valore sia convertibile in intero.
2. Che rientri nell'intervallo previsto.

### 10.4 Validazione e sicurezza

Una validazione insufficiente può contribuire a vulnerabilità come:

- SQL Injection.
- Cross-Site Scripting (XSS).
- Path Traversal.
- Command Injection.
- Mass Assignment.
- Buffer overflow in contesti e linguaggi vulnerabili.

La validazione è importante, ma deve essere accompagnata da altre misure.

Esempi:

| Rischio | Contromisura |
| --- | --- |
| SQL Injection | Query parametrizzate |
| XSS | Output encoding e sanitizzazione contestuale |
| Command Injection | Evitare shell non necessarie e utilizzare API sicure |
| Path Traversal | Validazione dei percorsi e controllo delle directory |
| Accessi non autorizzati | Autenticazione e autorizzazione |
| Mass Assignment | Consentire soltanto i campi modificabili |

### 10.5 SQL Injection: esempio concettuale

Una query costruita concatenando direttamente l'input dell'utente può essere vulnerabile.

Esempio da non utilizzare:

```python
username = input("Username: ")

query = (
    "SELECT * FROM utenti "
    "WHERE username = '" + username + "'"
)
```

Il problema è che il dato fornito dall'utente viene inserito direttamente nella query.

Una soluzione corretta utilizza query parametrizzate:

```python
cursor.execute(
    "SELECT * FROM utenti WHERE username = %s",
    (username,)
)
```

La sintassi dei parametri dipende dal driver utilizzato.

Il principio è separare i dati dalla struttura della query.

---

## 11. Architettura client-server con FastAPI

FastAPI è un framework Python utilizzato per sviluppare API Web.

Permette di realizzare applicazioni backend che ricevono richieste HTTP e restituiscono risposte strutturate, frequentemente in JSON.

### 11.1 Installazione

Creare un ambiente virtuale:

```bash
python3 -m venv .venv
```

Attivarlo:

```bash
source .venv/bin/activate
```

Installare FastAPI e Uvicorn:

```bash
pip install fastapi uvicorn
```

### 11.2 Primo server FastAPI

Creare un file `main.py`:

```python
from fastapi import FastAPI

# Crea l'applicazione
app = FastAPI(
    title="API Cybersecurity",
    description="Prima applicazione client-server",
    version="1.0.0"
)


# Endpoint principale
@app.get("/")
def home():
    return {
        "messaggio": "Server attivo",
        "applicazione": "API Cybersecurity"
    }


# Endpoint informativo
@app.get("/api/stato")
def stato():
    return {
        "stato": "online",
        "servizio": "FastAPI"
    }
```

Avviare il server:

```bash
uvicorn main:app --reload
```

Per impostazione predefinita il server di sviluppo è raggiungibile localmente all'indirizzo:

```text
http://127.0.0.1:8000
```

### 11.3 Testare il server

Aprire il browser e visitare:

```text
http://127.0.0.1:8000
```

Risposta:

```json
{
    "messaggio": "Server attivo",
    "applicazione": "API Cybersecurity"
}
```

Accedere alla documentazione interattiva:

```text
http://127.0.0.1:8000/docs
```

FastAPI genera automaticamente una documentazione OpenAPI e una interfaccia Swagger UI.

### 11.4 Creare un endpoint GET

Aggiungere al file `main.py`:

```python
mezzi = [
    {
        "id": 1,
        "targa": "AB123CD",
        "modello": "Fiat Ducato"
    },
    {
        "id": 2,
        "targa": "EF456GH",
        "modello": "Ford Transit"
    }
]


@app.get("/api/mezzi")
def elenco_mezzi():
    return mezzi
```

Richiesta:

```http
GET /api/mezzi
```

Risposta:

```json
[
    {
        "id": 1,
        "targa": "AB123CD",
        "modello": "Fiat Ducato"
    },
    {
        "id": 2,
        "targa": "EF456GH",
        "modello": "Ford Transit"
    }
]
```

### 11.5 Creare un endpoint con parametro

```python
from fastapi import HTTPException


@app.get("/api/mezzi/{mezzo_id}")
def dettaglio_mezzo(mezzo_id: int):

    for mezzo in mezzi:
        if mezzo["id"] == mezzo_id:
            return mezzo

    raise HTTPException(
        status_code=404,
        detail="Mezzo non trovato"
    )
```

Richiesta:

```http
GET /api/mezzi/1
```

Il parametro `mezzo_id` viene estratto dal percorso dell'URL.

FastAPI lo converte e verifica che sia un intero.

### 11.6 Validazione dei dati con Pydantic

Pydantic permette di definire modelli per validare e strutturare i dati ricevuti.

Esempio:

```python
from pydantic import BaseModel, Field


class MezzoCreate(BaseModel):

    targa: str = Field(
        min_length=7,
        max_length=10
    )

    modello: str = Field(
        min_length=2,
        max_length=50
    )

    anno: int = Field(
        ge=1990,
        le=2035
    )
```

Il modello definisce:

- Targa obbligatoria con lunghezza limitata.
- Modello con lunghezza minima e massima.
- Anno compreso nell'intervallo previsto.

Questi vincoli sono un esempio didattico: le regole effettive devono essere coerenti con i dati e con le esigenze applicative.

### 11.7 Endpoint POST

Aggiungere:

```python
@app.post("/api/mezzi", status_code=201)
def crea_mezzo(mezzo: MezzoCreate):

    nuovo_mezzo = {
        "id": len(mezzi) + 1,
        **mezzo.model_dump()
    }

    mezzi.append(nuovo_mezzo)

    return nuovo_mezzo
```

La richiesta può contenere:

```json
{
    "targa": "XY789ZT",
    "modello": "Renault Master",
    "anno": 2023
}
```

FastAPI:

1. Riceve il JSON.
2. Verifica la struttura.
3. Controlla i vincoli Pydantic.
4. Converte i dati nel modello.
5. Esegue la funzione.
6. Restituisce la risposta.

### 11.8 Test con curl

Richiedere l'elenco dei mezzi:

```bash
curl http://127.0.0.1:8000/api/mezzi
```

Richiedere un singolo mezzo:

```bash
curl http://127.0.0.1:8000/api/mezzi/1
```

Inserire un nuovo mezzo:

```bash
curl -X POST \
  http://127.0.0.1:8000/api/mezzi \
  -H "Content-Type: application/json" \
  -d '{
    "targa": "XY789ZT",
    "modello": "Renault Master",
    "anno": 2023
  }'
```

Il parametro `Content-Type` indica che il body della richiesta contiene JSON.

**Nota:** l'esempio utilizza una lista in memoria. I dati vengono persi quando il server viene riavviato. La persistenza su database sarà affrontata nei moduli dedicati.

---

## 12. Principali rischi di sicurezza nelle architetture client-server

Le applicazioni client-server espongono funzionalità e dati attraverso interfacce di comunicazione.

Ogni punto di ingresso deve essere progettato e protetto adeguatamente.

### 12.1 Accessi non autorizzati

Un utente potrebbe tentare di accedere a risorse senza disporre dei permessi necessari.

Contromisure:

- Autenticazione.
- Autorizzazione.
- Controllo dei ruoli.
- Verifica dei permessi sulle singole risorse.
- Principio del minimo privilegio.

### 12.2 SQL Injection

Si verifica quando dati controllati dall'utente vengono inseriti in query SQL senza un'adeguata separazione tra codice e dati.

Contromisure:

- Query parametrizzate.
- ORM utilizzati correttamente.
- Privilegi minimi sul database.
- Validazione degli input.
- Gestione sicura degli errori.

### 12.3 Broken Access Control

Si verifica quando un'applicazione non verifica correttamente i permessi di accesso alle risorse.

Esempio:

Un utente autenticato modifica l'identificativo presente nell'URL:

```text
/api/utenti/10
```

e prova ad accedere a:

```text
/api/utenti/11
```

Se il server restituisce i dati del secondo utente senza verificare i permessi, è presente una vulnerabilità di controllo degli accessi.

Questo tipo di problema è spesso associato a IDOR (Insecure Direct Object Reference).

Contromisure:

- Verificare i permessi per ogni risorsa.
- Non fidarsi degli identificativi inviati dal client.
- Applicare controlli lato server.
- Testare gli accessi con utenti e ruoli differenti.

### 12.4 Esposizione di informazioni

Un server potrebbe restituire informazioni non necessarie.

Esempi:

- Password.
- Token.
- Dati personali.
- Informazioni interne.
- Dettagli tecnici dell'infrastruttura.
- Stack trace.

Contromisure:

- Definire modelli di risposta.
- Restituire soltanto i campi necessari.
- Non esporre credenziali.
- Gestire correttamente gli errori.
- Proteggere i log.

### 12.5 Attacchi DoS e abuso delle API

Un servizio può essere sottoposto a un numero eccessivo di richieste.

Questo può causare:

- Saturazione delle risorse.
- Aumento dei tempi di risposta.
- Indisponibilità del servizio.
- Consumo eccessivo di risorse cloud.

Contromisure:

- Rate limiting.
- Timeout.
- Limiti alle dimensioni delle richieste.
- Monitoraggio.
- Protezione a livello di infrastruttura.
- Gestione delle risorse.

### 12.6 Checklist di sicurezza

Prima di rendere disponibile un'API è opportuno verificare:

- [ ] Le richieste sono protette tramite HTTPS.
- [ ] Le operazioni riservate richiedono autenticazione.
- [ ] I permessi sono verificati lato server.
- [ ] Gli input vengono validati.
- [ ] Le query al database sono parametrizzate.
- [ ] Le risposte non espongono informazioni riservate.
- [ ] Gli errori non mostrano dettagli interni.
- [ ] Sono previsti limiti alle richieste.
- [ ] I log registrano gli eventi rilevanti.
- [ ] I servizi non necessari non sono esposti.

---

## 13. Laboratorio pratico: analisi di una comunicazione HTTP

### Obiettivo

Osservare il funzionamento del modello richiesta/risposta utilizzando strumenti disponibili su Ubuntu.

### Fase 1 – Avviare il server

Creare il progetto FastAPI e avviare:

```bash
uvicorn main:app --reload
```

### Fase 2 – Inviare una richiesta GET

Aprire un secondo terminale:

```bash
curl -i http://127.0.0.1:8000/api/mezzi
```

Il parametro `-i` visualizza anche gli header della risposta.

Osservare:

- Codice di stato.
- Content-Type.
- Contenuto JSON.

### Fase 3 – Analizzare gli header

```bash
curl -v http://127.0.0.1:8000/api/mezzi
```

Il comando visualizza informazioni dettagliate sulla comunicazione.

### Fase 4 – Provocare un errore 404

```bash
curl -i http://127.0.0.1:8000/api/mezzi/999
```

Osservare il codice HTTP restituito.

### Fase 5 – Inviare dati non validi

```bash
curl -i -X POST \
  http://127.0.0.1:8000/api/mezzi \
  -H "Content-Type: application/json" \
  -d '{
    "targa": "",
    "modello": "A",
    "anno": 1800
  }'
```

FastAPI e Pydantic restituiscono un errore di validazione.

### Fase 6 – Analizzare la comunicazione

Rispondere alle seguenti domande:

1. Qual è il metodo HTTP utilizzato?
2. Qual è il percorso richiesto?
3. Quale codice di stato viene restituito?
4. Qual è il Content-Type?
5. Quali dati vengono trasmessi?
6. Quali controlli vengono eseguiti dal server?
7. Quali rischi potrebbero derivare dall'assenza di validazione?

---

## 14. Esercitazioni autonome

### Esercitazione 1 – Progettazione di un'API

Progettare un'API REST per la gestione degli utenti di un sistema aziendale.

Definire gli endpoint necessari per:

- Elencare gli utenti.
- Visualizzare un utente.
- Creare un utente.
- Modificare un utente.
- Eliminare un utente.

Per ogni endpoint indicare:

- Metodo HTTP.
- URI.
- Parametri.
- Eventuale body JSON.
- Codici di stato previsti.

### Esercitazione 2 – Interpretazione JSON

Analizzare il seguente JSON:

```json
{
    "id": 10,
    "username": "mrossi",
    "email": "mario@example.com",
    "ruolo": "operatore",
    "attivo": true,
    "ultimo_accesso": null,
    "permessi": [
        "lettura",
        "modifica"
    ]
}
```

Rispondere:

1. Quanti campi contiene l'oggetto?
2. Quali campi contengono stringhe?
3. Quale campo contiene un booleano?
4. Quale campo contiene un array?
5. Quale campo contiene il valore null?
6. Come si accede al campo `username` in Python?
7. Come si accede al primo elemento di `permessi`?

### Esercitazione 3 – Autenticazione e autorizzazione

Progettare un sistema di gestione utenti con tre ruoli:

- Amministratore.
- Operatore.
- Utente.

Definire una matrice dei permessi per le seguenti operazioni:

- Visualizzare i dati.
- Modificare i dati.
- Creare utenti.
- Eliminare utenti.
- Gestire i ruoli.

Spiegare la differenza tra autenticazione e autorizzazione.

### Esercitazione 4 – Validazione degli input

Realizzare un endpoint che riceva i dati di un utente.

I campi richiesti sono:

- Username: da 4 a 20 caratteri.
- Email: formato valido.
- Età: da 18 a 100.
- Ruolo: uno tra `admin`, `operatore`, `utente`.

Utilizzare Pydantic per definire il modello di validazione.

Verificare il comportamento con:

- Dati corretti.
- Username troppo corto.
- Email non valida.
- Età negativa.
- Ruolo non previsto.
- Campi mancanti.

### Esercitazione 5 – Analisi di sicurezza

Considerare un'API che espone il seguente endpoint:

```text
GET /api/utenti/{id}
```

Il sistema permette a ogni utente autenticato di visualizzare il proprio profilo.

Analizzare il rischio che un utente modifichi l'identificativo nell'URL.

Definire una soluzione che impedisca l'accesso ai dati di altri utenti.

### Esercitazione 6 – Architettura applicativa

Progettare un'applicazione client-server per la gestione delle segnalazioni di sicurezza informatica.

L'applicazione deve permettere di:

- Registrare una segnalazione.
- Consultare le segnalazioni.
- Assegnare una segnalazione a un analista.
- Aggiornare lo stato.
- Consultare lo storico.

Individuare:

1. Componenti client.
2. Server applicativo.
3. Database.
4. API.
5. Formato dei dati.
6. Meccanismi di autenticazione.
7. Ruoli e autorizzazioni.
8. Misure di sicurezza.

Produrre uno schema dell'architettura.

---

## 15. Domande di autovalutazione

1. Che cosa si intende per architettura client-server?
2. Qual è la differenza tra client e server?
3. Come funziona il modello richiesta/risposta?
4. Che cosa rappresenta il protocollo HTTP?
5. Quali informazioni contiene una richiesta HTTP?
6. Qual è la funzione degli header?
7. Qual è la differenza tra GET e POST?
8. Che cosa significa che un metodo HTTP è idempotente?
9. Qual è la differenza tra codice HTTP 401 e 403?
10. Che cosa rappresenta il livello Application Layer?
11. Quali sono i vantaggi dell'architettura a tre livelli?
12. Che cos'è un'API?
13. Che cosa si intende per endpoint?
14. Quali caratteristiche definiscono un'API REST?
15. Che cos'è JSON?
16. Qual è la differenza tra JSON e un dizionario Python?
17. Qual è la differenza tra autenticazione e autorizzazione?
18. Che cos'è un token?
19. Che cosa rappresenta un JWT?
20. Qual è la funzione del protocollo TLS?
21. Qual è la differenza tra HTTP e HTTPS?
22. Perché la validazione lato client non è sufficiente?
23. Che cosa si intende per SQL Injection?
24. Che cos'è il Broken Access Control?
25. Perché un'API deve essere protetta anche quando viene utilizzata soltanto da un'applicazione aziendale?

---

## 16. Riepilogo

| Argomento | Concetto fondamentale |
| --- | --- |
| Client | Richiede servizi e risorse |
| Server | Elabora richieste e fornisce servizi |
| HTTP | Protocollo applicativo Web |
| Request | Richiesta inviata dal client |
| Response | Risposta restituita dal server |
| GET | Recupera una risorsa |
| POST | Invia dati o crea una risorsa |
| PUT | Sostituisce una risorsa |
| PATCH | Modifica parzialmente una risorsa |
| DELETE | Elimina una risorsa |
| Status Code | Comunica l'esito della richiesta |
| Three-Tier | Separazione tra presentazione, applicazione e dati |
| API | Interfaccia per comunicare tra applicazioni |
| REST | Stile architetturale per servizi distribuiti |
| JSON | Formato testuale per dati strutturati |
| Autenticazione | Verifica dell'identità |
| Autorizzazione | Verifica dei permessi |
| JWT | Formato per rappresentare token |
| TLS | Protezione crittografica delle comunicazioni |
| Validazione | Verifica dei dati ricevuti |

### Concetti da ricordare

- Il client richiede un servizio, il server lo fornisce.
- HTTP è il protocollo alla base della comunicazione Web.
- I metodi HTTP descrivono le operazioni richieste.
- I codici di stato comunicano l'esito delle richieste.
- Le architetture a livelli separano le responsabilità.
- Le API consentono la comunicazione tra applicazioni differenti.
- JSON è uno dei principali formati utilizzati nelle API.
- Autenticazione e autorizzazione sono controlli distinti.
- TLS protegge la comunicazione tra client e server.
- La validazione deve essere eseguita lato server.
- La sicurezza deve essere considerata in ogni livello dell'architettura.

---

## 17. Collegamenti ai moduli successivi

**Modulo 02 – Logica e algoritmi**

- Elaborazione delle richieste.
- Controllo dei dati.
- Logica decisionale.
- Algoritmi di validazione.

**Modulo 03 – Python**

- Funzioni e moduli.
- Gestione delle stringhe.
- Strutture dati.
- Serializzazione JSON.
- Gestione delle eccezioni.

**Modulo 04 – Bash scripting**

- Utilizzo di curl.
- Richieste HTTP.
- Automazione di controlli.
- Interazione con servizi remoti.

**Modulo 05 – Database e SQL**

- Persistenza dei dati.
- Accesso al database.
- Query parametrizzate.
- Gestione delle transazioni.

**Modulo 06 – Backend e API**

- FastAPI.
- HTTP e REST.
- Pydantic.
- Autenticazione.
- SQLAlchemy.
- Progettazione di API sicure.

**Modulo 07 – Cybersecurity**

- Sicurezza delle API.
- Broken Access Control.
- SQL Injection.
- Validazione degli input.
- TLS.
- Gestione sicura delle credenziali.
- OWASP API Security Top 10.

### Risorse e documentazione

- MDN – HTTP Overview: <https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview>
- MDN – HTTP Methods: <https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods>
- MDN – HTTP Status Codes: <https://developer.mozilla.org/en-US/docs/Web/HTTP/Status>
- IETF – RFC 9110, HTTP Semantics: <https://www.rfc-editor.org/rfc/rfc9110>
- IETF – RFC 9112, HTTP/1.1: <https://www.rfc-editor.org/rfc/rfc9112>
- IETF – RFC 8446, TLS 1.3: <https://www.rfc-editor.org/rfc/rfc8446>
- JSON – ECMA-404: <https://ecma-international.org/publications-and-standards/standards/ecma-404/>
- OpenAPI Specification: <https://spec.openapis.org/oas/latest.html>
- FastAPI – Documentation: <https://fastapi.tiangolo.com/>
- Pydantic – Documentation: <https://docs.pydantic.dev/>
- OWASP – API Security Top 10: <https://owasp.org/www-project-api-security/>
- OWASP – Input Validation Cheat Sheet: <https://cheatsheetseries.owasp.org/cheatsheets/Input_Validation_Cheat_Sheet.html>
- OWASP – Authentication Cheat Sheet: <https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html>
- OWASP – Authorization Cheat Sheet: <https://cheatsheetseries.owasp.org/cheatsheets/Authorization_Cheat_Sheet.html>
