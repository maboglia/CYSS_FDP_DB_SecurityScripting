# 03 – Software e sistemi operativi

## 1. Obiettivi didattici

Al termine della lezione lo studente sarà in grado di:

- Comprendere il concetto di software e le sue principali categorie.
- Distinguere software di sistema, applicativo e di sviluppo.
- Comprendere il ruolo e le funzioni di un sistema operativo.
- Descrivere la differenza tra kernel e spazio utente.
- Comprendere i concetti di processo e servizio.
- Utilizzare i principali strumenti Linux per analizzare processi e servizi.
- Comprendere l'organizzazione del file system.
- Distinguere tra interfaccia CLI e GUI.
- Comprendere l'importanza degli aggiornamenti software.
- Applicare il principio del minimo privilegio.
- Riconoscere i principali rischi di sicurezza legati alla gestione del software e del sistema operativo.

## 2. Introduzione al software

Il software rappresenta l'insieme delle istruzioni, dei programmi e dei dati che permettono a un sistema informatico di svolgere determinate attività.

A differenza dell'hardware, che costituisce la parte fisica del computer, il software rappresenta la componente logica del sistema.

Il software consente di:

- Gestire le risorse hardware.
- Elaborare informazioni.
- Eseguire applicazioni.
- Comunicare con altri sistemi.
- Memorizzare e recuperare dati.
- Automatizzare operazioni.

Un computer senza software dispone delle componenti fisiche necessarie, ma non può svolgere le normali attività richieste dagli utenti.

## 3. Tipologie di software

Possiamo classificare il software in diverse categorie.

### 3.1 Software di sistema

Il software di sistema gestisce le risorse hardware e fornisce i servizi necessari all'esecuzione delle applicazioni.

Comprende:

- Sistemi operativi.
- Driver.
- Utility di sistema.
- Servizi di sistema.
- Firmware.

Esempi:

| Software | Funzione |
| --- | --- |
| Ubuntu | Sistema operativo |
| Windows | Sistema operativo |
| Linux Kernel | Nucleo del sistema operativo |
| Driver NVIDIA | Gestione di dispositivi grafici |
| GRUB | Bootloader |
| systemd | Sistema di inizializzazione e gestione dei servizi |

### 3.2 Software applicativo

Il software applicativo consente agli utenti di svolgere attività specifiche.

Esempi:

- Browser web.
- Elaboratori di testo.
- Fogli elettronici.
- Software gestionali.
- Client di posta elettronica.
- Applicazioni di videoscrittura.
- Software di monitoraggio.

In un contesto cybersecurity possiamo considerare applicazioni come:

- Wireshark.
- Nmap.
- Visualizzatori di log.
- SIEM.
- Antivirus ed EDR.

Questi strumenti devono essere utilizzati nel rispetto delle autorizzazioni e delle policy aziendali.

### 3.3 Software di sviluppo

Il software di sviluppo comprende gli strumenti utilizzati per realizzare, testare e mantenere applicazioni.

Esempi:

| Strumento | Funzione |
| --- | --- |
| Visual Studio Code | Editor di codice |
| PyCharm | IDE per Python |
| GCC | Compilatore |
| Python | Linguaggio e interprete |
| Git | Controllo di versione |
| Maven | Gestione di progetti Java |
| Docker | Containerizzazione |

Durante il percorso ITS utilizzeremo principalmente Python, Bash, Git, PostgreSQL e Visual Studio Code.

### 3.4 Firmware

Il firmware è un particolare tipo di software integrato in un dispositivo hardware.

Gestisce funzionalità a basso livello e permette al dispositivo di funzionare correttamente.

Esempi:

- Firmware UEFI della scheda madre.
- Firmware di un router.
- Firmware di un SSD.
- Firmware di una scheda di rete.

Il firmware è un elemento importante per la sicurezza perché una sua compromissione può interessare il funzionamento del dispositivo anche prima dell'avvio del sistema operativo.

## 4. Il sistema operativo

Il sistema operativo, o Operating System (OS), è il software fondamentale che gestisce le risorse hardware e offre servizi alle applicazioni.

Si colloca tra hardware, applicazioni e utenti.

