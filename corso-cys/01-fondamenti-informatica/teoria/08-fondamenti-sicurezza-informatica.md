# 08 – Fondamenti di sicurezza informatica

## 1. Obiettivi didattici

Al termine della lezione lo studente sarà in grado di:

- Definire il concetto di cybersecurity e distinguerlo dalla sicurezza informatica intesa in senso più generale.
- Comprendere gli obiettivi fondamentali della sicurezza attraverso la triade CIA.
- Distinguere autenticazione, autorizzazione e accounting.
- Riconoscere minacce, vulnerabilità, attacchi e rischi.
- Comprendere il funzionamento generale delle principali categorie di malware.
- Identificare le caratteristiche di un tentativo di phishing.
- Comprendere il ruolo dei log nel monitoraggio e nell'analisi degli eventi di sicurezza.
- Applicare comportamenti sicuri nell'utilizzo di sistemi, applicazioni e servizi online.
- Utilizzare alcuni strumenti Linux per osservare utenti, processi, accessi e attività del sistema.

---

## 2. Introduzione alla cybersecurity

La cybersecurity, o sicurezza informatica, comprende l'insieme di principi, tecnologie, procedure e comportamenti utilizzati per proteggere sistemi informatici, reti, applicazioni e dati da accessi non autorizzati, alterazioni, interruzioni e attacchi.

La sicurezza informatica non riguarda esclusivamente gli strumenti tecnologici. Coinvolge anche:

- Le persone che utilizzano i sistemi.
- Le procedure operative.
- Le politiche di gestione degli accessi.
- La protezione dei dati.
- La configurazione e manutenzione dei dispositivi.
- Il monitoraggio delle attività.
- La gestione degli incidenti.

### 2.1 Perché la cybersecurity è importante

Le organizzazioni utilizzano sistemi informatici per gestire informazioni e servizi fondamentali:

- Dati personali di clienti e dipendenti.
- Informazioni finanziarie e contabili.
- Documenti aziendali.
- Sistemi di produzione.
- Infrastrutture di rete.
- Applicazioni e servizi online.
- Credenziali e identità digitali.

Una compromissione può provocare conseguenze differenti:

| Conseguenza | Esempio |
| --- | --- |
| Furto di informazioni | Esfiltrazione di dati personali |
| Interruzione dei servizi | Un sito web non è più raggiungibile |
| Alterazione dei dati | Modifica non autorizzata di un archivio |
| Perdita economica | Richiesta di riscatto dopo un ransomware |
| Danno reputazionale | Diffusione pubblica di informazioni riservate |
| Problemi normativi | Violazione degli obblighi di protezione dei dati |

### 2.2 Obiettivi della sicurezza informatica

Un sistema sicuro deve garantire che:

1. Le informazioni siano accessibili soltanto ai soggetti autorizzati.
2. I dati non vengano modificati in modo non autorizzato.
3. I servizi siano disponibili quando necessari.
4. Le attività siano riconducibili a soggetti o processi identificabili.
5. Gli eventi rilevanti possano essere analizzati e verificati.

Questi obiettivi costituiscono la base per comprendere i principi successivi.

---

## 3. La triade CIA: Confidentiality, Integrity, Availability

Uno dei modelli fondamentali della sicurezza informatica è la triade CIA, composta da:

- **Confidentiality – Riservatezza**
- **Integrity – Integrità**
- **Availability – Disponibilità**

La triade rappresenta tre proprietà essenziali che devono essere protette durante la gestione delle informazioni.

### 3.1 Riservatezza (Confidentiality)

La riservatezza garantisce che le informazioni siano accessibili esclusivamente ai soggetti autorizzati.

Esempi:

- Un dipendente può visualizzare soltanto i documenti relativi alle proprie attività.
- Un amministratore può accedere alle configurazioni del server.
- Le password non devono essere memorizzate in chiaro.
- Le comunicazioni riservate devono essere protette attraverso protocolli cifrati.

**Minacce alla riservatezza:**

- Furto di credenziali.
- Accessi abusivi.
- Intercettazione delle comunicazioni.
- Esposizione accidentale di documenti.
- Errata configurazione dei permessi.

### 3.2 Integrità (Integrity)

L'integrità garantisce che le informazioni siano corrette, complete e non modificate in modo non autorizzato.

Esempi:

- Un record contenente i dati di un cliente non deve essere modificato da utenti non autorizzati.
- Un file di configurazione non deve essere alterato da un processo malevolo.
- Un aggiornamento software deve essere verificabile attraverso firme digitali o checksum.

**Minacce all'integrità:**

- Modifica non autorizzata dei dati.
- Manipolazione di file.
- Alterazione di transazioni.
- Malware che modifica configurazioni.
- Attacchi di tipo Man-in-the-Middle.

### 3.3 Disponibilità (Availability)

La disponibilità garantisce che sistemi, servizi e informazioni siano accessibili quando richiesto dagli utenti autorizzati.

Esempi:

