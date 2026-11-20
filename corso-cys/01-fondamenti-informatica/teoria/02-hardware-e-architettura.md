# 02 – Hardware e architettura del computer

## 1. Obiettivi didattici

Al termine della lezione lo studente sarà in grado di:

- Descrivere l'architettura generale di un computer.
- Identificare i principali componenti hardware.
- Comprendere il funzionamento della CPU.
- Distinguere ALU, unità di controllo, registri e cache.
- Comprendere le differenze tra RAM, ROM, SSD e HDD.
- Descrivere il ruolo della scheda madre.
- Riconoscere le principali periferiche.
- Comprendere il ruolo del firmware e le fasi di avvio del computer.
- Utilizzare alcuni comandi Linux per raccogliere informazioni hardware.
- Collegare l'architettura hardware ai principi di sicurezza informatica.

## 2. Introduzione all'hardware

L'hardware rappresenta l'insieme delle componenti fisiche che costituiscono un sistema informatico.

È la parte materiale del computer, ovvero tutto ciò che può essere fisicamente identificato e, in molti casi, sostituito o aggiornato.

Un computer è composto da diversi elementi che collaborano per eseguire programmi, elaborare dati, memorizzare informazioni e comunicare con altri dispositivi.

I principali componenti sono:

- CPU (Central Processing Unit).
- Memoria RAM.
- Memoria ROM e firmware.
- Memorie di massa SSD e HDD.
- Scheda madre.
- Periferiche.
- Schede e interfacce di comunicazione.

### 2.1 Architettura generale di un computer

Un modello semplificato dell'architettura di un computer comprende:

```text
                 COMPUTER
                    |
             +------+------+
             |             |
            CPU         MEMORIA
             |             |
       +-----+-----+    +---+---+
       |           |    |       |
      ALU       CONTROL RAM   ROM
       |           |
       +-----+-----+
             |
          BUS DATI
             |
        SCHEDA MADRE
             |
       +-----+------+
       |            |
   ARCHIVIAZIONE  PERIFERICHE
     SSD / HDD   Input / Output
```

I diversi componenti comunicano attraverso collegamenti fisici e interfacce elettroniche.

## 3. La CPU – Central Processing Unit

La CPU è l'unità centrale di elaborazione del computer.

È responsabile dell'esecuzione delle istruzioni dei programmi e dell'elaborazione dei dati.

La CPU esegue istruzioni come:

- Operazioni aritmetiche.
- Operazioni logiche.
- Confronti.
- Spostamento di dati.
- Controllo del flusso di esecuzione.

La CPU viene spesso definita il cervello del computer, anche se il funzionamento di un sistema dipende dalla collaborazione di tutti i componenti.

### 3.1 Ciclo di esecuzione delle istruzioni

Il funzionamento della CPU può essere descritto attraverso un ciclo fondamentale:

1. Fetch: acquisizione dell'istruzione dalla memoria.
2. Decode: interpretazione dell'istruzione.
3. Execute: esecuzione dell'operazione.
4. Write-back: eventuale scrittura del risultato.

Questo ciclo viene ripetuto continuamente durante l'esecuzione dei programmi.

```text
       FETCH
         |
         v
       DECODE
         |
         v
       EXECUTE
         |
         v
      WRITE-BACK
         |
         +------> Nuova istruzione
```

Esempio:

Un programma deve eseguire:

```python
risultato = 10 + 20
```

La CPU deve:

- Recuperare le istruzioni necessarie.
- Interpretare l'operazione.
- Eseguire la somma.
- Memorizzare il risultato.

### 3.2 Frequenza della CPU

La frequenza indica il numero di cicli di clock al secondo.

Si misura in Hertz (Hz), normalmente in GHz per i processori moderni.

Esempio:

Una CPU con frequenza di 3 GHz può generare circa 3 miliardi di cicli di clock al secondo.

Attenzione: questo valore non indica direttamente il numero di istruzioni eseguite al secondo. Le prestazioni dipendono anche dall'architettura, dal numero di core, dalla cache, dalle istruzioni eseguite e da altri fattori.

### 3.3 Core e thread

Un core è un'unità di elaborazione presente all'interno della CPU.

I processori moderni possono integrare più core, permettendo l'esecuzione concorrente di più attività.

Un thread è un flusso di esecuzione. Alcune CPU supportano più thread hardware per core attraverso tecnologie di multithreading.

Esempio:

Una CPU con:

- 4 core;
- 8 thread;

