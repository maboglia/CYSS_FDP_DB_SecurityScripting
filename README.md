# Fondamenti di Programmazione, Basi di Dati e Scripting per la Sicurezza

**Percorso:** Tecnico Superiore System Cybersecurity  
**Unità Formativa:** Fondamenti di Programmazione, Basi di Dati e Scripting per la Sicurezza  
**Livello:** EQF 5  
**Linguaggi principali:** Python, Bash, SQL  
**Tecnologie:** PostgreSQL, database NoSQL, FastAPI, Git  
**Ambito applicativo:** Cybersecurity, automazione sistemistica, analisi dei dati e sicurezza del software.

---

## 1. Descrizione dell'Unità Formativa

Questa Unità Formativa fornisce le competenze logiche e pratiche necessarie per sviluppare script di automazione, interrogare database e comprendere il codice software.

Il percorso parte dalle basi della logica di programmazione, utilizzando principalmente Python e Bash, e dalla gestione dei dati attraverso database relazionali e NoSQL, applicando le conoscenze acquisite a scenari concreti di cybersecurity.

L'obiettivo è consentire allo studente di automatizzare attività ripetitive di gestione sistemistica, estrarre e correlare log da database, comprendere il funzionamento del software e riconoscere vulnerabilità elementari a livello di codice, come la SQL Injection.

---

## 2. Obiettivi formativi

Al termine dell'Unità Formativa lo studente sarà in grado di:

- Comprendere i fondamenti della logica di programmazione e degli algoritmi.
- Scrivere programmi e script utilizzando Python.
- Utilizzare Bash per automatizzare operazioni di sistema.
- Comprendere e utilizzare strutture dati e funzioni.
- Interagire con database relazionali attraverso SQL.
- Comprendere i principi dei database NoSQL.
- Estrarre, filtrare e correlare informazioni contenute nei log.
- Comprendere i principi di funzionamento delle API REST.
- Riconoscere vulnerabilità elementari nel codice software.
- Applicare principi di sicurezza nella gestione dei dati e nello sviluppo del codice.

---

## 3. Struttura del percorso formativo

### Area 1 – Informatica e fondamenti tecnologici

- Fondamenti della tecnologia dell'informazione.
- Funzioni di base del sistema operativo.
- Principali strumenti e tecniche di osservazione.
- Principi di elaborazione testi.
- Elementi di foglio elettronico.
- Elementi di presentazione multimediale.
- Concetti e termini relativi a Internet.

### Area 2 – Programmazione e scripting

- Introduzione alla programmazione.
- Logica di programmazione e algoritmi.
- Linguaggio Python: sintassi, variabili e tipi di dato.
- Strutture di controllo e collezioni.
- Funzioni e programmazione modulare.
- Programmazione orientata agli oggetti.
- Gestione delle eccezioni.
- Scripting Bash e automazione sistemistica.

### Area 3 – Database e gestione dei dati

- Fondamenti dei database relazionali.
- Modello relazionale e progettazione dei dati.
- Linguaggio SQL.
- Query, JOIN e aggregazioni.
- Database PostgreSQL.
- Introduzione ai database NoSQL.
- Interrogazione e analisi dei dati.
- Gestione e correlazione dei log.

### Area 4 – Programmazione backend e sicurezza

- Architettura client-server.
- Protocollo HTTP e API REST.
- Introduzione a FastAPI.
- Validazione e gestione dei dati.
- Accesso ai database da applicazioni Python.
- Principi di sicurezza del codice.
- Vulnerabilità OWASP.
- SQL Injection e tecniche di prevenzione.
- Hardening e sicurezza dei database.

### Area 5 – Applicazioni alla cybersecurity

- Automazione di attività di sicurezza.
- Analisi di file e log.
- Ricerca di eventi anomali.
- Filtraggio e correlazione degli eventi.
- Analisi di accessi e autenticazioni.
- Riconoscimento di comportamenti sospetti.
- Sviluppo di piccoli strumenti di supporto alle attività di sicurezza.

### Area 6 – Sviluppo sostenibile e contesto ambientale

Conoscenze essenziali relative all'obiettivo di contestualizzare i principi dello sviluppo sostenibile nelle attività economico-produttive del settore di riferimento:

- Legislazione ambientale e incentivazioni economiche di settore.
- Principali strumenti e tecniche di osservazione.
- Legame di causa/effetto delle azioni umane sull'ambiente.

---

## 4. Organizzazione del repository

Il repository è organizzato per aree tematiche e moduli didattici.

