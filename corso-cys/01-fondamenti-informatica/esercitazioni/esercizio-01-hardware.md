# Esercitazione 01 – Hardware e architettura del computer

## 1. Obiettivi dell'esercitazione

L'obiettivo è imparare a riconoscere e classificare i principali componenti hardware di un computer, acquisendo informazioni tecniche direttamente dal sistema operativo.

Al termine dell'esercitazione lo studente sarà in grado di:

- Identificare i principali componenti hardware di un computer.
- Distinguere CPU, RAM, memoria di massa e periferiche.
- Raccogliere informazioni sulle caratteristiche hardware del proprio dispositivo.
- Utilizzare strumenti a riga di comando per analizzare l'hardware.
- Interpretare le informazioni restituite dal sistema operativo.
- Confrontare le caratteristiche hardware di dispositivi differenti.

## 2. Ambiente di lavoro

L'esercitazione può essere svolta utilizzando uno dei seguenti sistemi operativi:

| Sistema operativo | Strumenti                                          |
| ----------------- | -------------------------------------------------- |
| Ubuntu / Linux    | Terminale e comandi Linux                          |
| Windows 10/11     | PowerShell, Prompt dei comandi e Gestione attività |

Non è necessario installare software aggiuntivo.

**Importante:** gli studenti che utilizzano Windows possono svolgere tutte le attività previste utilizzando PowerShell e gli strumenti integrati nel sistema operativo.

## 3. Parte A – Classificazione dei componenti hardware

Prima di utilizzare i comandi, individuare e classificare i principali componenti hardware del proprio computer.

Completare la seguente tabella:

| Componente     | Funzione                                                 | Informazioni da rilevare              |
| -------------- | -------------------------------------------------------- | ------------------------------------- |
| CPU            | Esegue le istruzioni dei programmi                       | Produttore, modello, core e frequenza |
| RAM            | Memorizza temporaneamente dati e programmi in esecuzione | Capacità totale                       |
| Disco          | Memorizza dati e sistema operativo                       | Capacità, tipologia e modello         |
| Scheda madre   | Collega e coordina i componenti                          | Produttore e modello, se disponibili  |
| Scheda video   | Gestisce l'elaborazione grafica                          | Modello e memoria, se disponibili     |
| Scheda di rete | Consente la comunicazione in rete                        | Modello e tipologia                   |
| Periferiche    | Consentono input e output                                | Tastiera, mouse, monitor, webcam ecc. |

### Domande preliminari

1. Qual è la differenza tra CPU e RAM?
2. Perché la RAM viene definita memoria volatile?
3. Qual è la differenza tra HDD e SSD?
4. Che cosa significa che una CPU possiede più core?
5. Qual è la funzione della scheda madre?
6. Qual è la differenza tra memoria RAM e memoria di massa?

## 4. Parte B – Analisi della CPU

La CPU (Central Processing Unit) è il componente responsabile dell'esecuzione delle istruzioni dei programmi.

Durante questa attività raccogliere le seguenti informazioni:

- Produttore.
- Modello del processore.
- Numero di core fisici.
- Numero di processori logici (thread).
- Frequenza operativa, se disponibile.
- Architettura del processore (32 o 64 bit).

### Ambiente Linux – Ubuntu

Aprire il terminale ed eseguire:

```bash
# Visualizza le informazioni sulla CPU
lscpu
```

Prestare particolare attenzione ai campi:

| Campo              | Significato                      |
| ------------------ | -------------------------------- |
| Architecture       | Architettura del sistema         |
| CPU(s)             | Numero di CPU logiche            |
| Thread(s) per core | Thread per ciascun core          |
| Core(s) per socket | Numero di core per socket        |
| Socket(s)          | Numero di socket                 |
| Model name         | Modello del processore           |
| CPU MHz            | Frequenza corrente, se riportata |

### Ambiente Windows – PowerShell

Aprire PowerShell ed eseguire:

```powershell
# Informazioni principali sul processore
Get-CimInstance Win32_Processor |
    Select-Object Name, Manufacturer, NumberOfCores,
                  NumberOfLogicalProcessors, MaxClockSpeed
```

Per visualizzare anche l'architettura del sistema:

```powershell
Get-CimInstance Win32_OperatingSystem |
    Select-Object OSArchitecture
```

In alternativa, è possibile utilizzare:

```powershell
# Informazioni dettagliate sul sistema
systeminfo
```

### Attività

1. Individuare il modello della CPU.
2. Identificare il produttore.
3. Rilevare il numero di core fisici.
4. Rilevare il numero di processori logici.
5. Verificare se il sistema è a 32 o 64 bit.
6. Annotare la frequenza massima dichiarata, se disponibile.

**Domande:**

- Quanti core fisici possiede il processore?
- Quanti processori logici sono disponibili?
- I due valori coincidono?
- Qual è la differenza tra core fisico e thread logico?
- Il numero di core determina da solo le prestazioni di una CPU?

## 5. Parte C – Analisi della memoria RAM

