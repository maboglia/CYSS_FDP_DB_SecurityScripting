# Glossario – cURL e test delle API

## 1. Concetti fondamentali

| Termine | Definizione |
| --- | --- |
| **cURL** | Strumento da riga di comando utilizzato per trasferire dati attraverso diversi protocolli di rete, tra cui HTTP e HTTPS. |
| **Client HTTP** | Programma che invia richieste HTTP a un server e riceve le relative risposte. |
| **Richiesta HTTP (HTTP Request)** | Messaggio inviato da un client a un server per richiedere una risorsa o eseguire un'operazione. |
| **Risposta HTTP (HTTP Response)** | Messaggio restituito dal server in seguito a una richiesta HTTP. |
| **URL** | Uniform Resource Locator: indirizzo che identifica la posizione di una risorsa in rete. |
| **Protocollo** | Insieme di regole che definisce le modalità di comunicazione tra sistemi. |
| **HTTP** | Protocollo applicativo utilizzato per la comunicazione tra client e server Web. |
| **HTTPS** | Versione di HTTP protetta mediante TLS, che garantisce riservatezza e integrità della comunicazione. |
| **Endpoint** | Indirizzo specifico di un'API attraverso il quale è possibile accedere a una funzionalità. |

## 2. Metodi HTTP

| Metodo | Funzione |
| --- | --- |
| **GET** | Recupera informazioni da una risorsa. |
| **POST** | Invia dati al server, frequentemente per creare una nuova risorsa o avviare un'elaborazione. |
| **PUT** | Sostituisce completamente una risorsa esistente o ne crea una secondo le regole dell'API. |
| **PATCH** | Modifica parzialmente una risorsa. |
| **DELETE** | Richiede l'eliminazione di una risorsa. |
| **HEAD** | Richiede gli stessi metadati di una richiesta GET, senza il corpo della risposta. |
| **OPTIONS** | Richiede informazioni sui metodi e sulle opzioni di comunicazione supportati da una risorsa. |

## 3. Componenti di una richiesta HTTP

| Termine | Definizione |
| --- | --- |
| **Header** | Informazioni aggiuntive associate a una richiesta o risposta HTTP. |
| **Body** | Parte del messaggio HTTP che contiene i dati trasmessi. |
| **Content-Type** | Header che indica il formato dei dati contenuti nel corpo della richiesta o risposta. |
| **Accept** | Header che indica i formati di risposta accettati dal client. |
| **Authorization** | Header utilizzato per trasmettere informazioni di autenticazione. |
| **Bearer Token** | Token di accesso trasmesso normalmente attraverso l'header Authorization con lo schema Bearer. |
| **Query Parameter** | Parametro inserito nell'URL dopo il carattere `?`, utilizzato per filtrare o personalizzare una richiesta. |
| **JSON** | Formato testuale utilizzato per rappresentare e scambiare dati strutturati. |
| **Payload** | Contenuto dei dati trasmessi attraverso una richiesta o una risposta. |

## 4. Comandi e opzioni cURL

| Comando / Opzione | Funzione |
| --- | --- |
| `curl URL` | Esegue una richiesta HTTP GET verso l'URL specificato. |
| `-X GET` | Specifica il metodo HTTP GET. |
| `-X POST` | Specifica il metodo HTTP POST. |
| `-X PUT` | Specifica il metodo HTTP PUT. |
| `-X DELETE` | Specifica il metodo HTTP DELETE. |
| `-H` | Aggiunge un header HTTP alla richiesta. |
| `-d` | Invia dati nel corpo della richiesta. |
| `-i` | Mostra anche gli header della risposta HTTP. |
| `-v` | Abilita la modalità dettagliata, mostrando informazioni sulla comunicazione. |
| `-o` | Salva il contenuto della risposta in un file. |
| `-I` | Esegue una richiesta HEAD per ottenere gli header della risposta. |
| `-L` | Segue automaticamente i redirect HTTP. |
| `-u` | Specifica credenziali per l'autenticazione HTTP supportata dal server. |

## 5. Esempi pratici con FastAPI

Si ipotizza che un'applicazione FastAPI sia in esecuzione su:

`http://127.0.0.1:8000`

### Verificare il funzionamento dell'API

```bash
curl http://127.0.0.1:8000/
```

