# Comandi Windows – Guida rapida a PowerShell e Prompt dei comandi

## 1. Introduzione

Windows mette a disposizione diversi strumenti per interagire con il sistema operativo attraverso comandi testuali.

I principali ambienti sono:

- **Windows PowerShell:** shell e ambiente di scripting basato su oggetti, adatto all'amministrazione e all'automazione.
- **Windows Terminal:** applicazione che permette di utilizzare PowerShell, Prompt dei comandi e altre shell.
- **Prompt dei comandi (cmd):** interprete dei comandi tradizionale di Windows.

In questa guida PowerShell rappresenta l'ambiente di riferimento.

La riga di comando permette di:

- Navigare nel file system.
- Creare, modificare e organizzare file e directory.
- Cercare informazioni e contenuti.
- Gestire processi e servizi.
- Monitorare memoria e spazio disco.
- Visualizzare configurazioni di rete.
- Analizzare connessioni e porte.
- Consultare eventi e informazioni di sicurezza.
- Automatizzare attività attraverso script PowerShell.

## 2. Aprire PowerShell

È possibile aprire PowerShell in diversi modi:

1. Cercare PowerShell dal menu Start.
2. Aprire Windows Terminal e selezionare PowerShell.
3. Premere `Win + X` e selezionare Terminale.
4. Utilizzare la finestra Esegui (`Win + R`) e digitare `powershell`.

Un esempio di prompt:

```powershell
PS C:\Users\Studente>
```

| Elemento          | Significato                       |
| ----------------- | --------------------------------- |
| `PS`              | Indica PowerShell                 |
| `C:`              | Unità corrente                    |
| `\Users\Studente` | Percorso della directory corrente |
| `>`               | Prompt in attesa di un comando    |

### 2.1 PowerShell e CMD: differenze

PowerShell e CMD possono utilizzare comandi simili, ma hanno un funzionamento differente.

| Caratteristica    | PowerShell      | CMD             |
| ----------------- | --------------- | --------------- |
| Interprete        | PowerShell      | `cmd.exe`       |
| Output            | Oggetti .NET    | Testo           |
| Scripting         | `.ps1`          | `.bat`, `.cmd`  |
| Gestione processi | `Get-Process`   | `tasklist`      |
| Gestione servizi  | `Get-Service`   | `sc query`      |
| Ricerca testo     | `Select-String` | `findstr`       |
| Gestione file     | `Copy-Item`     | `copy`, `xcopy` |

**Nota:** PowerShell dispone anche di alias come `ls`, `dir`, `cp`, `mv` e `rm`, che richiamano cmdlet PowerShell. Non sono necessariamente gli stessi programmi presenti in Linux.

---

## 3. Navigazione nel file system

### 3.1 `Get-Location` – Directory corrente

Visualizza il percorso della directory corrente.

```powershell
Get-Location
```

Alias:

```powershell
pwd
```

Esempio di risultato:

```text
Path
----
C:\Users\Studente
```

Utilità:

- Verificare dove ci si trova.
- Controllare il percorso prima di modificare file.
- Evitare operazioni nella directory sbagliata.

### 3.2 `Get-ChildItem` – Elenco di file e directory

Visualizza il contenuto di una directory.

```powershell
# Elenca gli elementi della directory corrente
Get-ChildItem

# Elenca anche gli elementi nascosti
Get-ChildItem -Force

# Visualizza il contenuto di una directory specifica
Get-ChildItem C:\Users\Studente\Documents

# Elenca ricorsivamente i file e le directory
Get-ChildItem -Recurse

# Cerca soltanto i file
Get-ChildItem -File

# Cerca soltanto le directory
Get-ChildItem -Directory
```

Alias:

```powershell
ls
dir
gci
```

Per cercare file con una determinata estensione:

```powershell
Get-ChildItem -Path . -Filter "*.txt" -File
```

### 3.3 `Set-Location` – Cambio directory

Permette di spostarsi tra le directory.

```powershell
# Entra nella directory Documenti
Set-Location Documents

# Torna alla directory superiore
Set-Location ..

# Torna alla directory personale
Set-Location $HOME

# Entra nella directory radice dell'unità corrente
Set-Location \

# Entra in una directory tramite percorso assoluto
Set-Location C:\Users\Studente\Documents
```

Alias:

```powershell
cd Documents
```

Concetti importanti:

| Simbolo | Significato                |
| ------- | -------------------------- |
| `.`     | Directory corrente         |
| `..`    | Directory superiore        |
| `$HOME` | Directory personale        |
| `\`     | Radice dell'unità corrente |
| `C:\`   | Radice dell'unità C        |

---

## 4. Creazione e gestione di directory e file

### 4.1 `New-Item` – Creazione di elementi

Permette di creare file, directory e altri elementi supportati.

Creare una directory:

```powershell
New-Item -ItemType Directory -Name laboratorio
```

Creare più directory:

```powershell
New-Item -ItemType Directory -Name documenti
New-Item -ItemType Directory -Name script
New-Item -ItemType Directory -Name backup
```

Creare una struttura completa:

```powershell
New-Item -ItemType Directory -Path progetto\python\esercizi -Force
```

Creare un file:

```powershell
New-Item -ItemType File -Name appunti.txt
```

Creare un file in una directory specifica:

```powershell
New-Item -ItemType File -Path documenti\relazione.txt
```

L'opzione `-Force` consente, tra le altre cose, di creare le directory intermedie e non segnalare errore quando la directory esiste già. Va utilizzata con attenzione quando si lavora con elementi esistenti.

### 4.2 `Copy-Item` – Copia

Copia file e directory.

```powershell
# Copia un file
Copy-Item relazione.txt relazione-backup.txt

# Copia un file in una directory
Copy-Item relazione.txt backup\

# Copia una directory e il suo contenuto
Copy-Item documenti documenti-backup -Recurse

# Copia più file
Copy-Item file1.txt, file2.txt backup\
```

Opzioni utili:

| Parametro  | Descrizione                                   |
| ---------- | --------------------------------------------- |
| `-Recurse` | Copia ricorsivamente directory e contenuti    |
| `-Force`   | Forza alcune operazioni su elementi esistenti |
| `-WhatIf`  | Simula l'operazione senza eseguirla           |
| `-Confirm` | Richiede conferma                             |

Esempio di simulazione:

```powershell
Copy-Item relazione.txt backup\ -WhatIf
```

`-WhatIf` è particolarmente utile quando si devono verificare operazioni potenzialmente rischiose.

### 4.3 `Move-Item` – Spostamento

Sposta file e directory.

```powershell
# Sposta un file
Move-Item relazione.txt documenti\

# Sposta una directory
Move-Item documenti backup\

# Sposta più file
Move-Item *.txt backup\
```

Per simulare un'operazione:

```powershell
Move-Item relazione.txt backup\ -WhatIf
```

### 4.4 `Rename-Item` – Rinomina

Rinomina file e directory.

```powershell
Rename-Item relazione.txt relazione-finale.txt

Rename-Item backup backup-archivio
```

### 4.5 `Remove-Item` – Eliminazione

Elimina file e directory.

```powershell
# Elimina un file
Remove-Item relazione.txt

# Elimina una directory vuota
Remove-Item archivio

# Elimina una directory e il suo contenuto
Remove-Item documenti -Recurse

# Richiede conferma
Remove-Item relazione.txt -Confirm

# Simula l'eliminazione
Remove-Item relazione.txt -WhatIf
```

<text color="danger" weight="semibold">ATTENZIONE – Comando potenzialmente distruttivo</text>

`Remove-Item` può eliminare file e directory senza utilizzare il cestino grafico.

Prestare particolare attenzione a:

```powershell
Remove-Item * -Recurse -Force
```

Questo comando può eliminare ricorsivamente gli elementi presenti nella directory corrente.

Prima di utilizzare `Remove-Item`:

1. Verificare il percorso con `Get-Location`.
2. Visualizzare gli elementi con `Get-ChildItem`.
3. Utilizzare `-WhatIf` per simulare l'operazione.
4. Verificare attentamente il percorso di destinazione.

Durante le esercitazioni utilizzare esclusivamente directory create per il laboratorio.

---

## 5. Lettura, scrittura e ricerca dei contenuti

### 5.1 `Get-Content` – Lettura di file

Visualizza il contenuto di un file.

```powershell
# Visualizza il contenuto
Get-Content relazione.txt

# Visualizza le prime 10 righe
Get-Content sistema.log -TotalCount 10

# Visualizza le ultime 10 righe
Get-Content sistema.log -Tail 10

# Aggiorna continuamente la visualizzazione
Get-Content sistema.log -Wait
```

Alias:

```powershell
cat relazione.txt
type relazione.txt
```

**Nota:** `type` è anche un comando tradizionale di CMD. In PowerShell, invece, è un alias di `Get-Content`.

### 5.2 `Set-Content` – Scrittura

Scrive contenuto in un file, sostituendo quello eventualmente presente.

```powershell
Set-Content relazione.txt "Prima riga"
```

Scrivere più righe:

```powershell
Set-Content relazione.txt @(
    "Prima riga"
    "Seconda riga"
    "Terza riga"
)
```

### 5.3 `Add-Content` – Aggiunta

Aggiunge contenuto alla fine di un file senza sostituire quello esistente.

```powershell
Add-Content relazione.txt "Nuova riga"
```

### 5.4 `Select-String` – Ricerca di testo

Permette di cercare stringhe ed espressioni regolari nei file.

```powershell
# Cerca la parola errore
Select-String -Path sistema.log -Pattern "errore"

# Cerca ignorando maiuscole e minuscole
Select-String -Path sistema.log -Pattern "ERROR"

# Cerca più termini
Select-String -Path sistema.log -Pattern "ERROR|WARN"