La RAM è una memoria temporanea utilizzata dal sistema operativo e dai programmi durante la loro esecuzione.

L'obiettivo è individuare:

- Quantità totale di RAM installata.
- Quantità di memoria utilizzata.
- Quantità di memoria disponibile.
- Eventuale presenza di memoria swap o virtuale.

### Ambiente Linux – Ubuntu

```bash
# Visualizza le informazioni sulla memoria
free -h
```

Prestare attenzione ai seguenti campi:

| Campo      | Significato                                            |
| ---------- | ------------------------------------------------------ |
| total      | Memoria totale                                         |
| used       | Memoria utilizzata                                     |
| free       | Memoria completamente libera                           |
| shared     | Memoria condivisa                                      |
| buff/cache | Memoria utilizzata per buffer e cache                  |
| available  | Stima della memoria disponibile per nuove applicazioni |

Per visualizzare informazioni aggiuntive:

```bash
# Informazioni dettagliate sulla memoria
cat /proc/meminfo
```

### Ambiente Windows – PowerShell

```powershell
# Informazioni sulla memoria fisica installata
Get-CimInstance Win32_PhysicalMemory |
    Select-Object Manufacturer, Capacity, Speed
```

Per ottenere il totale della RAM installata:

```powershell
$ram = Get-CimInstance Win32_ComputerSystem

"RAM installata: {0:N2} GB" -f ($ram.TotalPhysicalMemory / 1GB)
```

Per visualizzare la memoria attualmente disponibile:

```powershell
Get-CimInstance Win32_OperatingSystem |
    Select-Object `
        @{Name="Memoria totale (GB)"; Expression={[math]::Round($_.TotalVisibleMemorySize / 1MB, 2)}},
        @{Name="Memoria libera (GB)"; Expression={[math]::Round($_.FreePhysicalMemory / 1MB, 2)}}
```

In alternativa, utilizzare **Gestione attività**:

1. Premere `CTRL + SHIFT + ESC`.
2. Aprire la scheda **Prestazioni**.
3. Selezionare **Memoria**.
4. Osservare memoria totale, utilizzata, disponibile e velocità.

### Attività

1. Quanta RAM è installata sul computer?
2. Quanta RAM risulta disponibile?
3. Quanta memoria viene utilizzata?
4. La memoria è sufficiente per eseguire più applicazioni contemporaneamente?
5. Che cosa succede quando la RAM disponibile diventa insufficiente?

## 6. Parte D – Analisi delle unità di archiviazione

Le unità di archiviazione consentono di conservare permanentemente il sistema operativo, i programmi e i dati.

L'obiettivo è individuare:

- Numero di unità di archiviazione.
- Capacità dei dischi.
- Tipologia (HDD, SSD SATA, SSD NVMe).
- Partizioni presenti.
- Spazio disponibile, se rilevabile.

### Ambiente Linux – Ubuntu

```bash
# Elenca i dispositivi di archiviazione
lsblk
```

Per ottenere informazioni più dettagliate:

```bash
# Visualizza filesystem, tipo e punti di mount
lsblk -f

# Visualizza lo spazio disponibile sui filesystem
df -h
```

Prestare attenzione ai seguenti elementi:

| Elemento    | Significato                 |
| ----------- | --------------------------- |
| NAME        | Nome del dispositivo        |
| SIZE        | Dimensione                  |
| TYPE        | Tipologia: disk, part, ecc. |
| FSTYPE      | Tipo di filesystem          |
| MOUNTPOINTS | Punto di montaggio          |

Esempio:

```text
NAME        SIZE TYPE MOUNTPOINTS
sda         500G disk
├─sda1      512M part /boot/efi
└─sda2    499.5G part /
```

L'esempio rappresenta un disco da 500 GB suddiviso in due partizioni.

### Ambiente Windows – PowerShell

Per visualizzare i dischi fisici:

```powershell
Get-PhysicalDisk |
    Select-Object FriendlyName, MediaType, Size, HealthStatus
```

Per visualizzare le unità logiche:

```powershell
Get-CimInstance Win32_LogicalDisk |
    Select-Object DeviceID, VolumeName,
        @{Name="Dimensione (GB)"; Expression={[math]::Round($_.Size / 1GB, 2)}},
        @{Name="Spazio libero (GB)"; Expression={[math]::Round($_.FreeSpace / 1GB, 2)}}
