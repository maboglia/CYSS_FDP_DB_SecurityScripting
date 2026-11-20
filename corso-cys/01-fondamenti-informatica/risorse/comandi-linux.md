# Comandi Linux – Guida rapida alla riga di comando

## 1. Introduzione

La riga di comando (CLI – Command Line Interface) permette di interagire con il sistema operativo attraverso comandi testuali.

In Linux il terminale consente di:

- Navigare nel file system.
- Creare, modificare e organizzare file e directory.
- Cercare informazioni e contenuti.
- Gestire processi e risorse.
- Controllare permessi e autorizzazioni.
- Analizzare interfacce di rete e connessioni.
- Automatizzare attività attraverso script Bash.

Questa guida raccoglie i principali comandi utilizzati durante il modulo di Fondamenti di informatica e le successive attività di programmazione e cybersecurity.

### 1.1 Aprire il terminale

Su Ubuntu è possibile aprire il terminale con la combinazione:

```text
CTRL + ALT + T
```

Un esempio di prompt:

```text
studente@ubuntu:~$
```

Le informazioni rappresentate sono:

| Elemento   | Significato                                                        |
| ---------- | ------------------------------------------------------------------ |
| `studente` | Nome dell'utente                                                   |
| `ubuntu`   | Nome del computer                                                  |
| `~`        | Directory personale dell'utente                                    |
| `$`        | Prompt di un utente normale                                        |
| `#`        | Prompt di un utente con privilegi amministrativi, comunemente root |

**Attenzione:** il simbolo `$` o `#` è generalmente parte del prompt e non deve essere digitato insieme al comando.

---

## 2. Navigazione nel file system

### 2.1 `pwd` – Print Working Directory

Visualizza il percorso della directory corrente.

Sintassi:

```bash
pwd
```

Esempio:

```bash
pwd
```

Risultato:

```text
/home/studente
```

Utilità:

- Verificare in quale directory ci si trova.
- Controllare il percorso prima di modificare o eliminare file.
- Evitare operazioni nella directory sbagliata.

Equivalente Windows PowerShell:

```powershell
Get-Location
```

### 2.2 `ls` – List

Visualizza il contenuto di una directory.

Sintassi:

```bash
ls [opzioni] [percorso]
```

Esempi:

```bash
# Elenca i file della directory corrente
ls

# Visualizza informazioni dettagliate
ls -l

# Include i file nascosti
ls -a

# Visualizza informazioni dettagliate e file nascosti
ls -la

# Visualizza le dimensioni in formato leggibile
ls -lh

# Elenca il contenuto di una directory specifica
ls /home/studente/Documenti
```

Opzioni principali:

| Opzione | Descrizione                           |
| ------- | ------------------------------------- |
| `-l`    | Formato dettagliato                   |
| `-a`    | Include file nascosti                 |
| `-h`    | Dimensioni leggibili                  |
| `-R`    | Elenco ricorsivo delle sottodirectory |
| `-t`    | Ordina per data di modifica           |

Equivalente Windows PowerShell:

```powershell
Get-ChildItem
```

Alias disponibili:

```powershell
ls
dir
```

### 2.3 `cd` – Change Directory

Permette di spostarsi tra le directory.

Sintassi:

```bash
cd [percorso]
```

Esempi:

```bash
# Entra nella directory Documenti
cd Documenti

# Torna alla directory precedente
cd ..

# Torna alla directory personale
cd ~

# Torna alla directory radice
cd /

# Entra in una directory tramite percorso assoluto
cd /home/studente/Documenti

# Torna alla directory precedente
cd -
```

Concetti importanti:

| Simbolo | Significato          |
| ------- | -------------------- |
| `.`     | Directory corrente   |
| `..`    | Directory superiore  |
| `~`     | Directory personale  |
| `/`     | Directory radice     |
| `-`     | Directory precedente |

Equivalente Windows PowerShell:

```powershell
Set-Location Documenti
Set-Location ..
Set-Location $HOME
```

---

## 3. Creazione e gestione di directory e file

### 3.1 `mkdir` – Make Directory

Crea una nuova directory.

Sintassi:

```bash
mkdir [opzioni] nome_directory
```

Esempi:

```bash
# Crea una directory
mkdir laboratorio

# Crea più directory
mkdir documenti script backup

# Crea una struttura di directory anche se le directory intermedie non esistono
mkdir -p progetto/python/esercizi
```

