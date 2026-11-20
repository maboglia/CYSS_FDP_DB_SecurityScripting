# Esercitazione 04 – Rete e indirizzi IP

## 1. Obiettivi dell'esercitazione

L'obiettivo è comprendere come un computer si collega a una rete e come il sistema operativo gestisce indirizzi IP, interfacce, routing, DNS e connessioni locali.

Al termine dell'esercitazione lo studente sarà in grado di:

- Identificare le interfacce di rete presenti nel proprio computer.
- Rilevare indirizzi IPv4 e IPv6.
- Comprendere il significato di indirizzo IP, subnet mask e gateway.
- Consultare la tabella di routing.
- Comprendere il funzionamento della risoluzione DNS.
- Verificare la risoluzione dei nomi di dominio.
- Identificare le porte TCP e UDP in ascolto.
- Distinguere un indirizzo IP da un indirizzo MAC.
- Utilizzare strumenti Linux e Windows per analizzare la configurazione di rete.
- Interpretare alcune informazioni utili per una prima attività di troubleshooting.

## 2. Ambiente di lavoro e regole di sicurezza

L'esercitazione può essere svolta utilizzando:

| Sistema operativo | Ambiente       | Strumenti                                                                           |
| ----------------- | -------------- | ----------------------------------------------------------------------------------- |
| Ubuntu / Linux    | Terminale Bash | `ip`, `getent`, `ss`                                                                |
| Windows 10/11     | PowerShell     | `Get-NetIPConfiguration`, `Get-NetRoute`, `Resolve-DnsName`, `Get-NetTCPConnection` |

Non è necessario installare software aggiuntivo.

**Regola fondamentale:** tutte le attività devono essere svolte esclusivamente sul proprio computer, sulla propria rete domestica o su infrastrutture per le quali si dispone di un'autorizzazione esplicita.

Durante l'esercitazione:

- Non effettuare scansioni di reti di terzi.
- Non tentare connessioni verso dispositivi non autorizzati.
- Non modificare la configurazione di rete senza autorizzazione.
- Non disabilitare firewall o sistemi di protezione.
- Non condividere pubblicamente indirizzi IP, nomi host o altre informazioni identificative della propria rete.

Le attività previste sono di tipo osservativo e diagnostico.

---

## 3. Parte A – Identificazione delle interfacce di rete

### 3.1 Che cos'è un'interfaccia di rete?

Un'interfaccia di rete è un componente hardware o virtuale attraverso il quale un dispositivo comunica con una rete.

Esempi:

- Scheda Ethernet.
- Scheda Wi-Fi.
- Interfaccia di loopback.
- Interfaccia VPN.
- Interfaccia virtuale creata da Docker o da altre piattaforme di virtualizzazione.

Ogni interfaccia può avere una propria configurazione di rete.

Le informazioni principali sono:

| Informazione     | Descrizione                                |
| ---------------- | ------------------------------------------ |
| Nome interfaccia | Identificativo dell'interfaccia            |
| Indirizzo IPv4   | Indirizzo IP a 32 bit                      |
| Indirizzo IPv6   | Indirizzo IP a 128 bit                     |
| MAC Address      | Indirizzo hardware dell'interfaccia        |
| Stato            | Attiva o non attiva                        |
| Gateway          | Nodo utilizzato per raggiungere altre reti |

### 3.2 Ambiente Linux – Ubuntu

Aprire il terminale ed eseguire:

```bash
# Visualizza tutte le interfacce di rete
ip link show

# Visualizza indirizzi IPv4 e IPv6
ip addr show

# Visualizza una versione sintetica delle interfacce
ip -br addr
```

Esempio di output:

```text
lo               UNKNOWN        127.0.0.1/8 ::1/128
enp3s0           DOWN
wlp2s0           UP             192.168.1.25/24
```

Significato:

- `lo`: interfaccia di loopback.
- `enp3s0`: possibile interfaccia Ethernet.
- `wlp2s0`: possibile interfaccia Wi-Fi.
- `UP`: interfaccia attiva.
- `DOWN`: interfaccia non attiva.

I nomi delle interfacce possono cambiare in base all'hardware e alla configurazione del sistema.

Per visualizzare anche gli indirizzi MAC:

```bash
ip link show
```

Cercare il campo `link/ether`.

### 3.3 Ambiente Windows – PowerShell

