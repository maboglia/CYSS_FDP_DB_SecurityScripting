# 05 – Reti e comunicazione

## 1. Obiettivi didattici

Al termine della lezione lo studente sarà in grado di:

- Comprendere il funzionamento di una rete informatica.
- Distinguere LAN, WAN e altre tipologie di rete.
- Identificare il ruolo di switch, router, firewall e access point.
- Comprendere la differenza tra indirizzo MAC e indirizzo IP.
- Riconoscere la struttura degli indirizzi IPv4 e IPv6.
- Comprendere il funzionamento dei protocolli TCP e UDP.
- Comprendere il concetto di porta di comunicazione e servizio di rete.
- Descrivere il funzionamento del DNS.
- Utilizzare i principali strumenti Linux per analizzare la configurazione e la connettività di rete.
- Individuare i principali rischi legati alle comunicazioni di rete.
- Comprendere il concetto di superficie di attacco e le strategie per ridurla.

---

## 2. Introduzione alle reti informatiche

Una rete informatica è un insieme di dispositivi collegati tra loro allo scopo di scambiare informazioni e condividere risorse.

I dispositivi collegati possono essere:

- Computer.
- Server.
- Smartphone.
- Stampanti.
- Router.
- Switch.
- Firewall.
- Dispositivi IoT.
- Sistemi di videosorveglianza.
- Apparati industriali.

La comunicazione avviene attraverso mezzi trasmissivi e protocolli che definiscono le regole per lo scambio dei dati.

### 2.1 Perché utilizzare una rete?

Una rete informatica permette di:

- Condividere file e documenti.
- Accedere a servizi centralizzati.
- Utilizzare applicazioni distribuite.
- Condividere stampanti e dispositivi.
- Accedere a Internet.
- Comunicare attraverso posta elettronica e messaggistica.
- Gestire infrastrutture aziendali.
- Monitorare e controllare sistemi remoti.

### 2.2 Esempio: rete aziendale

Consideriamo una piccola organizzazione.

La rete potrebbe essere composta da:

```text
                  INTERNET
                     |
                  ROUTER
                     |
                  FIREWALL
                     |
                   SWITCH
          ___________|____________
         |           |            |
       PC-01       SERVER       STAMPANTE
         |
      PORTATILE
```

I dispositivi comunicano attraverso la rete locale e possono accedere a servizi interni o esterni, secondo le regole di instradamento e sicurezza configurate.

### 2.3 Client e server

Nelle comunicazioni di rete è frequente utilizzare il modello client-server.

- Client: dispositivo o applicazione che richiede un servizio.
- Server: dispositivo o applicazione che mette a disposizione un servizio.

Esempio:

```text
CLIENT                         SERVER
Browser                        Web Server
   |                               |
   |------ Richiesta HTTP -------->|
   |                               |
   |<----- Risposta HTTP ----------|
   |                               |
```

Un browser può richiedere una pagina Web a un server utilizzando il protocollo HTTP o HTTPS.

Lo stesso modello viene utilizzato per:

- Database.
- API REST.
- Servizi di autenticazione.
- Posta elettronica.
- Condivisione di file.

---

## 3. Tipologie di rete: LAN e WAN

Le reti possono essere classificate in base alla loro estensione geografica e alle modalità di collegamento.

### 3.1 LAN – Local Area Network

Una LAN è una rete locale che collega dispositivi situati in un'area geografica limitata.

Esempi:

- Rete domestica.
- Rete di un laboratorio informatico.
- Rete di un ufficio.
- Rete di un edificio scolastico.

Caratteristiche:

- Estensione geografica limitata.
- Elevate velocità di trasmissione.
- Gestione generalmente locale.
- Utilizzo frequente di Ethernet e Wi-Fi.

### 3.2 WAN – Wide Area Network

Una WAN collega reti geograficamente distanti.

Esempi:

- Rete aziendale distribuita tra più sedi.
- Collegamento tra filiali.
- Rete di un operatore di telecomunicazioni.
- Internet.

Caratteristiche:

- Copertura geografica estesa.
- Collegamenti attraverso infrastrutture di telecomunicazione.
- Possibile utilizzo di VPN.
- Maggiore complessità di gestione e sicurezza.

### 3.3 Altre tipologie

| Tipologia | Significato | Esempio |
| --- | --- | --- |
| PAN | Personal Area Network | Bluetooth tra smartphone e cuffie |
| LAN | Local Area Network | Rete di un ufficio |
| WLAN | Wireless LAN | Rete Wi-Fi |
| MAN | Metropolitan Area Network | Rete metropolitana |
| WAN | Wide Area Network | Rete tra sedi aziendali |
| VPN | Virtual Private Network | Collegamento sicuro tra reti |

**Attenzione:** una VPN non è una tipologia geografica di rete come LAN o WAN. È una tecnologia che realizza collegamenti virtuali protetti attraverso un'infrastruttura di rete esistente.

### 3.4 Rete cablata e rete wireless

Le reti possono utilizzare differenti mezzi trasmissivi.

**Ethernet**

Utilizza cavi di rete, generalmente con connettori RJ45 e cavi a coppie intrecciate.

Vantaggi:

- Stabilità.
- Prestazioni generalmente prevedibili.
- Bassa latenza.
- Minore esposizione ad alcuni rischi tipici delle comunicazioni radio.

**Wi-Fi**

Utilizza onde radio per collegare i dispositivi.

Vantaggi:

- Mobilità.
- Facilità di installazione.
- Riduzione dei cablaggi.

Rischi:

- Accessi non autorizzati.
- Intercettazione delle comunicazioni se non adeguatamente protette.
- Attacchi contro configurazioni deboli.
- Presenza di access point non autorizzati.

Per proteggere una rete wireless è importante utilizzare protocolli moderni, come WPA2-AES o WPA3, configurare password robuste e disabilitare funzionalità non necessarie.

---

## 4. I dispositivi di rete

Una rete informatica utilizza dispositivi differenti, ciascuno con un ruolo specifico.

### 4.1 Switch

Uno switch collega più dispositivi all'interno di una rete locale.

Opera principalmente al livello 2 del modello OSI e utilizza gli indirizzi MAC per inoltrare i frame Ethernet verso la porta appropriata.

Esempio:

```text
             SWITCH
          _____|_____
         |     |     |
        PC    PC   SERVER
```

Lo switch apprende gli indirizzi MAC dei dispositivi collegati e costruisce una tabella di inoltro.

Questa tabella permette di individuare la porta attraverso la quale raggiungere un determinato dispositivo.

Funzioni e caratteristiche:

- Collegamento dei dispositivi.
- Inoltro dei frame.
- Apprendimento degli indirizzi MAC.
- Supporto alle VLAN negli switch gestiti.
- Possibilità di applicare controlli di accesso.

### 4.2 Router

Un router collega reti differenti e instrada i pacchetti IP verso la destinazione.

Opera principalmente al livello 3 del modello OSI.

Esempio:

```text
       RETE LOCALE
       192.168.1.0/24
              |
           ROUTER
              |
           INTERNET
```

Funzioni principali:

- Instradamento dei pacchetti.
- Collegamento tra reti differenti.
- Gestione delle rotte.
- Eventuale traduzione degli indirizzi tramite NAT.
- Possibile applicazione di regole di filtraggio.

### 4.3 Firewall

Un firewall controlla il traffico di rete applicando regole di sicurezza.

Può consentire o bloccare comunicazioni in base a diversi criteri:

- Indirizzo IP sorgente.
- Indirizzo IP destinazione.
- Protocollo.
- Porta sorgente.
- Porta destinazione.
- Stato della connessione.
- Applicazione, nei firewall di livello superiore.

Esempio concettuale:

```text
             INTERNET
                 |
              FIREWALL
                 |
          _______|_______
         |               |
       CONSENTITO      BLOCCATO
         |               |
      HTTPS/443       Servizi non
                       autorizzati
```

Un firewall può essere:

- Hardware: apparato dedicato.
- Software: applicazione installata su un sistema.
- Integrato: funzionalità presente in router o sistemi operativi.

In Linux è possibile utilizzare strumenti come `ufw` e `nftables`.

### 4.4 Access Point

Un access point permette ai dispositivi wireless di collegarsi a una rete.

```text
           RETE CABLATA
                 |
             ACCESS POINT
              /       \
          PORTATILE  SMARTPHONE
```

L'access point può essere integrato in un router domestico oppure essere un dispositivo separato.

### 4.5 Riepilogo dei dispositivi

| Dispositivo | Funzione principale | Livello OSI prevalente |
| --- | --- | --- |
| Switch Ethernet | Collega dispositivi nella LAN | 2 |
| Router | Collega reti e instrada pacchetti | 3 |
| Firewall | Filtra il traffico | Vari livelli |
| Access Point | Collega dispositivi wireless | 2 |
| Hub | Ripete il segnale su tutte le porte | 1 |

I dispositivi moderni possono integrare più funzioni e operare su più livelli.

---

## 5. Il modello OSI e la comunicazione di rete

Per comprendere come avviene una comunicazione di rete è utile introdurre il modello OSI.

Il modello OSI descrive la comunicazione attraverso sette livelli logici.

| Livello | Nome | Funzione | Esempi |
| ---: | --- | --- | --- |
| 7 | Application | Servizi per le applicazioni | HTTP, DNS, SMTP |
| 6 | Presentation | Formato e rappresentazione dei dati | Codifica, cifratura |
| 5 | Session | Gestione delle sessioni | Controllo dialogo |
| 4 | Transport | Comunicazione tra processi | TCP, UDP |
| 3 | Network | Indirizzamento e instradamento | IP, ICMP |
| 2 | Data Link | Comunicazione sul collegamento locale | Ethernet, MAC |
| 1 | Physical | Trasmissione dei bit | Cavi, fibra, radio |

Il modello OSI è un modello concettuale utile per descrivere le funzioni della rete.

### 5.1 Il modello TCP/IP

Nelle reti reali si utilizza comunemente il modello TCP/IP, che raggruppa le funzioni in quattro livelli.

| Livello TCP/IP | Esempi |
| --- | --- |
| Application | HTTP, DNS, SMTP, SSH |
| Transport | TCP, UDP |
| Internet | IP, ICMP |
| Network Access | Ethernet, Wi-Fi |

### 5.2 Incapsulamento dei dati

Durante una comunicazione, ogni livello aggiunge informazioni necessarie alla trasmissione.

Questo processo viene chiamato incapsulamento.

Esempio semplificato:

```text
DATI APPLICATIVI
       |
       v
SEGMENTO TCP / DATAGRAMMA UDP
       |
       v
PACCHETTO IP
       |
       v
FRAME ETHERNET
       |
       v
BIT TRASMESSI
```

Al destinatario avviene il processo inverso, chiamato decapsulamento.

Questa struttura permette a protocolli differenti di collaborare senza che ogni applicazione debba gestire direttamente tutti i dettagli della trasmissione.

---

## 6. Indirizzi MAC

### 6.1 Che cos'è un indirizzo MAC?

Il MAC address (Media Access Control address) è un identificativo utilizzato a livello Data Link per identificare un'interfaccia di rete all'interno di una rete locale.

Un indirizzo MAC Ethernet tradizionale è composto da 48 bit, generalmente rappresentati con 12 cifre esadecimali.

Esempio:

```text
00:1A:2B:3C:4D:5E
```

Ogni coppia di cifre esadecimali rappresenta un byte.

### 6.2 Struttura del MAC address

Un indirizzo MAC tradizionale contiene:

- Parte iniziale: identificativo dell'organizzazione assegnataria, normalmente chiamato OUI.
- Parte restante: identificativo assegnato dall'organizzazione.

La struttura può variare in base alle modalità di assegnazione e al tipo di indirizzo.

### 6.3 A cosa serve?

Gli switch utilizzano gli indirizzi MAC per inoltrare i frame Ethernet all'interno della rete locale.

Esempio:

```text
PC-A
MAC: AA:AA:AA:AA:AA:AA
       |
       |
    SWITCH
       |
       |
PC-B
MAC: BB:BB:BB:BB:BB:BB
```

Lo switch apprende che:

- Il MAC di PC-A è raggiungibile attraverso una determinata porta.
- Il MAC di PC-B è raggiungibile attraverso un'altra porta.

Quando riceve un frame destinato a PC-B, può inoltrarlo verso la porta corretta.

### 6.4 MAC address e sicurezza

Il MAC address non deve essere considerato un sistema di autenticazione affidabile.

Può essere modificato o falsificato attraverso tecniche di MAC spoofing.

Alcuni rischi:

- Falsificazione dell'identificativo di rete.
- Elusione di controlli basati esclusivamente sul MAC.
- Attacchi di tipo ARP spoofing.
- Manipolazione delle comunicazioni locali.

Per questo motivo il filtraggio MAC non deve essere utilizzato come unica misura di sicurezza.

---

## 7. Indirizzamento IP

L'indirizzo IP (Internet Protocol address) identifica logicamente un'interfaccia all'interno di una rete IP.