### 4.1 Funzioni principali

Un sistema operativo svolge diverse funzioni.

**Gestione del processore**

Distribuisce il tempo di utilizzo della CPU tra i processi in esecuzione.

**Gestione della memoria**

Assegna e controlla la memoria utilizzata dalle applicazioni.

**Gestione dei processi**

Crea, pianifica, sospende e termina i processi.

**Gestione dei dispositivi**

Permette alle applicazioni di interagire con le periferiche hardware.

**Gestione del file system**

Organizza file e directory e controlla le operazioni di accesso.

**Gestione degli utenti**

Permette di definire account, gruppi e autorizzazioni.

**Gestione della sicurezza**

Controlla accessi, privilegi e isolamento tra processi.

### 4.2 Esempi di sistemi operativi

| Sistema operativo | Ambito |
| --- | --- |
| Ubuntu | Desktop e server |
| Debian | Server e sistemi Linux |
| Windows 11 | Desktop |
| Windows Server | Server aziendali |
| macOS | Computer Apple |
| Android | Dispositivi mobili |
| iOS | Dispositivi mobili |

### 4.3 Sistema operativo e cybersecurity

Il sistema operativo rappresenta uno dei principali livelli da proteggere.

Una configurazione non sicura può consentire:

- Accessi non autorizzati.
- Esecuzione di codice malevolo.
- Escalation dei privilegi.
- Furto di informazioni.
- Compromissione dei servizi.
- Alterazione dei dati.

Per questo motivo l'amministrazione sicura del sistema operativo è una competenza fondamentale per chi opera nella cybersecurity.

## 5. Kernel e spazio utente

Il kernel è il nucleo del sistema operativo.

È responsabile della gestione delle risorse hardware e delle operazioni fondamentali del sistema.

### 5.1 Che cos'è il kernel

Il kernel gestisce:

- CPU.
- Memoria.
- Processi.
- Dispositivi.
- File system.
- Comunicazione tra processi.
- Interfacce di sistema.

Nel caso di Linux, il kernel è il componente centrale del sistema operativo.

È importante distinguere Linux, inteso come kernel, da una distribuzione Linux completa, come Ubuntu o Debian, che comprende anche librerie, utility, applicazioni e strumenti di gestione.

### 5.2 Spazio kernel e spazio utente

Per proteggere il sistema, l'esecuzione viene organizzata in livelli di privilegio.

Possiamo distinguere:

**Kernel Space**

È lo spazio privilegiato nel quale opera il kernel.

Ha accesso alle risorse hardware e alle operazioni privilegiate.

**User Space**

È lo spazio nel quale vengono eseguite normalmente le applicazioni degli utenti.

Le applicazioni non possono accedere liberamente alle risorse privilegiate: devono utilizzare interfacce controllate offerte dal sistema operativo.

### 5.3 Schema di funzionamento

```text
          APPLICAZIONI
        Browser - Python
        Editor - Database
               |
               v
          USER SPACE
               |
       System Call Interface
               |
               v
          KERNEL SPACE
               |
       +-------+-------+
       |       |       |
      CPU     RAM   DISPOSITIVI
       |       |       |
       +-------+-------+
               |
            HARDWARE
```

### 5.4 System Call

Una system call è un'interfaccia attraverso la quale un programma richiede un servizio al kernel.

Esempi di operazioni:

- Apertura di un file.
- Lettura di dati.
- Scrittura su disco.
- Creazione di un processo.
- Comunicazione con un dispositivo.

Esempio concettuale:

Un programma Python deve leggere un file.

```python
with open("dati.txt", "r") as file:
    contenuto = file.read()
```

Il programma utilizza le funzionalità offerte dalle librerie Python, che a loro volta interagiscono con il sistema operativo attraverso le interfacce disponibili.

### 5.5 Kernel e sicurezza

La separazione tra kernel e spazio utente è importante perché limita le operazioni che un'applicazione può svolgere direttamente.

Una vulnerabilità nel kernel può avere conseguenze particolarmente gravi, perché il kernel opera con privilegi elevati.

Un attaccante che riesce a ottenere il controllo del kernel può compromettere l'intero sistema.