Aprire PowerShell ed eseguire:

```powershell
# Visualizza le schede di rete
Get-NetAdapter
```

Per visualizzare informazioni dettagliate:

```powershell
Get-NetIPConfiguration
```

Per visualizzare gli indirizzi IP:

```powershell
Get-NetIPAddress |
    Select-Object InterfaceAlias, AddressFamily, IPAddress, PrefixLength
```

Per visualizzare gli indirizzi MAC:

```powershell
Get-NetAdapter |
    Select-Object Name, InterfaceDescription, MacAddress, Status
```

In alternativa, utilizzare:

```powershell
ipconfig /all
```

Questo comando mostra:

- Nome della scheda.
- Indirizzo IPv4.
- Subnet mask.
- Gateway predefinito.
- Server DNS.
- Indirizzo fisico (MAC).

### 3.4 Attività

1. Individuare tutte le interfacce di rete presenti.
2. Identificare l'interfaccia utilizzata per collegarsi a Internet o alla rete locale.
3. Rilevare l'indirizzo IPv4.
4. Verificare se è presente un indirizzo IPv6.
5. Individuare il MAC Address.
6. Verificare lo stato dell'interfaccia.

Completare la tabella:

| Informazione               | Valore rilevato |
| -------------------------- | --------------- |
| Nome interfaccia           |                 |
| Tipologia (Ethernet/Wi-Fi) |                 |
| Stato                      |                 |
| Indirizzo IPv4             |                 |
| Indirizzo IPv6             |                 |
| MAC Address                |                 |

### 3.5 Domande

1. Che cos'è un'interfaccia di rete?
2. Qual è la differenza tra Ethernet e Wi-Fi?
3. Che cosa rappresenta un MAC Address?
4. Qual è la differenza tra indirizzo IP e MAC Address?
5. A che cosa serve l'interfaccia di loopback?
6. Perché un computer può avere più interfacce di rete?

---

## 4. Parte B – Analisi degli indirizzi IP

### 4.1 Che cos'è un indirizzo IP?

Un indirizzo IP identifica un'interfaccia all'interno di una rete che utilizza il protocollo IP.

Le due versioni principali sono:

- IPv4.
- IPv6.

### 4.2 IPv4

IPv4 utilizza indirizzi composti da 32 bit.

Un indirizzo viene normalmente rappresentato attraverso quattro numeri decimali separati da punti.

Esempio:

```text
192.168.1.25
```

Ogni numero rappresenta un byte e può assumere un valore compreso tra 0 e 255.

Un indirizzo IPv4 può essere rappresentato in forma binaria:

```text
192       .168       .1         .25

11000000  .10101000  .00000001  .00011001
```

### 4.3 Subnet mask e prefisso CIDR

La subnet mask permette di distinguere la parte di rete dalla parte destinata agli host.

Esempio:

```text
Indirizzo IP:  192.168.1.25
Subnet mask:   255.255.255.0
Prefisso CIDR: /24
```

La notazione `/24` indica che i primi 24 bit identificano la rete.

In questo esempio:

- Indirizzo di rete: `192.168.1.0`
- Indirizzo host: `192.168.1.25`
- Broadcast IPv4: `192.168.1.255`

La quantità di indirizzi disponibili per gli host dipende dalla dimensione della subnet e dalle regole di indirizzamento applicabili.

### 4.4 Indirizzi IPv4 privati

Alcuni intervalli IPv4 sono riservati alle reti private.

| Intervallo                    | Prefisso       |
| ----------------------------- | -------------- |
| 10.0.0.0 – 10.255.255.255     | 10.0.0.0/8     |
| 172.16.0.0 – 172.31.255.255   | 172.16.0.0/12  |
| 192.168.0.0 – 192.168.255.255 | 192.168.0.0/16 |

Questi indirizzi vengono utilizzati comunemente nelle reti domestiche e aziendali.

Non sono direttamente instradabili su Internet pubblico.

### 4.5 IPv6

IPv6 utilizza indirizzi composti da 128 bit.

Esempio:

```text
2001:db8:1234:0000:0000:0000:0000:0001
```

Può essere abbreviato eliminando gli zeri iniziali dei gruppi e comprimendo una sequenza di gruppi a zero:

```text
2001:db8:1234::1
```

L'intervallo `2001:db8::/32` è riservato alla documentazione e viene utilizzato negli esempi.