può esporre al sistema operativo 8 processori logici.

Questo non significa che siano presenti 8 core fisici.

### 3.4 Architetture a 32 e 64 bit

L'architettura del processore determina, tra le altre caratteristiche, il modo in cui vengono gestiti dati e indirizzi.

Le architetture a 64 bit consentono di gestire spazi di indirizzamento molto più ampi rispetto a quelle a 32 bit.

Oggi la maggior parte dei computer utilizza architetture a 64 bit.

## 4. ALU – Arithmetic Logic Unit

L'ALU è una componente della CPU responsabile delle operazioni aritmetiche e logiche.

### 4.1 Operazioni aritmetiche

- Addizione.
- Sottrazione.
- Moltiplicazione.
- Divisione.

Esempio:

```text
10 + 5 = 15
20 - 8 = 12
```

### 4.2 Operazioni logiche

L'ALU può eseguire operazioni logiche e confronti:

- AND.
- OR.
- NOT.
- XOR.
- Confronti tra valori.

Esempio:

```text
10 > 5  → TRUE
10 == 5 → FALSE
```

Queste operazioni costituiscono la base dei controlli logici utilizzati nei programmi.

### 4.3 Collegamento con la programmazione

In Python:

```python
eta = 25
autorizzato = eta >= 18

print(autorizzato)  # True
```

Il programma utilizza un confronto logico per determinare il valore di una condizione.

Le operazioni logiche saranno approfondite nel modulo dedicato alla programmazione.

## 5. Registri della CPU

I registri sono piccole aree di memoria interne alla CPU, caratterizzate da tempi di accesso molto ridotti.

Vengono utilizzati per conservare temporaneamente:

- Dati da elaborare.
- Indirizzi di memoria.
- Istruzioni.
- Risultati intermedi.
- Informazioni sullo stato del processore.

### 5.1 Alcuni registri importanti

| Registro | Funzione |
| --- | --- |
| Program Counter (PC) | Contiene l'indirizzo della prossima istruzione da eseguire |
| Instruction Register (IR) | Contiene l'istruzione corrente |
| Accumulator | Utilizzato per risultati intermedi in alcune architetture |
| Stack Pointer (SP) | Indica la posizione corrente dello stack |
| General Purpose Registers | Memorizzano dati e indirizzi temporanei |

I nomi e le funzioni specifiche dipendono dall'architettura del processore.

### 5.2 Registri e sicurezza

I registri sono importanti anche dal punto di vista della sicurezza.

Durante l'esecuzione di un programma possono contenere informazioni sensibili, indirizzi e dati temporanei.

Alcune vulnerabilità legate all'esecuzione speculativa e alla gestione della memoria possono avere conseguenze sulla riservatezza dei dati.

Un esempio noto è la famiglia di vulnerabilità Spectre e Meltdown, che ha evidenziato criticità in alcune implementazioni dei processori moderni.

## 6. Cache della CPU

La cache è una memoria molto veloce utilizzata per ridurre i tempi di accesso ai dati e alle istruzioni richiesti frequentemente dalla CPU.

Senza cache, il processore dovrebbe accedere più frequentemente alla RAM, che ha tempi di accesso superiori.

### 6.1 Livelli della cache

Le CPU moderne utilizzano generalmente diversi livelli di cache.

| Livello | Caratteristiche |
| --- | --- |
| L1 | Molto veloce, generalmente piccola e vicina al core |
| L2 | Più capiente della L1, con latenza generalmente maggiore |
| L3 | Generalmente più capiente e spesso condivisa tra più core |

La configurazione dipende dal modello di processore.

### 6.2 Gerarchia della memoria

Una rappresentazione semplificata:

```text
       REGISTRI
           |
           v
         CACHE
       L1 - L2 - L3
           |
           v
          RAM
           |
           v
        SSD / HDD
```

Scendendo nella gerarchia:

- Aumenta generalmente la capacità.
- Aumenta generalmente il tempo di accesso.
- Diminuisce il costo per unità di capacità.

### 6.3 Cache e sicurezza

La cache può essere coinvolta in alcune tecniche di attacco side-channel.

Queste tecniche cercano di ricavare informazioni indirettamente osservando variazioni nei tempi di accesso alla memoria.

La famiglia Spectre ha dimostrato che alcune caratteristiche delle moderne CPU possono essere sfruttate per ottenere informazioni che dovrebbero essere isolate.

## 7. Memoria RAM

RAM significa Random Access Memory.