## 6. Processi

Un processo è un'istanza di un programma in esecuzione.

Quando avviamo un'applicazione, il sistema operativo crea un processo e gli assegna le risorse necessarie.

Un processo può contenere:

- Codice eseguibile.
- Dati.
- Memoria allocata.
- Stack.
- Registri e stato di esecuzione.
- Risorse aperte, come file e socket.

### 6.1 Programma e processo

È importante distinguere:

**Programma**

È un insieme di istruzioni memorizzate in un file.

**Processo**

È un programma durante la sua esecuzione.

Esempio:

Quando avviamo Firefox:

- Il programma è installato sul disco.
- Il sistema operativo carica le informazioni necessarie.
- Viene creato uno o più processi.
- I processi utilizzano CPU e RAM.

Possiamo avviare più istanze di uno stesso programma, generando processi differenti.

### 6.2 PID – Process Identifier

Ogni processo viene identificato da un numero chiamato PID.

Il PID permette al sistema operativo e agli strumenti amministrativi di identificare un processo.

Per visualizzare i processi:

```bash
ps aux
```

Esempio:

```text
USER       PID  %CPU %MEM COMMAND
root         1   0.0  0.2 /sbin/init
mario     1250   1.5  2.0 /usr/lib/firefox
mario     1400   0.5  1.0 python3 script.py
```

I valori sono puramente esemplificativi.

### 6.3 Visualizzare i processi

Comando:

```bash
ps aux
```

Mostra un elenco dettagliato dei processi.

Per cercare un processo:

```bash
ps aux | grep firefox
```

Per visualizzare i processi in tempo reale:

```bash
top
```

In alternativa:

```bash
htop
```

`htop` potrebbe richiedere installazione.

```bash
sudo apt install htop
```

### 6.4 Terminare un processo

Per terminare un processo:

```bash
kill PID
```

Esempio:

```bash
kill 1400
```

Normalmente `kill` invia il segnale SIGTERM, chiedendo al processo di terminare in modo controllato.

Per richiedere una terminazione forzata:

```bash
kill -9 1400
```

SIGKILL non permette al processo di gestire una chiusura ordinata.

È preferibile utilizzarlo soltanto quando necessario.

### 6.5 Stati di un processo

Un processo può trovarsi in diversi stati.

| Stato | Significato |
| --- | --- |
| Running | In esecuzione o pronto per essere eseguito |
| Sleeping | In attesa di un evento |
| Stopped | Sospeso |
| Zombie | Terminato, ma non ancora rimosso dalla tabella dei processi |

La gestione degli stati è responsabilità del sistema operativo.

### 6.6 Processi e cybersecurity

L'analisi dei processi è una delle attività di base nell'amministrazione e nella sicurezza dei sistemi.

Un analista può cercare:

- Processi sconosciuti.
- Utilizzo anomalo della CPU.
- Consumo eccessivo di memoria.
- Processi avviati da utenti inattesi.
- Esecuzione di programmi da directory sospette.
- Processi che comunicano con servizi non previsti.

L'analisi di un singolo processo non è sufficiente per dichiarare la presenza di un malware: occorre correlare più evidenze.

## 7. Servizi di sistema

Un servizio è un programma o insieme di processi che svolge una funzione in background, normalmente senza richiedere un'interazione diretta con l'utente.

Esempi:

- Servizio SSH.
- Servizio web Apache.
- Servizio database PostgreSQL.
- Servizio DNS.
- Servizio di logging.
- Servizio di pianificazione delle attività.

### 7.1 Servizi in Linux

Ubuntu utilizza normalmente systemd come sistema di inizializzazione e gestione dei servizi.

Il comando principale per amministrare i servizi è:

```bash
systemctl
```

### 7.2 Visualizzare i servizi attivi

```bash
systemctl --type=service --state=running
```

Mostra i servizi attualmente in esecuzione.

Per verificare lo stato di un servizio specifico:

```bash
systemctl status ssh
```

Il servizio SSH potrebbe non essere installato o attivo.

### 7.3 Avviare e arrestare un servizio

Avvio:

```bash
sudo systemctl start ssh
```