### 4.6 Attività

Sulla base dell'indirizzo IP rilevato nella Parte A:

1. Identificare se si tratta di IPv4 o IPv6.
2. Individuare il prefisso CIDR.
3. Verificare se l'indirizzo IPv4 appartiene a un intervallo privato.
4. Individuare la subnet mask, se disponibile.
5. Spiegare quale parte dell'indirizzo identifica la rete.
6. Spiegare quale parte identifica l'interfaccia all'interno della rete.

Completare la tabella:

| Informazione                 | Valore |
| ---------------------------- | ------ |
| Indirizzo IPv4               |        |
| Subnet mask / prefisso       |        |
| Indirizzo di rete            |        |
| Gateway                      |        |
| Indirizzo privato o pubblico |        |
| Eventuale indirizzo IPv6     |        |

**Nota:** per individuare l'indirizzo di rete e il broadcast è necessario conoscere il prefisso della subnet. Non tutti gli indirizzi IPv4 utilizzano una maschera `/24`.

### 4.7 Domande

1. Quanti bit compongono un indirizzo IPv4?
2. Quanti bit compongono un indirizzo IPv6?
3. Che cosa indica il prefisso `/24`?
4. Qual è la differenza tra indirizzo privato e pubblico?
5. Che cosa rappresenta l'indirizzo di broadcast?
6. Perché IPv6 utilizza indirizzi più lunghi rispetto a IPv4?

---

## 5. Parte C – Analisi del routing

### 5.1 Che cos'è il routing?

Il routing è il processo attraverso il quale un dispositivo determina il percorso da utilizzare per raggiungere una destinazione IP.

Ogni computer dispone di una tabella di routing che contiene informazioni sulle reti raggiungibili e sulle interfacce da utilizzare.

Un elemento importante è il gateway predefinito.

Il gateway è il dispositivo al quale il computer invia i pacchetti destinati a reti non raggiungibili direttamente attraverso le rotte più specifiche disponibili.

Nelle reti domestiche il gateway è spesso il router utilizzato per collegarsi a Internet.

### 5.2 Ambiente Linux – Ubuntu

Per visualizzare la tabella di routing:

```bash
# Visualizza la tabella di routing IPv4
ip route
```

Per visualizzare anche le rotte IPv6:

```bash
ip -6 route
```

Esempio:

```text
default via 192.168.1.1 dev wlp2s0
192.168.1.0/24 dev wlp2s0 proto kernel scope link
```

Interpretazione:

- `default`: rotta predefinita.
- `via 192.168.1.1`: gateway.
- `dev wlp2s0`: interfaccia utilizzata.
- `192.168.1.0/24`: rete locale direttamente raggiungibile.

Per verificare quale percorso verrebbe utilizzato per raggiungere una destinazione:

```bash
ip route get 1.1.1.1
```

Il comando consulta la tabella di routing locale e mostra il percorso selezionato.

### 5.3 Ambiente Windows – PowerShell

Per visualizzare la tabella di routing:

```powershell
Get-NetRoute -AddressFamily IPv4
```

Per visualizzare le rotte IPv6:

```powershell
Get-NetRoute -AddressFamily IPv6
```

Per visualizzare il gateway e le informazioni sulle interfacce:

```powershell
Get-NetIPConfiguration
```

Per una rappresentazione sintetica della tabella di routing:

```powershell
route print
```

Per verificare il percorso verso una destinazione:

```powershell
Test-NetConnection 1.1.1.1 -InformationLevel Detailed
```

Questo comando esegue una verifica di connettività e mostra alcune informazioni sul percorso e sull'interfaccia utilizzata.

### 5.4 Attività

1. Visualizzare la tabella di routing.
2. Individuare la rotta predefinita.
3. Identificare il gateway.
4. Individuare l'interfaccia utilizzata per raggiungere il gateway.
5. Individuare almeno una rotta relativa a una rete direttamente connessa.
6. Verificare quale percorso viene selezionato per una destinazione esterna.

Completare la tabella:

| Informazione               | Valore rilevato |
| -------------------------- | --------------- |
| Gateway predefinito        |                 |
| Interfaccia utilizzata     |                 |
| Rete locale                |                 |
| Prefisso della rete        |                 |
| Rotta predefinita presente | Sì / No         |

### 5.5 Domande