L'opzione `-p` consente di creare anche le directory intermedie e non segnala errore se la directory esiste già.

Equivalente Windows PowerShell:

```powershell
New-Item -ItemType Directory -Name laboratorio
```

### 3.2 `cp` – Copy

Copia file e directory.

Sintassi:

```bash
cp [opzioni] origine destinazione
```

Esempi:

```bash
# Copia un file
cp relazione.txt relazione-backup.txt

# Copia un file in una directory
cp relazione.txt backup/

# Copia più file
cp file1.txt file2.txt backup/

# Copia una directory e il suo contenuto
cp -r documenti documenti-backup

# Conserva, per quanto possibile, attributi e timestamp
cp -p relazione.txt backup/
```

Opzioni principali:

| Opzione | Descrizione                            |
| ------- | -------------------------------------- |
| `-r`    | Copia ricorsiva delle directory        |
| `-p`    | Conserva i principali attributi        |
| `-i`    | Chiede conferma prima di sovrascrivere |
| `-v`    | Mostra le operazioni effettuate        |

Per maggiore prudenza durante le esercitazioni:

```bash
cp -i relazione.txt backup/
```

Equivalente Windows PowerShell:

```powershell
Copy-Item relazione.txt relazione-backup.txt
Copy-Item relazione.txt backup/
Copy-Item documenti documenti-backup -Recurse
```

### 3.3 `mv` – Move

Sposta file e directory oppure rinomina un elemento.

Sintassi:

```bash
mv [opzioni] origine destinazione
```

Esempi:

```bash
# Rinomina un file
mv relazione.txt relazione-finale.txt

# Sposta un file
mv relazione.txt documenti/

# Sposta una directory
mv documenti backup/
```

Opzioni utili:

| Opzione | Descrizione                               |
| ------- | ----------------------------------------- |
| `-i`    | Chiede conferma prima di sovrascrivere    |
| `-n`    | Evita la sovrascrittura di file esistenti |
| `-v`    | Mostra le operazioni effettuate           |

Equivalente Windows PowerShell:

```powershell
Move-Item relazione.txt documenti/
Rename-Item relazione.txt relazione-finale.txt
```

### 3.4 `rm` – Remove

Elimina file e directory.

Sintassi:

```bash
rm [opzioni] elemento
```

Esempi:

```bash
# Elimina un file
rm relazione.txt

# Chiede conferma prima dell'eliminazione
rm -i relazione.txt

# Elimina più file
rm file1.txt file2.txt

# Elimina una directory vuota
rmdir archivio

# Elimina una directory e il suo contenuto
rm -r documenti
```

Opzioni principali:

| Opzione | Descrizione                                  |
| ------- | -------------------------------------------- |
| `-i`    | Richiede conferma                            |
| `-r`    | Elimina ricorsivamente directory e contenuti |
| `-f`    | Forza l'eliminazione senza chiedere conferma |
| `-v`    | Mostra gli elementi eliminati                |

<text color="danger" weight="semibold">ATTENZIONE – Comando potenzialmente distruttivo</text>

Il comando `rm` elimina gli elementi senza utilizzare normalmente il cestino grafico.

Evitare assolutamente di eseguire comandi come:

```bash
rm -rf /
rm -rf *
```

L'utilizzo di `-r` e `-f` richiede particolare attenzione, soprattutto quando si utilizzano percorsi assoluti o variabili.

Durante le esercitazioni utilizzare esclusivamente directory create appositamente per il laboratorio.

Equivalente Windows PowerShell:

```powershell
Remove-Item relazione.txt
Remove-Item documenti -Recurse
```

Per richiedere conferma:

```powershell
Remove-Item relazione.txt -Confirm
```

---

## 4. Lettura e ricerca dei contenuti

### 4.1 `cat` – Concatenate

Visualizza il contenuto di uno o più file.

Sintassi:

```bash
cat [opzioni] file
```

Esempi:

```bash
# Visualizza un file
cat relazione.txt

# Visualizza più file
cat file1.txt file2.txt

# Unisce il contenuto di due file in un terzo
cat file1.txt file2.txt > unione.txt

# Aggiunge il contenuto di un file a un altro
cat appunti.txt >> relazione.txt
```

Gli operatori di redirezione:

| Operatore | Significato                                     |
| --------- | ----------------------------------------------- |
| `>`       | Scrive creando o sovrascrivendo il file         |
| `>>`      | Aggiunge contenuto alla fine del file           |
| `|`       | Invia l'output di un comando a un altro comando |

**Attenzione:** l'operatore `>` sovrascrive il contenuto esistente. Verificare sempre la destinazione prima di utilizzarlo.

Equivalente Windows PowerShell:

```powershell
Get-Content relazione.txt
```

Per scrivere o aggiungere contenuto:

```powershell
Set-Content relazione.txt "Nuovo contenuto"
Add-Content relazione.txt "Riga aggiuntiva"
```

### 4.2 `grep` – Global Regular Expression Print

Cerca stringhe o espressioni regolari all'interno di file o flussi di testo.

Sintassi:

```bash
grep [opzioni] pattern file
```

Esempi:

```bash
# Cerca la parola errore
grep "errore" sistema.log

# Ignora maiuscole e minuscole
grep -i "errore" sistema.log

# Mostra il numero di riga
grep -n "login" autenticazioni.log

# Cerca una parola in più file
grep "failed" *.log

# Cerca ricorsivamente nelle directory
grep -r "password" ./configurazione

# Mostra soltanto il numero delle corrispondenze
grep -c "ERROR" sistema.log

# Cerca più pattern
grep -E "ERROR|WARN|CRITICAL" sistema.log
```

Opzioni principali:

| Opzione | Descrizione                                               |
| ------- | --------------------------------------------------------- |
| `-i`    | Ignora maiuscole/minuscole                                |
| `-n`    | Mostra il numero di riga                                  |
| `-r`    | Ricerca ricorsiva                                         |
| `-c`    | Conta le corrispondenze                                   |
| `-v`    | Esclude le righe corrispondenti                           |
| `-E`    | Utilizza espressioni regolari estese                      |
| `-l`    | Mostra soltanto i nomi dei file contenenti corrispondenze |

Equivalente Windows PowerShell:

```powershell
Select-String -Path sistema.log -Pattern "errore"
```

Altri esempi:

```powershell
Select-String -Path sistema.log -Pattern "ERROR|WARN"
Select-String -Path sistema.log -Pattern "login" -CaseSensitive
```

### 4.3 `find` – Ricerca di file e directory

Permette di cercare elementi all'interno del file system in base a nome, tipo, dimensione, data e altri criteri.

Sintassi:

```bash
find percorso criteri
```

Esempi:

```bash
# Cerca tutti i file nella directory corrente
find .

# Cerca un file con nome preciso
find . -name "relazione.txt"

# Cerca file con estensione .log
find . -name "*.log"

# Cerca ignorando maiuscole e minuscole
find . -iname "*.TXT"

# Cerca soltanto directory
find . -type d

# Cerca soltanto file regolari
find . -type f

# Cerca file più grandi di 10 MB
find . -type f -size +10M

# Cerca file modificati negli ultimi 7 giorni
find . -type f -mtime -7
```

Tipi principali:

| Opzione   | Significato                                    |
| --------- | ---------------------------------------------- |
| `-type f` | File regolare                                  |
| `-type d` | Directory                                      |
| `-type l` | Link simbolico                                 |
| `-name`   | Ricerca per nome                               |
| `-iname`  | Ricerca per nome ignorando maiuscole/minuscole |
| `-size`   | Ricerca per dimensione                         |
| `-mtime`  | Ricerca in base alla data di modifica          |

Esempio combinato:

```bash
find ./log -type f -name "*.log" -mtime -7
```

Cerca i file con estensione `.log` modificati negli ultimi sette giorni all'interno della directory `log`.

Equivalente Windows PowerShell:

```powershell
Get-ChildItem -Path . -Recurse -File -Filter "*.log"
```

Ricerca per nome:

```powershell
Get-ChildItem -Path . -Recurse -Filter "relazione.txt"
```

---

## 5. Gestione dei permessi

### 5.1 `chmod` – Change Mode

Modifica i permessi di file e directory in Linux.

Sintassi:

```bash
chmod [opzioni] permessi file
```

I permessi fondamentali sono:

| Simbolo | Significato | Valore |
| ------- | ----------- | -----: |
| `r`     | Lettura     |      4 |
| `w`     | Scrittura   |      2 |
| `x`     | Esecuzione  |      1 |

Le categorie di utenti sono:

| Simbolo | Significato  |
| ------- | ------------ |
| `u`     | Proprietario |
| `g`     | Gruppo       |
| `o`     | Altri utenti |
| `a`     | Tutti        |

#### Notazione numerica

```bash
# Proprietario RW, gruppo R, altri R
chmod 644 file.txt

# Proprietario RW, gruppo R, altri nessuno
chmod 640 file.txt

# Proprietario RWX, gruppo RX, altri RX
chmod 755 script.sh

# Solo il proprietario può leggere e scrivere
chmod 600 credenziali.txt
```

#### Notazione simbolica

```bash
# Aggiunge il permesso di esecuzione al proprietario
chmod u+x script.sh

# Rimuove il permesso di scrittura agli altri
chmod o-w file.txt

# Aggiunge il permesso di lettura al gruppo
chmod g+r file.txt

# Imposta esattamente i permessi del proprietario
chmod u=rw file.txt
```

#### Visualizzare i permessi

```bash
ls -l file.txt
stat file.txt
```

**Attenzione:** evitare di assegnare permessi indiscriminati come `777`, soprattutto a file di configurazione, script e directory utilizzate da servizi.

Equivalente Windows PowerShell:

```powershell
Get-Acl file.txt
```

Per visualizzare le autorizzazioni NTFS:

```powershell
icacls file.txt
```

Windows utilizza ACL e non applica direttamente il modello numerico `chmod`.

---

## 6. Monitoraggio dei processi e delle risorse

### 6.1 `ps` – Process Status

Visualizza informazioni sui processi in esecuzione.

Esempi:

```bash
# Visualizza i processi associati al terminale
ps

# Visualizza tutti i processi
ps aux

# Visualizza i processi dell'utente corrente
ps -u "$USER"

# Cerca un processo specifico
ps aux | grep python

# Visualizza una struttura gerarchica
ps -ef --forest
```

Informazioni principali:

| Campo   | Significato                        |
| ------- | ---------------------------------- |
| USER    | Utente proprietario del processo   |
| PID     | Identificativo del processo        |
| %CPU    | Utilizzo percentuale della CPU     |
| %MEM    | Utilizzo percentuale della memoria |
| STAT    | Stato del processo                 |
| COMMAND | Comando associato                  |

Il PID (Process Identifier) identifica univocamente un processo durante la sua esecuzione.

Equivalente Windows PowerShell:

```powershell
Get-Process
```

Cercare un processo:

```powershell
Get-Process -Name python
```

Ordinare per utilizzo di memoria:

```powershell
Get-Process | Sort-Object WorkingSet64 -Descending
```

### 6.2 `free` – Visualizzazione della memoria

Mostra le informazioni sull'utilizzo della memoria RAM e dello swap.

Esempi:

```bash
# Visualizza le informazioni in formato leggibile
free -h

# Visualizza i valori in MB
free -m

# Aggiorna le informazioni ogni secondo
free -h -s 1
```

Esempio di output:

```text
               total        used        free      shared  buff/cache   available
Mem:            7.7Gi       2.1Gi       3.2Gi       200Mi       2.4Gi       5.1Gi
Swap:           2.0Gi          0B       2.0Gi
```

Campi principali:

| Campo      | Significato                                            |
| ---------- | ------------------------------------------------------ |
| total      | Memoria totale                                         |
| used       | Memoria utilizzata secondo il calcolo dello strumento  |
| free       | Memoria completamente libera                           |
| shared     | Memoria condivisa                                      |
| buff/cache | Memoria utilizzata per buffer e cache                  |
| available  | Stima della memoria disponibile per nuove applicazioni |

**Nota:** il valore `available` è generalmente più significativo del solo valore `free` per valutare quanta memoria può essere utilizzata da nuovi processi senza ricorrere allo swap.

Equivalente Windows PowerShell:

```powershell
Get-CimInstance Win32_OperatingSystem |
    Select-Object TotalVisibleMemorySize, FreePhysicalMemory
```

I valori restituiti da questo comando sono espressi in KB.

### 6.3 `df` – Disk Free

Visualizza lo spazio disponibile sui file system montati.

Esempi:

```bash
# Visualizza lo spazio disponibile
df

# Visualizza i valori in formato leggibile
df -h

# Visualizza lo spazio del file system contenente la directory corrente
df -h .

# Visualizza anche il tipo di file system
df -Th
```

Esempio di output:

```text
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda2        50G   25G   23G  53% /
```

Campi principali:

| Campo      | Significato               |
| ---------- | ------------------------- |
| Filesystem | File system o dispositivo |
| Size       | Dimensione totale         |
| Used       | Spazio utilizzato         |
| Avail      | Spazio disponibile        |
| Use%       | Percentuale di utilizzo   |
| Mounted on | Punto di montaggio        |

Equivalente Windows PowerShell:

```powershell
Get-PSDrive -PSProvider FileSystem
```

Per visualizzare i volumi:

```powershell
Get-Volume
```

**Differenza importante:** `df` mostra lo spazio utilizzato e disponibile sul file system; `du` permette invece di analizzare quanto spazio occupano file e directory specifici.

---

## 7. Analisi della rete

I comandi `ip` e `ss` sono particolarmente importanti nelle attività di cybersecurity perché consentono di osservare la configurazione di rete e le connessioni locali.

### 7.1 `ip` – Gestione e analisi delle interfacce di rete

Il comando `ip` permette di visualizzare e gestire interfacce, indirizzi IP e tabelle di routing.

#### Visualizzare le interfacce

```bash
ip link
```

Visualizza le interfacce di rete e il loro stato.

#### Visualizzare gli indirizzi IP

```bash
ip addr
```

Visualizza gli indirizzi IPv4 e IPv6 associati alle interfacce.

Versione sintetica:

```bash
ip -br addr
```

#### Visualizzare la tabella di routing

```bash
ip route
```

Visualizza le rotte IPv4.

Per IPv6:

```bash
ip -6 route
```

#### Individuare il percorso utilizzato per raggiungere un indirizzo

```bash
ip route get 1.1.1.1
```

Questo comando permette di osservare quale interfaccia e quale gateway vengono utilizzati per raggiungere la destinazione.

Equivalente Windows PowerShell:

```powershell
Get-NetAdapter
Get-NetIPConfiguration
Get-NetIPAddress
Get-NetRoute
```

Per una visualizzazione sintetica della configurazione:

```powershell
ipconfig /all
```

**Attenzione:** alcuni sottocomandi di `ip` modificano la configurazione di rete. In questa guida vengono utilizzate esclusivamente operazioni di consultazione. Non modificare indirizzi, rotte o stato delle interfacce senza autorizzazione.

### 7.2 `ss` – Socket Statistics

Visualizza informazioni su socket e connessioni di rete.

È uno strumento utile per comprendere quali servizi sono in ascolto e quali connessioni sono attive.

#### Visualizzare le connessioni TCP

```bash
ss -t
```

#### Visualizzare le connessioni TCP e UDP

```bash
ss -t -u
```

#### Visualizzare le porte in ascolto

```bash
ss -l
```

#### Visualizzare porte TCP e UDP in ascolto

```bash
ss -tuln
```

#### Visualizzare i processi associati ai socket

```bash
sudo ss -tulnp
```

L'opzione `sudo` può essere necessaria per visualizzare informazioni sui processi appartenenti ad altri utenti.

Opzioni principali:

| Opzione | Significato                        |
| ------- | ---------------------------------- |
| `-t`    | Socket TCP                         |
| `-u`    | Socket UDP                         |
| `-l`    | Socket in ascolto                  |
| `-n`    | Mostra numeri senza risolvere nomi |
| `-p`    | Mostra i processi associati        |
| `-a`    | Mostra tutti i socket              |

Esempio:

```bash
ss -tuln
```

Possibile risultato:

```text
Netid State  Recv-Q Send-Q Local Address:Port Peer Address:Port
tcp   LISTEN 0      128    0.0.0.0:22        0.0.0.0:*
tcp   LISTEN 0      128    127.0.0.1:8000    0.0.0.0:*
```

Interpretazione:

- La porta TCP 22 è in ascolto su tutte le interfacce IPv4.
- La porta TCP 8000 è in ascolto soltanto sull'interfaccia locale IPv4.

Una porta in ascolto non rappresenta automaticamente una vulnerabilità: è necessario conoscere il servizio, la sua configurazione, l'esposizione di rete e i controlli di accesso.

Equivalente Windows PowerShell:

```powershell
Get-NetTCPConnection -State Listen
```

Per le connessioni TCP:

```powershell
Get-NetTCPConnection
```

Per le porte UDP:

```powershell
Get-NetUDPEndpoint
```

Alternativa:

```powershell
netstat -ano
```