Arresto:

```bash
sudo systemctl stop ssh
```

Riavvio:

```bash
sudo systemctl restart ssh
```

Abilitazione all'avvio automatico:

```bash
sudo systemctl enable ssh
```

Disabilitazione dell'avvio automatico:

```bash
sudo systemctl disable ssh
```

Questi comandi modificano lo stato del sistema e devono essere eseguiti soltanto quando autorizzati.

### 7.4 Differenza tra processo e servizio

| Processo | Servizio |
| --- | --- |
| Programma in esecuzione | Funzione software fornita in background |
| Può essere avviato da un utente | Spesso gestito dal sistema |
| Può essere temporaneo | Spesso progettato per funzionare continuativamente |
| Ha un PID | È gestito attraverso un sistema di servizi |

Un servizio è normalmente implementato attraverso uno o più processi, ma i due concetti non sono equivalenti.

### 7.5 Servizi e sicurezza

Ogni servizio attivo può rappresentare una potenziale superficie di attacco.

Ad esempio:

- Un server SSH esposto può essere bersaglio di tentativi di autenticazione.
- Un database non adeguatamente protetto può esporre informazioni.
- Un servizio non aggiornato può contenere vulnerabilità.

Buone pratiche:

- Disabilitare i servizi non necessari.
- Aggiornare regolarmente i servizi.
- Limitare gli accessi.
- Configurare correttamente le porte.
- Monitorare i log.
- Utilizzare account dedicati e privilegi limitati.

## 8. File system

Il file system è il sistema utilizzato dal sistema operativo per organizzare, memorizzare e recuperare file e directory.

Consente di gestire:

- Documenti.
- Programmi.
- Configurazioni.
- Log.
- Database.
- File temporanei.

### 8.1 File e directory

Un file contiene informazioni.

Una directory contiene riferimenti a file e ad altre directory.

Esempio:

```text
/home/mario/
    |
    +-- Documenti/
    |      |
    |      +-- appunti.txt
    |
    +-- Progetti/
    |      |
    |      +-- programma.py
    |
    +-- Download/
```

### 8.2 File system Linux

Linux utilizza una struttura gerarchica che parte dalla directory radice `/`.

Alcune directory importanti:

| Directory | Funzione |
| --- | --- |
| `/` | Directory radice |
| `/home` | Directory degli utenti |
| `/root` | Directory dell'amministratore root |
| `/etc` | File di configurazione |
| `/var` | Dati variabili e log |
| `/tmp` | File temporanei |
| `/usr` | Programmi e risorse |
| `/opt` | Software aggiuntivo |
| `/dev` | File dispositivo |
| `/proc` | Informazioni virtuali su processi e kernel |
| `/boot` | File necessari all'avvio |

### 8.3 Percorsi assoluti e relativi

Un percorso assoluto parte dalla radice `/`.

Esempio:

```text
/home/mario/Documenti/appunti.txt
```

Un percorso relativo viene interpretato rispetto alla directory corrente.

Esempio:

```text
Documenti/appunti.txt
```

### 8.4 Comandi fondamentali

Visualizzare la directory corrente:

```bash
pwd
```

Elencare i file:

```bash
ls -la
```

Cambiare directory:

```bash
cd /home
```

Creare una directory:

```bash
mkdir progetto
```

Creare un file:

```bash
touch appunti.txt
```

Visualizzare il contenuto:

```bash
cat appunti.txt
```

Cercare file:

```bash
find /home -name "*.txt"
```

### 8.5 File system e sicurezza

Il file system è uno degli elementi più importanti nella protezione dei sistemi.

I principali rischi comprendono:

- Accesso non autorizzato ai file.
- Modifica delle configurazioni.
- Cancellazione dei log.
- Furto di documenti.
- Esposizione di credenziali.
- Esecuzione di file malevoli.

Per proteggere il file system è necessario configurare correttamente proprietari, gruppi e permessi.

Questi aspetti saranno approfonditi nell'unità dedicata a file system e permessi Linux.

## 9. Interfaccia CLI e GUI

Un sistema operativo può essere utilizzato attraverso differenti tipologie di interfaccia.