1. Che cosa si intende per routing?
2. A che cosa serve una tabella di routing?
3. Che cos'è il gateway predefinito?
4. Qual è la differenza tra una rotta locale e una rotta predefinita?
5. Perché un computer deve conoscere il gateway per comunicare con reti esterne?

---

## 6. Parte D – Analisi della risoluzione DNS

### 6.1 Che cos'è il DNS?

Il DNS (Domain Name System) è un sistema distribuito che permette di associare nomi di dominio a informazioni di rete, tra cui gli indirizzi IP.

Esempio:

```text
www.example.com
```

Il sistema DNS può restituire uno o più indirizzi IP associati al nome richiesto.

Il DNS evita agli utenti di dover ricordare gli indirizzi IP dei servizi che utilizzano.

### 6.2 Processo di risoluzione DNS

In forma semplificata:

1. Un'applicazione richiede la risoluzione di un nome.
2. Il sistema verifica le informazioni disponibili nella cache e nei meccanismi locali di risoluzione.
3. Se necessario, viene interrogato un resolver DNS.
4. Il resolver restituisce le informazioni richieste.
5. L'applicazione utilizza l'indirizzo IP ottenuto per comunicare con la destinazione.

I record DNS più comuni sono:

| Record | Funzione                                                                                     |
| ------ | -------------------------------------------------------------------------------------------- |
| A      | Associa un nome a un indirizzo IPv4                                                          |
| AAAA   | Associa un nome a un indirizzo IPv6                                                          |
| MX     | Identifica i server di posta                                                                 |
| CNAME  | Definisce un alias                                                                           |
| NS     | Identifica i server DNS autorevoli                                                           |
| TXT    | Contiene informazioni testuali, utilizzate anche per verifiche e configurazioni di sicurezza |

### 6.3 Ambiente Linux – Ubuntu

Il comando `getent` permette di interrogare i database di sistema, incluso quello utilizzato per la risoluzione dei nomi.

Per verificare la risoluzione di un dominio:

```bash
getent hosts example.com
```

Per verificare un altro dominio:

```bash
getent hosts www.wikipedia.org
```

Per visualizzare la configurazione DNS utilizzata dal sistema:

```bash
cat /etc/resolv.conf
```

Su Ubuntu la gestione DNS può essere affidata a systemd-resolved o ad altri servizi di rete. Il file `/etc/resolv.conf` può essere un collegamento simbolico o un file gestito automaticamente.

Se è disponibile systemd-resolved:

```bash
resolvectl status
```

Per verificare le informazioni di risoluzione:

```bash
resolvectl query example.com
```

### 6.4 Ambiente Windows – PowerShell

Per verificare la risoluzione DNS:

```powershell
Resolve-DnsName example.com
```

Per interrogare un record IPv4:

```powershell
Resolve-DnsName example.com -Type A
```

Per interrogare un record IPv6:

```powershell
Resolve-DnsName example.com -Type AAAA
```

Per visualizzare i server DNS configurati:

```powershell
Get-DnsClientServerAddress
```

Per visualizzare la cache DNS locale:

```powershell
Get-DnsClientCache
```

In alternativa, dal Prompt dei comandi:

```cmd
ipconfig /all
```

### 6.5 Attività

Eseguire le verifiche sui seguenti domini pubblici:

- `example.com`
- `wikipedia.org`
- `ubuntu.com`

Per ciascun dominio:

1. Verificare se la risoluzione DNS ha esito positivo.
2. Individuare gli indirizzi IPv4 restituiti, se presenti.
3. Verificare la presenza di record IPv6.
4. Annotare eventuali differenze tra i risultati.
5. Identificare i server DNS configurati sul proprio computer.

Completare la tabella:

| Dominio       | Risoluzione riuscita | Indirizzo IPv4 | Indirizzo IPv6 |
| ------------- | -------------------- | -------------- | -------------- |
| example.com   |                      |                |                |
| wikipedia.org |                      |                |                |
| ubuntu.com    |                      |                |                |

Gli indirizzi restituiti possono cambiare in base al momento, al resolver DNS e alla distribuzione geografica dei servizi.

### 6.6 Domande

1. Che cosa significa DNS?
2. Perché è necessario il DNS?
3. Qual è la differenza tra record A e AAAA?
4. A che cosa serve un record MX?
5. Che cosa succede quando un nome di dominio non viene risolto?
6. Qual è la differenza tra un nome di dominio e un indirizzo IP?