# Cerca una stringa in più file
Select-String -Path *.log -Pattern "login"

# Mostra il numero di riga
Select-String -Path sistema.log -Pattern "failed" |
    Select-Object Filename, LineNumber, Line
```

Per impostazione predefinita, la ricerca di `Select-String` non distingue maiuscole e minuscole.

### 5.5 `Get-ChildItem` – Ricerca di file

PowerShell utilizza `Get-ChildItem` anche per ricercare file e directory.

```powershell
# Cerca tutti i file .log nella directory corrente
Get-ChildItem -Path . -Filter "*.log" -File

# Cerca ricorsivamente tutti i file .txt
Get-ChildItem -Path . -Recurse -Filter "*.txt" -File

# Cerca un file con nome preciso
Get-ChildItem -Path C:\Users\Studente -Recurse -Filter "relazione.txt" -File

# Cerca directory con nome specifico
Get-ChildItem -Path . -Recurse -Directory -Filter "backup"
```

Per filtrare gli elementi:

```powershell
Get-ChildItem -Path . -Recurse -File |
    Where-Object { $_.Length -gt 1MB }
```

L'esempio individua i file con dimensione superiore a 1 MB.

### 5.6 `Where-Object` – Filtrare risultati

Permette di selezionare gli oggetti che soddisfano una condizione.

Esempio:

```powershell
Get-Process | Where-Object { $_.CPU -gt 10 }
```

Visualizza i processi che hanno un valore CPU superiore a 10 secondi di tempo CPU cumulativo.

Un altro esempio:

```powershell
Get-ChildItem -File |
    Where-Object { $_.Extension -eq ".log" }
```

Seleziona i file con estensione `.log`.

---

## 6. Gestione delle autorizzazioni NTFS

Windows utilizza un modello di autorizzazioni basato principalmente sulle ACL (Access Control Lists).

Le ACL definiscono quali utenti e gruppi possono eseguire determinate operazioni su file e directory.

### 6.1 Visualizzare le autorizzazioni con `Get-Acl`

```powershell
# Visualizza le autorizzazioni di un file
Get-Acl relazione.txt

# Visualizza le autorizzazioni in formato dettagliato
Get-Acl relazione.txt | Format-List

# Visualizza le singole regole di accesso
(Get-Acl relazione.txt).Access |
    Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited
```

Campi principali:

| Campo             | Significato                     |
| ----------------- | ------------------------------- |
| IdentityReference | Utente o gruppo                 |
| FileSystemRights  | Autorizzazioni assegnate        |
| AccessControlType | Allow oppure Deny               |
| IsInherited       | Indica se la regola è ereditata |

### 6.2 `icacls` – Gestione delle ACL

`icacls` è uno strumento Windows utilizzabile anche da PowerShell.

Visualizzare le autorizzazioni:

```powershell
icacls relazione.txt
```

Visualizzare le autorizzazioni di una directory:

```powershell
icacls C:\Users\Studente\Documents
```

Alcune autorizzazioni comuni:

| Sigla | Significato      |
| ----- | ---------------- |
| F     | Full Control     |
| M     | Modify           |
| RX    | Read and Execute |
| R     | Read             |
| W     | Write            |

Esempio di assegnazione di autorizzazione di lettura e scrittura all'utente corrente:

```powershell
icacls relazione.txt /grant:r "$($env:USERNAME):(R,W)"
```

**Attenzione:** questo comando modifica le ACL del file. Va eseguito esclusivamente su file creati per il laboratorio.

### 6.3 Interfaccia grafica

Per esaminare le autorizzazioni NTFS:

1. Aprire Esplora file.
2. Fare clic con il tasto destro su un file.
3. Selezionare Proprietà.
4. Aprire la scheda Sicurezza.
5. Selezionare un utente o gruppo.
6. Esaminare le autorizzazioni.

### 6.4 Principio del minimo privilegio

Il principio del minimo privilegio prevede che ogni utente disponga esclusivamente delle autorizzazioni necessarie per svolgere il proprio lavoro.

Esempio:

| Ruolo           | Autorizzazioni                        |
| --------------- | ------------------------------------- |
| Amministratore  | Controllo completo, se necessario     |
| Analista        | Lettura dei report                    |
| Operatore       | Modifica dei documenti assegnati      |
| Utente standard | Accesso alle sole risorse autorizzate |

La gestione delle ACL deve considerare anche le autorizzazioni ereditate e le appartenenze ai gruppi.

---

## 7. Monitoraggio dei processi e dei servizi

### 7.1 `Get-Process` – Gestione dei processi

Visualizza i processi in esecuzione.

```powershell
# Elenca tutti i processi
Get-Process

# Cerca un processo specifico
Get-Process -Name notepad

# Visualizza i primi 10 processi per utilizzo di memoria
Get-Process |
    Sort-Object WorkingSet64 -Descending |
    Select-Object -First 10