### 9.1 CLI – Command Line Interface

La CLI è un'interfaccia testuale che permette di interagire con il sistema attraverso comandi.

Esempi:

- Bash.
- Zsh.
- PowerShell.
- Windows Command Prompt.

In Linux la shell Bash è ampiamente utilizzata per amministrazione e automazione.

Esempio:

```bash
ls -la
```

Il comando visualizza il contenuto della directory corrente.

Vantaggi:

- Rapidità nelle operazioni ripetitive.
- Possibilità di automatizzazione.
- Controllo dettagliato del sistema.
- Facilità di esecuzione da remoto.
- Possibilità di concatenare comandi.

### 9.2 GUI – Graphical User Interface

La GUI è un'interfaccia grafica che consente di interagire con il sistema mediante finestre, icone, menu e puntatori.

Esempi:

- Desktop Ubuntu.
- Windows Desktop.
- macOS Finder.

Vantaggi:

- Facilità di utilizzo.
- Rappresentazione visuale.
- Interazione intuitiva.
- Minore necessità di memorizzare comandi.

### 9.3 CLI e GUI a confronto

| Caratteristica | CLI | GUI |
| --- | --- | --- |
| Interazione | Testuale | Grafica |
| Automazione | Molto elevata | Generalmente più limitata |
| Risorse | Generalmente contenute | Generalmente maggiori |
| Precisione operativa | Elevata, se il comando è corretto | Dipende dall'interfaccia |
| Curva di apprendimento | Richiede pratica | Generalmente più immediata |
| Amministrazione remota | Molto utilizzata | Possibile, ma spesso meno efficiente |

### 9.4 CLI e cybersecurity

La CLI è uno strumento fondamentale per chi lavora nella cybersecurity.

Permette di:

- Analizzare processi.
- Consultare log.
- Verificare connessioni.
- Gestire utenti.
- Modificare permessi.
- Automatizzare controlli.
- Analizzare file.
- Amministrare servizi.

Nel corso utilizzeremo prevalentemente il terminale Linux per sviluppare competenze operative.

## 10. Aggiornamenti software

Gli aggiornamenti software sono interventi che modificano programmi e sistemi operativi per correggere problemi, migliorare prestazioni, introdurre funzionalità o risolvere vulnerabilità.

### 10.1 Tipologie di aggiornamento

**Security Update**

Corregge vulnerabilità di sicurezza.

**Bug Fix**

Risolve errori presenti nel software.

**Feature Update**

Introduce nuove funzionalità.

**Version Upgrade**

Aggiorna il software a una nuova versione principale.

### 10.2 Perché gli aggiornamenti sono importanti

Un software non aggiornato può contenere vulnerabilità conosciute e documentate.

Un attaccante potrebbe sfruttare queste vulnerabilità per:

- Eseguire codice.
- Ottenere accessi non autorizzati.
- Elevare i privilegi.
- Rubare informazioni.
- Compromettere il sistema.

La gestione degli aggiornamenti è quindi una delle attività fondamentali di sicurezza informatica.

### 10.3 Gestione degli aggiornamenti su Ubuntu

Ubuntu utilizza APT per la gestione dei pacchetti.

Aggiornare l'elenco dei pacchetti disponibili:

```bash
sudo apt update
```

Visualizzare gli aggiornamenti disponibili:

```bash
apt list --upgradable
```

Installare gli aggiornamenti:

```bash
sudo apt upgrade
```

Rimuovere pacchetti non più necessari:

```bash
sudo apt autoremove
```

È importante distinguere:

- `apt update`: aggiorna l'indice dei pacchetti.
- `apt upgrade`: installa gli aggiornamenti disponibili.

Il comando `apt update` non aggiorna direttamente i programmi installati.

### 10.4 Aggiornamenti e organizzazioni

In un ambiente aziendale gli aggiornamenti devono essere gestiti attraverso procedure controllate.

È opportuno:

- Verificare la disponibilità degli aggiornamenti.
- Valutare la criticità delle vulnerabilità.
- Testare gli aggiornamenti quando necessario.
- Pianificare le finestre di manutenzione.
- Effettuare backup.
- Verificare il corretto funzionamento dopo l'aggiornamento.