---

## 7. Parte E – Analisi delle porte e dei socket locali

### 7.1 Che cos'è una porta di rete?

Una porta è un identificativo numerico utilizzato dai protocolli di trasporto TCP e UDP per distinguere i servizi e le comunicazioni associate a un dispositivo.

Gli indirizzi IP identificano le interfacce di rete, mentre le porte permettono di identificare gli endpoint di comunicazione.

Esempi di porte comunemente utilizzate:

| Porta | Protocollo | Servizio                          |
| ----: | ---------- | --------------------------------- |
|    22 | TCP        | SSH                               |
|    53 | TCP/UDP    | DNS                               |
|    80 | TCP        | HTTP                              |
|   443 | TCP        | HTTPS                             |
|  3306 | TCP        | MySQL                             |
|  5432 | TCP        | PostgreSQL                        |
|  8000 | TCP        | Spesso utilizzata in sviluppo web |

Le associazioni indicate sono convenzionali: una porta può essere utilizzata anche da applicazioni differenti.

### 7.2 Che cos'è un socket?

Un socket è un endpoint di comunicazione utilizzato dalle applicazioni.

Un socket di rete può essere identificato attraverso informazioni come:

- Protocollo.
- Indirizzo IP locale.
- Porta locale.
- Indirizzo IP remoto.
- Porta remota.
- Stato della connessione.

È importante distinguere:

- **Listening:** un servizio è in attesa di connessioni.
- **Established:** una connessione TCP è stata stabilita.
- **Closed:** la connessione non è attiva.

### 7.3 Ambiente Linux – Ubuntu

Il comando `ss` permette di visualizzare informazioni sui socket.

Per visualizzare le porte TCP e UDP in ascolto:

```bash
ss -tuln
```

Significato delle opzioni:

| Opzione | Significato                       |
| ------- | --------------------------------- |
| `-t`    | Socket TCP                        |
| `-u`    | Socket UDP                        |
| `-l`    | Socket in ascolto                 |
| `-n`    | Mostra indirizzi e porte numerici |

Per visualizzare anche i processi associati:

```bash
sudo ss -tulnp
```

Per visualizzare le connessioni TCP stabilite:

```bash
ss -tn state established
```

Per visualizzare tutte le connessioni TCP:

```bash
ss -tan
```

### 7.4 Ambiente Windows – PowerShell

Per visualizzare le connessioni TCP:

```powershell
Get-NetTCPConnection
```

Per visualizzare soltanto le porte in ascolto:

```powershell
Get-NetTCPConnection -State Listen
```

Per visualizzare le connessioni TCP stabilite:

```powershell
Get-NetTCPConnection -State Established
```

Per visualizzare le informazioni principali:

```powershell
Get-NetTCPConnection |
    Select-Object LocalAddress, LocalPort,
                  RemoteAddress, RemotePort, State, OwningProcess
```

Per associare un PID al nome del processo:

```powershell
Get-Process -Id PID
```

Sostituire `PID` con il valore rilevato nella colonna `OwningProcess`.

Per visualizzare anche le porte UDP:

```powershell
Get-NetUDPEndpoint
```

In alternativa, utilizzare il Prompt dei comandi:

```cmd
netstat -ano
```

Per visualizzare le porte in ascolto:

```cmd
netstat -ano | findstr LISTENING
```

### 7.5 Attività

1. Visualizzare le porte TCP in ascolto.
2. Visualizzare le porte UDP locali.
3. Individuare almeno tre porte in ascolto, se presenti.
4. Identificare gli indirizzi IP locali associati.
5. Individuare i PID dei processi che utilizzano le porte.
6. Identificare i programmi associati, quando possibile.
7. Verificare se sono presenti connessioni TCP stabilite.

Completare la tabella:

| Protocollo | Indirizzo locale | Porta | Stato | Processo |
| ---------- | ---------------- | ----: | ----- | -------- |
|            |                  |       |       |          |
|            |                  |       |       |          |
|            |                  |       |       |          |
|            |                  |       |       |          |

Se non sono presenti tre porte in ascolto, riportare quelle effettivamente rilevate senza avviare servizi non necessari.

### 7.6 Domande