- Un server web deve rispondere alle richieste.
- Un database aziendale deve essere operativo durante l'orario di lavoro.
- I dati devono poter essere recuperati dopo un guasto.
- Un servizio deve poter riprendere l'attività dopo un incidente.

**Minacce alla disponibilità:**

- Attacchi Denial of Service (DoS).
- Guasti hardware.
- Errori di configurazione.
- Ransomware.
- Interruzioni di rete.
- Indisponibilità delle risorse.

### 3.4 Esempio applicativo: sistema di autenticazione

Consideriamo un'applicazione aziendale che permette ai dipendenti di consultare i propri dati.

| Principio | Applicazione |
| --- | --- |
| Riservatezza | Un dipendente non può visualizzare i dati degli altri dipendenti |
| Integrità | Un utente non può modificare autonomamente il proprio stipendio |
| Disponibilità | Il servizio deve essere accessibile durante l'orario lavorativo |

Un incidente può compromettere uno o più principi contemporaneamente.

Ad esempio, un ransomware che cifra i file aziendali compromette principalmente la disponibilità, ma può anche compromettere l'integrità dei dati e la riservatezza se l'attaccante ha precedentemente sottratto informazioni.

### 3.5 Esercizio: identificare il principio CIA

Per ciascuno scenario, individuare il principio principalmente compromesso.

| Scenario | Principio |
| --- | --- |
| Un utente non autorizzato legge un documento riservato | Riservatezza |
| Un attaccante modifica il saldo di un conto | Integrità |
| Un attacco rende indisponibile un sito web | Disponibilità |
| Un dipendente pubblica accidentalmente un archivio riservato | Riservatezza |
| Un malware modifica un file di configurazione | Integrità |

**Attività autonoma:** individuare almeno altri tre esempi per ciascun principio CIA.

---

## 4. Autenticazione, autorizzazione e accounting

La gestione delle identità e degli accessi è un elemento centrale della cybersecurity.

È importante distinguere tre concetti:

- **Autenticazione (Authentication):** verifica dell'identità di un soggetto.
- **Autorizzazione (Authorization):** definizione delle operazioni che il soggetto può eseguire.
- **Accounting:** registrazione delle attività svolte.

Questi concetti sono spesso sintetizzati nel modello AAA.

### 4.1 Autenticazione

L'autenticazione risponde alla domanda:

**Chi sei?**

Un sistema deve verificare che un utente sia effettivamente il soggetto che dichiara di essere.

I principali fattori di autenticazione sono:

| Fattore | Descrizione | Esempio |
| --- | --- | --- |
| Something you know | Qualcosa che conosci | Password, PIN |
| Something you have | Qualcosa che possiedi | Smartphone, token hardware |
| Something you are | Qualcosa che sei | Impronta digitale, riconoscimento facciale |

L'autenticazione multifattore (MFA) utilizza almeno due fattori distinti.

Esempio:

1. L'utente inserisce username e password.
2. Il sistema richiede un codice temporaneo generato da un'applicazione.
3. L'accesso viene consentito se entrambe le verifiche hanno esito positivo.

La MFA riduce il rischio che il furto della sola password sia sufficiente per compromettere un account.

### 4.2 Autorizzazione

L'autorizzazione risponde alla domanda:

**Che cosa puoi fare?**

Dopo aver identificato un utente, il sistema deve stabilire quali risorse e funzionalità può utilizzare.

Esempio di un'applicazione aziendale:

| Ruolo | Visualizzazione | Modifica | Amministrazione |
| --- | ---: | ---: | ---: |
| Utente | Sì | No | No |
| Operatore | Sì | Sì | No |
| Amministratore | Sì | Sì | Sì |

Il modello RBAC (Role-Based Access Control) assegna i permessi in funzione dei ruoli.

### 4.3 Principio del minimo privilegio

Il principio del Least Privilege stabilisce che ogni utente, processo o applicazione debba disporre soltanto dei privilegi strettamente necessari per svolgere le proprie attività.

Esempio:

Un programma che deve leggere un file di log non dovrebbe essere eseguito con privilegi di amministratore se è sufficiente un account con permessi di lettura.

Applicare questo principio permette di limitare i danni in caso di compromissione.

### 4.4 Accounting e tracciabilità

L'accounting consiste nella registrazione delle attività effettuate dagli utenti e dai sistemi.

Esempi:

- Accesso effettuato da un utente.
- Tentativo di autenticazione fallito.
- Modifica di un documento.
- Esecuzione di un comando amministrativo.
- Accesso a una risorsa protetta.

Queste informazioni vengono utilizzate per:

- Ricostruire gli eventi.
- Individuare comportamenti anomali.
- Analizzare incidenti.
- Verificare il rispetto delle politiche di sicurezza.

### 4.5 Esempio pratico: autenticazione e autorizzazione

Consideriamo un sistema di gestione degli utenti.

Un dipendente:

1. Inserisce le proprie credenziali.
2. Viene autenticato dal sistema.
3. Riceve il ruolo `USER`.
4. Può consultare i propri dati.
5. Non può accedere alle funzionalità amministrative.
6. Le operazioni effettuate vengono registrate.

L'autenticazione non implica automaticamente l'autorizzazione a tutte le operazioni.

**Attenzione:** un'applicazione deve verificare i permessi lato server. Nascondere un pulsante nell'interfaccia grafica non impedisce a un utente di invocare direttamente l'endpoint corrispondente.

---

## 5. Minacce, vulnerabilità e rischio

Per comprendere un incidente informatico è necessario distinguere alcuni concetti fondamentali.

### 5.1 Minaccia (Threat)

Una minaccia è una possibile causa di un evento in grado di provocare danni a un sistema o alle informazioni gestite.

Può essere:

- Intenzionale, come un attacco informatico.
- Accidentale, come la cancellazione involontaria di un file.
- Ambientale, come un incendio o un allagamento.
- Tecnica, come un guasto hardware.

Esempi di minacce:

- Cybercriminali.
- Malware.
- Phishing.
- Errori umani.
- Guasti elettrici.
- Eventi naturali.

### 5.2 Vulnerabilità (Vulnerability)

Una vulnerabilità è una debolezza di un sistema che può essere sfruttata da una minaccia.

Esempi:

- Software non aggiornato.
- Password deboli.
- Servizi esposti senza necessità.
- Configurazioni errate.
- Permessi eccessivi.
- Query SQL costruite concatenando direttamente input dell'utente.
- Assenza di controlli sugli accessi.

Una vulnerabilità non implica necessariamente che il sistema sia già stato compromesso, ma può aumentare la possibilità di un attacco riuscito.

### 5.3 Attacco (Attack)

Un attacco è un'azione intenzionale che tenta di sfruttare una vulnerabilità per compromettere un sistema o violare una proprietà di sicurezza.

Esempi:

- Tentativo di accesso tramite credenziali rubate.
- Invio di una richiesta contenente una SQL Injection.
- Esecuzione di un malware.
- Saturazione delle risorse di un server.
- Sfruttamento di una configurazione errata.

### 5.4 Rischio (Risk)

Il rischio rappresenta la possibilità che una minaccia sfrutti una vulnerabilità provocando un impatto negativo.

In una valutazione semplificata si può utilizzare:

**Rischio = Probabilità × Impatto**

Questa formula è un modello didattico di valutazione qualitativa o semi-quantitativa. Nelle metodologie professionali il rischio viene analizzato con criteri più articolati, che considerano anche esposizione, efficacia dei controlli e contesto.

Esempio:

Un server aziendale espone un servizio amministrativo su Internet utilizzando una password debole.

| Elemento | Descrizione |
| --- | --- |
| Risorsa | Server aziendale |
| Minaccia | Accesso abusivo |
| Vulnerabilità | Password debole |
| Attacco | Tentativi automatizzati di autenticazione |
| Probabilità | Alta, se il servizio è esposto |
| Impatto | Potenzialmente elevato |
| Rischio | Elevato |

### 5.5 Matrice qualitativa del rischio

Una matrice semplice permette di classificare i rischi.

| Probabilità / Impatto | Basso | Medio | Alto |
| --- | --- | --- | --- |
| Bassa | Basso | Basso | Medio |
| Media | Basso | Medio | Alto |
| Alta | Medio | Alto | Alto |

La classificazione deve essere interpretata in relazione al contesto e ai criteri adottati dall'organizzazione.

### 5.6 Riduzione del rischio

Il rischio può essere ridotto attraverso diversi interventi:

- Aggiornamento del software.
- Applicazione del principio del minimo privilegio.
- Utilizzo di autenticazione multifattore.
- Configurazione corretta dei firewall.
- Cifratura delle comunicazioni.
- Backup periodici.
- Monitoraggio dei log.
- Formazione degli utenti.
- Verifiche periodiche delle vulnerabilità.

### 5.7 Esercitazione: analisi di un rischio

Scenario:

Un piccolo ufficio utilizza un server Linux per condividere documenti. Tutti i dipendenti accedono con lo stesso account amministrativo. Il server non viene aggiornato da diversi mesi.

Individuare:

1. Le risorse da proteggere.
2. Le possibili minacce.
3. Le vulnerabilità presenti.
4. Le conseguenze di un eventuale attacco.
5. Le misure di sicurezza da adottare.
6. Le priorità degli interventi.

---

## 6. Principali categorie di malware

Il termine malware deriva dall'espressione *malicious software* e identifica un software progettato per svolgere attività dannose o non autorizzate.

Il malware può essere utilizzato per:

- Rubare informazioni.
- Cifrare documenti.
- Controllare un dispositivo.
- Registrare le attività dell'utente.
- Sottrarre credenziali.
- Compromettere altri sistemi.
- Interrompere servizi.

### 6.1 Virus