Permette ai dispositivi di comunicare anche quando si trovano su reti differenti.

Le principali versioni sono:

- IPv4.
- IPv6.

### 7.1 IPv4

IPv4 utilizza indirizzi di 32 bit.

Un indirizzo viene normalmente rappresentato attraverso quattro numeri decimali separati da punti.

Esempio:

```text
192.168.1.10
```

Ogni gruppo rappresenta 8 bit e può assumere valori da 0 a 255.

Quindi:

```text
192       168       1        10
11000000  10101000  00000001  00001010
```

La lunghezza complessiva è:

\[
4 \times 8 = 32 \text{ bit}
\]

Il numero teorico di indirizzi IPv4 è:

\[
2^{32} = 4.294.967.296
\]

Una parte degli indirizzi è riservata a utilizzi specifici.

### 7.2 Indirizzi pubblici e privati

Gli indirizzi IPv4 possono essere pubblici o privati.

Gli indirizzi pubblici sono utilizzati per identificare destinazioni raggiungibili attraverso Internet, secondo le regole di instradamento.

Gli indirizzi privati sono utilizzati nelle reti interne e non vengono instradati direttamente sulla rete Internet pubblica.

Gli intervalli IPv4 privati sono definiti da RFC 1918.

| Intervallo | Subnet mask predefinita | Utilizzo |
| --- | --- | --- |
| 10.0.0.0/8 | 255.0.0.0 | Reti private |
| 172.16.0.0/12 | 255.240.0.0 | Reti private |
| 192.168.0.0/16 | 255.255.0.0 | Reti private |

Esempi di indirizzi privati:

```text
192.168.1.10
10.0.0.5
172.16.10.20
```

Un indirizzo privato può essere utilizzato da numerosi dispositivi in reti differenti.

### 7.3 Indirizzo di loopback

L'indirizzo IPv4:

```text
127.0.0.1
```

identifica il loopback, cioè il sistema locale.

È comunemente chiamato `localhost`.

Viene utilizzato per comunicare con servizi in esecuzione sullo stesso computer.

Esempio:

```text
http://127.0.0.1:8000
```

Un'applicazione Web avviata sulla porta 8000 del proprio computer può essere raggiunta attraverso questo indirizzo, se è in ascolto sull'interfaccia di loopback.

### 7.4 Subnet mask e CIDR

La subnet mask permette di distinguere la parte di indirizzo relativa alla rete da quella relativa agli host.

Esempio:

```text
IP:          192.168.1.10
Subnet mask: 255.255.255.0
CIDR:        /24
```

La notazione `/24` indica che i primi 24 bit identificano la rete.

Quindi:

```text
Rete: 192.168.1.0/24
```

Gli indirizzi utilizzabili per gli host, nella classica sottorete IPv4 `/24`, sono:

```text
192.168.1.1 - 192.168.1.254
```

L'indirizzo `192.168.1.0` identifica la rete e `192.168.1.255` è l'indirizzo di broadcast.

Questa convenzione vale per le normali sottoreti IPv4 con prefisso `/24`; esistono eccezioni per altre dimensioni di sottorete e configurazioni particolari.

### 7.5 Gateway predefinito

Il gateway è il dispositivo utilizzato per raggiungere destinazioni esterne alla rete locale.

In una rete domestica potrebbe essere:

```text
192.168.1.1
```

Esempio:

```text
PC
IP: 192.168.1.10
        |
        |
ROUTER / GATEWAY
IP: 192.168.1.1
        |
        |
     INTERNET
```

Quando un computer deve comunicare con un indirizzo esterno alla propria sottorete, invia il traffico al gateway predefinito.

---

## 8. IPv6

IPv6 è la versione più recente del protocollo IP, progettata anche per superare i limiti di disponibilità degli indirizzi IPv4.

Utilizza indirizzi di 128 bit.

Esempio:

```text
2001:0db8:85a3:0000:0000:8a2e:0370:7334
```

L'indirizzo viene rappresentato attraverso otto gruppi esadecimali, ciascuno composto da 16 bit.

### 8.1 Perché IPv6?

IPv4 dispone di circa 4,3 miliardi di indirizzi teorici.

La diffusione di:

- Smartphone.
- Dispositivi IoT.
- Server.
- Infrastrutture cloud.
- Sistemi industriali.

ha aumentato la necessità di indirizzi IP.

IPv6 offre uno spazio di indirizzamento estremamente più ampio:

\[
2^{128}
\]

### 8.2 Caratteristiche principali

- Indirizzi a 128 bit.
- Notazione esadecimale.
- Configurazione manuale o automatica.
- Supporto alla comunicazione end-to-end.
- Utilizzo di Neighbor Discovery.
- Assenza del broadcast tradizionale IPv4: vengono utilizzati multicast e anycast.

### 8.3 Abbreviazione degli indirizzi IPv6

Un indirizzo IPv6 può essere abbreviato.

Esempio completo:

```text
2001:0db8:0000:0000:0000:0000:0000:0001
```

Forma abbreviata:

```text
2001:db8::1
```

Gli zeri iniziali di ogni gruppo possono essere omessi e una sequenza continua di gruppi composti da zero può essere sostituita con `::`, una sola volta nell'indirizzo.

### 8.4 Indirizzi IPv6 importanti

| Indirizzo | Significato |
| --- | --- |
| `::1` | Loopback |
| `::` | Indirizzo non specificato |
| `fe80::/10` | Link-local |
| `2000::/3` | Spazio degli indirizzi global unicast attualmente assegnato |

### 8.5 IPv4 e IPv6 a confronto

| Caratteristica | IPv4 | IPv6 |
| --- | --- | --- |
| Lunghezza | 32 bit | 128 bit |
| Rappresentazione | Decimale puntata | Esadecimale |
| Spazio indirizzi | Circa 4,3 miliardi | 2¹²⁸ |
| Broadcast | Presente | Assente |
| NAT | Molto diffuso | Non necessario per la scarsità di indirizzi |
| Configurazione | Manuale o DHCP | Manuale, SLAAC o DHCPv6 |

**Nota:** IPv6 non elimina automaticamente la necessità di firewall e controlli di sicurezza. Un dispositivo con un indirizzo IPv6 globale deve essere protetto attraverso regole appropriate, proprio come un dispositivo IPv4.

---

## 9. Protocollo TCP e UDP

I protocolli TCP e UDP operano a livello Transport del modello TCP/IP.

Permettono alle applicazioni di comunicare attraverso la rete.

### 9.1 TCP – Transmission Control Protocol

