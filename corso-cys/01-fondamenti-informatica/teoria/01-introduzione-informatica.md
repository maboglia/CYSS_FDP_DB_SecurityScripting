# 01 – Introduzione all'informatica

## 1. Obiettivi didattici

Al termine della lezione lo studente sarà in grado di:

- Definire il concetto di informatica.
- Distinguere tra dato e informazione.
- Descrivere il ciclo di elaborazione delle informazioni.
- Identificare i componenti fondamentali di un sistema informatico.
- Comprendere le relazioni tra hardware, software, dati e utenti.
- Riconoscere il ruolo dell'informatica nell'ambito della cybersecurity.

## 2. Che cos'è l'informatica

Il termine **informatica** deriva dalla combinazione delle parole informazione e automatica.

L'informatica è la disciplina che studia i metodi e gli strumenti per rappresentare, elaborare, memorizzare e trasmettere informazioni attraverso sistemi automatici.

Un sistema informatico utilizza componenti hardware e software per eseguire operazioni sui dati, trasformandoli in informazioni utili.

### 2.1 Le principali attività dell'informatica

Le attività fondamentali sono:

| Attività | Descrizione | Esempio |
| --- | --- | --- |
| Acquisizione | Raccolta dei dati | Inserimento di username e password |
| Elaborazione | Trasformazione dei dati | Verifica delle credenziali |
| Memorizzazione | Conservazione dei dati | Salvataggio in un database |
| Comunicazione | Trasmissione delle informazioni | Invio di una risposta a un client |

Queste attività sono presenti nella maggior parte delle applicazioni informatiche.

### 2.2 Esempio applicativo

Consideriamo un sistema di autenticazione utilizzato per accedere a un'applicazione aziendale.

1. L'utente inserisce username e password.
2. Il sistema acquisisce le credenziali.
3. Il software verifica le informazioni ricevute.
4. Il sistema registra l'esito dell'autenticazione.
5. L'applicazione comunica se l'accesso è consentito oppure negato.

Questo semplice processo coinvolge tutte le principali attività dell'informatica.

## 3. Dato e informazione

Nel linguaggio informatico i termini dato e informazione sono strettamente collegati, ma non hanno lo stesso significato.

### 3.1 Che cos'è un dato

Un **dato** è una rappresentazione elementare di un fatto, di un evento o di una caratteristica.

Un dato, considerato isolatamente, potrebbe non avere un significato completo.

Esempi:

- `192.168.1.10`
- `42`
- `2026-11-18`
- `ACCESS_DENIED`
- `admin`

Questi valori rappresentano dati, ma per interpretarli correttamente è necessario conoscere il contesto.

### 3.2 Che cos'è un'informazione

Un'**informazione** è il risultato dell'interpretazione e dell'elaborazione di uno o più dati all'interno di un determinato contesto.

Esempio:

| Dato | Interpretazione |
| --- | --- |
| 192.168.1.10 | Indirizzo IP di un dispositivo |
| 42 | Numero di tentativi di accesso falliti |
| ACCESS_DENIED | Autenticazione non riuscita |
| 2026-11-18 | Data di registrazione dell'evento |

Un insieme di dati organizzati e interpretati può produrre informazioni utili per prendere decisioni.

### 3.3 Esempio: analisi degli accessi

Supponiamo di avere i seguenti eventi registrati da un sistema:

| Ora | Utente | Evento |
| --- | --- | --- |
| 09:00 | mario | LOGIN_OK |
| 09:05 | admin | LOGIN_FAIL |
| 09:06 | admin | LOGIN_FAIL |
| 09:07 | admin | LOGIN_FAIL |
| 09:15 | lucia | LOGIN_OK |

I singoli eventi costituiscono dati.

Analizzando i dati possiamo ricavare informazioni:

- Sono stati registrati 5 tentativi di accesso.
- 3 tentativi sono falliti.
- L'account admin presenta tre tentativi falliti consecutivi.
- È opportuno approfondire il comportamento osservato.

**Collegamento con la cybersecurity:** l'analisi dei dati è fondamentale per individuare comportamenti anomali, tentativi di accesso non autorizzati e possibili incidenti di sicurezza.

## 4. Il ciclo di elaborazione delle informazioni

Un sistema informatico può essere descritto attraverso un modello semplificato composto da quattro fasi:

1. Input (acquisizione).
2. Processing (elaborazione).
3. Storage (memorizzazione).
4. Output (produzione e comunicazione dei risultati).

### 4.1 Input – Acquisizione

È la fase in cui il sistema riceve i dati.

Le informazioni possono essere acquisite attraverso:

- Tastiera.
- Mouse.
- Sensori.
- File.
- Database.
- Reti informatiche.
- API.

Esempio: un utente inserisce le proprie credenziali in una pagina di login.

### 4.2 Processing – Elaborazione

È la fase in cui il sistema esegue operazioni sui dati ricevuti.

L'elaborazione può comprendere:

- Calcoli matematici.
- Confronti.
- Verifiche.
- Ordinamenti.
- Filtraggio.
- Applicazione di regole.
- Esecuzione di algoritmi.

Esempio: il sistema confronta le credenziali ricevute con le informazioni di autenticazione memorizzate.

### 4.3 Storage – Memorizzazione

È la fase in cui i dati vengono conservati per essere utilizzati successivamente.

Le informazioni possono essere memorizzate in:

- RAM.
- Hard disk.
- SSD.
- Database.
- File.
- Sistemi cloud.

La memoria RAM è volatile, mentre SSD e HDD consentono la conservazione persistente dei dati.

### 4.4 Output – Produzione dei risultati

È la fase in cui il sistema restituisce il risultato dell'elaborazione.

L'output può essere:

- Un messaggio visualizzato sullo schermo.
- Un documento.
- Un report.
- Una risposta API.
- Un file.
- Un comando impartito a un dispositivo.

Esempio: il sistema comunica all'utente che l'autenticazione è riuscita oppure fallita.

### 4.5 Schema del ciclo di elaborazione

```text
          INPUT
     Acquisizione dati
             |
             v
        PROCESSING
       Elaborazione
             |
             v
         STORAGE
      Memorizzazione
             |
             v
          OUTPUT
     Risultato prodotto
```

Il ciclo può essere ripetuto continuamente e le diverse fasi possono interagire tra loro.

## 5. I componenti di un sistema informatico

Un sistema informatico non è costituito soltanto dal computer.

È il risultato della collaborazione tra diverse componenti.

### 5.1 Hardware

L'hardware comprende tutte le componenti fisiche di un sistema informatico.

Esempi:

- CPU.
- RAM.
- SSD e HDD.
- Scheda madre.
- Scheda di rete.
- Monitor.
- Tastiera.
- Mouse.

L'hardware fornisce le risorse necessarie per eseguire programmi e memorizzare dati.

### 5.2 Software

Il software comprende i programmi e le istruzioni che permettono all'hardware di svolgere determinate attività.

Possiamo distinguere:

**Software di sistema**

- Sistemi operativi.
- Driver.
- Utility.
- Servizi di sistema.

**Software applicativo**

- Browser.
- Gestionali.
- Editor di testo.
- Applicazioni aziendali.
- Sistemi di monitoraggio.

**Software di sviluppo**

- Editor e IDE.
- Compilatori.
- Interpreti.
- Debugger.
- Framework.

### 5.3 Dati

I dati rappresentano gli elementi elaborati dal sistema informatico.

Possono essere:

- Numerici.
- Testuali.
- Immagini.
- Audio.
- Video.
- Informazioni strutturate in database.
- Log di sistema e applicazioni.

I dati rappresentano una risorsa fondamentale e devono essere protetti da accessi e modifiche non autorizzati.

### 5.4 Utenti

Gli utenti sono le persone o i sistemi che interagiscono con l'infrastruttura informatica.

Possiamo distinguere:

- Utenti finali.
- Amministratori di sistema.
- Sviluppatori.
- Database administrator.
- Analisti di sicurezza.
- Applicazioni automatiche.

Ogni utente dovrebbe disporre esclusivamente delle autorizzazioni necessarie per svolgere le proprie attività.

### 5.5 Procedure

Le procedure definiscono le modalità con cui vengono utilizzati e amministrati i sistemi informatici.

Esempi:

- Procedure di backup.
- Gestione delle password.
- Aggiornamento dei sistemi.
- Gestione degli account.
- Risposta agli incidenti.
- Controllo degli accessi.

Le procedure permettono di standardizzare le attività e ridurre gli errori operativi.

### 5.6 Rappresentazione complessiva

```text
          SISTEMA INFORMATICO
                   |
     +-------------+-------------+
     |             |             |
  HARDWARE      SOFTWARE        DATI
     |             |             |
     +-------------+-------------+
                   |
          UTENTI E PROCEDURE
                   |
                   v
       ELABORAZIONE INFORMAZIONI
```

## 6. Informatica e cybersecurity

La cybersecurity si occupa della protezione dei sistemi informatici, delle reti, delle applicazioni e delle informazioni.

Per comprendere la sicurezza è necessario conoscere prima il funzionamento dei sistemi che devono essere protetti.

Ogni componente di un sistema informatico può rappresentare un potenziale punto di rischio.

### 6.1 Esempi di rischi

| Componente | Possibile rischio | Misura di protezione |
| --- | --- | --- |
| Hardware | Furto o danneggiamento | Sicurezza fisica |
| Software | Vulnerabilità applicative | Aggiornamenti e sviluppo sicuro |
| Dati | Accesso non autorizzato | Cifratura e controllo accessi |
| Utenti | Furto delle credenziali | MFA e formazione |
| Rete | Intercettazione delle comunicazioni | TLS e segmentazione |
| Procedure | Backup non verificati | Procedure di controllo e test |

### 6.2 La triade CIA

Tre principi fondamentali della sicurezza informatica sono:

**Confidentiality – Riservatezza**