Un virus è un codice malevolo che si inserisce all'interno di un file o programma legittimo e può replicarsi quando il componente infetto viene eseguito.

Caratteristiche:

- Necessita generalmente di un file o programma ospite.
- Può diffondersi attraverso file infetti.
- Può modificare o danneggiare informazioni.

### 6.2 Worm

Un worm è un malware in grado di propagarsi autonomamente tra sistemi, spesso sfruttando vulnerabilità di rete o servizi esposti.

Caratteristiche:

- Può diffondersi senza richiedere l'esecuzione manuale di un file da parte dell'utente.
- Può generare traffico anomalo.
- Può compromettere numerosi dispositivi.

### 6.3 Trojan

Un Trojan Horse è un programma che si presenta come legittimo, ma contiene funzionalità malevole.

Esempio:

Un utente scarica un programma apparentemente utile da una fonte non affidabile. Durante l'esecuzione, il programma installa anche componenti che consentono accessi non autorizzati.

### 6.4 Ransomware

Il ransomware è un malware che impedisce l'accesso ai dati o ai sistemi, spesso attraverso la cifratura dei file, e richiede un riscatto per il ripristino.

Possibili conseguenze:

- Indisponibilità dei documenti.
- Interruzione delle attività aziendali.
- Perdita di dati.
- Sottrazione e divulgazione di informazioni.
- Danni economici e reputazionali.

Le misure preventive comprendono:

- Backup periodici e verificati.
- Aggiornamento dei sistemi.
- Limitazione dei privilegi.
- Protezione degli endpoint.
- Formazione degli utenti.
- Segmentazione della rete.

### 6.5 Spyware e keylogger

Lo spyware raccoglie informazioni sull'attività dell'utente senza un'adeguata autorizzazione.

Un keylogger registra le sequenze di tasti digitate, potenzialmente intercettando:

- Password.
- Credenziali.
- Informazioni personali.
- Dati finanziari.

### 6.6 Rootkit

Un rootkit è un insieme di componenti malevoli progettati per mantenere un accesso non autorizzato e nascondere la propria presenza nel sistema.

Può operare a diversi livelli:

- Applicativo.
- Kernel.
- Boot o firmware.

La sua individuazione può essere complessa perché può alterare il funzionamento degli strumenti di controllo del sistema compromesso.

### 6.7 Botnet

Una botnet è una rete di dispositivi compromessi controllati da un soggetto esterno.

I dispositivi coinvolti possono essere utilizzati per:

- Attacchi DDoS.
- Invio di spam.
- Distribuzione di malware.
- Attività automatizzate su larga scala.

### 6.8 Tabella riepilogativa

| Malware | Caratteristica principale |
| --- | --- |
| Virus | Si inserisce in file o programmi |
| Worm | Si propaga autonomamente |
| Trojan | Si presenta come software legittimo |
| Ransomware | Blocca o cifra i dati |
| Spyware | Raccoglie informazioni |
| Keylogger | Registra i tasti digitati |
| Rootkit | Nasconde attività e mantiene accessi |
| Botnet | Coordina dispositivi compromessi |

**Nota:** queste categorie non sono necessariamente esclusive. Un singolo malware può integrare più funzionalità, ad esempio sottrazione di credenziali, persistenza e cifratura dei dati.

---

## 7. Phishing e ingegneria sociale

L'ingegneria sociale (Social Engineering) comprende tecniche utilizzate per manipolare le persone e indurle a compiere azioni che possono compromettere la sicurezza.

L'attaccante sfrutta spesso fattori psicologici:

- Fiducia.
- Urgenza.
- Paura.
- Curiosità.
- Autorità.
- Desiderio di ottenere un vantaggio.

### 7.1 Phishing

Il phishing è una tecnica di ingegneria sociale attraverso la quale un attaccante cerca di indurre una vittima a:

- Comunicare credenziali.
- Aprire un allegato malevolo.
- Visitare un sito fraudolento.
- Effettuare un pagamento.
- Fornire informazioni riservate.

Esempio di messaggio fraudolento:

> Oggetto: Il tuo account sarà sospeso!
>
> Gentile utente,
>
> abbiamo rilevato un problema sul tuo account. Per evitare la sospensione del servizio, verifica immediatamente le tue credenziali attraverso il collegamento indicato.
>
> Grazie,
> Servizio Assistenza

Il messaggio può presentare diversi segnali sospetti:

- Linguaggio che genera urgenza.
- Richiesta di inserire credenziali.
- Collegamento verso un dominio non riconducibile al servizio.
- Mittente non verificato.
- Errori grammaticali o formattazione insolita.

### 7.2 Varianti del phishing

| Tipologia | Descrizione |
| --- | --- |
| Phishing | Campagna rivolta a numerosi destinatari |
| Spear phishing | Attacco mirato a una persona o organizzazione |
| Whaling | Attacco rivolto a figure di alto livello |
| Smishing | Phishing tramite SMS |
| Vishing | Phishing tramite chiamate vocali |
| Business Email Compromise (BEC) | Frode basata sulla compromissione o imitazione delle comunicazioni aziendali |