È la memoria principale utilizzata dal sistema operativo e dai programmi durante la loro esecuzione.

Quando avviamo un'applicazione:

1. Il programma viene caricato dalla memoria di massa.
2. Le istruzioni e i dati necessari vengono collocati in RAM.
3. La CPU utilizza i dati durante l'esecuzione.
4. Le modifiche persistenti vengono eventualmente salvate su disco.

### 7.1 Caratteristiche della RAM

- È volatile.
- Consente accessi rapidi.
- Viene utilizzata da sistema operativo e applicazioni.
- La sua capacità influenza il numero e la dimensione delle applicazioni gestibili contemporaneamente.

Quando il computer viene spento, il contenuto della RAM viene perso.

### 7.2 Capacità della RAM

La RAM viene misurata in GB.

Esempi indicativi:

| RAM | Utilizzo tipico |
| --- | --- |
| 4 GB | Attività leggere e sistemi essenziali |
| 8 GB | Utilizzo generale |
| 16 GB | Sviluppo software e multitasking |
| 32 GB | Attività intensive e ambienti virtualizzati |
| 64 GB o più | Workstation e carichi elevati |

Il fabbisogno dipende dal sistema operativo, dalle applicazioni e dal carico di lavoro.

### 7.3 RAM e cybersecurity

La RAM contiene temporaneamente informazioni utilizzate dai programmi.

In determinate condizioni, l'analisi della memoria può consentire di individuare:

- Processi sospetti.
- Codice malevolo.
- Informazioni sensibili.
- Artefatti di attacchi.
- Connessioni e attività anomale.

La memory forensics è una disciplina che analizza la memoria volatile per supportare le indagini di sicurezza.

## 8. ROM e firmware

La ROM (Read Only Memory) è una memoria non volatile, tradizionalmente utilizzata per conservare informazioni che devono essere mantenute anche in assenza di alimentazione.

Nei sistemi moderni il firmware viene normalmente memorizzato in memoria flash riscrivibile, non necessariamente in una ROM tradizionale.

### 8.1 Che cos'è il firmware

Il firmware è un software a basso livello integrato in un dispositivo hardware.

Ha il compito di inizializzare e controllare alcune funzionalità del dispositivo.

Esempi:

- Firmware della scheda madre.
- Firmware di un SSD.
- Firmware di una scheda di rete.
- Firmware di un router.
- Firmware di dispositivi IoT.

Il firmware costituisce il collegamento tra hardware e software.

### 8.2 BIOS e UEFI

BIOS e UEFI sono interfacce firmware utilizzate durante l'avvio del computer.

**BIOS**

È il sistema firmware tradizionale utilizzato nei PC storici.

**UEFI**

È il sistema firmware moderno che offre funzionalità più evolute, tra cui:

- Gestione moderna dei dispositivi di avvio.
- Supporto GPT.
- Configurazione del processo di avvio.
- Supporto al Secure Boot.

UEFI ha progressivamente sostituito il BIOS tradizionale.

## 9. Avvio sicuro – Secure Boot

Il processo di avvio del computer è particolarmente importante per la sicurezza.

Durante l'avvio vengono inizializzati i componenti hardware e viene caricato il sistema operativo.

Se un aggressore riesce a modificare componenti del processo di avvio, potrebbe riuscire a eseguire codice malevolo prima del caricamento del sistema operativo.

### 9.1 Fasi principali dell'avvio

Un modello semplificato:

```text
       ACCENSIONE
            |
            v
       FIRMWARE UEFI
            |
            v
   INIZIALIZZAZIONE HARDWARE
            |
            v
    VERIFICA BOOTLOADER
            |
            v
    CARICAMENTO KERNEL
            |
            v
     AVVIO SISTEMA
            |
            v
       LOGIN UTENTE
```

### 9.2 Che cos'è Secure Boot

Secure Boot è una funzionalità dello standard UEFI che verifica l'affidabilità delle componenti software coinvolte nell'avvio.

Utilizza firme digitali e chiavi attendibili per controllare che i componenti di avvio siano autorizzati.

L'obiettivo è impedire l'esecuzione di componenti di boot non autorizzati.

### 9.3 Minacce legate al processo di avvio

Alcune minacce comprendono:

- Bootkit.
- Rootkit a livello di avvio.
- Modifica non autorizzata del bootloader.
- Firmware compromesso.
- Avvio da dispositivi esterni non autorizzati.

### 9.4 Buone pratiche

