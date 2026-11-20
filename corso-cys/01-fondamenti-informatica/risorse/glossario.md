**Percorso:** `01-fondamenti-informatica/risorse/glossario.md`

Ho organizzato il glossario in ordine alfabetico, con definizioni adatte a studenti ITS EQF 5, esempi pratici e collegamenti alla cybersecurity. Ho aggiunto anche alcuni termini correlati utili per affrontare i moduli successivi.

# Glossario di informatica e cybersecurity

## 1. Introduzione

Questo documento raccoglie i principali termini tecnici utilizzati nel percorso formativo **Fondamenti di Programmazione, Basi di Dati e Scripting per la Sicurezza**.

Il glossario è organizzato in ordine alfabetico e costituisce uno strumento di consultazione durante le lezioni, le esercitazioni e i laboratori.

Le definizioni sono accompagnate, quando utile, da esempi e riferimenti alla cybersecurity.

---

## 2. Glossario

### A

**Algoritmo**

Sequenza finita e ordinata di istruzioni che permette di risolvere un problema o svolgere un'attività.

Un algoritmo riceve eventualmente dei dati in ingresso, li elabora e produce un risultato.

*Esempio:* un algoritmo che verifica se una password soddisfa determinati requisiti di complessità.

**Autenticazione**

Processo attraverso il quale un sistema verifica l'identità di un utente o di un dispositivo.

Può utilizzare:

- Qualcosa che l'utente conosce (password).
- Qualcosa che l'utente possiede (token, smartphone).
- Qualcosa che caratterizza l'utente (impronta digitale).

**Autorizzazione**

Processo che stabilisce quali operazioni un utente autenticato può eseguire su una risorsa.

*Esempio:* un utente può consultare un documento ma non modificarlo.

### B

**Backup**

Copia di sicurezza di dati, file o sistemi, utilizzata per recuperare informazioni in caso di perdita, danneggiamento o attacco informatico.

Una strategia di backup dovrebbe prevedere copie multiple, supporti differenti e verifiche periodiche del ripristino.

**Banda (Bandwidth)**

Quantità massima di dati che una connessione può trasferire nell'unità di tempo.

Viene generalmente misurata in bit al secondo (bit/s), con multipli come Mbps e Gbps.

**Bit**

Unità elementare di informazione digitale. Può assumere due valori: 0 oppure 1.

È l'unità fondamentale utilizzata per rappresentare ed elaborare informazioni nei sistemi digitali.

**Byte**

Unità di informazione composta convenzionalmente da 8 bit.

Un byte può rappresentare, ad esempio, un carattere secondo una determinata codifica.

### C

**Cache**

Memoria veloce utilizzata per conservare temporaneamente dati e istruzioni che potrebbero essere riutilizzati.

Riduce i tempi di accesso alle informazioni e migliora le prestazioni del sistema.

**Cifratura (Encryption)**

Processo che trasforma dati leggibili in una forma non comprensibile senza la chiave appropriata.

È utilizzata per proteggere la riservatezza delle informazioni.

**Client**

Programma o dispositivo che richiede servizi o risorse a un server.

*Esempio:* un browser web che richiede una pagina a un server HTTP.

**CPU (Central Processing Unit)**

Unità centrale di elaborazione di un computer.

Esegue istruzioni, effettua operazioni aritmetiche e logiche e coordina parte delle attività del sistema.

Componenti e caratteristiche principali:

- ALU (Arithmetic Logic Unit).
- Unità di controllo.
- Registri.
- Cache.
- Core e thread.

La CPU esegue le istruzioni dei programmi caricati in memoria.

**Cybersecurity**

Insieme di tecnologie, processi, procedure e comportamenti utilizzati per proteggere sistemi informatici, reti, applicazioni e dati da minacce e attacchi.

### D

**Database**

Insieme organizzato di dati, gestito attraverso un sistema che permette di memorizzare, consultare, modificare e proteggere le informazioni.

**DNS (Domain Name System)**

Sistema distribuito che associa nomi di dominio a informazioni utilizzabili dai sistemi di rete, tra cui gli indirizzi IP.

*Esempio:* permette di risolvere `example.com` nell'indirizzo IP corrispondente.

Il DNS utilizza prevalentemente UDP sulla porta 53, ma può utilizzare anche TCP e altri protocolli di trasporto.

**DoS (Denial of Service)**

Attacco informatico finalizzato a rendere indisponibile un servizio o una risorsa, ad esempio sovraccaricando un server con richieste.

Un DDoS (Distributed Denial of Service) utilizza più sistemi distribuiti per generare l'attacco.

### E

**Ethernet**

Tecnologia utilizzata per realizzare reti locali cablate (LAN).

Definisce modalità di comunicazione a livello di collegamento dati e fisico, secondo gli standard IEEE 802.3.

