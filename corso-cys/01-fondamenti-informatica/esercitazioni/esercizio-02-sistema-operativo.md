# Esercitazione 02 – Sistema operativo: kernel, processi, servizi e spazio disco

## 1. Obiettivi dell'esercitazione

L'obiettivo è esplorare il funzionamento del sistema operativo attraverso l'analisi di alcune sue componenti fondamentali.

Al termine dell'esercitazione lo studente sarà in grado di:

- Identificare la versione del sistema operativo e del kernel.
- Comprendere il ruolo del kernel nella gestione delle risorse.
- Individuare e analizzare i processi in esecuzione.
- Comprendere la differenza tra processo e servizio.
- Individuare i servizi attivi e il loro stato.
- Analizzare lo spazio disponibile sui dispositivi di archiviazione.
- Utilizzare strumenti a riga di comando per raccogliere informazioni sul sistema.
- Interpretare i risultati e riconoscere eventuali situazioni che richiedono approfondimenti.

## 2. Ambiente di lavoro

L'esercitazione può essere svolta utilizzando uno dei seguenti sistemi operativi:

| Sistema operativo | Ambiente       | Strumenti                                                     |
| ----------------- | -------------- | ------------------------------------------------------------- |
| Ubuntu / Linux    | Terminale Bash | `uname`, `ps`, `systemctl`, `df`                              |
| Windows 10/11     | PowerShell     | `Get-CimInstance`, `Get-Process`, `Get-Service`, `Get-Volume` |

Non è necessario installare software aggiuntivo.

**Nota:** i comandi Linux e Windows non sono identici, ma permettono di raccogliere informazioni analoghe. `systemctl`, ad esempio, è specifico dei sistemi che utilizzano systemd; su Windows si utilizza PowerShell per interrogare i servizi.

---

## 3. Parte A – Analisi del kernel

### 3.1 Che cos'è il kernel?

Il kernel è il componente centrale del sistema operativo. Gestisce le risorse hardware e fornisce servizi ai programmi in esecuzione.

Le sue principali responsabilità comprendono:

- Gestione dei processi e della CPU.
- Gestione della memoria.
- Comunicazione con i dispositivi hardware.
- Gestione delle operazioni di input/output.
- Gestione delle interruzioni.
- Controllo degli accessi alle risorse di sistema.

Il kernel opera a un livello privilegiato rispetto alle applicazioni.

In Linux il kernel è il nucleo del sistema operativo, mentre Ubuntu è una distribuzione che comprende il kernel, librerie, strumenti e applicazioni.

### 3.2 Ambiente Linux – Ubuntu

Aprire il terminale ed eseguire:

```bash
# Visualizza le informazioni sul sistema e sul kernel
uname -a

# Visualizza esclusivamente la versione del kernel
uname -r

# Visualizza l'architettura
uname -m

# Informazioni sulla distribuzione Linux
cat /etc/os-release
```

Prestare attenzione ai seguenti elementi:

| Comando               | Informazione                      |
| --------------------- | --------------------------------- |
| `uname -a`            | Informazioni generali sul sistema |
| `uname -r`            | Versione del kernel               |
| `uname -m`            | Architettura                      |
| `cat /etc/os-release` | Distribuzione e versione          |

### 3.3 Ambiente Windows – PowerShell

Windows utilizza un proprio kernel, appartenente alla famiglia Windows NT.

Aprire PowerShell ed eseguire:

```powershell
# Informazioni sul sistema operativo
Get-CimInstance Win32_OperatingSystem |
    Select-Object Caption, Version, BuildNumber, OSArchitecture
```

Per visualizzare informazioni aggiuntive:

```powershell
# Informazioni sul sistema
systeminfo
```

Per ottenere informazioni sulla versione del sistema:

```powershell
# Versione e build di Windows
[System.Environment]::OSVersion.Version
```

Windows non mette a disposizione un comando direttamente equivalente a `uname -r` per visualizzare la versione del kernel Linux. Le informazioni sulla versione del sistema Windows e sulla relativa build permettono comunque di identificare la versione dell'ambiente operativo.

### 3.4 Attività

Raccogliere le informazioni sul proprio sistema operativo e completare la tabella:

| Informazione             | Valore rilevato |
| ------------------------ | --------------- |
| Sistema operativo        |                 |
| Distribuzione o edizione |                 |
| Versione                 |                 |
| Versione kernel / build  |                 |
| Architettura             |                 |
| Nome computer            |                 |

### 3.5 Domande

1. Che cos'è il kernel?
2. Quali sono le principali funzioni del kernel?
3. Qual è la differenza tra kernel e sistema operativo?
4. Qual è la differenza tra Linux e Ubuntu?
5. Perché il kernel deve gestire l'accesso alle risorse hardware?
6. Quali vantaggi offre un'architettura a 64 bit?

---

## 4. Parte B – Analisi dei processi

### 4.1 Che cos'è un processo?

Un processo è un programma in esecuzione.

Quando un'applicazione viene avviata, il sistema operativo crea un processo e gli assegna le risorse necessarie.

Ogni processo è identificato da un numero denominato PID (Process Identifier).

Un processo può utilizzare:

- CPU.
- Memoria RAM.
- File.
- Dispositivi.
- Connessioni di rete.
- Altre risorse del sistema.

Esempi di processi:

- Browser web.
- Editor di testo.
- Server web.
- Database.
- Servizi di sistema.
- Applicazioni in esecuzione in background.

### 4.2 Ambiente Linux – Ubuntu

Aprire il terminale ed eseguire:

```bash
# Elenco dei processi in esecuzione
ps aux
```

Il comando mostra informazioni come:

| Campo   | Significato                           |
| ------- | ------------------------------------- |
| USER    | Utente proprietario del processo      |
| PID     | Identificativo del processo           |
| %CPU    | Percentuale di utilizzo della CPU     |
| %MEM    | Percentuale di utilizzo della memoria |
| STAT    | Stato del processo                    |
| COMMAND | Comando o programma eseguito          |

Per visualizzare i processi in modo interattivo:

```bash
top
```

Per visualizzare i processi dell'utente corrente:

```bash
ps -u "$USER"
```

Per cercare un processo specifico:

```bash
# Cerca i processi che contengono il nome firefox
ps aux | grep firefox
```

### 4.3 Ambiente Windows – PowerShell

Per visualizzare i processi in esecuzione:

```powershell
# Elenco dei processi
Get-Process
```

Per visualizzare informazioni specifiche:

```powershell
Get-Process |
    Select-Object Id, ProcessName, CPU, WorkingSet64
```

Per cercare un processo:

```powershell
# Cerca il processo Chrome
Get-Process -Name chrome -ErrorAction SilentlyContinue
```

Per visualizzare i processi ordinati in base all'utilizzo della memoria:

```powershell
Get-Process |
    Sort-Object WorkingSet64 -Descending |
    Select-Object -First 10 ProcessName, Id, WorkingSet64
```

In alternativa, è possibile utilizzare Gestione attività:

1. Premere `CTRL + SHIFT + ESC`.
2. Aprire la scheda **Processi**.
3. Osservare le colonne CPU, Memoria, Disco e Rete.
4. Individuare i processi che utilizzano maggiormente le risorse.

### 4.4 Attività

1. Visualizzare tutti i processi in esecuzione.
2. Individuare almeno cinque processi.
3. Annotare il PID di ciascun processo.
4. Individuare il processo che utilizza più memoria.
5. Individuare un processo associato a un'applicazione utilizzata quotidianamente.
6. Individuare un processo di sistema.

Completare la tabella:

| Processo |  PID | Utilizzo CPU | Memoria | Funzione |
| -------- | ---: | -----------: | ------: | -------- |
|          |      |              |         |          |
|          |      |              |         |          |
|          |      |              |         |          |
|          |      |              |         |          |
|          |      |              |         |          |

### 4.5 Domande

1. Che cos'è un processo?
2. Che cosa identifica il PID?
3. Qual è la differenza tra un programma e un processo?
4. Perché più processi possono essere in esecuzione contemporaneamente?
5. Che cosa può succedere se un processo utilizza una quantità eccessiva di memoria?
6. Qual è la differenza tra un processo applicativo e un processo di sistema?

---

## 5. Parte C – Analisi dei servizi

### 5.1 Che cos'è un servizio?

Un servizio è un programma o componente software progettato per svolgere attività in background, spesso senza interazione diretta con l'utente.

Esempi:

- Servizio di rete.
- Servizio di stampa.
- Servizio di gestione degli accessi.
- Servizio di aggiornamento.
- Server web.
- Database.
- Servizio SSH.

Un servizio può essere avviato automaticamente all'avvio del sistema oppure manualmente.

È importante distinguere:

- **Processo:** un'istanza di un programma in esecuzione.
- **Servizio:** una funzionalità o un componente gestito dal sistema operativo.

Un servizio attivo è generalmente associato a uno o più processi, ma la relazione non è necessariamente uno a uno.

### 5.2 Ambiente Linux – Ubuntu

Nelle distribuzioni che utilizzano systemd, la gestione dei servizi avviene attraverso `systemctl`.

Aprire il terminale ed eseguire:

```bash
# Elenca i servizi attivi
systemctl list-units --type=service --state=running
```

Per visualizzare tutti i servizi conosciuti dal sistema:

```bash
systemctl list-unit-files --type=service
```

Per verificare lo stato di un servizio specifico:

```bash
# Verifica lo stato del servizio SSH
systemctl status ssh
```

Su alcuni sistemi il servizio può chiamarsi `sshd`.

Per visualizzare se un servizio è abilitato all'avvio automatico:

```bash
systemctl is-enabled ssh
```

Per visualizzare se è attualmente attivo:

```bash
systemctl is-active ssh
```

**Attenzione:** non tutti i servizi presenti sono necessariamente attivi. Inoltre, un servizio disabilitato all'avvio potrebbe essere avviato manualmente o da altre unità.

### 5.3 Ambiente Windows – PowerShell

Windows utilizza il Service Control Manager per gestire i servizi.

Per visualizzare i servizi:

```powershell
# Elenca tutti i servizi
Get-Service
```

Per visualizzare soltanto i servizi in esecuzione:

```powershell
Get-Service |
    Where-Object {$_.Status -eq "Running"}
```

Per cercare un servizio specifico:

```powershell
# Cerca il servizio Windows Update
Get-Service -Name wuauserv
```

Per visualizzare maggiori informazioni:

```powershell
Get-CimInstance Win32_Service |
    Select-Object Name, DisplayName, State, StartMode
```

I campi principali sono:

| Campo       | Significato               |
| ----------- | ------------------------- |
| Name        | Nome tecnico del servizio |
| DisplayName | Nome visualizzato         |
| State       | Stato corrente            |
| StartMode   | Modalità di avvio         |

Alcuni possibili valori di `StartMode`:

- `Auto`: avvio automatico.
- `Manual`: avvio manuale o su richiesta.
- `Disabled`: servizio disabilitato.

In alternativa:

1. Premere `WIN + R`.
2. Digitare `services.msc`.
3. Premere Invio.
4. Osservare l'elenco dei servizi.
5. Verificare stato e tipo di avvio.

### 5.4 Attività

1. Elencare i servizi attivi.
2. Individuare almeno cinque servizi.
3. Annotare il nome e la funzione di ciascun servizio.
4. Verificare se l'avvio è automatico o manuale.
5. Individuare un servizio collegato alla rete.
6. Individuare un servizio collegato alla sicurezza o agli aggiornamenti.

Completare la tabella:

| Servizio | Stato | Tipo di avvio | Funzione |
| -------- | ----- | ------------- | -------- |
|          |       |               |          |
|          |       |               |          |
|          |       |               |          |
|          |       |               |          |
|          |       |               |          |

### 5.5 Domande

1. Che cos'è un servizio?
2. Qual è la differenza tra processo e servizio?
3. Che cosa significa che un servizio viene avviato automaticamente?
4. Qual è il ruolo di systemd in Linux?
5. Qual è lo strumento utilizzato da Windows per gestire i servizi?
6. Perché è opportuno disabilitare i servizi non necessari?
7. Perché non è consigliabile disabilitare un servizio senza conoscerne la funzione?

---

## 6. Parte D – Analisi dello spazio disco

### 6.1 File system e spazio di archiviazione

Il sistema operativo utilizza il file system per organizzare e gestire i dati presenti sui dispositivi di archiviazione.

Lo spazio disco viene utilizzato da:

- Sistema operativo.
- Applicazioni installate.
- Documenti.
- File temporanei.
- Log.
- Aggiornamenti.
- Backup locali.

La disponibilità di spazio libero è importante per il corretto funzionamento del sistema.