- Mantenere aggiornato il firmware.
- Proteggere le impostazioni UEFI.
- Abilitare Secure Boot quando compatibile con la configurazione adottata.
- Limitare l'avvio da dispositivi esterni.
- Proteggere fisicamente il dispositivo.
- Verificare la provenienza degli aggiornamenti firmware.

Secure Boot non protegge da ogni tipologia di attacco: è uno dei livelli di una strategia di difesa più ampia.

## 10. SSD e HDD – Memorie di massa

Le memorie di massa consentono di conservare dati e programmi anche quando il computer viene spento.

### 10.1 HDD – Hard Disk Drive

L'HDD è un dispositivo di archiviazione magnetico composto da piatti rotanti e testine di lettura e scrittura.

Caratteristiche:

- Parti meccaniche in movimento.
- Capacità generalmente elevata.
- Costo per GB generalmente contenuto.
- Velocità inferiore rispetto agli SSD.
- Sensibilità a urti e vibrazioni.

### 10.2 SSD – Solid State Drive

L'SSD utilizza memoria flash per memorizzare i dati.

Caratteristiche:

- Nessuna parte meccanica in movimento.
- Tempi di accesso ridotti.
- Maggiore velocità rispetto agli HDD tradizionali.
- Minore sensibilità agli urti.
- Costo per GB generalmente superiore.

### 10.3 Confronto HDD e SSD

| Caratteristica | HDD | SSD |
| --- | --- | --- |
| Tecnologia | Magnetica | Memoria flash |
| Parti meccaniche | Sì | No |
| Velocità | Inferiore | Superiore |
| Rumorosità | Può essere presente | Assente |
| Resistenza agli urti | Generalmente inferiore | Generalmente superiore |
| Costo per GB | Generalmente inferiore | Generalmente superiore |

### 10.4 Interfacce di collegamento

Le unità di archiviazione possono utilizzare diverse interfacce:

- SATA.
- NVMe.
- PCI Express.

Gli SSD NVMe utilizzano generalmente il bus PCIe e possono offrire prestazioni superiori rispetto agli SSD SATA.

### 10.5 SSD, HDD e sicurezza

Le memorie di massa contengono informazioni persistenti.

È necessario considerare:

- Cifratura dei dati.
- Gestione degli accessi.
- Backup.
- Cancellazione sicura.
- Protezione fisica dei dispositivi.

La semplice eliminazione di un file non garantisce necessariamente la cancellazione definitiva dei dati.

## 11. La scheda madre

La scheda madre (Motherboard) è il circuito principale del computer.

Collega e permette la comunicazione tra i diversi componenti hardware.

### 11.1 Componenti principali

- Socket CPU.
- Slot RAM.
- Chipset.
- Slot PCI Express.
- Connettori SATA.
- Slot M.2.
- Connettori di alimentazione.
- Porte USB.
- Interfacce di rete.
- Chip firmware UEFI.

### 11.2 Bus e comunicazione

I bus permettono il trasferimento di dati e segnali tra i componenti.

Tra le principali interfacce troviamo:

- PCI Express.
- SATA.
- USB.
- Bus di memoria.

Le caratteristiche della scheda madre determinano anche la compatibilità con processori, memorie e dispositivi di espansione.

### 11.3 Sicurezza della scheda madre

La scheda madre può rappresentare un elemento critico per la sicurezza perché ospita componenti coinvolti nell'avvio e nella gestione del sistema.

È importante:

- Proteggere fisicamente il dispositivo.
- Aggiornare il firmware quando necessario.
- Evitare configurazioni non autorizzate.
- Proteggere l'accesso alle impostazioni UEFI.

## 12. Periferiche

Le periferiche sono dispositivi collegati al computer per consentire l'acquisizione, la restituzione o lo scambio di informazioni.

### 12.1 Periferiche di input

Consentono di inserire dati nel sistema.

Esempi:

- Tastiera.
- Mouse.
- Scanner.
- Microfono.
- Webcam.
- Sensori.

### 12.2 Periferiche di output

Consentono di restituire informazioni all'utente.

Esempi:

- Monitor.
- Stampante.
- Altoparlanti.
- Proiettore.

### 12.3 Periferiche di input/output

Consentono sia di ricevere sia di trasmettere informazioni.

Esempi:

- Scheda di rete.
- Touchscreen.
- Dispositivi di archiviazione.
- Modem.

### 12.4 Periferiche e sicurezza

Le periferiche possono costituire un punto di ingresso per minacce informatiche.

Esempi:

- Dispositivi USB contenenti malware.
- Webcam utilizzate senza autorizzazione.
- Tastiere e dispositivi compromessi.
- Dispositivi di rete configurati in modo non sicuro.

È importante controllare i dispositivi collegati e limitare l'utilizzo di periferiche non autorizzate.

## 13. Laboratorio Linux – Analisi dell'hardware

In questa sezione utilizziamo Linux Ubuntu per raccogliere informazioni sull'hardware del computer.

Gli strumenti utilizzati sono:

- `lscpu`
- `free -h`
- `lsblk`
- `lspci`

### 13.1 Analizzare la CPU con lscpu

Il comando:

```bash
lscpu
```

Mostra informazioni sul processore.

Esempio di informazioni restituite:

```text
Architecture:        x86_64
CPU(s):              4
Thread(s) per core:  2
Core(s) per socket:  2
Socket(s):           1
```

Le informazioni possono variare in base al processore.

Interpretazione:

- Architecture: architettura del processore.
- CPU(s): processori logici disponibili.
- Thread(s) per core: thread hardware per core.
- Core(s) per socket: core fisici per socket.
- Socket(s): numero di socket CPU.

Comando aggiuntivo:

```bash
lscpu | grep -E 'Model name|CPU\(s\)|Core|Thread'
```

Permette di filtrare alcune informazioni.

### 13.2 Analizzare la RAM con free -h

Il comando:

```bash
free -h
```

Mostra informazioni sull'utilizzo della memoria.

Esempio:

```text
               total        used        free
Mem:            7.7Gi       2.1Gi       3.8Gi
Swap:           2.0Gi       0.0Ki       2.0Gi
```

Significato:

- total: memoria totale disponibile al sistema.
- used: memoria utilizzata secondo il criterio del comando.
- free: memoria completamente libera.
- buff/cache: memoria utilizzata per buffer e cache.
- available: stima della memoria disponibile per nuove applicazioni senza ricorrere significativamente allo swap.

La memoria disponibile (`available`) è generalmente più significativa della sola memoria libera.

Comando aggiuntivo:

```bash
free -h -w
```

Mostra una separazione più dettagliata delle componenti.

### 13.3 Analizzare i dispositivi di archiviazione con lsblk

Il comando:

```bash
lsblk
```

Mostra i dispositivi a blocchi presenti nel sistema.

Esempio:

```text
NAME   SIZE TYPE MOUNTPOINTS
sda    500G disk
├─sda1 512M part /boot/efi
└─sda2 499G part /
```

Informazioni:

- NAME: nome del dispositivo.
- SIZE: capacità.
- TYPE: tipologia.
- MOUNTPOINTS: punti di montaggio.

Per ottenere informazioni aggiuntive:

```bash
lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINTS,MODEL
```

Il comando permette di identificare le unità di archiviazione e le relative partizioni.

### 13.4 Analizzare le periferiche PCI con lspci

Il comando:

```bash
lspci
```

Mostra i dispositivi collegati al bus PCI.

Esempi:

- Controller USB.
- Schede di rete.
- Controller audio.
- Controller grafici.
- Controller di archiviazione.

Per ottenere informazioni più dettagliate:

```bash
lspci -nn
```

Per filtrare le periferiche di rete:

```bash
lspci | grep -i network
```

Per individuare eventuali controller grafici:

```bash
lspci | grep -i vga
```

## 14. Riepilogo dei comandi Linux

| Comando | Funzione |
| --- | --- |
| `lscpu` | Informazioni sulla CPU |
| `free -h` | Utilizzo della RAM e della swap |
| `lsblk` | Dispositivi di archiviazione |
| `lspci` | Dispositivi collegati al bus PCI |
| `lsusb` | Dispositivi USB |
| `sudo dmidecode` | Informazioni hardware da DMI/SMBIOS, quando disponibile |
| `uname -m` | Architettura del sistema |

Nota: alcuni comandi potrebbero richiedere l'installazione di pacchetti aggiuntivi o privilegi amministrativi.

## 15. Esercitazioni

### Esercizio 1 – Identificazione dei componenti

Classificare i seguenti componenti indicando la loro funzione:

1. CPU.
2. RAM.
3. SSD.
4. HDD.
5. Scheda madre.
6. Scheda di rete.
7. UEFI.
8. Cache L1.

Per ciascuno indicare:

- Funzione.
- Tipologia.
- Caratteristiche principali.
- Eventuale rilevanza per la sicurezza.