TCP è un protocollo orientato alla connessione.

Prima di trasmettere i dati viene stabilita una connessione logica tra i due endpoint.

Caratteristiche:

- Connessione tra endpoint.
- Trasmissione affidabile.
- Numerazione dei segmenti.
- Rilevazione delle perdite.
- Ritrasmissione dei dati mancanti.
- Controllo del flusso.
- Controllo della congestione.
- Consegna ordinata dei dati all'applicazione.

### 9.2 Three-way handshake

L'apertura di una connessione TCP avviene normalmente attraverso una procedura chiamata three-way handshake.

```text
CLIENT                         SERVER
   |                              |
   |---------- SYN -------------->|
   |                              |
   |<-------- SYN + ACK -----------|
   |                              |
   |---------- ACK -------------->|
   |                              |
   |        CONNESSIONE            |
```

Le tre fasi sono:

1. SYN: il client richiede l'apertura della connessione.
2. SYN-ACK: il server risponde.
3. ACK: il client conferma.

La connessione TCP è ora stabilita.

### 9.3 UDP – User Datagram Protocol

UDP è un protocollo senza connessione.

Invia datagrammi senza stabilire una connessione preliminare e senza garantire la consegna o l'ordine dei dati.

Caratteristiche:

- Minore overhead rispetto a TCP.
- Nessuna garanzia di consegna.
- Nessuna ritrasmissione automatica.
- Nessuna garanzia di ordinamento.
- Adatto a comunicazioni in cui la tempestività può essere più importante della consegna di ogni singolo pacchetto.

Applicazioni:

- DNS.
- VoIP.
- Streaming.
- Videoconferenze.
- Giochi online.
- DHCP.

Alcune applicazioni implementano autonomamente meccanismi di affidabilità sopra UDP.

### 9.4 TCP e UDP a confronto

| Caratteristica | TCP | UDP |
| --- | --- | --- |
| Connessione | Orientato alla connessione | Senza connessione |
| Affidabilità | Garantita dal protocollo entro i limiti della connessione | Non garantita dal protocollo |
| Ordinamento | Sì | No |
| Ritrasmissione | Sì | No, non automaticamente |
| Overhead | Maggiore | Minore |
| Utilizzo | Web, SSH, trasferimento file | DNS, VoIP, streaming, DHCP |

### 9.5 Esempi applicativi

**TCP**

Quando si scarica un file, è importante che tutti i dati arrivino correttamente e nell'ordine previsto.

**UDP**

Durante una videoconferenza, può essere preferibile perdere un piccolo numero di pacchetti piuttosto che attendere la ritrasmissione di dati ormai superati.

**Attenzione:** non è corretto affermare che TCP sia sempre più sicuro di UDP. La sicurezza dipende dai protocolli applicativi, dalla cifratura, dall'autenticazione e dalla configurazione dei servizi.

---

## 10. Porte di comunicazione

Un indirizzo IP identifica un'interfaccia di rete.

Una porta identifica un endpoint logico utilizzato da un processo o servizio di rete.

Le porte TCP e UDP sono numeri compresi tra 0 e 65535.

Una comunicazione viene identificata, tra gli altri elementi, attraverso:

- Indirizzo IP sorgente.
- Porta sorgente.
- Indirizzo IP destinazione.
- Porta destinazione.
- Protocollo di trasporto.

### 10.1 Esempio

Un browser vuole accedere a un server Web.

```text
CLIENT                         SERVER
192.168.1.10                   93.184.216.34

Porta sorgente: 51520          Porta destinazione: 443
        |                             |
        |--------- TCP -------------->|
        |                             |
        |                         HTTPS
```

La porta sorgente può essere scelta dinamicamente dal sistema operativo.

La porta destinazione è quella sulla quale il servizio remoto è in ascolto.

### 10.2 Porte standard

Alcune porte sono comunemente associate a servizi specifici.

| Porta | Protocollo | Servizio |
| ---: | --- | --- |
| 20/21 | TCP | FTP |
| 22 | TCP | SSH |
| 23 | TCP | Telnet |
| 25 | TCP | SMTP |
| 53 | TCP/UDP | DNS |
| 67/68 | UDP | DHCP |
| 80 | TCP | HTTP |
| 110 | TCP | POP3 |
| 123 | UDP | NTP |
| 143 | TCP | IMAP |
| 443 | TCP | HTTPS |
| 445 | TCP | SMB |
| 3306 | TCP | MySQL |
| 5432 | TCP | PostgreSQL |
| 8000 | TCP | Porta frequentemente usata in sviluppo Web |

Questa tabella riporta associazioni comuni, non vincoli assoluti: un servizio può essere configurato per utilizzare una porta differente.

### 10.3 Classificazione delle porte

Le porte sono suddivise in tre intervalli:

| Intervallo | Categoria |
| --- | --- |
| 0–1023 | Well-known ports |
| 1024–49151 | Registered ports |
| 49152–65535 | Dynamic/private ports |

Le porte dinamiche vengono spesso utilizzate come porte sorgente temporanee dai client.

### 10.4 Servizi in ascolto

Un servizio di rete può essere configurato per ascoltare su una determinata porta.

Esempio:

```text
0.0.0.0:8000
```

Indica che il servizio è in ascolto sulla porta 8000 su tutte le interfacce IPv4 locali.

Al contrario:

```text
127.0.0.1:8000
```

Indica che il servizio accetta connessioni soltanto attraverso l'interfaccia di loopback IPv4.

La distinzione è importante per la sicurezza: un servizio esposto su tutte le interfacce può essere raggiungibile da altri dispositivi, se le regole di rete lo consentono.

---

## 11. DNS – Domain Name System

Il DNS è un sistema distribuito che permette di associare nomi di dominio a informazioni utilizzate per la comunicazione in rete, tra cui gli indirizzi IP.

Gli esseri umani preferiscono utilizzare nomi come:

```text
www.example.com
```

I dispositivi utilizzano gli indirizzi IP per comunicare.

Il DNS permette di effettuare la risoluzione dei nomi.

### 11.1 Come funziona una richiesta DNS?

Esempio:

```text
UTENTE
   |
   v
Browser: www.example.com
   |
   v
Resolver DNS
   |
   v
Ricerca dell'indirizzo IP
   |
   v
Risposta DNS
   |
   v
Connessione al server
```

Il resolver può utilizzare informazioni già presenti nella cache oppure interrogare altri server DNS.

### 11.2 Gerarchia DNS

Il DNS è organizzato gerarchicamente.