**Exploit**

Codice, tecnica o procedura che sfrutta una vulnerabilità di un sistema o di un'applicazione per ottenere un determinato effetto.

### F

**Firewall**

Componente hardware o software che controlla il traffico di rete in ingresso e in uscita applicando regole di sicurezza.

Può consentire o bloccare comunicazioni in base a indirizzi IP, porte, protocolli e altri criteri.

**File system**

Sistema utilizzato dal sistema operativo per organizzare, memorizzare e gestire file e directory su dispositivi di archiviazione.

Esempi: NTFS, ext4, FAT32.

### G

**Gateway**

Dispositivo o componente di rete che permette la comunicazione tra reti differenti.

Il gateway predefinito viene utilizzato da un dispositivo per inviare traffico destinato a reti non direttamente raggiungibili.

**Gigabyte (GB)**

Unità di misura della capacità di memorizzazione.

Nel Sistema Internazionale corrisponde a 1.000.000.000 byte.

Non deve essere confuso con il gibibyte (GiB), che corrisponde a 1.073.741.824 byte.

### H

**Hash**

Risultato di una funzione matematica che trasforma dati di dimensione arbitraria in una sequenza di lunghezza definita.

Le funzioni hash crittografiche, come SHA-256, sono utilizzate per verificare l'integrità dei dati.

Un hash non è una cifratura: non è progettato per essere invertito.

**HTTP (Hypertext Transfer Protocol)**

Protocollo applicativo utilizzato per trasferire risorse e informazioni sul Web.

Utilizza metodi come GET, POST, PUT, PATCH e DELETE.

**HTTPS**

Versione di HTTP protetta attraverso TLS.

Fornisce protezione della comunicazione attraverso cifratura, integrità e autenticazione del server, quando il certificato viene verificato correttamente.

### I

**Indirizzo IP**

Identificativo logico assegnato a un'interfaccia di rete per consentire la comunicazione tramite il protocollo IP.

Esistono due versioni principali:

- IPv4: indirizzi a 32 bit.
- IPv6: indirizzi a 128 bit.

*Esempio IPv4:* `192.168.1.10`.

**Integrità (Integrity)**

Proprietà della sicurezza informatica che garantisce che dati e informazioni non vengano modificati in modo non autorizzato o accidentale.

Può essere verificata attraverso hash, firme digitali e controlli di accesso.

**Interfaccia di rete**

Componente hardware o virtuale attraverso cui un dispositivo comunica con una rete.

Può essere cablata, wireless o virtuale.

### K

**Kernel**

Nucleo centrale del sistema operativo.

Gestisce risorse hardware e attività fondamentali come:

- Processi.
- Memoria.
- Dispositivi.
- File system.
- Comunicazione tra processi.
- Accesso alle risorse hardware.

Il kernel Linux è il nucleo utilizzato dalle distribuzioni Linux, tra cui Ubuntu.

### L

**LAN (Local Area Network)**

Rete locale che collega dispositivi all'interno di un'area geografica limitata, come un'abitazione, un ufficio o un laboratorio.

**Log**

Registrazione cronologica degli eventi generati da un sistema operativo, un'applicazione o un dispositivo di rete.

I log possono contenere informazioni relative ad autenticazioni, errori, accessi, modifiche e attività sospette.

In cybersecurity sono fondamentali per il monitoraggio e l'analisi degli incidenti.

### M

**Malware**

Software malevolo progettato per danneggiare sistemi, compromettere dati, sottrarre informazioni o consentire attività non autorizzate.

Principali categorie:

- Virus.
- Worm.
- Trojan.
- Ransomware.
- Spyware.
- Rootkit.
- Keylogger.

**Memoria RAM (Random Access Memory)**

Memoria principale utilizzata dal computer per conservare temporaneamente dati e istruzioni necessari ai programmi in esecuzione.

È una memoria volatile: normalmente perde il proprio contenuto quando il dispositivo viene spento.

**Modem**

Dispositivo che permette di collegare una rete o un dispositivo a una tecnologia di comunicazione fornita da un operatore.

Il termine deriva da modulatore-demodulatore.

### N

**Network (Rete)**

Insieme di dispositivi interconnessi che comunicano e condividono dati, servizi e risorse attraverso protocolli comuni.

**NAT (Network Address Translation)**

Tecnica che modifica gli indirizzi IP presenti nei pacchetti di rete durante il loro attraversamento di un dispositivo, ad esempio un router.

È comunemente utilizzata per consentire a più dispositivi di una rete privata di condividere un indirizzo IPv4 pubblico.

### O

**Open Source**

Modello di sviluppo e distribuzione del software in cui il codice sorgente è disponibile secondo i termini di una licenza che ne disciplina utilizzo, modifica e ridistribuzione.