Le informazioni devono essere accessibili esclusivamente ai soggetti autorizzati.

Esempio: un utente non deve poter consultare i dati personali di altri utenti senza autorizzazione.

**Integrity – Integrità**

Le informazioni devono mantenere la propria correttezza e non devono essere modificate senza autorizzazione.

Esempio: un log di sicurezza non deve poter essere alterato da un utente non autorizzato.

**Availability – Disponibilità**

Sistemi e informazioni devono essere accessibili quando necessario.

Esempio: un servizio aziendale deve rimanere operativo anche in presenza di guasti o incidenti, secondo i livelli di disponibilità previsti.

## 7. Caso applicativo: sistema di autenticazione

Consideriamo un'applicazione aziendale utilizzata dai dipendenti.

L'applicazione deve consentire l'accesso soltanto agli utenti autorizzati.

### Funzionamento

1. L'utente apre la pagina di login.
2. Inserisce username e password.
3. Il backend riceve i dati.
4. Il sistema verifica le credenziali.
5. L'esito viene registrato nei log.
6. Il sistema restituisce una risposta.

### Componenti coinvolti

| Componente | Funzione |
| --- | --- |
| Client | Interfaccia utilizzata dall'utente |
| Server | Gestione della richiesta |
| Software | Logica di autenticazione |
| Database | Memorizzazione delle informazioni sugli account |
| Log | Registrazione degli eventi |
| Utente | Soggetto che richiede l'accesso |

### Possibili problematiche di sicurezza

- Password deboli.
- Credenziali intercettate.
- Tentativi ripetuti di autenticazione.
- Mancanza di controllo degli accessi.
- Esposizione di informazioni sensibili nei log.
- Database non adeguatamente protetto.

Questo scenario sarà ripreso nei successivi moduli dedicati alla programmazione Python, ai database e alla cybersecurity.

## 8. Esercitazioni

### Esercizio 1 – Dato o informazione?

Classificare i seguenti elementi:

1. `192.168.1.20`
2. `35 tentativi di accesso falliti in 10 minuti`
3. `LOGIN_FAILED`
4. `L'account admin ha registrato 12 tentativi falliti`
5. `2026-11-18 09:30:00`

Per ogni elemento indicare se rappresenta un dato oppure un'informazione e motivare la risposta.

### Esercizio 2 – Il ciclo di elaborazione

Considerare un sistema che registra la temperatura di una server room.

Individuare:

- Input.
- Processing.
- Storage.
- Output.

Descrivere inoltre cosa dovrebbe accadere se la temperatura supera una soglia prestabilita.

### Esercizio 3 – Componenti del sistema informatico

Considerare un computer utilizzato da un analista SOC.

Individuare almeno:

- 3 componenti hardware;
- 3 componenti software;
- 3 tipologie di dati;
- 2 tipologie di utenti;
- 2 procedure operative.

### Esercizio 4 – Informatica e sicurezza

Per ciascuno scenario individuare il principio CIA principalmente coinvolto:

1. Un dipendente accede ai dati riservati di un altro dipendente.
2. Un aggressore modifica un file di configurazione.
3. Un attacco rende indisponibile un servizio web.
4. Un amministratore cancella deliberatamente alcuni eventi dai log.

Motivare ogni risposta.

## 9. Domande di autovalutazione

1. Che cosa si intende per informatica?
2. Qual è la differenza tra dato e informazione?
3. Quali sono le principali fasi del ciclo di elaborazione?
4. Che cosa si intende per hardware?
5. Qual è la differenza tra software di sistema e software applicativo?
6. Quali componenti costituiscono un sistema informatico?
7. Perché gli utenti e le procedure sono importanti?
8. Quali sono i tre principi della triade CIA?
9. Perché la protezione dei dati è fondamentale?
10. Quale relazione esiste tra informatica e cybersecurity?

## 10. Riepilogo della lezione

I concetti fondamentali da ricordare:

- L'informatica studia l'elaborazione automatica delle informazioni.
- Il dato rappresenta un elemento elementare, mentre l'informazione deriva dalla sua interpretazione.
- Il ciclo di elaborazione comprende acquisizione, elaborazione, memorizzazione e produzione dei risultati.
- Un sistema informatico comprende hardware, software, dati, utenti e procedure.
- La cybersecurity protegge sistemi e informazioni.
- Riservatezza, integrità e disponibilità sono i tre principi fondamentali della sicurezza informatica.

## 11. Collegamenti con i moduli successivi

| Modulo | Collegamento |
| --- | --- |
| 02 – Logica e algoritmi | Elaborazione dei dati e progettazione delle procedure |
| 03 – Python | Automazione ed elaborazione delle informazioni |
| 04 – Bash scripting | Interazione con il sistema operativo |
| 05 – Database SQL | Memorizzazione e interrogazione dei dati |
| 06 – Backend API | Comunicazione tra applicazioni e servizi |
| 07 – Cybersecurity | Protezione di sistemi, dati e comunicazioni |

---

**Fine scheda didattica – 01 Introduzione all'informatica**
