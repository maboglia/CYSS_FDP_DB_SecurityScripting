# Glossario – Pydantic e validazione dei dati

## 1. Concetti fondamentali

| Termine | Definizione |
| --- | --- |
| **Pydantic** | Libreria Python che consente di definire modelli di dati, verificare i valori ricevuti e gestire la validazione attraverso le annotazioni di tipo. |
| **Validazione dei dati** | Processo di controllo che verifica se i dati ricevuti rispettano determinati requisiti e vincoli. |
| **Modello (Model)** | Struttura che descrive i dati attesi, specificando campi, tipi e possibili vincoli. |
| **Schema** | Descrizione formale della struttura e delle caratteristiche dei dati accettati da un'applicazione. |
| **Campo (Field)** | Singolo elemento di un modello, caratterizzato da un nome, un tipo e possibili regole di validazione. |
| **Tipo di dato (Data Type)** | Categoria che identifica la natura di un valore, ad esempio intero, stringa o valore booleano. |
| **Type Hint** | Annotazione Python utilizzata per dichiarare il tipo atteso di una variabile, di un parametro o di un attributo. |
| **Type Checking** | Controllo della compatibilità dei valori con i tipi dichiarati. |
| **Vincolo (Constraint)** | Regola aggiuntiva che stabilisce le condizioni che un dato deve rispettare, ad esempio una lunghezza minima o un valore massimo. |
| **Serializzazione** | Conversione di un oggetto o di una struttura dati in un formato trasferibile o memorizzabile, come JSON. |
| **Deserializzazione** | Operazione inversa: conversione di dati provenienti da un formato esterno in strutture utilizzabili dal programma. |

## 2. Modelli Pydantic

| Termine | Definizione |
| --- | --- |
| **BaseModel** | Classe fondamentale di Pydantic dalla quale si ereditano i modelli utilizzati per definire e validare i dati. |
| **Attributo** | Elemento di un modello che rappresenta un dato, come `username`, `email` o `age`. |
| **Campo obbligatorio** | Campo che deve essere presente nei dati ricevuti. |
| **Campo opzionale** | Campo che può assumere anche il valore `None`, se previsto dal tipo dichiarato. |
| **Valore predefinito (Default Value)** | Valore assegnato automaticamente a un campo quando non viene fornito un valore esplicito e il modello lo consente. |
| **Field** | Funzione di Pydantic utilizzata per specificare metadati e vincoli aggiuntivi relativi a un campo. |
| **Alias** | Nome alternativo utilizzabile per identificare un campo durante la validazione o la serializzazione. |
| **Custom Validator** | Funzione personalizzata che permette di applicare controlli specifici ai dati. |

## 3. Validazione e gestione degli errori

| Termine | Definizione |
| --- | --- |
| **Validation Error** | Errore generato quando i dati non rispettano le regole definite nel modello. |
| **Coercizione** | Conversione automatica di un valore in un tipo compatibile, quando consentita dalla configurazione della validazione. |
| **Strict Mode** | Modalità di validazione più rigorosa che limita le conversioni automatiche dei tipi. |
| **Validazione personalizzata** | Controllo aggiuntivo definito dal programmatore per verificare condizioni specifiche. |
| **Input Validation** | Verifica dei dati in ingresso prima che vengano utilizzati dall'applicazione. |
| **Data Integrity** | Proprietà che garantisce accuratezza, coerenza e affidabilità dei dati. |

## 4. Integrazione con FastAPI

| Termine | Definizione |
| --- | --- |
| **FastAPI** | Framework Python per sviluppare API che utilizza Pydantic per la validazione e la gestione dei dati. |
| **Request Body** | Parte della richiesta HTTP che contiene i dati inviati dal client al server. |
| **Response Model** | Modello che definisce la struttura dei dati restituiti da un endpoint. |
| **JSON** | Formato testuale leggero utilizzato per rappresentare e scambiare dati strutturati. |
| **OpenAPI** | Specifica standard per descrivere le API HTTP, i relativi endpoint, parametri e modelli. |
| **Swagger UI** | Interfaccia grafica interattiva che permette di consultare e provare le API descritte tramite OpenAPI. |
| **Endpoint** | Punto di accesso a una funzionalità esposta da un'API. |

## 5. Esempio pratico

Definizione di un modello Pydantic per rappresentare un utente:

```python
from pydantic import BaseModel, Field

class Utente(BaseModel):
    username: str
    email: str
    eta: int = Field(ge=18, le=100)

# Creazione di un oggetto valido
utente = Utente(
    username="mario",
    email="mario@example.com",
    eta=25
)

print(utente.username)
print(utente.eta)

# La validazione fallisce se eta è inferiore a 18
```

In questo esempio:

- `BaseModel` definisce la struttura del modello.
- `username` ed `email` sono campi di tipo stringa.
- `eta` è un campo intero.
- `Field(ge=18, le=100)` impone un valore compreso tra 18 e 100.
- Pydantic verifica i dati durante la creazione dell'oggetto.

## 6. Concetti di sicurezza

| Termine | Definizione |
| --- | --- |
| **Input Sanitization** | Trattamento dei dati in ingresso per ridurre il rischio che contenuti non sicuri vengano interpretati in modo improprio. |
| **Mass Assignment** | Vulnerabilità che può verificarsi quando un'applicazione assegna automaticamente ai propri oggetti campi non autorizzati forniti dall'utente. |
| **Data Exposure** | Esposizione involontaria di informazioni riservate attraverso risposte, log o interfacce applicative. |
| **Allowlist** | Elenco esplicito dei valori o dei campi consentiti. |
| **Principio del minimo privilegio** | Regola secondo cui ogni componente deve poter accedere esclusivamente alle informazioni e alle funzionalità necessarie. |

**Nota di sicurezza:** Pydantic valida la struttura e i vincoli dei dati, ma non sostituisce l'autenticazione, l'autorizzazione, la sanitizzazione specifica per il contesto o i controlli di sicurezza del database.

## 7. Domande di autovalutazione

1. Che cos'è Pydantic e quale problema risolve?
2. Qual è la funzione della classe `BaseModel`?
3. Che cosa sono i Type Hint?
4. Qual è la differenza tra un campo obbligatorio e uno opzionale?
5. A cosa serve la funzione `Field()`?
6. Che cosa si intende per validazione dei dati?
7. Che cosa succede quando un dato non rispetta i vincoli definiti?
8. Qual è il rapporto tra Pydantic e FastAPI?
9. Qual è la differenza tra Request Body e Response Model?
10. Perché la validazione degli input contribuisce alla sicurezza di un'applicazione backend?

---

**Obiettivo formativo:** acquisire le competenze terminologiche e operative necessarie per definire modelli di dati Python, applicare vincoli di validazione e utilizzare Pydantic nella realizzazione di API REST con FastAPI.