### 7.3 Come riconoscere un tentativo di phishing

Prima di interagire con un messaggio è opportuno verificare:

1. L'indirizzo effettivo del mittente.
2. Il dominio del collegamento.
3. La presenza di richieste anomale.
4. L'eventuale pressione a compiere un'azione immediata.
5. La coerenza del messaggio con le normali procedure dell'organizzazione.
6. La presenza di allegati inattesi.

Non è sufficiente controllare il nome visualizzato del mittente: può essere facilmente falsificato.

### 7.4 Comportamenti corretti

- Non comunicare mai la password tramite email.
- Non aprire allegati inattesi.
- Non inserire credenziali dopo aver seguito collegamenti sospetti.
- Verificare le richieste attraverso canali ufficiali.
- Segnalare i messaggi sospetti al referente IT.
- Utilizzare MFA.
- Non riutilizzare la stessa password su servizi differenti.

### 7.5 Esercitazione: analisi di un'email

Analizzare il seguente messaggio simulato:

```text
Da: supporto@azienda-verifica.example
Oggetto: URGENTE - Account bloccato

Il tuo account aziendale verrà disattivato
entro 30 minuti.

Per evitare il blocco clicca qui:
https://azienda-verifica.example/login

Inserisci username e password per confermare
la tua identità.
```

Rispondere alle domande:

1. Quali elementi generano sospetto?
2. Perché la richiesta di urgenza può essere una tecnica di manipolazione?
3. Quali verifiche dovrebbe effettuare il destinatario?
4. Come dovrebbe comportarsi?
5. Quali danni potrebbero derivare dall'inserimento delle credenziali?

**Attenzione:** utilizzare esclusivamente esempi simulati e domini riservati alla documentazione o ai test, senza inviare messaggi fraudolenti a destinatari reali.

---

## 8. Log e monitoraggio degli eventi

Un log è una registrazione cronologica di eventi generati da un sistema operativo, un'applicazione, un servizio o un dispositivo di rete.

I log sono fondamentali per:

- Monitorare il funzionamento dei sistemi.
- Individuare anomalie.
- Ricostruire gli eventi.
- Analizzare incidenti di sicurezza.
- Verificare accessi e operazioni.
- Supportare attività di auditing.

### 8.1 Informazioni contenute in un log

Un evento può contenere:

| Campo | Descrizione |
| --- | --- |
| Timestamp | Data e ora dell'evento |
| Host | Sistema che ha generato il log |
| User | Utente coinvolto |
| Process | Processo o servizio |
| Event | Tipo di evento |
| Severity | Livello di gravità |
| Source IP | Indirizzo IP di origine, quando disponibile |
| Message | Descrizione dell'evento |

Esempio di evento:

```text
2026-11-18 09:15:23
host=server01
user=admin
event=login_failed
source_ip=192.0.2.45
severity=warning
```

L'indirizzo `192.0.2.45` appartiene a un intervallo riservato alla documentazione e viene utilizzato qui esclusivamente come esempio.

### 8.2 Livelli di severità

Molti sistemi di logging utilizzano livelli per classificare la gravità degli eventi.

| Livello | Significato |
| --- | --- |
| DEBUG | Informazioni dettagliate per il debugging |
| INFO | Evento informativo |
| NOTICE | Evento significativo ma normale |
| WARNING | Situazione anomala che richiede attenzione |
| ERROR | Errore che impedisce una specifica operazione |
| CRITICAL | Condizione critica |
| ALERT | Necessità di intervento immediato |
| EMERGENCY | Sistema inutilizzabile o condizione di emergenza |

La classificazione precisa può variare in base alla piattaforma utilizzata.

### 8.3 Log in Linux

Nei sistemi Linux basati su systemd è possibile consultare i log attraverso `journalctl`.

Comandi principali:

```bash
# Visualizza i log disponibili
journalctl

# Visualizza gli ultimi eventi
journalctl -n 20

# Segue i log in tempo reale
journalctl -f

# Visualizza i log relativi a un servizio
journalctl -u ssh

# Visualizza gli eventi relativi all'avvio corrente
journalctl -b

# Visualizza gli eventi relativi al kernel
journalctl -k
```

Alcuni sistemi Linux registrano inoltre eventi in file all'interno di `/var/log`.

Esempi:

```bash
# Elenco dei file di log
ls -lah /var/log

# Log di autenticazione su Ubuntu
sudo less /var/log/auth.log

# Ricerca di eventi relativi a SSH
sudo grep -i "ssh" /var/log/auth.log
```

La disponibilità e il nome dei file possono variare in base alla configurazione del sistema e al servizio di logging utilizzato.

### 8.4 Analisi degli accessi

Un'attività importante per un tecnico cybersecurity consiste nell'individuare tentativi di accesso anomali.

Esempi di eventi da analizzare:

- Numerosi tentativi di login falliti.
- Accessi in orari insoliti.
- Connessioni da indirizzi IP inattesi.
- Accessi con account amministrativi.
- Esecuzione di comandi privilegiati.
- Modifiche a file di configurazione.

Un singolo evento anomalo non dimostra necessariamente la presenza di un attacco. È necessario analizzare il contesto, la frequenza e la correlazione con altri eventi.

### 8.5 Esercitazione: interpretazione dei log

Considerare il seguente estratto simulato:

```text
09:00:12 user=mario event=login_success
09:05:31 user=admin event=login_failed
09:05:33 user=admin event=login_failed
09:05:35 user=admin event=login_failed
09:05:37 user=admin event=login_failed
09:05:39 user=admin event=login_failed
09:12:10 user=mario event=file_access
09:15:42 user=admin event=login_success
```

Rispondere:

1. Quanti tentativi di autenticazione falliti sono presenti?
2. Quale account è coinvolto?
3. Quale evento merita un approfondimento?
4. Quali informazioni aggiuntive sarebbe utile raccogliere?
5. Quali controlli potrebbero ridurre il rischio?

Possibili approfondimenti:

- Origine delle connessioni.
- Indirizzi IP.
- Orari degli accessi.
- Presenza di MFA.
- Modifiche effettuate dopo l'accesso.
- Eventuali processi avviati dall'account.

---

## 9. Comportamenti sicuri e buone pratiche

La sicurezza informatica dipende anche dai comportamenti quotidiani degli utenti e degli amministratori.

### 9.1 Gestione delle password

Una password dovrebbe essere:

- Lunga e sufficientemente complessa.
- Unica per ogni servizio.
- Non riconducibile a informazioni personali facilmente reperibili.
- Conservata in modo sicuro.

È consigliabile utilizzare un password manager affidabile per generare e conservare credenziali differenti.

Evitare:

- Password condivise tra più utenti.
- Password scritte in documenti non protetti.
- Password inviate tramite email o chat.
- Credenziali predefinite non modificate.

### 9.2 Aggiornamento dei sistemi

Gli aggiornamenti correggono vulnerabilità, risolvono errori e migliorano la sicurezza.

Su Ubuntu:

```bash
# Aggiorna l'elenco dei pacchetti
sudo apt update

# Installa gli aggiornamenti disponibili
sudo apt upgrade

# Verifica eventuali pacchetti aggiornabili
apt list --upgradable
```

Gli aggiornamenti devono essere gestiti considerando anche la compatibilità applicativa e le procedure operative dell'organizzazione.

### 9.3 Backup

Il backup permette di recuperare dati dopo:

- Guasti hardware.
- Cancellazioni accidentali.
- Errori operativi.
- Attacchi ransomware.
- Corruzione dei dati.

È importante:

- Effettuare copie periodiche.
- Proteggere i backup dagli accessi non autorizzati.
- Conservare copie separate dal sistema principale.
- Verificare periodicamente il ripristino.

Una strategia di riferimento è la regola 3-2-1:

- 3 copie dei dati.
- 2 supporti o tecnologie differenti.
- 1 copia conservata in una posizione separata.

Le copie devono essere progettate in modo da non poter essere facilmente alterate o cifrate insieme ai dati originali.

### 9.4 Navigazione sicura

Durante la navigazione:

- Verificare il dominio dei siti.
- Utilizzare HTTPS.
- Evitare download da fonti non affidabili.
- Non ignorare sistematicamente gli avvisi del browser.
- Non installare estensioni sconosciute.
- Non inserire informazioni riservate in pagine non verificate.

La presenza di HTTPS protegge la comunicazione tra client e server, ma non garantisce che il sito sia legittimo o affidabile.

### 9.5 Sicurezza dei dispositivi

Buone pratiche:

- Bloccare lo schermo quando ci si allontana.
- Utilizzare account individuali.
- Limitare i privilegi amministrativi.
- Installare software da fonti attendibili.
- Attivare gli aggiornamenti.
- Utilizzare strumenti di protezione adeguati.
- Evitare dispositivi USB di provenienza sconosciuta.
- Proteggere i dispositivi mobili con PIN o sistemi biometrici.

### 9.6 Sicurezza delle reti

- Evitare reti Wi-Fi non protette per operazioni riservate.
- Utilizzare VPN quando richiesto dalle politiche aziendali.
- Modificare le credenziali predefinite dei dispositivi.
- Disattivare servizi non necessari.
- Configurare correttamente firewall e regole di accesso.
- Separare le reti in base alle necessità operative.

### 9.7 Segnalazione degli incidenti

In caso di sospetta compromissione:

1. Non ignorare il problema.
2. Segnalare immediatamente l'evento al referente IT o al responsabile della sicurezza.
3. Annotare orario e circostanze.
4. Non cancellare file o log potenzialmente utili all'analisi.
5. Non tentare interventi improvvisati che potrebbero compromettere le evidenze.
6. Seguire le procedure aziendali di gestione degli incidenti.