# Visualizza i processi ordinati per tempo CPU cumulativo
Get-Process |
    Sort-Object CPU -Descending |
    Select-Object -First 10
```

Campi principali:

| Campo        | Significato                                        |
| ------------ | -------------------------------------------------- |
| Id           | PID del processo                                   |
| ProcessName  | Nome del processo                                  |
| CPU          | Tempo CPU cumulativo                               |
| WorkingSet64 | Memoria fisica attualmente utilizzata dal processo |
| StartTime    | Ora di avvio, se disponibile                       |

### 7.2 `Stop-Process` – Terminazione dei processi

Permette di terminare un processo.

```powershell
Stop-Process -Name notepad
```

Oppure tramite PID:

```powershell
Stop-Process -Id 1234
```

Per richiedere conferma:

```powershell
Stop-Process -Id 1234 -Confirm
```

**Attenzione:** terminare un processo può comportare perdita di dati o interruzione di servizi. Durante le esercitazioni limitarsi a processi di prova avviati personalmente.

### 7.3 `Get-Service` – Gestione dei servizi

Visualizza i servizi Windows.

```powershell
# Elenca tutti i servizi
Get-Service

# Cerca un servizio specifico
Get-Service -Name Spooler

# Visualizza i servizi in esecuzione
Get-Service | Where-Object { $_.Status -eq "Running" }

# Visualizza i servizi arrestati
Get-Service | Where-Object { $_.Status -eq "Stopped" }
```

Campi principali:

| Campo       | Significato         |
| ----------- | ------------------- |
| Status      | Stato del servizio  |
| Name        | Nome identificativo |
| DisplayName | Nome descrittivo    |

Per visualizzare maggiori informazioni:

```powershell
Get-CimInstance Win32_Service |
    Select-Object Name, State, StartMode, StartName
```

### 7.4 `Get-Service` e sicurezza

I servizi possono essere utilizzati per eseguire attività in background.

È importante verificare:

- Quali servizi sono attivi.
- Quali account li eseguono.
- Quali servizi sono configurati per l'avvio automatico.
- Se esistono servizi non necessari.
- Se i servizi dispongono di privilegi eccessivi.

Non arrestare o disabilitare servizi di sistema senza conoscerne la funzione.

---

## 8. Monitoraggio delle risorse

### 8.1 Memoria RAM

PowerShell permette di visualizzare informazioni sulla memoria attraverso CIM.

```powershell
Get-CimInstance Win32_OperatingSystem |
    Select-Object TotalVisibleMemorySize, FreePhysicalMemory
```

I valori sono espressi in KB.

Per visualizzare le informazioni sulla memoria fisica installata:

```powershell
Get-CimInstance Win32_PhysicalMemory |
    Select-Object Manufacturer, Capacity, Speed
```

Per una visualizzazione grafica:

1. Premere `CTRL + SHIFT + ESC`.
2. Aprire Gestione attività.
3. Selezionare Prestazioni.
4. Selezionare Memoria.

### 8.2 `Get-PSDrive` – Unità e spazio disponibile

Visualizza le unità accessibili attraverso PowerShell.

```powershell
Get-PSDrive
```

Per visualizzare le unità di tipo FileSystem:

```powershell
Get-PSDrive -PSProvider FileSystem
```

Campi principali:

| Campo | Significato        |
| ----- | ------------------ |
| Name  | Nome dell'unità    |
| Used  | Spazio utilizzato  |
| Free  | Spazio disponibile |
| Root  | Percorso radice    |

### 8.3 `Get-Volume` – Informazioni sui volumi

Visualizza le informazioni relative ai volumi del sistema.

```powershell
Get-Volume
```

Per selezionare alcuni campi:

```powershell
Get-Volume |
    Select-Object DriveLetter, FileSystem, Size, SizeRemaining, HealthStatus
```

Questi comandi sono utili per verificare:

- Spazio disponibile.
- File system utilizzato.
- Stato del volume.
- Dimensione complessiva.

---

## 9. Analisi della rete

### 9.1 `ipconfig` – Configurazione IP

Visualizza la configurazione delle interfacce di rete.

```powershell
# Visualizza la configurazione IP essenziale
ipconfig