1. Che cos'è una porta di rete?
2. Qual è la differenza tra indirizzo IP e porta?
3. Che cosa significa che una porta è in ascolto?
4. Qual è la differenza tra TCP e UDP?
5. Che cosa rappresenta lo stato `ESTABLISHED`?
6. Perché è importante conoscere i servizi che ascoltano sulle interfacce di rete?
7. Perché una porta aperta non rappresenta necessariamente una vulnerabilità?

---

## 8. Parte F – Verifica della connettività

Questa parte permette di verificare se il computer riesce a comunicare con altri dispositivi e servizi.

Le verifiche devono essere effettuate esclusivamente verso destinazioni pubbliche o dispositivi autorizzati.

### 8.1 Verifica con ping

Il comando `ping` utilizza messaggi ICMP Echo Request ed Echo Reply per verificare la raggiungibilità di una destinazione.

#### Linux

```bash
ping -c 4 1.1.1.1
```

Per verificare un nome di dominio:

```bash
ping -c 4 example.com
```

#### Windows

```powershell
ping -n 4 1.1.1.1
```

Per verificare un nome di dominio:

```powershell
ping -n 4 example.com
```

Osservare:

- Numero di pacchetti inviati.
- Numero di risposte ricevute.
- Eventuali pacchetti persi.
- Tempo medio di risposta.

**Nota:** un mancato risultato non dimostra necessariamente che una destinazione sia irraggiungibile. Alcuni sistemi o firewall filtrano le richieste ICMP.

### 8.2 Verifica del percorso

È possibile osservare il percorso seguito dai pacchetti verso una destinazione.

#### Linux

```bash
traceroute example.com
```

Il comando potrebbe non essere installato. In alternativa, utilizzare:

```bash
tracepath example.com
```

#### Windows

```powershell
tracert example.com
```

Il risultato mostra i nodi intermedi rilevati lungo il percorso.

Alcuni nodi possono non rispondere alle richieste di diagnostica: ciò non significa necessariamente che il percorso sia interrotto.

### 8.3 Attività

1. Verificare la raggiungibilità di `1.1.1.1`.
2. Verificare la risoluzione e la raggiungibilità di `example.com`.
3. Annotare il tempo medio di risposta, se disponibile.
4. Eseguire una verifica del percorso verso `example.com`.
5. Confrontare i risultati.

Completare la tabella:

| Destinazione | Risposta | Pacchetti persi | Tempo medio |
| ------------ | -------- | --------------: | ----------: |
| 1.1.1.1      |          |                 |             |
| example.com  |          |                 |             |

### 8.4 Domande

1. A che cosa serve il comando ping?
2. Quale protocollo utilizza ping?
3. Che cosa rappresenta il tempo di risposta?
4. Che cosa significa packet loss?
5. Perché un dispositivo potrebbe non rispondere a ping pur essendo raggiungibile tramite altri protocolli?
6. A che cosa serve traceroute?

---

## 9. Parte G – Analisi e riflessione sulla sicurezza

Le informazioni raccolte durante l'esercitazione possono essere utilizzate per una prima valutazione della superficie di rete di un dispositivo.

Una superficie di rete comprende le interfacce, i servizi e i punti di comunicazione attraverso i quali un sistema può interagire con altri dispositivi.

Rispondere alle seguenti domande:

1. Quante interfacce di rete sono presenti nel computer?
2. Quale interfaccia viene utilizzata per la connessione principale?
3. Quali indirizzi IP sono configurati?
4. Qual è il gateway predefinito?
5. Quali server DNS vengono utilizzati?
6. Quali porte risultano in ascolto?
7. Quali processi sono associati alle porte rilevate?
8. Sono presenti servizi che non si conoscono?
9. Quali servizi potrebbero richiedere una verifica?
10. Perché è importante limitare i servizi esposti sulla rete?

### Riflessione cybersecurity

Considerare il seguente scenario:

Un computer aziendale dispone di:

- Una connessione Ethernet.
- Una connessione Wi-Fi.
- Un servizio SSH attivo.
- Un server web locale.
- Un database in ascolto su una porta TCP.

Rispondere:

1. Quali informazioni devono essere raccolte prima di valutare la sicurezza del dispositivo?
2. Quali servizi dovrebbero essere esposti soltanto alle interfacce necessarie?
3. Perché un database non dovrebbe essere accessibile da reti non autorizzate?
4. Quali vantaggi offre il firewall?
5. Perché è importante verificare i processi associati alle porte in ascolto?