### Esercizio 2 – Analisi hardware Linux

Aprire il terminale ed eseguire:

```bash
lscpu
free -h
lsblk
lspci
```

Compilare una tabella con i risultati:

| Elemento | Informazione rilevata |
| --- | --- |
| Architettura CPU | |
| Modello CPU | |
| Numero core | |
| Numero thread | |
| RAM totale | |
| RAM disponibile | |
| Capacità SSD/HDD | |
| Scheda di rete | |
| Scheda grafica | |

### Esercizio 3 – RAM e archiviazione

Rispondere alle seguenti domande:

1. Qual è la differenza tra RAM e SSD?
2. Perché la RAM viene definita volatile?
3. Perché un computer non può utilizzare direttamente l'SSD come sostituto della RAM?
4. Quali vantaggi offre un SSD rispetto a un HDD?

### Esercizio 4 – Secure Boot

Rispondere:

1. Che cos'è UEFI?
2. Qual è la differenza tra BIOS e UEFI?
3. Che cosa verifica Secure Boot?
4. Che cosa si intende per bootkit?
5. Perché è importante proteggere il processo di avvio?

Se il computer lo consente, verificare lo stato di Secure Boot con:

```bash
mokutil --sb-state
```

Il comando potrebbe richiedere l'installazione del pacchetto `mokutil`.

### Esercizio 5 – Analisi hardware e cybersecurity

Scenario:

Un'organizzazione utilizza una workstation Linux per gestire informazioni riservate.

Durante una verifica vengono rilevate le seguenti condizioni:

- Firmware non aggiornato.
- Avvio da dispositivi USB consentito.
- Memoria SSD non cifrata.
- Accesso fisico al computer non controllato.

Individuare almeno quattro rischi e proporre una misura di protezione per ciascuno.

## 16. Domande di autovalutazione

1. Che cosa si intende per hardware?
2. Qual è il compito principale della CPU?
3. Che cosa fa l'ALU?
4. Che cosa sono i registri?
5. Qual è la funzione della cache?
6. Qual è la differenza tra RAM e ROM?
7. Che cosa si intende per memoria volatile?
8. Qual è la differenza tra SSD e HDD?
9. Qual è il ruolo della scheda madre?
10. Che cosa si intende per firmware?
11. Qual è la differenza tra BIOS e UEFI?
12. Che cosa verifica Secure Boot?
13. A cosa serve il comando `lscpu`?
14. Quali informazioni restituisce `free -h`?
15. Perché l'hardware è importante nella cybersecurity?

## 17. Riepilogo della lezione

I concetti fondamentali da ricordare:

- L'hardware comprende tutte le componenti fisiche del computer.
- La CPU esegue le istruzioni dei programmi.
- L'ALU gestisce operazioni aritmetiche e logiche.
- I registri e la cache supportano l'elaborazione ad alta velocità.
- La RAM è una memoria volatile utilizzata durante l'esecuzione.
- SSD e HDD conservano i dati in modo persistente.
- La scheda madre collega i componenti hardware.
- Il firmware gestisce funzionalità fondamentali dei dispositivi.
- UEFI e Secure Boot contribuiscono alla protezione del processo di avvio.
- Linux mette a disposizione strumenti per analizzare l'hardware.

## 18. Collegamenti con i moduli successivi

| Modulo | Collegamento |
| --- | --- |
| 03 – Software e sistemi operativi | Interazione tra hardware e software |
| 04 – Rappresentazione delle informazioni | Elaborazione binaria dei dati |
| 02 – Logica e algoritmi | Operazioni aritmetiche e logiche |
| 03 – Python | Esecuzione dei programmi e utilizzo delle risorse |
| 04 – Bash scripting | Automazione e amministrazione Linux |
| 07 – Cybersecurity | Sicurezza hardware, firmware e processo di avvio |

---

### WSL (Windows Subsystem for Linux)

- Come funziona. Permette di eseguire un vero kernel Linux (es. Ubuntu) direttamente dentro Windows, senza dover creare una macchina virtuale pesante.
- Vantaggi didattici. Tutti e tre i comandi (lscpu, free -h, lsblk) funzionano in modo nativo. Gli studenti vedranno la CPU reale, la RAM allocata al sottosistema e i dischi virtuali, imparando al contempo un ambiente standard nel mondo professionale.
- Installazione. Basta aprire il terminale di Windows (PowerShell o CMD) come amministratore e digitare wsl --install.

---

**Fine scheda didattica – 02 Hardware e architettura**
