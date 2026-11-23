# Glossario – Server ASGI

## 1. Concetti fondamentali

| Termine | Definizione |
| --- | --- |
| **Server** | Sistema hardware o software che mette a disposizione servizi e risorse ad altri dispositivi o programmi. |
| **Server web** | Software che riceve richieste HTTP e restituisce risposte ai client, come i browser o le applicazioni. |
| **Backend** | Parte di un'applicazione che gestisce la logica, i dati, le elaborazioni e le comunicazioni con altri servizi. |
| **API** | Application Programming Interface: insieme di regole e funzionalità che permette a programmi diversi di comunicare. |
| **HTTP** | Protocollo applicativo utilizzato per la comunicazione tra client e server sul Web. |
| **Richiesta (Request)** | Messaggio inviato da un client a un server per richiedere una risorsa o eseguire un'operazione. |
| **Risposta (Response)** | Messaggio restituito dal server al client in seguito a una richiesta. |
| **Client** | Programma o dispositivo che richiede servizi o risorse a un server. |
| **Endpoint** | Indirizzo specifico di un'API attraverso il quale è possibile accedere a una determinata funzionalità. |

## 2. ASGI – Asynchronous Server Gateway Interface

| Termine | Definizione |
| --- | --- |
| **ASGI** | Asynchronous Server Gateway Interface: specifica che definisce un'interfaccia standard tra server web e applicazioni Python asincrone. |
| **WSGI** | Web Server Gateway Interface: precedente specifica per collegare server web e applicazioni Python, principalmente basata su un modello sincrono. |
| **Server ASGI** | Server che implementa il protocollo ASGI e permette di eseguire applicazioni Python compatibili. |
| **Applicazione ASGI** | Applicazione Python che rispetta l'interfaccia ASGI e può essere eseguita da un server compatibile. |
| **Scope** | Informazioni relative alla connessione o alla richiesta corrente, passate dal server all'applicazione ASGI. |
| **Receive** | Funzione asincrona attraverso cui l'applicazione riceve eventi dal server. |
| **Send** | Funzione asincrona attraverso cui l'applicazione invia eventi e risposte al server. |
| **Event Loop** | Meccanismo che coordina l'esecuzione delle operazioni asincrone, gestendo più attività concorrenti. |
| **Concorrenza** | Capacità di gestire più attività in modo sovrapposto, alternandone l'esecuzione quando necessario. |

## 3. Programmazione asincrona Python

| Termine | Definizione |
| --- | --- |
| **Programmazione asincrona** | Modello di programmazione che consente di avviare operazioni senza bloccare l'esecuzione durante l'attesa del loro completamento. |
| **async** | Parola chiave Python utilizzata per dichiarare una funzione asincrona. |
| **await** | Parola chiave che sospende temporaneamente una funzione asincrona in attesa del risultato di un'operazione. |
| **Coroutine** | Oggetto che rappresenta un'operazione asincrona e la cui esecuzione può essere sospesa e ripresa. |
| **I/O (Input/Output)** | Operazioni di ingresso e uscita dei dati, come lettura di file, accesso a database e comunicazioni di rete. |
| **Non-blocking I/O** | Modalità di gestione delle operazioni di input/output che evita di bloccare il flusso di esecuzione durante le attese. |
| **Task** | Unità di lavoro asincrona programmata per essere eseguita dall'event loop. |

## 4. Strumenti e framework Python

| Termine | Definizione |
| --- | --- |
| **Uvicorn** | Server ASGI leggero e ad alte prestazioni utilizzato per eseguire applicazioni Python asincrone. |
| **FastAPI** | Framework Python per la realizzazione di API, basato su standard moderni e compatibile con ASGI. |
| **Starlette** | Framework ASGI leggero utilizzato anche come componente fondamentale di FastAPI. |
| **Hypercorn** | Server ASGI e WSGI utilizzabile per eseguire applicazioni Python web. |
| **Pip** | Gestore dei pacchetti Python utilizzato per installare librerie e strumenti. |
| **Middleware** | Componente software che intercetta e tratta richieste e risposte durante il loro passaggio nell'applicazione. |

## 5. Comandi di riferimento

| Comando | Funzione |
| --- | --- |
| `pip install fastapi` | Installa il framework FastAPI. |
| `pip install "uvicorn[standard]"` | Installa Uvicorn con le dipendenze standard aggiuntive. |
| `uvicorn main:app --reload` | Avvia l'applicazione FastAPI definita nell'oggetto `app` del file `main.py`, abilitando il riavvio automatico durante lo sviluppo. |
| `uvicorn main:app --host 0.0.0.0 --port 8000` | Avvia il server sulla porta 8000, rendendolo raggiungibile attraverso le interfacce di rete disponibili, compatibilmente con firewall e configurazione di rete. |

## 6. Concetti di sicurezza

| Termine | Definizione |
| --- | --- |
| **Autenticazione** | Processo di verifica dell'identità di un utente o di un sistema. |
| **Autorizzazione** | Processo che stabilisce quali operazioni un soggetto autenticato può eseguire. |
| **TLS** | Protocollo crittografico utilizzato per proteggere le comunicazioni tra client e server. |
| **Rate Limiting** | Tecnica che limita il numero di richieste consentite in un determinato intervallo temporale. |
| **DoS (Denial of Service)** | Attacco che mira a rendere un servizio indisponibile attraverso l'esaurimento delle sue risorse. |
| **Logging** | Registrazione delle richieste, delle risposte e degli eventi utili al monitoraggio e all'analisi di sicurezza. |
| **Validazione degli input** | Controllo dei dati ricevuti per verificare che rispettino il formato e i vincoli previsti. |

## 7. Domande di autovalutazione

1. Che cosa significa ASGI?
2. Qual è la differenza principale tra WSGI e ASGI?
3. Quale funzione svolge un server ASGI?
4. Che cos'è Uvicorn?
5. Quale relazione esiste tra FastAPI e ASGI?
6. Qual è la differenza tra programmazione sincrona e asincrona?
7. A cosa servono le parole chiave `async` e `await`?
8. Che cosa si intende per Event Loop?
9. Perché un server asincrono può essere utile nella gestione di numerose richieste?
10. Quali misure di sicurezza è opportuno adottare quando si espone un'API su una rete?

---

**Obiettivo formativo:** comprendere il ruolo dei server ASGI nell'ecosistema Python, conoscere Uvicorn e FastAPI e acquisire il lessico necessario per comprendere l'esecuzione di applicazioni backend asincrone.