```text
fondamenti-programmazione-cybersecurity/
│
├── README.md
│
├── 00-materiali-introduttivi/
│   ├── programma.md
│   ├── obiettivi-formativi.md
│   └── strumenti-e-ambiente.md
│
├── 01-fondamenti-informatica/
│   ├── teoria/
│   ├── esercitazioni/
│   └── risorse/
│
├── 02-logica-e-algoritmi/
│   ├── teoria/
│   ├── pseudocodice/
│   ├── diagrammi-flusso/
│   ├── esempi-python/
│   └── esercitazioni/
│
├── 03-python/
│   ├── 01-sintassi-e-variabili/
│   ├── 02-operatori-e-condizioni/
│   ├── 03-cicli-e-iterazioni/
│   ├── 04-collezioni/
│   ├── 05-funzioni/
│   ├── 06-programmazione-oop/
│   ├── 07-moduli-e-librerie/
│   ├── 08-gestione-eccezioni/
│   └── esercitazioni/
│
├── 04-bash-scripting/
│   ├── comandi-base/
│   ├── variabili-e-condizioni/
│   ├── cicli-e-funzioni/
│   ├── gestione-file/
│   ├── automazione-sistemistica/
│   └── esercitazioni/
│
├── 05-database-sql/
│   ├── modello-relazionale/
│   ├── progettazione/
│   ├── sql/
│   ├── postgresql/
│   ├── query-e-join/
│   ├── database-nosql/
│   └── esercitazioni/
│
├── 06-backend-api/
│   ├── http-e-rest/
│   ├── fastapi/
│   ├── pydantic/
│   ├── sqlalchemy/
│   └── esercitazioni/
│
├── 07-cybersecurity/
│   ├── analisi-log/
│   ├── automazione-sicurezza/
│   ├── sicurezza-database/
│   ├── sql-injection/
│   ├── vulnerabilita-owasp/
│   └── esercitazioni/
│
├── 08-laboratori/
│   ├── laboratorio-01/
│   ├── laboratorio-02/
│   ├── laboratorio-03/
│   └── project-work/
│
├── 09-sviluppo-sostenibile/
│   ├── legislazione-ambientale/
│   ├── strumenti-osservazione/
│   └── impatto-ambientale/
│
├── 10-verifiche/
│   ├── test/
│   ├── prove-pratiche/
│   └── verifiche-finali/
│
└── risorse/
    ├── documentazione/
    ├── link-utili.md
    └── glossario.md
```

---

## 5. Ambiente di sviluppo

Gli strumenti principali utilizzati durante il percorso sono:

| Strumento | Utilizzo |
| --- | --- |
| Python 3.12 | Programmazione e scripting |
| Visual Studio Code | Ambiente di sviluppo |
| Bash | Automazione sistemistica |
| PostgreSQL | Database relazionale |
| SQL | Interrogazione dei dati |
| FastAPI | Sviluppo di API REST |
| SQLAlchemy | Accesso ai database tramite ORM |
| Git e GitHub | Versionamento e condivisione del codice |
| Ubuntu Linux | Ambiente operativo e laboratori |

---

## 6. Laboratori e project work

Le attività pratiche saranno orientate all'applicazione delle competenze in contesti di cybersecurity.

Esempi di attività:

- Realizzazione di script Python per l'analisi di file di log.
- Automatizzazione di controlli sul sistema operativo tramite Bash.
- Analisi di tentativi di accesso non autorizzati.
- Interrogazione di database contenenti eventi di sicurezza.
- Individuazione di anomalie attraverso query SQL.
- Realizzazione di una semplice API REST per la gestione degli eventi.
- Analisi di codice vulnerabile e correzione di SQL Injection.
- Progettazione di un piccolo sistema di monitoraggio degli eventi.

Tutti i laboratori di sicurezza saranno svolti in ambienti controllati e su sistemi predisposti a fini didattici.

---

## 7. Modalità di utilizzo del repository

Ogni modulo può contenere:

- **Teoria:** dispense e spiegazioni degli argomenti.
- **Esempi:** codice commentato e progressivo.
- **Esercitazioni:** attività guidate e autonome.
- **Laboratori:** applicazioni pratiche in ambito cybersecurity.
- **Risorse:** documentazione tecnica e approfondimenti.

Gli studenti sono invitati a utilizzare il repository come riferimento durante le lezioni e come ambiente di lavoro per lo svolgimento delle esercitazioni.

---

## 8. Documentazione e risorse

- [Documentazione ufficiale Python](https://docs.python.org/3.12/)
- [Documentazione Bash](https://www.gnu.org/software/bash/manual/)
- [Documentazione PostgreSQL](https://www.postgresql.org/docs/)
- [Documentazione FastAPI](https://fastapi.tiangolo.com/)
- [Documentazione SQLAlchemy](https://docs.sqlalchemy.org/)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Git Documentation](https://git-scm.com/doc)

---

## 9. Obiettivo finale

L'obiettivo conclusivo del percorso è fornire allo studente una base tecnica solida per comprendere, sviluppare e utilizzare strumenti software a supporto delle attività di cybersecurity.

La combinazione di programmazione Python, scripting Bash, interrogazione dei database e principi di sicurezza del codice consentirà di affrontare semplici attività di automazione, analisi e supporto operativo nei processi di difesa e monitoraggio dei sistemi informatici.