```text
              ROOT DNS
                 |
                 v
             TLD DNS
             (.com)
                 |
                 v
       DNS AUTORITATIVO
         (example.com)
                 |
                 v
          www.example.com
```

Le principali componenti sono:

- Root DNS server.
- TLD server.
- Authoritative DNS server.
- Recursive resolver.

### 11.3 Record DNS

Il DNS può restituire differenti tipologie di record.

| Record | Funzione |
| --- | --- |
| A | Associa un nome a un indirizzo IPv4 |
| AAAA | Associa un nome a un indirizzo IPv6 |
| CNAME | Definisce un alias |
| MX | Identifica i server di posta |
| NS | Identifica i server DNS autoritativi |
| TXT | Memorizza informazioni testuali |
| PTR | Utilizzato per la risoluzione inversa |

### 11.4 DNS e cybersecurity

Il DNS è un componente fondamentale dell'infrastruttura Internet, ma può essere coinvolto in diverse tipologie di attacco:

- DNS spoofing.
- DNS cache poisoning.
- DNS tunneling.
- Domain hijacking.
- Utilizzo di domini malevoli.
- Manipolazione delle risposte DNS.

Per migliorare la sicurezza si possono utilizzare:

- Resolver affidabili.
- DNSSEC, dove supportato.
- DNS over HTTPS (DoH).
- DNS over TLS (DoT).
- Monitoraggio delle richieste DNS.
- Filtri contro domini malevoli.

**Attenzione:** DNSSEC fornisce autenticità e integrità delle informazioni DNS attraverso firme digitali, ma non cifra le richieste DNS. DoH e DoT proteggono il trasporto delle richieste verso il resolver, ma non garantiscono da soli che il resolver sia affidabile.

---

## 12. Sicurezza delle comunicazioni

Le comunicazioni di rete possono essere esposte a diversi rischi.

### 12.1 Intercettazione del traffico

Un attaccante potrebbe riuscire a osservare il traffico scambiato tra due dispositivi.

Il rischio è particolarmente elevato quando vengono utilizzati protocolli non cifrati.

Esempi:

- HTTP.
- Telnet.
- FTP tradizionale.

Per proteggere le comunicazioni si utilizzano protocolli e meccanismi di cifratura.

Esempi:

- HTTPS.
- SSH.
- SFTP.
- TLS.
- VPN.

### 12.2 Man-in-the-Middle

Un attacco Man-in-the-Middle (MITM) si verifica quando un attaccante riesce a inserirsi nella comunicazione tra due soggetti.

Schema:

```text
CLIENT
   |
   |
ATTACCANTE
   |
   |
SERVER
```

L'attaccante può tentare di:

- Intercettare le comunicazioni.
- Modificare i dati.
- Impersonare uno dei soggetti.
- Raccogliere informazioni riservate.

Le contromisure comprendono:

- Utilizzo di HTTPS.
- Verifica dei certificati digitali.
- Utilizzo di protocolli sicuri.
- Protezione delle reti Wi-Fi.
- Autenticazione robusta.

### 12.3 ARP spoofing

ARP è un protocollo utilizzato nelle reti IPv4 per associare un indirizzo IP locale a un indirizzo MAC.

Un attaccante può tentare di inviare messaggi ARP contraffatti per associare il proprio MAC all'indirizzo IP di un altro dispositivo, ad esempio il gateway.

Questo può consentire l'intercettazione o la manipolazione del traffico locale.

Contromisure possibili:

- Dynamic ARP Inspection, negli switch compatibili.
- Segmentazione della rete.
- Protezione delle infrastrutture Layer 2.
- Monitoraggio delle associazioni IP-MAC.
- Utilizzo di protocolli cifrati end-to-end.

### 12.4 Port scanning

Il port scanning è un'attività che permette di individuare le porte aperte su un dispositivo.

Può essere utilizzato per:

- Verificare la configurazione di un sistema.
- Identificare servizi esposti.
- Effettuare attività di inventario.
- Rilevare potenziali vulnerabilità.

Può essere anche una fase di ricognizione da parte di un attaccante.

Per ridurre i rischi:

- Disabilitare i servizi non necessari.
- Limitare le porte accessibili.
- Applicare regole firewall.
- Monitorare le connessioni.
- Aggiornare i servizi esposti.

Le attività di scansione devono essere effettuate esclusivamente su sistemi propri o per i quali si dispone di autorizzazione.

---

## 13. Superficie di attacco e principio del minimo esposto

La superficie di attacco rappresenta l'insieme dei punti attraverso i quali un sistema può essere raggiunto o potenzialmente compromesso.

In una rete può comprendere:

- Porte aperte.
- Servizi in ascolto.
- Applicazioni Web.
- API.
- Interfacce di amministrazione.
- Accessi remoti.
- Dispositivi IoT.
- Servizi cloud.
- Protocolli non sicuri.

### 13.1 Esempio

Consideriamo un server Linux con i seguenti servizi:

| Porta | Servizio | Necessario? |
| ---: | --- | --- |
| 22 | SSH | Sì, per amministrazione remota |
| 80 | HTTP | Da valutare |
| 443 | HTTPS | Sì, per applicazione Web |
| 3306 | MySQL | Non deve essere pubblicamente accessibile |
| 5432 | PostgreSQL | Non deve essere pubblicamente accessibile |
| 8080 | Applicazione di test | No, se non necessaria |

Ogni servizio esposto rappresenta un potenziale punto di ingresso.

### 13.2 Principio del minimo privilegio

Ogni utente, applicazione o servizio dovrebbe disporre soltanto dei privilegi necessari per svolgere le proprie attività.

Applicato alle reti significa:

- Limitare gli accessi.
- Evitare servizi non necessari.
- Consentire soltanto le comunicazioni richieste.
- Separare le reti.
- Limitare l'accesso alle interfacce amministrative.

### 13.3 Segmentazione della rete

La segmentazione consiste nel suddividere una rete in zone differenti, applicando regole di comunicazione tra di esse.

Esempio:

```text
                  INTERNET
                     |
                  FIREWALL
                     |
          ___________|___________
         |           |           |
       VLAN 10     VLAN 20     VLAN 30
       UFFICI      SERVER       GUEST
         |           |           |
        PC         SERVER      OSPITI
```

Vantaggi:

- Riduzione della propagazione di un attacco.
- Separazione dei sistemi critici.
- Controllo degli accessi.
- Maggiore facilità di monitoraggio.
- Isolamento dei dispositivi meno affidabili.

La segmentazione non garantisce da sola la sicurezza: è necessario configurare correttamente le regole di comunicazione tra le zone.

---