# Visualizza tutti i dettagli
ipconfig /all
```

Informazioni principali:

| Campo           | Significato           |
| --------------- | --------------------- |
| IPv4 Address    | Indirizzo IPv4        |
| IPv6 Address    | Indirizzo IPv6        |
| Subnet Mask     | Maschera di sottorete |
| Default Gateway | Gateway predefinito   |
| DNS Servers     | Server DNS            |

### 9.2 `Get-NetAdapter` – Interfacce di rete

Visualizza le schede di rete presenti nel sistema.

```powershell
Get-NetAdapter
```

Per ottenere maggiori dettagli:

```powershell
Get-NetAdapter | Format-List *
```

### 9.3 `Get-NetIPConfiguration` – Configurazione delle interfacce

Visualizza le informazioni IP associate alle interfacce.

```powershell
Get-NetIPConfiguration
```

Per visualizzare gli indirizzi IP:

```powershell
Get-NetIPAddress
```

### 9.4 `Get-NetRoute` – Tabella di routing

Visualizza le rotte conosciute dal sistema.

```powershell
Get-NetRoute
```

Per visualizzare le rotte IPv4:

```powershell
Get-NetRoute -AddressFamily IPv4
```

Per visualizzare il gateway predefinito:

```powershell
Get-NetRoute -DestinationPrefix "0.0.0.0/0"
```

Alternativa CMD:

```cmd
route print
```

### 9.5 `Resolve-DnsName` – Risoluzione DNS

Consente di interrogare il sistema DNS.

```powershell
# Risolve il nome di un dominio
Resolve-DnsName example.com

# Richiede record IPv4
Resolve-DnsName example.com -Type A

# Richiede record IPv6
Resolve-DnsName example.com -Type AAAA

# Richiede record MX
Resolve-DnsName example.com -Type MX
```

Per visualizzare i server DNS configurati:

```powershell
Get-DnsClientServerAddress
```

### 9.6 `Get-NetTCPConnection` – Connessioni TCP

Visualizza le connessioni TCP presenti nel sistema.

```powershell
Get-NetTCPConnection
```

Visualizzare le connessioni in ascolto:

```powershell
Get-NetTCPConnection -State Listen
```

Visualizzare le connessioni stabilite:

```powershell
Get-NetTCPConnection -State Established
```

Visualizzare le porte locali:

```powershell
Get-NetTCPConnection |
    Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State
```

### 9.7 `Get-NetUDPEndpoint` – Endpoint UDP

Visualizza gli endpoint UDP locali.

```powershell
Get-NetUDPEndpoint
```

### 9.8 `netstat` – Statistiche di rete

È un comando tradizionale di Windows, disponibile anche in PowerShell.

```cmd
netstat -ano
```

Opzioni principali:

| Opzione | Significato                               |
| ------- | ----------------------------------------- |
| `-a`    | Visualizza connessioni e porte in ascolto |
| `-n`    | Visualizza indirizzi e porte numerici     |
| `-o`    | Visualizza il PID associato               |

Per visualizzare soltanto le porte in ascolto:

```cmd
netstat -ano | findstr LISTENING
```

Per associare un PID al processo:

```powershell
Get-Process -Id 1234
```

Una porta in ascolto non indica automaticamente la presenza di una vulnerabilità. Occorre identificare il servizio e valutare la sua esposizione e configurazione.

---

## 10. Analisi dei log e degli eventi Windows

Windows utilizza il servizio Windows Event Log per registrare gli eventi del sistema.

I registri principali sono:

| Registro    | Contenuto                                          |
| ----------- | -------------------------------------------------- |
| Application | Eventi delle applicazioni                          |
| System      | Eventi del sistema operativo e dei driver          |
| Security    | Eventi relativi alla sicurezza e agli accessi      |
| Setup       | Eventi relativi all'installazione e configurazione |

### 10.1 Visualizzatore eventi

Per aprire il Visualizzatore eventi:

1. Premere `Win + R`.
2. Digitare `eventvwr.msc`.
3. Aprire Registri di Windows.
4. Selezionare il registro da analizzare.

### 10.2 `Get-WinEvent` – Consultazione degli eventi

Visualizzare gli ultimi eventi di sistema:

```powershell
Get-WinEvent -LogName System -MaxEvents 20
```

Visualizzare gli eventi delle applicazioni:

```powershell
Get-WinEvent -LogName Application -MaxEvents 20
```

Visualizzare gli eventi di sicurezza:

```powershell
Get-WinEvent -LogName Security -MaxEvents 20
```

L'accesso al registro Security può richiedere autorizzazioni specifiche.

### 10.3 Filtrare gli eventi

Visualizzare gli ultimi eventi di errore del sistema:

```powershell
Get-WinEvent -FilterHashtable @{
    LogName = "System"
    Level = 2
} -MaxEvents 20
```

Valori principali del campo Level:

| Valore | Livello     |
| ------ | ----------- |
| 1      | Critical    |
| 2      | Error       |
| 3      | Warning     |
| 4      | Information |
| 5      | Verbose     |

Esempio: visualizzare gli eventi di errore del registro Application:

```powershell
Get-WinEvent -FilterHashtable @{
    LogName = "Application"
    Level = 2
} -MaxEvents 20
```

### 10.4 Esportare gli eventi

Salvare gli ultimi eventi di sistema in un file:

```powershell
Get-WinEvent -LogName System -MaxEvents 50 |
    Format-List TimeCreated, Id, LevelDisplayName, Message |
    Out-File eventi-sistema.txt
