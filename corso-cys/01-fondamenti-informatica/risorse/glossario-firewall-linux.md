# Glossario – Firewall Linux: UFW e nftables

## 1. Concetti fondamentali

| Termine | Definizione |
| --- | --- |
| **Firewall** | Sistema hardware o software che controlla il traffico di rete in ingresso e in uscita applicando regole di sicurezza. |
| **Traffico di rete** | Insieme dei dati scambiati tra dispositivi attraverso una rete informatica. |
| **Pacchetto** | Unità di dati trasmessa attraverso una rete, contenente informazioni di controllo e dati. |
| **Regola firewall** | Istruzione che stabilisce se consentire o bloccare una determinata comunicazione. |
| **Policy** | Insieme di criteri che definiscono il comportamento di sicurezza del firewall. |
| **Inbound** | Traffico di rete in ingresso verso il dispositivo. |
| **Outbound** | Traffico di rete in uscita dal dispositivo. |
| **Allow** | Azione che consente il passaggio del traffico. |
| **Deny** | Azione che blocca il traffico senza necessariamente inviare una risposta al mittente. |
| **Reject** | Azione che blocca il traffico e comunica esplicitamente il rifiuto della connessione. |
| **Porta di rete** | Identificativo numerico utilizzato dai protocolli di trasporto per indirizzare i dati verso uno specifico servizio. |
| **Protocollo** | Insieme di regole che definisce le modalità di comunicazione tra dispositivi. |

## 2. UFW – Uncomplicated Firewall

| Termine | Definizione |
| --- | --- |
| **UFW** | Uncomplicated Firewall: strumento che semplifica la configurazione e la gestione delle regole firewall su Linux. |
| **Frontend** | Interfaccia che permette di utilizzare funzionalità di un sistema sottostante attraverso comandi più semplici. |
| **Regola predefinita** | Comportamento applicato dal firewall quando non esiste una regola specifica per il traffico considerato. |
| **Status** | Stato operativo del firewall, che può essere attivo o inattivo. |
| **Abilitazione** | Operazione che attiva il firewall e rende operative le sue regole. |
| **Disabilitazione** | Operazione che arresta il filtraggio gestito da UFW. |

### Comandi principali UFW

| Comando | Funzione |
| --- | --- |
| `sudo ufw status` | Visualizza lo stato del firewall. |
| `sudo ufw status verbose` | Visualizza lo stato e informazioni aggiuntive sulla configurazione. |
| `sudo ufw enable` | Abilita il firewall. |
| `sudo ufw disable` | Disabilita il firewall. |
| `sudo ufw allow 22/tcp` | Consente il traffico TCP sulla porta 22. |
| `sudo ufw deny 23/tcp` | Blocca il traffico TCP sulla porta 23. |
| `sudo ufw delete allow 22/tcp` | Elimina la regola che consente il traffico TCP sulla porta 22. |
| `sudo ufw default deny incoming` | Imposta il blocco predefinito delle connessioni in ingresso. |
| `sudo ufw default allow outgoing` | Consente per impostazione predefinita le connessioni in uscita. |
| `sudo ufw reload` | Ricarica la configurazione del firewall. |

## 3. nftables

| Termine | Definizione |
| --- | --- |
| **nftables** | Framework del kernel Linux utilizzato per filtrare e gestire il traffico di rete. |
| **Netfilter** | Sottosistema del kernel Linux che implementa funzionalità di filtraggio, gestione e manipolazione dei pacchetti di rete. |
| **Framework** | Insieme organizzato di strumenti e componenti software che forniscono funzionalità comuni. |
| **nft** | Comando utilizzato per configurare e amministrare nftables. |
| **Table** | Struttura che raggruppa catene e regole di filtraggio. |
| **Chain** | Struttura che contiene regole applicate ai pacchetti in determinati punti del percorso di rete. |
| **Rule** | Istruzione che identifica determinate caratteristiche del traffico e definisce un'azione da eseguire. |
| **Hook** | Punto del percorso di elaborazione dei pacchetti nel kernel Linux in cui una chain può intervenire. |
| **Family** | Categoria di protocolli o traffico gestita da una tabella, ad esempio IPv4, IPv6 o Internet. |
| **Set** | Struttura che raccoglie più elementi, come indirizzi IP o porte, utilizzabili nelle regole. |

### Comandi principali nftables

| Comando | Funzione |
| --- | --- |
| `sudo nft list ruleset` | Visualizza tutte le regole attualmente configurate. |
| `sudo nft list tables` | Elenca le tabelle configurate. |
| `sudo nft list chains` | Elenca le catene presenti. |
| `sudo nft add table inet filtro` | Crea una tabella denominata `filtro` per IPv4 e IPv6. |
| `sudo nft add chain inet filtro input { type filter hook input priority 0 \; policy drop \; }` | Crea una chain di ingresso con politica predefinita di blocco. |
| `sudo nft flush ruleset` | Elimina tutte le regole e le strutture del ruleset. |

**Attenzione:** `flush ruleset` è un comando potenzialmente distruttivo: rimuove l'intera configurazione nftables. Non eseguirlo su sistemi in produzione o durante una sessione SSH senza aver predisposto un accesso alternativo.

## 4. Confronto UFW e nftables

| Caratteristica | UFW | nftables |
| --- | --- | --- |
| Tipologia | Strumento di gestione semplificata | Framework di filtraggio di rete |
| Utilizzo | Configurazione introduttiva e quotidiana | Configurazione avanzata |
| Complessità | Bassa | Medio-alta |
| Interfaccia | Comandi semplificati | Regole e strutture articolate |
| Gestione | Regole tramite UFW | Tabelle, chain e regole |
| Destinatari | Amministratori e utenti Linux | Amministratori di sistema e specialisti di rete |

## 5. Concetti di sicurezza

| Termine | Definizione |
| --- | --- |
| **Least Privilege** | Principio secondo cui ogni utente, processo o servizio deve disporre esclusivamente dei permessi necessari. |
| **Default Deny** | Strategia che blocca tutto il traffico non esplicitamente autorizzato. |
| **Attack Surface** | Insieme dei punti di ingresso attraverso cui un sistema può essere attaccato. |
| **Hardening** | Processo di rafforzamento della sicurezza di un sistema attraverso configurazioni e controlli adeguati. |
| **Logging** | Registrazione degli eventi e delle attività del sistema, utile per analisi e verifiche di sicurezza. |
| **SSH** | Protocollo che consente di amministrare sistemi remoti attraverso una connessione cifrata. |
| **ACL (Access Control List)** | Elenco di regole che stabilisce quali soggetti possono accedere a determinate risorse. |

## 6. Domande di autovalutazione

1. Che cos'è un firewall e quale funzione svolge?
2. Qual è la differenza tra traffico inbound e outbound?
3. Che cosa significa applicare una politica Default Deny?
4. Che cosa identifica UFW?
5. Quale comando permette di verificare lo stato di UFW?
6. Qual è la differenza tra Allow, Deny e Reject?
7. Che cos'è nftables?
8. Qual è la differenza tra una table e una chain?
9. Quale funzione svolge il comando `nft list ruleset`?
10. Perché è importante limitare le porte di rete aperte su un server?

---

**Obiettivo formativo:** comprendere il funzionamento dei firewall Linux, conoscere gli strumenti UFW e nftables e acquisire le competenze introduttive necessarie per configurare regole di filtraggio del traffico in modo consapevole e sicuro.