**OS (Operating System)**

Sistema operativo: software di base che gestisce le risorse hardware e fornisce servizi ai programmi applicativi.

Esempi: Windows, Linux, macOS.

### P

**Password**

Sequenza di caratteri utilizzata come fattore di autenticazione.

Una password dovrebbe essere sufficientemente lunga, unica e non prevedibile.

Per la memorizzazione nei database è necessario utilizzare funzioni specifiche di derivazione delle chiavi, come Argon2id, bcrypt, scrypt o PBKDF2, con parametri adeguati e salt.

**Phishing**

Tecnica di ingegneria sociale attraverso cui un attaccante cerca di indurre una persona a rivelare informazioni riservate, aprire allegati malevoli o eseguire azioni non sicure.

**Protocollo**

Insieme di regole che definisce le modalità con cui dispositivi e applicazioni comunicano.

Esempi: TCP, UDP, IP, HTTP, DNS.

**Proxy**

Componente intermedio che riceve richieste da un client e le inoltra verso un altro sistema.

Può essere utilizzato per filtrare il traffico, applicare politiche di sicurezza, memorizzare contenuti o controllare gli accessi.

### R

**RAM**

Vedi Memoria RAM.

**Ransomware**

Tipologia di malware che impedisce l'accesso ai dati o ai sistemi, spesso attraverso la cifratura dei file, e richiede un pagamento per il ripristino o minaccia la divulgazione delle informazioni sottratte.

**Router**

Dispositivo di rete che inoltra pacchetti IP tra reti differenti sulla base delle informazioni contenute nella tabella di routing.

Un router domestico può integrare anche funzionalità di firewall, access point Wi-Fi, switch e NAT.

### S

**Server**

Sistema hardware o software che mette a disposizione servizi o risorse ad altri dispositivi o applicazioni, denominati client.

Esempi:

- Web server.
- Database server.
- File server.
- DNS server.
- Mail server.

Un server può essere un computer fisico, una macchina virtuale o un servizio eseguito in un container.

**Sistema operativo**

Software che gestisce le risorse del computer e consente l'esecuzione delle applicazioni.

Esempi: Windows, Ubuntu, Debian, macOS.

**SIEM (Security Information and Event Management)**

Piattaforma utilizzata per raccogliere, centralizzare, correlare e analizzare eventi e log provenienti da sistemi, applicazioni e dispositivi di rete.

Supporta il monitoraggio e l'individuazione di potenziali incidenti di sicurezza.

**Switch**

Dispositivo di rete che collega più dispositivi all'interno di una rete locale.

Uno switch Ethernet tradizionale inoltra i frame sulla base degli indirizzi MAC, utilizzando una tabella di apprendimento.

**Subnet Mask**

Parametro utilizzato nelle reti IPv4 per distinguere la parte di indirizzo relativa alla rete da quella relativa agli host.

*Esempio:* `255.255.255.0`, equivalente a una rete `/24`.

### T

**TCP (Transmission Control Protocol)**

Protocollo di trasporto orientato alla connessione.

Fornisce un flusso di dati affidabile e ordinato, utilizzando meccanismi di controllo degli errori, ritrasmissione e gestione del flusso.

È utilizzato, tra gli altri, da HTTP, HTTPS, SSH e SMTP.

**TLS (Transport Layer Security)**

Protocollo crittografico utilizzato per proteggere le comunicazioni tra applicazioni.

Fornisce cifratura, integrità e meccanismi di autenticazione.

HTTPS utilizza HTTP protetto tramite TLS.

### U

**UDP (User Datagram Protocol)**

Protocollo di trasporto senza connessione.

Non garantisce la consegna, l'ordine o la ritrasmissione dei datagrammi.

È utilizzato in diversi contesti, tra cui DNS, streaming e applicazioni in tempo reale.

**URL (Uniform Resource Locator)**

Indirizzo che identifica la posizione di una risorsa accessibile attraverso una rete.

*Esempio:* `https://www.example.com/documenti/index.html`.

### V

**Vulnerabilità**

Debolezza di un sistema, di un'applicazione, di una configurazione o di un processo che può essere sfruttata per compromettere la sicurezza.

Esempi:

- Software non aggiornato.
- Password deboli.
- Permessi eccessivamente permissivi.
- SQL Injection.
- Configurazioni errate dei servizi.

Una vulnerabilità può essere associata a un identificativo pubblico, come un CVE (Common Vulnerabilities and Exposures).

### W

**WAN (Wide Area Network)**

Rete geografica che collega dispositivi e reti locali distanti tra loro.

Internet è il più grande esempio di rete globale basata sull'interconnessione di reti.

**Wi-Fi**

Tecnologia di comunicazione wireless utilizzata per collegare dispositivi a una rete locale, secondo gli standard IEEE 802.11.