```

Per visualizzare dischi e partizioni:

```powershell
Get-Disk
Get-Partition
```

In alternativa:

1. Premere `WIN + X`.
2. Selezionare **Gestione disco**.
3. Osservare i dischi fisici.
4. Individuare le partizioni presenti.
5. Rilevare capacità e spazio non allocato.

### Attività

1. Quanti dischi sono presenti?
2. Qual è la capacità totale?
3. Il disco è un HDD o un SSD?
4. Quali partizioni sono presenti?
5. Qual è la differenza tra disco fisico e partizione?
6. Perché un SSD è generalmente più veloce di un HDD?

## 7. Parte E – Analisi delle periferiche e dei componenti

Un computer utilizza diversi dispositivi collegati alla scheda madre o attraverso interfacce esterne.

Esempi:

- Scheda video.
- Scheda audio.
- Scheda di rete.
- Controller USB.
- Tastiera e mouse.
- Webcam.
- Stampante.

### Ambiente Linux – Ubuntu

Per visualizzare i dispositivi collegati al bus PCI:

```bash
# Elenca i dispositivi PCI
lspci
```

Per visualizzare informazioni dettagliate:

```bash
# Informazioni dettagliate sui dispositivi PCI
lspci -v
```

Per visualizzare i dispositivi USB:

```bash
# Elenca i dispositivi USB
lsusb
```

### Ambiente Windows – PowerShell

Per visualizzare i dispositivi hardware:

```powershell
Get-PnpDevice |
    Select-Object Class, FriendlyName, Status
```

Per visualizzare le schede di rete:

```powershell
Get-NetAdapter |
    Select-Object Name, InterfaceDescription, Status, LinkSpeed
```

Per individuare la scheda video:

```powershell
Get-CimInstance Win32_VideoController |
    Select-Object Name, AdapterRAM, DriverVersion
```

In alternativa:

1. Premere `WIN + X`.
2. Selezionare **Gestione dispositivi**.
3. Espandere le categorie:
   - Schede video.
   - Schede di rete.
   - Controller USB.
   - Controller audio.
   - Unità disco.
4. Annotare i dispositivi presenti.

### Attività

1. Individuare il modello della scheda video.
2. Individuare la scheda di rete.
3. Identificare almeno due dispositivi aggiuntivi.
4. Distinguere dispositivi interni e periferiche esterne.
5. Individuare eventuali dispositivi con problemi o driver non correttamente installati.

## 8. Parte F – Riepilogo delle informazioni raccolte

Completare la seguente scheda tecnica utilizzando i risultati delle attività precedenti.

| Caratteristica                 | Valore rilevato |
| ------------------------------ | --------------- |
| Sistema operativo              |                 |
| Versione del sistema operativo |                 |
| Produttore CPU                 |                 |
| Modello CPU                    |                 |
| Numero core fisici             |                 |
| Numero processori logici       |                 |
| Architettura                   |                 |
| RAM installata                 |                 |
| RAM disponibile                |                 |
| Numero dischi                  |                 |
| Capacità totale archiviazione  |                 |
| Tipologia disco                |                 |
| Modello scheda video           |                 |
| Modello scheda di rete         |                 |

## 9. Parte G – Analisi e riflessione

Rispondere alle seguenti domande sulla base dei dati raccolti.

1. Il computer analizzato è adatto a un utilizzo didattico e allo sviluppo software?
2. Quale componente potrebbe rappresentare il principale limite prestazionale?
3. Quali vantaggi offre un processore con più core?
4. Qual è la differenza tra RAM e memoria di archiviazione?
5. Quali vantaggi offre un SSD rispetto a un HDD?
6. Quali componenti potrebbero essere aggiornati o potenziati?
7. Quali informazioni hardware potrebbero essere utili durante un'attività di troubleshooting?
8. Perché è importante conoscere l'hardware di un sistema prima di installare software o configurare servizi?

## 10. Consegna

Produrre un documento Markdown denominato:

`esercitazione-01-hardware-cognome-nome.md`

Il documento deve contenere:

1. Nome e cognome.
2. Sistema operativo utilizzato.
3. Comandi o strumenti utilizzati.
4. Tabella con le caratteristiche hardware rilevate.
5. Risposte alle domande delle varie sezioni.
6. Breve valutazione conclusiva del computer analizzato.

È possibile aggiungere screenshot dei risultati dei comandi, purché siano leggibili e non contengano informazioni personali o identificative non necessarie.

**Modalità di consegna:** caricare il documento nella cartella o nello spazio condiviso indicato dal docente.

## 11. Criteri di valutazione

| Criterio                                           | Punteggio |
| -------------------------------------------------- | --------: |
| Corretta classificazione dei componenti hardware   |         2 |
| Utilizzo appropriato degli strumenti di analisi    |         2 |
| Raccolta e interpretazione dei dati CPU e RAM      |         2 |
| Analisi delle unità di archiviazione e periferiche |         2 |
| Completezza del report e risposte alle domande     |         2 |
| **Totale**                                         |    **10** |

### Risultato atteso

Al termine dell'esercitazione ogni studente dovrà essere in grado di descrivere le caratteristiche hardware principali del proprio computer, interpretare le informazioni fornite dal sistema operativo e riconoscere le differenze tra le principali componenti di un sistema informatico.

**Nota:** i risultati possono differire tra dispositivi e sistemi operativi. Alcune informazioni, come la frequenza effettiva della CPU, la tipologia del disco o la memoria video dedicata, potrebbero non essere disponibili attraverso tutti gli strumenti. In questi casi indicare il dato come non rilevato, senza inventare valori.