Un disco quasi pieno può causare:

- Impossibilità di salvare nuovi file.
- Errori durante gli aggiornamenti.
- Problemi nella creazione di file temporanei.
- Malfunzionamenti delle applicazioni.
- Interruzione di alcuni servizi.

### 6.2 Ambiente Linux – Ubuntu

Aprire il terminale ed eseguire:

```bash
# Visualizza lo spazio utilizzato e disponibile
df -h
```

Per visualizzare soltanto i filesystem principali:

```bash
df -h /
```

Per individuare le directory che occupano maggiormente spazio, limitando l'analisi alla propria home:

```bash
du -h --max-depth=1 "$HOME"
```

Significato delle colonne principali di `df -h`:

| Campo      | Significato              |
| ---------- | ------------------------ |
| Filesystem | Dispositivo o filesystem |
| Size       | Dimensione totale        |
| Used       | Spazio utilizzato        |
| Avail      | Spazio disponibile       |
| Use%       | Percentuale di utilizzo  |
| Mounted on | Punto di montaggio       |

L'opzione `-h` visualizza le dimensioni in formato leggibile, ad esempio MB o GB.

### 6.3 Ambiente Windows – PowerShell

Per visualizzare le unità disponibili:

```powershell
# Elenca le unità disco
Get-PSDrive -PSProvider FileSystem
```

Per ottenere informazioni più dettagliate sui volumi:

```powershell
Get-Volume |
    Select-Object DriveLetter, FileSystemLabel, FileSystem,
        @{Name="Dimensione (GB)"; Expression={[math]::Round($_.Size / 1GB, 2)}},
        @{Name="Spazio libero (GB)"; Expression={[math]::Round($_.SizeRemaining / 1GB, 2)}}
```

Per visualizzare lo spazio utilizzato e disponibile nelle unità logiche:

```powershell
Get-CimInstance Win32_LogicalDisk |
    Select-Object DeviceID,
        @{Name="Dimensione (GB)"; Expression={[math]::Round($_.Size / 1GB, 2)}},
        @{Name="Spazio libero (GB)"; Expression={[math]::Round($_.FreeSpace / 1GB, 2)}},
        @{Name="Utilizzo (%)"; Expression={
            [math]::Round((1 - ($_.FreeSpace / $_.Size)) * 100, 2)
        }}
```

In alternativa:

1. Aprire Esplora file.
2. Selezionare **Questo PC**.
3. Individuare le unità disponibili.
4. Osservare lo spazio utilizzato e quello libero.

### 6.4 Attività

1. Individuare le unità di archiviazione disponibili.
2. Rilevare la dimensione totale di ciascuna unità.
3. Rilevare lo spazio utilizzato.
4. Rilevare lo spazio disponibile.
5. Calcolare la percentuale di utilizzo.
6. Individuare l'unità con meno spazio libero.

Completare la tabella:

| Unità | Dimensione totale | Spazio utilizzato | Spazio disponibile | Utilizzo % |
| ----- | ----------------: | ----------------: | -----------------: | ---------: |
|       |                   |                   |                    |            |
|       |                   |                   |                    |            |
|       |                   |                   |                    |            |

### 6.5 Domande

1. Qual è la differenza tra spazio totale e spazio disponibile?
2. Che cosa significa che un disco è occupato al 90%?
3. Perché il sistema operativo ha bisogno di spazio libero?
4. Che cosa può succedere se la partizione principale si riempie?
5. Qual è la differenza tra `df` e `du` in Linux?
6. Quali informazioni fornisce il comando `Get-Volume` in Windows?

---

## 7. Parte E – Analisi e valutazione del sistema

Dopo aver raccolto le informazioni, effettuare una breve valutazione dello stato del proprio computer.

Rispondere alle seguenti domande:

1. Il sistema operativo è aggiornato?
2. Quanti processi risultano in esecuzione?
3. Sono presenti processi che utilizzano molte risorse?
4. Quanti servizi risultano attivi?
5. Sono presenti servizi che non si conosce?
6. Qual è la percentuale di utilizzo del disco principale?
7. Lo spazio disponibile è sufficiente?
8. Quali informazioni potrebbero essere utili durante un'attività di troubleshooting?
9. Quali elementi del sistema potrebbero richiedere un approfondimento?