```

Questa operazione permette di creare un report testuale per successive analisi.

**Nota:** la disponibilità degli eventi dipende dalla configurazione del sistema e dalle politiche di auditing. L'assenza di un evento in un registro non dimostra necessariamente che l'operazione non sia avvenuta.

---

## 11. Combinare i comandi: pipeline e redirezione

PowerShell utilizza la pipeline per trasferire oggetti da un cmdlet all'altro.

L'operatore `|` permette di concatenare le operazioni.

### Esempio 1 – Cercare un processo

```powershell
Get-Process | Where-Object { $_.ProcessName -like "*python*" }
```

### Esempio 2 – Ordinare i processi per memoria

```powershell
Get-Process |
    Sort-Object WorkingSet64 -Descending |
    Select-Object -First 10
```

### Esempio 3 – Cercare errori in un file

```powershell
Select-String -Path sistema.log -Pattern "ERROR"
```

### Esempio 4 – Contare i processi

```powershell
(Get-Process).Count
```

### Esempio 5 – Salvare le informazioni sui processi

```powershell
Get-Process | Out-File processi.txt
```

### Esempio 6 – Esportare i risultati in CSV

```powershell
Get-Process |
    Select-Object ProcessName, Id, CPU, WorkingSet64 |
    Export-Csv processi.csv -NoTypeInformation
```

Il file CSV potrà essere aperto con Excel o elaborato con Python.

### Operatori di redirezione

| Operatore | Significato                                  |
| --------- | -------------------------------------------- |
| `>`       | Reindirizza l'output, sovrascrivendo il file |
| `>>`      | Aggiunge l'output al file                    |
| `2>`      | Reindirizza gli errori                       |
| `2>>`     | Aggiunge gli errori a un file                |
| `|`       | Collega comandi attraverso la pipeline       |

Esempio:

```powershell
Get-Process > processi.txt
```

**Attenzione:** `>` sovrascrive il contenuto del file di destinazione.

---

## 12. Tabella riepilogativa dei comandi

| Comando PowerShell       | Funzione                         | Categoria          |
| ------------------------ | -------------------------------- | ------------------ |
| `Get-Location`           | Visualizza la directory corrente | Navigazione        |
| `Get-ChildItem`          | Elenca file e directory          | Navigazione        |
| `Set-Location`           | Cambia directory                 | Navigazione        |
| `New-Item`               | Crea file e directory            | File system        |
| `Copy-Item`              | Copia file e directory           | File system        |
| `Move-Item`              | Sposta elementi                  | File system        |
| `Rename-Item`            | Rinomina elementi                | File system        |
| `Remove-Item`            | Elimina file e directory         | File system        |
| `Get-Content`            | Legge file                       | Gestione contenuti |
| `Set-Content`            | Scrive file                      | Gestione contenuti |
| `Add-Content`            | Aggiunge contenuto               | Gestione contenuti |
| `Select-String`          | Cerca testo                      | Ricerca            |
| `Get-Acl`                | Visualizza le autorizzazioni     | Sicurezza          |
| `icacls`                 | Gestisce le ACL NTFS             | Sicurezza          |
| `Get-Process`            | Visualizza processi              | Sistema            |
| `Stop-Process`           | Termina processi                 | Sistema            |
| `Get-Service`            | Visualizza servizi               | Sistema            |
| `Get-CimInstance`        | Recupera informazioni di sistema | Sistema            |
| `Get-PSDrive`            | Visualizza unità e spazio        | Risorse            |
| `Get-Volume`             | Visualizza volumi                | Risorse            |
| `Get-NetAdapter`         | Visualizza schede di rete        | Rete               |
| `Get-NetIPConfiguration` | Visualizza configurazione IP     | Rete               |
| `Get-NetRoute`           | Visualizza rotte                 | Rete               |
| `Resolve-DnsName`        | Interroga DNS                    | Rete               |
| `Get-NetTCPConnection`   | Visualizza connessioni TCP       | Rete               |
| `Get-NetUDPEndpoint`     | Visualizza endpoint UDP          | Rete               |
| `netstat`                | Visualizza connessioni e porte   | Rete               |
| `Get-WinEvent`           | Consulta i registri eventi       | Sicurezza          |

---

## 13. Precauzioni di sicurezza

I comandi PowerShell permettono di intervenire direttamente sul sistema operativo. Un utilizzo non consapevole può provocare perdita di dati, interruzione di servizi o modifiche alle autorizzazioni.

Prima di eseguire un comando verificare sempre:

1. Il percorso corrente con `Get-Location`.
2. Gli elementi presenti con `Get-ChildItem`.
3. Il percorso dei file coinvolti.
4. Gli effetti dei parametri utilizzati.
5. La necessità effettiva di avviare PowerShell come amministratore.

### Operazioni da utilizzare con particolare cautela

| Comando/operazione            | Rischio                                                          |
| ----------------------------- | ---------------------------------------------------------------- |
| `Remove-Item -Recurse -Force` | Eliminazione ricorsiva e forzata                                 |
| `Remove-Item *`               | Eliminazione degli elementi selezionati nella directory corrente |
| `Set-Acl`                     | Modifica delle autorizzazioni                                    |
| `icacls /grant`               | Assegnazione di autorizzazioni                                   |
| `icacls /reset`               | Ripristino delle ACL predefinite                                 |
| `Stop-Process`                | Terminazione di processi                                         |
| `Stop-Service`                | Arresto di servizi                                               |
| `Set-Service`                 | Modifica della configurazione dei servizi                        |
| `Set-NetIPAddress`            | Modifica degli indirizzi IP                                      |
| `New-NetRoute`                | Creazione di rotte                                               |
| `Remove-NetRoute`             | Eliminazione di rotte                                            |
| `Clear-DnsClientCache`        | Cancellazione della cache DNS                                    |
| `Set-ExecutionPolicy`         | Modifica della politica di esecuzione degli script               |

### Regole da seguire durante le esercitazioni

- Operare esclusivamente nelle directory dedicate al laboratorio.
- Non utilizzare PowerShell come amministratore se non necessario.
- Non modificare le autorizzazioni di directory di sistema.
- Non terminare processi sconosciuti.
- Non arrestare servizi di Windows senza autorizzazione.
- Non modificare la configurazione IP del computer.
- Non disabilitare firewall o antivirus.
- Non modificare le politiche di sicurezza del sistema.
- Utilizzare `-WhatIf` quando disponibile per simulare le operazioni.

---

## 14. Esercitazione autonoma – Esplorazione di Windows

Realizzare un'attività pratica utilizzando i comandi descritti.

### Attività 1 – Navigazione

1. Visualizzare la directory corrente.
2. Elencare i file presenti.
3. Creare una directory denominata `test-comandi`.
4. Entrare nella directory.
5. Verificare il percorso.

Comandi di riferimento:

```powershell
Get-Location
Get-ChildItem -Force
New-Item -ItemType Directory -Name test-comandi
Set-Location test-comandi
Get-Location
```

### Attività 2 – Gestione dei file

1. Creare un file `appunti.txt`.
2. Inserire alcune righe di testo.
3. Copiare il file in `backup.txt`.
4. Rinominare il file originale.
5. Visualizzare il contenuto del backup.

Comandi di riferimento:

```powershell
New-Item -ItemType File -Name appunti.txt