### X

**XSS (Cross-Site Scripting)**

Vulnerabilità delle applicazioni Web che consente di inserire ed eseguire contenuti script non affidabili nel contesto di una pagina visitata da altri utenti.

Può consentire furto di sessioni, manipolazione delle pagine e altre attività malevole.

### Z

**Zero-day**

Vulnerabilità per la quale non è ancora disponibile una correzione pubblica o che viene sfruttata prima che il produttore abbia potuto distribuire una soluzione.

Il termine può riferirsi anche all'attacco che sfrutta tale vulnerabilità.

---

## 3. Tabella di consultazione rapida

| Termine       | Categoria             | Concetto principale              |
| ------------- | --------------------- | -------------------------------- |
| CPU           | Hardware              | Elaborazione delle istruzioni    |
| RAM           | Hardware              | Memoria temporanea               |
| Bit           | Rappresentazione dati | Unità elementare di informazione |
| Byte          | Rappresentazione dati | Gruppo di 8 bit                  |
| DNS           | Rete                  | Risoluzione dei nomi             |
| IP            | Rete                  | Indirizzamento dei dispositivi   |
| Kernel        | Sistema operativo     | Nucleo del sistema               |
| Log           | Sicurezza             | Registrazione degli eventi       |
| Malware       | Cybersecurity         | Software malevolo                |
| Router        | Rete                  | Instradamento dei pacchetti      |
| Server        | Architettura          | Fornitore di servizi             |
| Switch        | Rete                  | Collegamento di dispositivi LAN  |
| TCP           | Rete                  | Trasporto affidabile e ordinato  |
| UDP           | Rete                  | Trasporto senza connessione      |
| Vulnerabilità | Cybersecurity         | Debolezza sfruttabile            |

---

## 4. Distinzioni importanti

Alcuni termini vengono spesso confusi. È importante distinguerli correttamente.

| Termini                         | Differenza                                                                                                            |
| ------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| Bit / Byte                      | Un bit vale 0 o 1; un byte è composto da 8 bit                                                                        |
| RAM / Disco                     | La RAM è memoria volatile; il disco conserva i dati                                                                   |
| Router / Switch                 | Il router instrada pacchetti IP tra reti; lo switch collega dispositivi in una LAN                                    |
| TCP / UDP                       | TCP offre trasporto affidabile e ordinato; UDP non garantisce consegna e ordine                                       |
| DNS / IP                        | DNS risolve nomi; IP identifica interfacce di rete                                                                    |
| Autenticazione / Autorizzazione | L'autenticazione verifica l'identità; l'autorizzazione definisce cosa è consentito                                    |
| Cifratura / Hash                | La cifratura è reversibile con la chiave appropriata; l'hash è una trasformazione non progettata per essere invertita |
| Minaccia / Vulnerabilità        | La minaccia può causare un danno; la vulnerabilità è una debolezza sfruttabile                                        |
| Evento / Incidente              | Un evento è un'attività registrata; un incidente compromette o minaccia la sicurezza                                  |
| Client / Server                 | Il client richiede servizi; il server li fornisce                                                                     |

---

## 5. Domande di autovalutazione

1. Qual è la funzione principale della CPU?
2. Perché la RAM viene definita memoria volatile?
3. Quanti bit contiene un byte?
4. Qual è il compito principale del DNS?
5. Qual è la differenza tra IPv4 e IPv6?
6. Quali attività vengono gestite dal kernel?
7. Perché i log sono importanti nell'analisi di un incidente?
8. Che cosa distingue un malware da un software legittimo?
9. Qual è la differenza tra router e switch?
10. Che cosa si intende per architettura client-server?
11. Qual è la differenza tra TCP e UDP?
12. Che cosa si intende per vulnerabilità informatica?
13. Quali sono le principali proprietà della triade CIA?
14. Perché è importante applicare il principio del minimo privilegio?
15. Qual è la funzione di un firewall?

---

## 6. Come utilizzare il glossario

Il glossario è una risorsa trasversale al percorso formativo.

Si consiglia di consultarlo:

- Durante lo studio dei fondamenti dell'informatica.
- Durante le esercitazioni sui sistemi operativi.
- Durante lo studio delle reti e dei protocolli.
- Durante lo sviluppo di applicazioni Python e API REST.
- Durante le attività di analisi dei log.
- Durante i laboratori di cybersecurity.

**Attività suggerita:** ogni studente può contribuire all'ampliamento del glossario aggiungendo nuovi termini incontrati durante le lezioni. Ogni nuova voce dovrebbe contenere una definizione, un esempio concreto e, quando pertinente, un collegamento con la sicurezza informatica.

Il glossario potrà quindi evolvere insieme al repository didattico.

Aggiungi i termini Python e database
Uniforma i termini inglesi e italiani