Le azioni di contenimento, isolamento e ripristino devono essere eseguite da personale autorizzato secondo le procedure previste.

---

## 10. Laboratorio Linux: osservazione di utenti, processi e log

### Obiettivo

Utilizzare alcuni comandi Linux per osservare il sistema e raccogliere informazioni utili a una prima analisi di sicurezza.

Il laboratorio deve essere svolto su una macchina propria o su un ambiente di test autorizzato.

### 10.1 Identificazione dell'utente

```bash
# Visualizza l'utente corrente
whoami

# Visualizza UID, GID e gruppi
id

# Visualizza i gruppi dell'utente
groups
```

Domande:

- Qual è il nome dell'utente corrente?
- Qual è il suo UID?
- A quali gruppi appartiene?
- L'utente dispone di privilegi amministrativi?

### 10.2 Analisi dei processi

```bash
# Visualizza i processi in esecuzione
ps aux

# Visualizza i processi in modo interattivo
top

# Visualizza i processi dell'utente corrente
ps -u "$USER"
```

Osservare:

- Nome del processo.
- Utente proprietario.
- PID.
- Utilizzo della CPU.
- Utilizzo della memoria.

Non considerare automaticamente sospetto un processo sconosciuto: occorre verificarne provenienza, percorso, comportamento e contesto.

### 10.3 Analisi delle connessioni di rete

```bash
# Visualizza gli indirizzi IP delle interfacce
ip addr

# Visualizza le connessioni e le porte in ascolto
ss -tuln

# Visualizza le connessioni con i processi associati
sudo ss -tulnp
```

Significato delle opzioni di `ss`:

- `-t`: connessioni TCP.
- `-u`: connessioni UDP.
- `-l`: socket in ascolto.
- `-n`: mostra indirizzi e porte numerici.
- `-p`: mostra i processi associati, quando disponibili.

Attività:

1. Individuare le porte in ascolto.
2. Identificare i protocolli utilizzati.
3. Verificare se sono presenti servizi non necessari.
4. Annotare le porte che richiedono ulteriori verifiche.

### 10.4 Consultazione dei log

```bash
# Visualizza gli ultimi 20 eventi
journalctl -n 20

# Segue gli eventi in tempo reale
journalctl -f

# Visualizza i log di autenticazione su Ubuntu
sudo less /var/log/auth.log
```

Attività:

1. Individuare eventuali tentativi di autenticazione falliti.
2. Verificare la presenza di accessi riusciti.
3. Individuare gli orari degli eventi.
4. Annotare le informazioni disponibili.
5. Formulare un'ipotesi sulle anomalie, senza trarre conclusioni non supportate.

### 10.5 Report del laboratorio

Produrre un breve report contenente:

| Sezione | Informazioni da riportare |
| --- | --- |
| Sistema | Distribuzione e versione Linux |
| Utente | Nome, UID e gruppi |
| Processi | Elenco di alcuni processi significativi |
| Rete | Porte e servizi in ascolto |
| Log | Eventi di autenticazione osservati |
| Valutazione | Eventuali anomalie da approfondire |

---

## 11. Esercitazioni

### Esercizio 1 – Triade CIA

Per ciascuno scenario indicare quale principio CIA viene compromesso principalmente.

1. Un utente accede ai documenti riservati di un collega.
2. Un attaccante modifica i dati di un database.
3. Un attacco DDoS rende irraggiungibile un portale.
4. Un malware altera un file di configurazione.
5. Un dipendente invia accidentalmente un archivio riservato a un destinatario esterno.

Per ogni scenario indicare anche una possibile contromisura.

### Esercizio 2 – Analisi di un rischio

Scenario:

Un'azienda utilizza un'applicazione web per gestire i dati dei clienti.

L'applicazione presenta le seguenti caratteristiche:

- Password semplici.
- Nessuna autenticazione multifattore.
- Database accessibile dalla rete pubblica.
- Software non aggiornato.
- Backup effettuati soltanto sul server principale.

Individuare:

1. Le vulnerabilità.
2. Le minacce.
3. I possibili attacchi.
4. Gli impatti sulla triade CIA.
5. Le contromisure prioritarie.

### Esercizio 3 – Analisi di un tentativo di phishing

Ricevi un messaggio che comunica la sospensione del tuo account e richiede di inserire username e password attraverso un collegamento.

Descrivere:

1. I segnali sospetti.
2. Le verifiche da effettuare.
3. Il comportamento corretto.
4. Le possibili conseguenze dell'inserimento delle credenziali.
5. Le misure preventive che avrebbero potuto ridurre il rischio.

### Esercizio 4 – Analisi di eventi di sicurezza

Considerare il seguente dataset simulato:

```text
2026-11-18 08:30:00 user=alice event=login_success
2026-11-18 08:45:12 user=admin event=login_failed
2026-11-18 08:45:14 user=admin event=login_failed
2026-11-18 08:45:16 user=admin event=login_failed
2026-11-18 09:00:00 user=alice event=file_access
2026-11-18 09:10:00 user=admin event=login_success
2026-11-18 09:12:00 user=admin event=config_change
```