## 14. Strumenti Linux per l'analisi delle reti

Linux mette a disposizione numerosi strumenti per analizzare configurazioni, indirizzi, connessioni e traffico di rete.

Questi strumenti sono importanti sia per l'amministrazione sistemistica sia per le attività di cybersecurity.

### 14.1 ip – Configurazione delle interfacce

Il comando `ip` permette di visualizzare e gestire le interfacce e gli indirizzi di rete.

Visualizzare le interfacce:

```bash
ip link show
```

Visualizzare gli indirizzi IP:

```bash
ip address show
```

Visualizzare le rotte:

```bash
ip route
```

Esempio di output:

```text
default via 192.168.1.1 dev enp2s0
192.168.1.0/24 dev enp2s0 proto kernel scope link
```

Interpretazione:

- `default`: rotta predefinita.
- `via 192.168.1.1`: gateway.
- `dev enp2s0`: interfaccia utilizzata.
- `192.168.1.0/24`: rete locale.

### 14.2 hostname

Visualizzare il nome del computer:

```bash
hostname
```

Visualizzare informazioni più complete:

```bash
hostnamectl
```

### 14.3 ping

Il comando `ping` verifica la raggiungibilità di un host attraverso messaggi ICMP Echo Request.

Esempio:

```bash
ping -c 4 8.8.8.8
```

Il parametro `-c 4` limita il numero di richieste a quattro.

È possibile verificare anche la raggiungibilità di un nome DNS:

```bash
ping -c 4 example.com
```

Il comando permette di osservare:

- Risposte ricevute.
- Pacchetti persi.
- Tempo di risposta.
- Eventuali problemi di connettività.

**Attenzione:** l'assenza di risposta a `ping` non dimostra necessariamente che un host sia spento o irraggiungibile. Il traffico ICMP potrebbe essere filtrato.

### 14.4 traceroute

Il comando `traceroute` permette di osservare il percorso seguito dai pacchetti verso una destinazione.

```bash
traceroute example.com
```

Se non installato:

```bash
sudo apt install traceroute
```

Il comando utilizza il meccanismo del TTL per individuare i nodi intermedi.

È utile per individuare:

- Problemi di instradamento.
- Nodi intermedi.
- Interruzioni del percorso.
- Eventuali anomalie di rete.

Il percorso osservato può variare e alcuni router possono non rispondere alle richieste utilizzate dallo strumento.

### 14.5 ss – Connessioni e porte

Il comando `ss` permette di visualizzare socket e connessioni di rete.

Visualizzare le porte in ascolto:

```bash
ss -tuln
```

Significato:

- `-t`: TCP.
- `-u`: UDP.
- `-l`: socket in ascolto.
- `-n`: visualizzazione numerica di indirizzi e porte.

Visualizzare anche i processi associati:

```bash
sudo ss -tulpn
```

Questo comando è particolarmente utile per individuare i servizi esposti.

### 14.6 ip neigh

Visualizzare la tabella dei vicini:

```bash
ip neigh
```

Il comando mostra le associazioni tra indirizzi IP e MAC conosciute dal sistema per la rete locale.

È utile per comprendere il funzionamento di ARP in IPv4 e Neighbor Discovery in IPv6.

### 14.7 dig

Il comando `dig` permette di interrogare i server DNS.

Esempio:

```bash
dig example.com
```

Richiedere un record IPv4:

```bash
dig example.com A
```

Richiedere un record IPv6:

```bash
dig example.com AAAA
```

Richiedere i server di posta:

```bash
dig example.com MX
```

Se non installato:

```bash
sudo apt install dnsutils
```

### 14.8 nslookup

Uno strumento alternativo per interrogare il DNS:

```bash
nslookup example.com
```

### 14.9 curl

`curl` permette di effettuare richieste verso servizi Web e API.

Esempio:

```bash
curl https://example.com
```

Visualizzare informazioni sulla richiesta:

```bash
curl -I https://example.com
```

Il parametro `-I` richiede gli header HTTP.

Esempio con un endpoint locale:

```bash
curl http://127.0.0.1:8000
```

### 14.10 tcpdump

`tcpdump` permette di catturare e analizzare pacchetti di rete.

Esempio:

```bash
sudo tcpdump -i any
```

Limitare la cattura a 10 pacchetti:

```bash
sudo tcpdump -i any -c 10
```

Osservare il traffico TCP:

```bash
sudo tcpdump -i any tcp
```

Osservare il traffico DNS:

```bash
sudo tcpdump -i any port 53
```

Per visualizzare il contenuto dei pacchetti in esadecimale e ASCII:

```bash
sudo tcpdump -i any -X
```

La cattura del traffico deve essere effettuata soltanto su reti e sistemi per i quali si dispone di autorizzazione.

### 14.11 Riepilogo dei comandi

| Comando | Funzione |
| --- | --- |
| `ip link` | Interfacce di rete |
| `ip addr` | Indirizzi IP |
| `ip route` | Tabella di routing |
| `ip neigh` | Tabella dei vicini |
| `hostnamectl` | Informazioni sul sistema |
| `ping` | Test di raggiungibilità |
| `traceroute` | Analisi del percorso |
| `ss` | Socket e connessioni |
| `dig` | Interrogazioni DNS |
| `nslookup` | Risoluzione DNS |
| `curl` | Richieste HTTP e HTTPS |
| `tcpdump` | Cattura del traffico |

---

## 15. Firewall Linux con UFW

UFW (Uncomplicated Firewall) è uno strumento che semplifica la gestione delle regole firewall su Ubuntu.

### 15.1 Verificare lo stato

```bash
sudo ufw status
```

### 15.2 Attivare il firewall

Prima di attivare il firewall, è importante verificare le regole e assicurarsi di non perdere l'accesso remoto.

Configurare una policy predefinita:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

Consentire SSH:

```bash
sudo ufw allow 22/tcp
```

Attivare:

```bash
sudo ufw enable
```

Verificare:

```bash
sudo ufw status verbose
```

### 15.3 Consentire un servizio specifico

Consentire HTTPS:

```bash
sudo ufw allow 443/tcp
```

Consentire HTTP:

```bash
sudo ufw allow 80/tcp
```

Consentire PostgreSQL soltanto da una rete autorizzata:

```bash
sudo ufw allow from 192.168.1.0/24 to any port 5432 proto tcp
```

Questa regola consente connessioni alla porta 5432 provenienti dalla rete indicata, ma è necessario verificare anche la configurazione del servizio e gli altri livelli di controllo.

### 15.4 Eliminare una regola

Visualizzare le regole numerate:

```bash
sudo ufw status numbered
```

Eliminare una regola:

```bash
sudo ufw delete NUMERO
```

### 15.5 Verificare la configurazione

```bash
sudo ufw status verbose
```

Un firewall configurato correttamente dovrebbe consentire soltanto i servizi necessari.

**Attenzione:** un firewall non sostituisce gli aggiornamenti, l'autenticazione robusta, la cifratura e la corretta configurazione dei servizi.

---

## 16. Laboratorio pratico Linux

### Obiettivo

Analizzare la configurazione di rete di una macchina Ubuntu e individuare i servizi in ascolto.

### Fase 1 – Identificazione del sistema

```bash
hostnamectl
```

Annotare:

- Nome del sistema.
- Sistema operativo.
- Architettura.
- Kernel.

### Fase 2 – Analisi delle interfacce

```bash
ip link show
```

Individuare:

- Nome delle interfacce.
- Stato operativo.
- Indirizzi MAC.

### Fase 3 – Analisi degli indirizzi IP

```bash
ip address show
```

Annotare:

- Indirizzo IPv4.
- Eventuale indirizzo IPv6.
- Interfaccia associata.
- Indirizzo di loopback.

### Fase 4 – Analisi delle rotte

```bash
ip route
```

Individuare:

- Rete locale.
- Gateway predefinito.
- Interfaccia utilizzata.

### Fase 5 – Test di connettività

```bash
ping -c 4 127.0.0.1
ping -c 4 8.8.8.8
ping -c 4 example.com
```

Confrontare i risultati.

Possibili interpretazioni:

- Se il loopback non funziona, potrebbe esserci un problema locale.
- Se l'indirizzo IP pubblico non risponde, potrebbero esserci problemi di connettività o filtri ICMP.
- Se il nome DNS non viene risolto, potrebbe esserci un problema DNS.

Non considerare il mancato funzionamento di un singolo test come prova definitiva di un guasto.

### Fase 6 – Analisi DNS

```bash
dig example.com
```

Annotare:

- Server DNS interrogato.
- Indirizzo restituito.
- Tempo di risposta.
- Eventuale TTL.

### Fase 7 – Analisi delle porte

```bash
ss -tulpn
```

Individuare:

- Servizi TCP in ascolto.
- Servizi UDP.
- Porte utilizzate.
- Processi associati.

### Fase 8 – Analisi del traffico

```bash
sudo tcpdump -i any -c 20
```

Osservare i pacchetti catturati.

Ripetere filtrando il traffico DNS:

```bash
sudo tcpdump -i any port 53 -c 10
```

### Fase 9 – Analisi firewall

```bash
sudo ufw status verbose
```

Verificare:

- Stato del firewall.
- Policy predefinite.
- Regole attive.
- Porte consentite.

---

## 17. Esercitazioni autonome

### Esercitazione 1 – Analisi della rete locale

Utilizzando una macchina Ubuntu, raccogliere le seguenti informazioni:

1. Nome dell'interfaccia di rete attiva.
2. Indirizzo MAC.
3. Indirizzo IPv4.
4. Eventuale indirizzo IPv6.
5. Gateway predefinito.
6. Indirizzo della rete locale.
7. Server DNS utilizzato.

Produrre una tabella riepilogativa.

### Esercitazione 2 – Analisi dei servizi esposti

Utilizzare:

```bash
ss -tulpn
```

Individuare almeno tre servizi in ascolto, se presenti.

Per ciascuno indicare:

- Protocollo.
- Indirizzo di ascolto.
- Porta.
- Processo associato.
- Funzione del servizio.
- Necessità o meno di esposizione sulla rete.

Distinguere tra servizi in ascolto su `127.0.0.1`, su un indirizzo specifico e su `0.0.0.0`.

### Esercitazione 3 – DNS

Utilizzare `dig` per interrogare un dominio a scelta.

Eseguire:

```bash
dig dominio.example A
dig dominio.example AAAA
dig dominio.example MX
dig dominio.example NS
```

Sostituire `dominio.example` con un dominio reale.

Rispondere:

1. Qual è l'indirizzo IPv4 restituito?
2. È presente un indirizzo IPv6?
3. Quali server gestiscono la posta?
4. Quali sono i server DNS autoritativi?
5. Che cosa rappresenta il TTL?

### Esercitazione 4 – Firewall e riduzione della superficie esposta

In un ambiente di laboratorio autorizzato:

1. Verificare lo stato del firewall.
2. Individuare le porte in ascolto.
3. Identificare un servizio non necessario.
4. Valutare se sia possibile disabilitarlo.
5. Configurare una regola firewall coerente con le necessità del sistema.
6. Verificare nuovamente le porte e le regole.

Documentare le modifiche e i risultati.

### Esercitazione 5 – Progettazione di una rete sicura

Progettare la rete di una piccola organizzazione composta da:

- 10 postazioni di lavoro.
- 2 server.
- 1 stampante di rete.
- 1 access point.
- 1 router.
- 1 firewall.

Definire:

1. Tipologia di rete.
2. Indirizzamento IPv4.
3. Gateway.
4. Segmentazione in almeno due reti.
5. Servizi che devono essere raggiungibili.
6. Regole firewall principali.
7. Misure per proteggere la rete Wi-Fi.

Produrre uno schema logico della rete.

---

## 18. Caso applicativo: protezione di un server Web

Consideriamo un server Linux che ospita un'applicazione Web realizzata con FastAPI.

L'applicazione è in ascolto sulla porta 8000.

### 18.1 Configurazione non ottimale

```text
INTERNET
   |
   v
SERVER
   |
   |-- Porta 22: SSH
   |-- Porta 80: HTTP
   |-- Porta 443: HTTPS
   |-- Porta 8000: FastAPI
   |-- Porta 5432: PostgreSQL
```

In questa configurazione diversi servizi potrebbero essere raggiungibili dall'esterno.

### 18.2 Configurazione migliorata

```text
                  INTERNET
                     |
                     v
                  FIREWALL
                     |
                  HTTPS/443
                     |
                     v
                REVERSE PROXY
                     |
                     v
                FASTAPI/8000
                     |
                     v
               POSTGRESQL/5432
```

Possibili miglioramenti:

- Esporre pubblicamente soltanto HTTPS.
- Utilizzare un reverse proxy.
- Mantenere FastAPI accessibile soltanto localmente o attraverso una rete interna.
- Consentire PostgreSQL soltanto ai sistemi autorizzati.
- Limitare SSH a indirizzi IP o reti amministrative.
- Utilizzare autenticazione robusta.
- Applicare aggiornamenti di sicurezza.
- Monitorare i log.
- Configurare backup e procedure di ripristino.