## 11. Il principio del minimo privilegio

Il principio del minimo privilegio, o Principle of Least Privilege, stabilisce che ogni utente, processo o applicazione debba disporre esclusivamente dei permessi necessari per svolgere le proprie attività.

È uno dei principi fondamentali della sicurezza informatica.

### 11.1 Esempio

Consideriamo un'organizzazione con tre tipologie di utenti:

| Utente | Permessi |
| --- | --- |
| Amministratore | Gestione completa del sistema |
| Analista SOC | Consultazione dei log e analisi degli eventi |
| Utente standard | Utilizzo delle applicazioni autorizzate |

Non tutti gli utenti devono disporre dei privilegi amministrativi.

### 11.2 Account root

Nei sistemi Linux l'utente `root` è l'amministratore con privilegi molto elevati.

Può:

- Installare software.
- Modificare configurazioni.
- Gestire utenti.
- Modificare permessi.
- Arrestare servizi.
- Accedere a molte risorse del sistema.

L'utilizzo improprio dell'account root può causare danni importanti.

Per questo motivo è consigliabile utilizzare un account standard per le attività quotidiane e ricorrere a `sudo` soltanto quando necessario.

Esempio:

```bash
sudo apt update
```

Il comando esegue l'operazione con privilegi amministrativi.

### 11.3 Rischi legati ai privilegi eccessivi

Se un utente utilizza sempre un account amministrativo, un eventuale malware eseguito con quell'account potrebbe ottenere privilegi elevati.

I rischi comprendono:

- Modifica dei file di sistema.
- Installazione di software malevolo.
- Creazione di nuovi account.
- Alterazione dei permessi.
- Disabilitazione dei sistemi di protezione.

### 11.4 Applicazione del minimo privilegio

Buone pratiche:

- Utilizzare account personali.
- Evitare l'utilizzo quotidiano di root.
- Assegnare permessi specifici.
- Separare account amministrativi e account ordinari.
- Limitare i privilegi dei servizi.
- Verificare periodicamente le autorizzazioni.
- Revocare gli accessi non più necessari.

## 12. Laboratorio Linux – Analisi del sistema operativo

In questa sezione vengono utilizzati alcuni strumenti Linux per analizzare il sistema operativo, i processi, i servizi e le risorse disponibili.

### 12.1 Identificare il sistema operativo

```bash
uname -a
```

Mostra informazioni sul kernel.

Per visualizzare le informazioni sulla distribuzione:

```bash
cat /etc/os-release
```

### 12.2 Analizzare i processi

```bash
ps aux
```

Visualizza i processi attivi.

Per cercare un processo specifico:

```bash
ps aux | grep python
```

Per monitorare le risorse:

```bash
top
```

### 12.3 Analizzare i servizi

```bash
systemctl --type=service --state=running
```

Visualizza i servizi in esecuzione.

Per verificare un servizio:

```bash
systemctl status cron
```

### 12.4 Analizzare il file system

Visualizzare le directory:

```bash
ls -la /
```

Verificare lo spazio disponibile:

```bash
df -h
```

Verificare lo spazio occupato dalle directory:

```bash
du -sh /var/log
```

### 12.5 Analizzare gli utenti

Visualizzare l'utente corrente:

```bash
whoami
```

Visualizzare i gruppi dell'utente:

```bash
groups
```

Visualizzare gli utenti attualmente collegati:

```bash
who
```

## 13. Esercitazioni

### Esercizio 1 – Classificazione del software

Classificare i seguenti strumenti:

1. Ubuntu.
2. Firefox.
3. Python.
4. GCC.
5. Linux Kernel.
6. PostgreSQL.
7. Visual Studio Code.
8. GRUB.
9. Bash.
10. Docker.

Per ogni elemento indicare:

- Categoria.
- Funzione.
- Possibile utilizzo in ambito cybersecurity.

### Esercizio 2 – Analisi dei processi

Eseguire:

```bash
ps aux
```

Individuare:

- Il PID di almeno tre processi.
- L'utente proprietario.
- Il consumo di CPU.
- Il consumo di memoria.