Rispondere:

1. Quali eventi sono potenzialmente anomali?
2. Quanti tentativi di accesso falliti sono presenti?
3. Quale relazione potrebbe esistere tra l'accesso amministrativo riuscito e la modifica della configurazione?
4. Quali ulteriori informazioni servirebbero?
5. Quali azioni di verifica suggeriresti?

### Esercizio 5 – Comportamenti sicuri

Preparare un elenco di almeno dieci comportamenti che un dipendente dovrebbe adottare per proteggere il proprio account e il sistema aziendale.

Suddividere le raccomandazioni nelle seguenti categorie:

- Password e autenticazione.
- Email e navigazione.
- Gestione dei dispositivi.
- Protezione dei dati.
- Segnalazione degli incidenti.

---

## 12. Domande di autovalutazione

1. Che cosa si intende per cybersecurity?
2. Quali sono i tre principi della triade CIA?
3. Qual è la differenza tra riservatezza e integrità?
4. Che cosa si intende per disponibilità?
5. Qual è la differenza tra autenticazione e autorizzazione?
6. Che cosa rappresenta il modello AAA?
7. Che cosa significa applicare il principio del minimo privilegio?
8. Qual è la differenza tra minaccia e vulnerabilità?
9. Come si definisce il rischio informatico?
10. Quali sono le principali categorie di malware?
11. Qual è la differenza tra virus e worm?
12. Che cosa caratterizza un ransomware?
13. Che cosa si intende per phishing?
14. Quali sono le principali tecniche di ingegneria sociale?
15. Perché i log sono importanti per la cybersecurity?
16. Quali informazioni possono essere presenti in un evento di log?
17. Quali comandi Linux possono essere utilizzati per consultare i log?
18. Perché è importante aggiornare periodicamente i sistemi?
19. Che cosa prevede la regola 3-2-1 per i backup?
20. Quali comportamenti adottare in caso di sospetto incidente informatico?

---

## 13. Riepilogo

La sicurezza informatica è un processo continuo che coinvolge persone, tecnologie e procedure.

I concetti fondamentali affrontati nella lezione sono:

| Concetto | Significato |
| --- | --- |
| Cybersecurity | Protezione di sistemi, reti, applicazioni e dati |
| CIA | Riservatezza, integrità e disponibilità |
| Autenticazione | Verifica dell'identità |
| Autorizzazione | Definizione dei permessi |
| Accounting | Registrazione delle attività |
| Minaccia | Possibile causa di un evento dannoso |
| Vulnerabilità | Debolezza sfruttabile di un sistema |
| Attacco | Azione volta a compromettere un sistema |
| Rischio | Possibilità di un impatto negativo |
| Malware | Software progettato per attività malevole |
| Phishing | Tecnica di ingegneria sociale |
| Log | Registrazione degli eventi |
| Hardening | Riduzione delle vulnerabilità e della superficie di attacco |

La sicurezza non dipende da un singolo prodotto o strumento. Richiede una combinazione di prevenzione, protezione, monitoraggio, risposta agli incidenti e ripristino.

---

## 14. Collegamenti ai moduli successivi

Questa unità introduce concetti che verranno approfonditi nei moduli successivi del percorso.

| Argomento | Collegamento |
| --- | --- |
| Triade CIA | Sicurezza di sistemi, applicazioni e database |
| Autenticazione e autorizzazione | Gestione degli utenti e dei privilegi in Linux e nelle API |
| Minacce e vulnerabilità | Analisi delle vulnerabilità e OWASP Top 10 |
| Malware | Analisi di processi e attività sospette |
| Phishing | Tecniche di social engineering e sensibilizzazione |
| Log | Analisi automatizzata con Python e Bash |
| Rischio | Valutazione della sicurezza delle infrastrutture |
| Backup e disponibilità | Continuità operativa e disaster recovery |
| Minimo privilegio | Hardening di sistemi operativi e database |

### Risorse e documentazione

- NIST Cybersecurity Framework: <https://www.nist.gov/cyberframework>
- NIST Computer Security Resource Center: <https://csrc.nist.gov/>
- OWASP Foundation: <https://owasp.org/>
- ENISA – European Union Agency for Cybersecurity: <https://www.enisa.europa.eu/>
- CERT-AgID: <https://cert-agid.gov.it/>
- Ubuntu Server Documentation: <https://documentation.ubuntu.com/server/>
- Linux man pages: <https://man7.org/linux/man-pages/>

**Nota per il docente:** gli esempi e i laboratori di questa unità devono essere svolti su sistemi propri, ambienti didattici isolati o infrastrutture per le quali sia stata concessa un'autorizzazione esplicita. L'obiettivo è sviluppare capacità di osservazione, prevenzione e analisi, non eseguire attività offensive su sistemi di terzi.