Set-Content appunti.txt "Esercitazione Windows"

Copy-Item appunti.txt backup.txt

Rename-Item appunti.txt appunti-finali.txt

Get-Content backup.txt
```

### Attività 3 – Ricerca

1. Cercare i file con estensione `.txt`.
2. Cercare la parola `Windows` nei file.
3. Visualizzare il numero di riga delle corrispondenze.
4. Verificare il risultato.

Comandi di riferimento:

```powershell
Get-ChildItem -Path . -Recurse -Filter "*.txt" -File

Select-String -Path *.txt -Pattern "Windows"
```

### Attività 4 – Autorizzazioni

1. Visualizzare le autorizzazioni di `backup.txt`.
2. Individuare utenti e gruppi autorizzati.
3. Individuare le autorizzazioni ereditate.
4. Spiegare il principio del minimo privilegio.

Comandi di riferimento:

```powershell
Get-Acl backup.txt

(Get-Acl backup.txt).Access |
    Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited
```

### Attività 5 – Analisi del sistema

Eseguire i seguenti comandi:

```powershell
Get-Process
Get-Service
Get-PSDrive -PSProvider FileSystem
Get-Volume
Get-NetAdapter
Get-NetIPConfiguration
Get-NetRoute
Get-NetTCPConnection -State Listen
```

Per ciascun comando descrivere:

- Quali informazioni vengono visualizzate.
- Quali elementi sono rilevanti per la sicurezza.
- Quali anomalie potrebbero richiedere ulteriori verifiche.

### Attività 6 – Analisi dei log

Visualizzare gli ultimi eventi del registro System:

```powershell
Get-WinEvent -LogName System -MaxEvents 20
```

Visualizzare gli eventi di errore:

```powershell
Get-WinEvent -FilterHashtable @{
    LogName = "System"
    Level = 2
} -MaxEvents 10
```

Salvare i risultati in un file:

```powershell
Get-WinEvent -LogName System -MaxEvents 20 |
    Format-List TimeCreated, Id, LevelDisplayName, Message |
    Out-File eventi-sistema.txt