### Recuperare una risorsa

```bash
curl http://127.0.0.1:8000/utenti
```

### Inviare dati JSON con POST

```bash
curl -X POST http://127.0.0.1:8000/utenti \
  -H "Content-Type: application/json" \
  -d '{"username":"mario","email":"mario@example.com","eta":25}'
```

### Aggiornare una risorsa

```bash
curl -X PUT http://127.0.0.1:8000/utenti/1 \
  -H "Content-Type: application/json" \
  -d '{"username":"mario","email":"mario@example.com","eta":26}'
```

### Eliminare una risorsa

```bash
curl -X DELETE http://127.0.0.1:8000/utenti/1
```

### Visualizzare gli header della risposta

```bash
curl -i http://127.0.0.1:8000/utenti
```

### Visualizzare i dettagli della comunicazione

```bash
curl -v http://127.0.0.1:8000/
```

### Salvare la risposta in un file

```bash
curl -o risposta.json \
  http://127.0.0.1:8000/utenti
```

## 6. Codici di stato HTTP

| Codice | Significato |
| --- | --- |
| **200 OK** | Richiesta completata correttamente. |
| **201 Created** | Risorsa creata correttamente. |
| **204 No Content** | Richiesta completata senza contenuto nella risposta. |
| **301 Moved Permanently** | Risorsa trasferita definitivamente a un altro indirizzo. |
| **400 Bad Request** | Richiesta non valida. |
| **401 Unauthorized** | Autenticazione necessaria o non valida. |
| **403 Forbidden** | Accesso negato per mancanza di autorizzazione. |
| **404 Not Found** | Risorsa non trovata. |
| **405 Method Not Allowed** | Metodo HTTP non consentito per la risorsa. |
| **422 Unprocessable Content** | Richiesta sintatticamente valida ma con contenuti che non superano la validazione prevista. |
| **429 Too Many Requests** | Troppe richieste effettuate in un determinato intervallo. |
| **500 Internal Server Error** | Errore interno del server. |
| **503 Service Unavailable** | Servizio temporaneamente non disponibile. |

## 7. cURL e cybersecurity

| Termine | Definizione |
| --- | --- |
| **API Testing** | Attività di verifica del corretto funzionamento delle API attraverso richieste e risposte. |
| **Authentication Testing** | Verifica dei meccanismi di autenticazione di un servizio. |
| **Authorization Testing** | Verifica che gli utenti possano accedere esclusivamente alle risorse autorizzate. |
| **TLS Verification** | Controllo dell'autenticità del certificato e della validità della connessione TLS. |
| **HTTP Header Inspection** | Analisi degli header HTTP per individuare informazioni utili sulla configurazione e sulla sicurezza del server. |
| **Rate Limiting** | Tecnica che limita il numero di richieste effettuabili in un determinato intervallo temporale. |
| **API Security** | Insieme di tecniche e controlli utilizzati per proteggere le interfacce di programmazione. |
| **Token** | Stringa utilizzata per rappresentare un'autorizzazione o un'identità durante l'accesso a un servizio. |

**Attenzione alla sicurezza:**

- Non inserire password o token reali nei comandi condivisi o nei repository.
- Non utilizzare `-k` o `--insecure` per disabilitare la verifica dei certificati TLS nelle normali attività operative.
- Eseguire test esclusivamente su API proprie o per le quali si dispone di autorizzazione.
- Evitare di condividere output contenenti credenziali o informazioni riservate.

## 8. Domande di autovalutazione

1. Che cos'è cURL e a cosa serve?
2. Qual è la differenza tra GET e POST?
3. A cosa serve l'opzione `-H`?
4. Quale funzione svolge l'opzione `-d`?
5. Come si invia un documento JSON a un'API?
6. Qual è la differenza tra HTTP e HTTPS?
7. Che cosa rappresenta il codice HTTP 404?
8. Qual è la differenza tra autenticazione e autorizzazione?
9. Perché l'opzione `-v` è utile durante il debug?
10. Perché è importante verificare i certificati TLS durante i test?

---

**Obiettivo formativo:** conoscere cURL come strumento per inviare richieste HTTP, testare API REST, analizzare le risposte dei server e svolgere verifiche introduttive sul comportamento e sulla sicurezza dei servizi backend.