**Importante:** la presenza di un servizio o di una porta in ascolto non costituisce automaticamente una vulnerabilità. La valutazione deve considerare configurazione, necessità operativa, autenticazione, autorizzazioni e regole di rete.

---

## 10. Report conclusivo

Produrre una scheda di rilevazione contenente i risultati dell'esercitazione.

### Scheda di analisi della rete

| Categoria    | Informazione                          | Valore rilevato |
| ------------ | ------------------------------------- | --------------- |
| Interfacce   | Nome interfaccia principale           |                 |
| Interfacce   | Tipologia                             |                 |
| IP           | Indirizzo IPv4                        |                 |
| IP           | Prefisso / subnet mask                |                 |
| IP           | Indirizzo IPv6                        |                 |
| MAC          | MAC Address                           |                 |
| Routing      | Gateway predefinito                   |                 |
| DNS          | Server DNS configurato                |                 |
| DNS          | Risoluzione di example.com            |                 |
| Socket       | Numero porte TCP in ascolto osservate |                 |
| Socket       | Numero endpoint UDP osservati         |                 |
| Connettività | Ping verso 1.1.1.1                    |                 |
| Connettività | Ping verso example.com                |                 |

### Commento finale

Scrivere un breve commento (10-15 righe) che descriva:

- La configurazione di rete del proprio computer.
- Le interfacce utilizzate.
- Il funzionamento del routing.
- I server DNS configurati.
- Le porte e i servizi rilevati.
- Eventuali elementi che richiedono ulteriori verifiche.

Non inserire nel report indirizzi IP pubblici personali, credenziali o informazioni riservate della rete aziendale o domestica. È possibile anonimizzare gli indirizzi e utilizzare valori rappresentativi.

---

## 11. Consegna

Produrre un documento Markdown denominato:

`esercitazione-04-rete-e-indirizzi-ip-cognome-nome.md`

Il documento deve contenere:

1. Nome e cognome.
2. Sistema operativo utilizzato.
3. Comandi eseguiti.
4. Risultati dell'analisi delle interfacce.
5. Informazioni sugli indirizzi IP.
6. Tabella di routing.
7. Risultati della risoluzione DNS.
8. Analisi delle porte e dei socket locali.
9. Risultati delle verifiche di connettività.
10. Risposte alle domande.
11. Commento conclusivo.

È possibile aggiungere screenshot dei risultati dei comandi, purché siano leggibili e non contengano informazioni sensibili.

**Modalità di consegna:** caricare il documento nella cartella o nello spazio condiviso indicato dal docente.

---

## 12. Criteri di valutazione

| Criterio                                                  | Punteggio |
| --------------------------------------------------------- | --------: |
| Identificazione delle interfacce e degli indirizzi IP     |         2 |
| Comprensione e analisi del routing                        |       1,5 |
| Analisi della risoluzione DNS                             |       1,5 |
| Analisi di porte e socket locali                          |         2 |
| Verifica della connettività                               |         1 |
| Interpretazione dei risultati e riflessione cybersecurity |         1 |
| Completezza del report                                    |         1 |
| **Totale**                                                |    **10** |

## Risultato atteso

Al termine dell'esercitazione lo studente dovrà essere in grado di osservare e interpretare la configurazione di rete del proprio computer, riconoscere indirizzi IP, gateway e server DNS, comprendere il funzionamento del routing e individuare i servizi che utilizzano porte TCP e UDP.

Queste competenze costituiscono una base per le successive attività di amministrazione Linux, analisi dei log, hardening dei sistemi e monitoraggio della sicurezza delle reti.

### Nota

L'esercitazione può essere suddivisa in quattro momenti:

- **Prima fase:** analisi delle interfacce e degli indirizzi IP.
- **Seconda fase:** studio del routing e del DNS.
- **Terza fase:** osservazione delle porte e dei socket locali.
- **Quarta fase:** riflessione sulla superficie di rete e sulla sicurezza dei servizi.

Per gli studenti meno esperti è opportuno introdurre prima i concetti di indirizzo IP, subnet mask e gateway, lasciando le verifiche con `ss` e `Get-NetTCPConnection` come approfondimento guidato.

Tutte le attività devono essere svolte su dispositivi e reti propri o esplicitamente autorizzati.