Il parametro `-o` consente di visualizzare il PID del processo associato.

---

## 8. Combinare i comandi: pipeline e redirezione

In Linux è possibile combinare più comandi attraverso le pipeline.

L'operatore `|` trasmette l'output di un comando come input al comando successivo.

### Esempio 1 – Cercare un processo

```bash
ps aux | grep python
```

Il risultato di `ps aux` viene filtrato da `grep`.

### Esempio 2 – Cercare errori nei log

```bash
grep -i "error" sistema.log
```

### Esempio 3 – Contare gli errori

```bash
grep -i "error" sistema.log | wc -l
```

### Esempio 4 – Ordinare i processi per utilizzo della CPU

```bash
ps aux --sort=-%cpu | head
```

### Esempio 5 – Salvare il risultato in un file

```bash
ps aux > processi.txt
```

### Esempio 6 – Salvare le connessioni di rete

```bash
ss -tuln > connessioni.txt
```

**Attenzione:** la redirezione `>` sovrascrive il file di destinazione. Per aggiungere informazioni utilizzare `>>`.

---

## 9. Tabella riepilogativa dei comandi

| Comando | Funzione                                    | Categoria          |
| ------- | ------------------------------------------- | ------------------ |
| `pwd`   | Visualizza la directory corrente            | Navigazione        |
| `ls`    | Elenca file e directory                     | Navigazione        |
| `cd`    | Cambia directory                            | Navigazione        |
| `mkdir` | Crea directory                              | File system        |
| `cp`    | Copia file e directory                      | File system        |
| `mv`    | Sposta o rinomina                           | File system        |
| `rm`    | Elimina file e directory                    | File system        |
| `cat`   | Visualizza o concatena file                 | Gestione contenuti |
| `grep`  | Cerca testo                                 | Ricerca            |
| `find`  | Cerca file e directory                      | Ricerca            |
| `chmod` | Modifica i permessi                         | Sicurezza          |
| `ps`    | Visualizza processi                         | Sistema            |
| `free`  | Visualizza la memoria                       | Risorse            |
| `df`    | Visualizza lo spazio disco                  | Risorse            |
| `ip`    | Visualizza configurazione di rete e routing | Rete               |
| `ss`    | Visualizza socket e connessioni             | Rete               |

---

## 10. Precauzioni di sicurezza

I comandi Linux consentono di intervenire direttamente sul sistema operativo. Un utilizzo scorretto può provocare perdita di dati, interruzioni dei servizi o configurazioni non sicure.

Prima di eseguire un comando verificare sempre:

1. La directory corrente con `pwd`.
2. Il contenuto della directory con `ls`.
3. Il percorso dei file coinvolti.
4. Gli effetti delle opzioni utilizzate.
5. La necessità effettiva di utilizzare `sudo`.

### Comandi e operazioni da utilizzare con particolare cautela

| Comando/operazione       | Rischio                                 |
| ------------------------ | --------------------------------------- |
| `rm -rf`                 | Eliminazione ricorsiva senza conferma   |
| `chmod -R`               | Modifica ricorsiva dei permessi         |
| `chown -R`               | Modifica ricorsiva della proprietà      |
| `sudo`                   | Esecuzione con privilegi amministrativi |
| `>`                      | Sovrascrittura del contenuto di un file |
| `ip addr add/del`        | Modifica degli indirizzi di rete        |
| `ip link set`            | Modifica dello stato di un'interfaccia  |
| `ip route add/del`       | Modifica delle rotte di rete            |
| `systemctl stop/disable` | Arresto o disabilitazione di servizi    |

### Regole da seguire durante le esercitazioni

- Operare esclusivamente nelle directory dedicate al laboratorio.
- Non utilizzare `sudo` se non espressamente richiesto.
- Non eliminare file o directory di sistema.
- Non modificare i permessi di file appartenenti al sistema operativo.
- Non disabilitare servizi o interfacce di rete.
- Non modificare le tabelle di routing.
- Non effettuare analisi su sistemi o reti senza autorizzazione.
- Prima di eseguire operazioni distruttive, verificare sempre i percorsi e le destinazioni.

---

## 11. Esercitazione autonoma – Esplorazione del sistema

Realizzare una breve attività pratica utilizzando i comandi descritti.

### Attività 1 – Navigazione

1. Visualizzare la directory corrente.
2. Elencare i file presenti.
3. Creare una directory denominata `test-comandi`.
4. Entrare nella directory.
5. Verificare il percorso.