Rispondere:

1. Che cosa identifica il PID?
2. Perché più processi possono appartenere allo stesso programma?
3. Quali indicatori potrebbero suggerire un comportamento anomalo?

### Esercizio 3 – Analisi dei servizi

Eseguire:

```bash
systemctl --type=service --state=running
```

Individuare almeno cinque servizi.

Per ciascuno descrivere:

- Nome.
- Funzione.
- Stato.
- Eventuale rilevanza per la sicurezza.

Non arrestare o modificare servizi senza autorizzazione del docente.

### Esercizio 4 – Gestione del file system

Eseguire i seguenti comandi:

```bash
mkdir laboratorio
cd laboratorio
touch documento.txt
mkdir documenti
ls -la
pwd
```

Rispondere:

1. Quale directory è stata creata?
2. Quale file è stato creato?
3. Che differenza c'è tra percorso assoluto e relativo?
4. Perché il file system deve essere protetto?

### Esercizio 5 – Aggiornamenti software

Eseguire:

```bash
sudo apt update
apt list --upgradable
```

Rispondere:

1. Che differenza esiste tra aggiornare l'indice e aggiornare i pacchetti?
2. Perché è importante installare gli aggiornamenti di sicurezza?
3. Quali problemi potrebbero verificarsi utilizzando software non aggiornato?

L'installazione effettiva degli aggiornamenti deve essere concordata con il docente.

### Esercizio 6 – Minimo privilegio

Considerare il seguente scenario:

Un'organizzazione dispone di:

- Un amministratore di sistema.
- Un analista SOC.
- Un dipendente dell'ufficio amministrativo.

Definire una matrice dei permessi indicando quali operazioni dovrebbero essere consentite a ciascun utente:

| Operazione | Amministratore | Analista SOC | Dipendente |
| --- | --- | --- | --- |
| Installare software | | | |
| Consultare log | | | |
| Modificare configurazioni | | | |
| Consultare documenti personali | | | |
| Gestire account | | | |

Motivare le scelte applicando il principio del minimo privilegio.

## 14. Domande di autovalutazione

1. Che cosa si intende per software?
2. Qual è la differenza tra software di sistema e applicativo?
3. Quali funzioni svolge un sistema operativo?
4. Che cos'è il kernel?
5. Qual è la differenza tra kernel space e user space?
6. Che cos'è una system call?
7. Qual è la differenza tra programma e processo?
8. Che cosa identifica il PID?
9. Che cosa si intende per servizio?
10. Qual è la funzione del file system?
11. Qual è la differenza tra CLI e GUI?
12. Perché è importante aggiornare il software?
13. Che cosa significa Principle of Least Privilege?
14. Perché non è consigliabile utilizzare sempre l'account root?
15. Quali rischi comporta un servizio non necessario e non aggiornato?

## 15. Riepilogo della lezione

I concetti fondamentali da ricordare:

- Il software rappresenta la componente logica di un sistema informatico.
- Il sistema operativo gestisce hardware, memoria, processi, file e utenti.
- Il kernel è il nucleo del sistema operativo.
- Le applicazioni operano normalmente nello spazio utente.
- Un processo è un programma in esecuzione.
- Un servizio fornisce una funzione in background.
- Il file system organizza file e directory.
- La CLI permette di amministrare il sistema attraverso comandi.
- Gli aggiornamenti correggono errori e vulnerabilità.
- Il minimo privilegio riduce i rischi derivanti da accessi eccessivi.

## 16. Collegamenti con i moduli successivi

| Modulo | Collegamento |
| --- | --- |
| 02 – Logica e algoritmi | Elaborazione e gestione delle istruzioni |
| 03 – Python | Esecuzione dei programmi e interazione con il sistema operativo |
| 04 – Bash scripting | Automazione delle operazioni amministrative |
| 05 – Database SQL | Installazione e gestione dei servizi database |
| 06 – Backend API | Esecuzione e amministrazione di applicazioni server |
| 07 – Cybersecurity | Hardening, gestione privilegi, aggiornamenti e analisi dei processi |

---

**Fine scheda didattica – 03 Software e sistemi operativi**