### 18.3 Esempio di regole firewall

Un esempio semplificato con UFW:

```bash
# Blocca le connessioni in ingresso per default
sudo ufw default deny incoming

# Consente le connessioni in uscita
sudo ufw default allow outgoing

# Consente HTTPS
sudo ufw allow 443/tcp

# Consente SSH soltanto dalla rete amministrativa
sudo ufw allow from 192.168.1.0/24 to any port 22 proto tcp
```

In questo scenario:

- HTTPS è esposto agli utenti.
- SSH è accessibile soltanto dalla rete amministrativa.
- FastAPI non deve essere esposto direttamente se viene raggiunto dal reverse proxy attraverso localhost o una rete interna.
- PostgreSQL non deve essere pubblicamente accessibile.

La configurazione effettiva deve essere coerente con le interfacce, gli indirizzi e le regole di rete realmente presenti.

---

## 19. Domande di autovalutazione

1. Che cos'è una rete informatica?
2. Qual è la differenza tra LAN e WAN?
3. Qual è la funzione di uno switch?
4. Qual è la differenza tra switch e router?
5. Che cosa fa un firewall?
6. Che cosa rappresenta un indirizzo MAC?
7. Quanti bit contiene un indirizzo IPv4?
8. Quanti bit contiene un indirizzo IPv6?
9. Che cosa rappresenta la subnet mask?
10. Che cos'è il gateway predefinito?
11. Qual è la differenza tra indirizzo pubblico e privato?
12. Qual è la funzione del protocollo TCP?
13. Qual è la differenza tra TCP e UDP?
14. Che cosa rappresenta una porta di comunicazione?
15. Qual è la differenza tra indirizzo IP e porta?
16. Che cosa fa il DNS?
17. Qual è la differenza tra record A e AAAA?
18. Che cosa si intende per Man-in-the-Middle?
19. Che cosa rappresenta la superficie di attacco?
20. Perché è importante disabilitare i servizi non necessari?
21. Qual è la funzione del comando `ss -tulpn`?
22. A cosa serve `ip route`?
23. Qual è la differenza tra `ping` e `traceroute`?
24. Perché un servizio in ascolto su `0.0.0.0` può rappresentare un rischio?
25. Perché un firewall non è sufficiente, da solo, a garantire la sicurezza di un server?

---

## 20. Riepilogo

| Argomento | Concetto fondamentale |
| --- | --- |
| LAN | Rete locale |
| WAN | Rete geografica estesa |
| Switch | Collega dispositivi nella rete locale |
| Router | Instrada pacchetti tra reti |
| Firewall | Filtra le comunicazioni |
| MAC | Identificativo di livello Data Link |
| IPv4 | Indirizzo IP a 32 bit |
| IPv6 | Indirizzo IP a 128 bit |
| TCP | Trasporto affidabile e orientato alla connessione |
| UDP | Trasporto senza connessione e senza garanzia di consegna |
| Porta | Identifica un endpoint logico di comunicazione |
| DNS | Risoluzione dei nomi |
| HTTPS | Comunicazione Web protetta tramite TLS |
| SSH | Accesso remoto sicuro |
| UFW | Gestione semplificata del firewall Linux |
| Superficie di attacco | Insieme dei punti potenzialmente esposti |

### Concetti da ricordare

- Una rete permette ai dispositivi di comunicare e condividere risorse.
- Gli switch collegano dispositivi nella stessa rete locale.
- I router permettono la comunicazione tra reti differenti.
- Gli indirizzi MAC vengono utilizzati nel collegamento locale.
- Gli indirizzi IP identificano logicamente le interfacce di rete.
- TCP e UDP sono protocolli di trasporto con caratteristiche differenti.
- Le porte identificano gli endpoint logici dei servizi.
- Il DNS permette di risolvere nomi di dominio.
- I protocolli cifrati proteggono la riservatezza e l'integrità delle comunicazioni.
- Il firewall controlla il traffico in ingresso e in uscita.
- Ridurre i servizi esposti significa ridurre la superficie di attacco.

---

## 21. Collegamenti ai moduli successivi

**Modulo 02 – Logica e algoritmi**

- Rappresentazione dei dati.
- Elaborazione delle informazioni.
- Algoritmi per analizzare dati di rete.

**Modulo 03 – Python**

- Programmazione di client e server.
- Gestione delle connessioni.
- Utilizzo delle librerie di rete.
- Elaborazione di dati e log.

**Modulo 04 – Bash scripting**

- Diagnostica di rete.
- Automazione dei controlli.
- Analisi delle porte.
- Monitoraggio dei servizi.

**Modulo 05 – Database e SQL**

- Comunicazione tra applicazioni e database.
- Accesso ai database attraverso la rete.
- Protezione delle connessioni.

**Modulo 06 – Backend e API**

- Architettura client-server.
- HTTP e HTTPS.
- API REST.
- FastAPI.
- Autenticazione e autorizzazione.

**Modulo 07 – Cybersecurity**

- Analisi del traffico di rete.
- Firewall e segmentazione.
- Scansione delle porte.
- Hardening dei servizi.
- Analisi delle comunicazioni sospette.
- Riduzione della superficie di attacco.

### Risorse e documentazione

- IETF – RFC 791, Internet Protocol: <https://www.rfc-editor.org/rfc/rfc791>
- IETF – RFC 8200, IPv6 Specification: <https://www.rfc-editor.org/rfc/rfc8200>
- IETF – RFC 9293, Transmission Control Protocol: <https://www.rfc-editor.org/rfc/rfc9293>
- IETF – RFC 768, User Datagram Protocol: <https://www.rfc-editor.org/rfc/rfc768>
- IETF – RFC 1034, Domain Names: Concepts and Facilities: <https://www.rfc-editor.org/rfc/rfc1034>
- IETF – RFC 1035, Domain Names: Implementation and Specification: <https://www.rfc-editor.org/rfc/rfc1035>
- Ubuntu – Firewall: <https://documentation.ubuntu.com/server/how-to/security/firewalls/>
- Linux – ip manual: <https://man7.org/linux/man-pages/man8/ip.8.html>
- Linux – ss manual: <https://man7.org/linux/man-pages/man8/ss.8.html>
- Wireshark – Documentation: <https://www.wireshark.org/docs/>
- OWASP – Network Segmentation: <https://owasp.org/>
- NIST – Guide to Firewalls and Firewall Policy: <https://csrc.nist.gov/pubs/sp/800/41/r1/final>