Comandi di riferimento:

```bash
pwd
ls -la
mkdir test-comandi
cd test-comandi
pwd
```

### Attività 2 – Gestione dei file

1. Creare un file `appunti.txt`.
2. Inserire alcune righe di testo.
3. Copiare il file in `backup.txt`.
4. Rinominare il file originale.
5. Visualizzare il contenuto del backup.

Comandi di riferimento:

```bash
touch appunti.txt
echo "Esercitazione Linux" > appunti.txt
cp appunti.txt backup.txt
mv appunti.txt appunti-finali.txt
cat backup.txt
```

### Attività 3 – Ricerca

1. Cercare i file con estensione `.txt`.
2. Cercare la parola `Linux` nei file.
3. Visualizzare il numero di riga delle corrispondenze.
4. Verificare il risultato.

Comandi di riferimento:

```bash
find . -type f -name "*.txt"
grep -n "Linux" *.txt
```

### Attività 4 – Permessi

1. Visualizzare i permessi dei file.
2. Impostare `640` su `backup.txt`.
3. Verificare il risultato.
4. Spiegare il significato dei permessi assegnati.

Comandi di riferimento:

```bash
ls -l
chmod 640 backup.txt
stat backup.txt
```

### Attività 5 – Analisi del sistema

Eseguire i seguenti comandi e raccogliere i risultati:

```bash
ps aux
free -h
df -h
ip -br addr
ip route
ss -tuln
```

Per ciascun comando descrivere:

- Quali informazioni vengono visualizzate.
- Quali elementi sono rilevanti per la sicurezza.
- Quali anomalie potrebbero richiedere ulteriori verifiche.

### Consegna

Produrre una breve relazione contenente:

- I comandi eseguiti.
- Gli output principali.
- Una spiegazione delle operazioni effettuate.
- Le eventuali difficoltà incontrate.
- Una riflessione sull'importanza dell'utilizzo consapevole della CLI.

---

## 12. Risorse per approfondire

La documentazione ufficiale e le pagine manuale Linux rappresentano il riferimento principale per approfondire i comandi.

### Manuali Linux

Per consultare il manuale di un comando:

```bash
man ls
man chmod
man grep
man find
man ps
man ip
man ss
```

Per uscire dal manuale premere `q`.

Per una descrizione sintetica:

```bash
ls --help
chmod --help
grep --help
```

### Documentazione online

- GNU Coreutils: https://www.gnu.org/software/coreutils/manual/
- GNU Grep: https://www.gnu.org/software/grep/manual/
- GNU Findutils: https://www.gnu.org/software/findutils/manual/
- Linux man-pages: https://man7.org/linux/man-pages/
- Ubuntu Documentation: https://help.ubuntu.com/
- Microsoft PowerShell Documentation: https://learn.microsoft.com/powershell/
- Microsoft Windows Commands: https://learn.microsoft.com/windows-server/administration/windows-commands/windows-commands

## 13. Glossario essenziale

| Termine     | Definizione                                                   |
| ----------- | ------------------------------------------------------------- |
| CLI         | Command Line Interface, interfaccia testuale                  |
| Shell       | Programma che interpreta ed esegue i comandi                  |
| Bash        | Bourne Again Shell, shell comunemente utilizzata in Linux     |
| File system | Sistema per organizzare e gestire file e directory            |
| Directory   | Contenitore logico di file e altre directory                  |
| Path        | Percorso di un file o di una directory                        |
| Permesso    | Autorizzazione a eseguire un'operazione su una risorsa        |
| PID         | Process Identifier, identificativo di un processo             |
| Socket      | Endpoint di comunicazione tra processi                        |
| Pipeline    | Collegamento tra l'output di un comando e l'input di un altro |
| Redirezione | Reindirizzamento dell'input o dell'output                     |
| Root        | Account amministrativo con privilegi elevati                  |
| sudo        | Strumento per eseguire comandi con privilegi autorizzati      |
| Log         | Registrazione cronologica degli eventi di un sistema          |

**Conclusione:** la padronanza dei comandi Linux costituisce una competenza operativa essenziale per chi si occupa di sistemi informatici e cybersecurity. La CLI permette di osservare il funzionamento del sistema, individuare informazioni rilevanti e automatizzare attività, ma richiede consapevolezza dei privilegi e degli effetti di ogni operazione.