```

### Consegna

Produrre una breve relazione contenente:

- I comandi eseguiti.
- Gli output principali.
- Una spiegazione delle operazioni effettuate.
- Le eventuali difficoltà incontrate.
- Una riflessione sull'importanza dell'utilizzo consapevole della CLI.

---

## 15. Equivalenze Linux e Windows

La tabella seguente permette di confrontare i comandi principali dei due sistemi operativi.

| Operazione          | Linux         | Windows PowerShell                           |
| ------------------- | ------------- | -------------------------------------------- |
| Directory corrente  | `pwd`         | `Get-Location`                               |
| Elenco file         | `ls`          | `Get-ChildItem`                              |
| Cambio directory    | `cd`          | `Set-Location`                               |
| Creazione directory | `mkdir`       | `New-Item -ItemType Directory`               |
| Creazione file      | `touch`       | `New-Item -ItemType File`                    |
| Copia               | `cp`          | `Copy-Item`                                  |
| Spostamento         | `mv`          | `Move-Item`                                  |
| Eliminazione        | `rm`          | `Remove-Item`                                |
| Lettura file        | `cat`         | `Get-Content`                                |
| Scrittura file      | `echo > file` | `Set-Content`                                |
| Ricerca testo       | `grep`        | `Select-String`                              |
| Ricerca file        | `find`        | `Get-ChildItem -Recurse`                     |
| Permessi            | `chmod`       | `Get-Acl`, `icacls`                          |
| Processi            | `ps`          | `Get-Process`                                |
| Memoria             | `free`        | `Get-CimInstance Win32_OperatingSystem`      |
| Spazio disco        | `df`          | `Get-Volume`, `Get-PSDrive`                  |
| Interfacce di rete  | `ip addr`     | `Get-NetAdapter`, `Get-NetIPConfiguration`   |
| Routing             | `ip route`    | `Get-NetRoute`                               |
| Socket              | `ss`          | `Get-NetTCPConnection`, `Get-NetUDPEndpoint` |
| Servizi             | `systemctl`   | `Get-Service`                                |
| Log                 | `journalctl`  | `Get-WinEvent`                               |

**Nota:** le equivalenze indicano funzioni analoghe, non necessariamente un comportamento identico. I due sistemi operativi utilizzano architetture, modelli di autorizzazione e strumenti differenti.

---

## 16. Risorse per approfondire

### Documentazione ufficiale Microsoft

- PowerShell: https://learn.microsoft.com/powershell/
- PowerShell Reference: https://learn.microsoft.com/powershell/module/
- Get-ChildItem: https://learn.microsoft.com/powershell/module/microsoft.powershell.management/get-childitem
- Get-Process: https://learn.microsoft.com/powershell/module/microsoft.powershell.management/get-process
- Get-Service: https://learn.microsoft.com/powershell/module/microsoft.powershell.management/get-service
- Get-WinEvent: https://learn.microsoft.com/powershell/module/microsoft.powershell.diagnostics/get-winevent
- Get-NetTCPConnection: https://learn.microsoft.com/powershell/module/nettcpip/get-nettcpconnection
- icacls: https://learn.microsoft.com/windows-server/administration/windows-commands/icacls

### Consultare l'aiuto direttamente da PowerShell

PowerShell dispone di un sistema di documentazione integrato.

```powershell
Get-Help Get-ChildItem
Get-Help Get-Process
Get-Help Get-Service
Get-Help Get-WinEvent
```

Per visualizzare esempi:

```powershell
Get-Help Get-ChildItem -Examples
```

Per visualizzare la documentazione completa:

```powershell
Get-Help Get-ChildItem -Full
```

Se la documentazione locale non è disponibile o aggiornata, è possibile consultarla online:

```powershell
Get-Help Get-ChildItem -Online
```

---

## 17. Glossario essenziale

| Termine          | Definizione                                                                           |
| ---------------- | ------------------------------------------------------------------------------------- |
| PowerShell       | Shell e ambiente di scripting Microsoft                                               |
| CMD              | Interprete dei comandi tradizionale di Windows                                        |
| Windows Terminal | Applicazione che ospita diverse shell                                                 |
| Cmdlet           | Comando PowerShell con struttura Verb-Noun                                            |
| Pipeline         | Collegamento tra comandi tramite `|`                                                  |
| ACL              | Access Control List, elenco delle autorizzazioni                                      |
| NTFS             | File system utilizzato da Windows                                                     |
| PID              | Process Identifier, identificativo di un processo                                     |
| Service          | Servizio eseguito in background                                                       |
| Event Log        | Sistema di registrazione degli eventi Windows                                         |
| CIM              | Common Information Model, modello per accedere a informazioni di gestione del sistema |
| WMI              | Windows Management Instrumentation                                                    |
| DNS              | Domain Name System                                                                    |
| TCP              | Transmission Control Protocol                                                         |
| UDP              | User Datagram Protocol                                                                |
| Socket           | Endpoint di comunicazione tra processi                                                |
| Execution Policy | Politica che regola le condizioni di esecuzione degli script PowerShell               |

**Conclusione:** PowerShell è uno strumento fondamentale per amministrare e analizzare sistemi Windows. La sua capacità di elaborare oggetti, interrogare componenti del sistema operativo e automatizzare attività lo rende particolarmente utile anche in ambito cybersecurity. La conoscenza dei comandi consente di effettuare verifiche, raccogliere informazioni e analizzare eventi senza dipendere esclusivamente dagli strumenti grafici.