**Attenzione:** la presenza di un processo o servizio sconosciuto non dimostra automaticamente un problema di sicurezza. È necessario verificarne nome, percorso, provenienza, funzione e comportamento.

---

## 8. Parte F – Report conclusivo

Preparare un breve report contenente i risultati dell'esercitazione.

### Scheda di rilevazione

| Categoria | Informazione                              | Valore rilevato |
| --------- | ----------------------------------------- | --------------- |
| Sistema   | Sistema operativo                         |                 |
| Sistema   | Versione                                  |                 |
| Kernel    | Versione / build                          |                 |
| Processi  | Numero di processi osservati              |                 |
| Processi  | Processo con maggiore utilizzo di memoria |                 |
| Servizi   | Numero di servizi attivi                  |                 |
| Servizi   | Servizio selezionato per l'analisi        |                 |
| Disco     | Unità principale                          |                 |
| Disco     | Spazio totale                             |                 |
| Disco     | Spazio disponibile                        |                 |
| Disco     | Percentuale di utilizzo                   |                 |

### Commento finale

Scrivere un breve commento (10-15 righe) che descriva:

- Le caratteristiche principali del sistema analizzato.
- Le informazioni più interessanti emerse.
- Eventuali anomalie o situazioni da approfondire.
- Le possibili attività di manutenzione o ottimizzazione.

---

## 9. Esercitazione aggiuntiva – Osservazione dei processi e dei servizi

Questa attività permette di osservare la relazione tra processi e servizi.

1. Individuare un servizio attivo nel sistema.
2. Cercare il processo associato, quando identificabile.
3. Annotare il nome del servizio e il PID del processo.
4. Verificare se il processo utilizza CPU o memoria.
5. Descrivere la funzione del servizio.

### Linux

Per verificare un servizio:

```bash
systemctl status ssh
```

Per individuare i processi SSH:

```bash
ps aux | grep ssh
```

### Windows

Per verificare un servizio:

```powershell
Get-Service -Name wuauserv
```

Per individuare i processi associati a un servizio, quando disponibili:

```powershell
Get-CimInstance Win32_Service |
    Where-Object {$_.Name -eq "wuauserv"} |
    Select-Object Name, State, ProcessId
```

Per visualizzare il processo:

```powershell
Get-Process -Id PID
```

Sostituire `PID` con il valore rilevato. Il servizio potrebbe non avere un processo dedicato oppure condividere un processo con altri servizi.

**Domanda:** perché un servizio può essere associato a un processo che gestisce anche altre funzionalità?

---

## 10. Consegna

Produrre un documento Markdown denominato:

`esercitazione-02-sistema-operativo-cognome-nome.md`

Il documento deve contenere:

1. Nome e cognome.
2. Sistema operativo utilizzato.
3. Comandi eseguiti.
4. Risultati dell'analisi del kernel.
5. Tabella dei processi osservati.
6. Tabella dei servizi analizzati.
7. Tabella dello spazio disco.
8. Risposte alle domande.
9. Commento conclusivo.

È possibile allegare screenshot dei risultati dei comandi, purché siano leggibili e non contengano informazioni personali non necessarie.

**Modalità di consegna:** caricare il documento nella cartella o nello spazio condiviso indicato dal docente.

---

## 11. Criteri di valutazione

| Criterio                                             | Punteggio |
| ---------------------------------------------------- | --------: |
| Identificazione del sistema operativo e del kernel   |         2 |
| Analisi e interpretazione dei processi               |         2 |
| Analisi dei servizi                                  |         2 |
| Analisi dello spazio disco                           |         2 |
| Completezza del report e capacità di interpretazione |         2 |
| **Totale**                                           |    **10** |

### Risultato atteso

Al termine dell'esercitazione ogni studente dovrà essere in grado di raccogliere e interpretare informazioni relative al funzionamento del sistema operativo, riconoscendo il ruolo del kernel, dei processi, dei servizi e delle risorse di archiviazione.

Dovrà inoltre saper utilizzare strumenti a riga di comando per effettuare una prima attività di osservazione e diagnostica del sistema.

**Nota:** i risultati possono variare in base alla versione del sistema operativo, ai programmi installati e ai servizi attivi. L'obiettivo non è ottenere valori identici tra gli studenti, ma imparare a utilizzare gli strumenti e interpretare correttamente le informazioni.