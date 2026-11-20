# Esercitazione 05 – File e permessi

## 1. Obiettivi didattici

L'esercitazione ha lo scopo di comprendere come vengono organizzati file e directory e come il sistema operativo controlla l'accesso alle risorse attraverso i permessi.

Al termine dell'attività lo studente sarà in grado di:

- Creare, copiare, spostare ed eliminare file e directory.
- Esplorare la struttura del file system.
- Interpretare i permessi Linux `rwx`.
- Distinguere i permessi di proprietario, gruppo e altri utenti.
- Utilizzare il comando `chmod` per modificare i permessi.
- Comprendere il principio del minimo privilegio.
- Confrontare il modello dei permessi Linux con quello di Windows.
- Riconoscere configurazioni potenzialmente insicure.

## 2. Ambiente di lavoro

L'esercitazione può essere svolta su:

- **Linux Ubuntu:** terminale Bash.
- **Windows 10/11:** PowerShell e Esplora file.

I comandi Linux sono il riferimento principale per lo studio dei permessi `rwx`. Windows utilizza un modello differente, basato principalmente sulle ACL (Access Control Lists) del file system NTFS.

Non è necessario utilizzare privilegi amministrativi per le attività proposte.

### Preparazione dell'ambiente

Aprire un terminale Linux oppure PowerShell su Windows.

Creare una directory dedicata all'esercitazione.

**Linux:**

```bash
mkdir -p ~/laboratorio-permessi
cd ~/laboratorio-permessi
pwd
```

**Windows PowerShell:**

```powershell
New-Item -ItemType Directory -Path "$HOME\laboratorio-permessi" -Force
Set-Location "$HOME\laboratorio-permessi"
Get-Location
```

Tutte le operazioni successive dovranno essere effettuate all'interno di questa directory.

---

## 3. Parte A – Creazione e gestione di file e directory

### 3.1 Creare una struttura di directory

Creare la seguente struttura:

```text
laboratorio-permessi/
│
├── documenti/
│   ├── relazione.txt
│   └── appunti.txt
│
├── script/
│   └── controllo.sh
│
└── archivio/
```

**Linux:**

```bash
mkdir documenti script archivio

touch documenti/relazione.txt
touch documenti/appunti.txt
touch script/controllo.sh
```

**Windows PowerShell:**

```powershell
New-Item -ItemType Directory -Name documenti
New-Item -ItemType Directory -Name script
New-Item -ItemType Directory -Name archivio

New-Item -ItemType File -Path documenti/relazione.txt
New-Item -ItemType File -Path documenti/appunti.txt
New-Item -ItemType File -Path script/controllo.sh
```

### 3.2 Inserire contenuti nei file

**Linux:**

```bash
echo "Relazione sulle attività del laboratorio" > documenti/relazione.txt
echo "Appunti personali" > documenti/appunti.txt
echo "#!/bin/bash" > script/controllo.sh
echo 'echo "Controllo completato"' >> script/controllo.sh
```

**Windows PowerShell:**

```powershell
Set-Content documenti/relazione.txt "Relazione sulle attività del laboratorio"
Set-Content documenti/appunti.txt "Appunti personali"
Set-Content script/controllo.sh '#!/bin/bash'
Add-Content script/controllo.sh 'echo "Controllo completato"'
```

Visualizzare il contenuto dei file.

**Linux:**

```bash
cat documenti/relazione.txt
cat script/controllo.sh
```

**Windows PowerShell:**

```powershell
Get-Content documenti/relazione.txt
Get-Content script/controllo.sh
```

### 3.3 Copiare e spostare file

Copiare la relazione nella directory `archivio` e spostare gli appunti nella stessa directory.

**Linux:**

```bash
cp documenti/relazione.txt archivio/
mv documenti/appunti.txt archivio/
```

**Windows PowerShell:**

```powershell
Copy-Item documenti/relazione.txt archivio/
Move-Item documenti/appunti.txt archivio/
```

Verificare il risultato:

```bash
# Linux
find . -maxdepth 2 -type f
```

```powershell
# Windows PowerShell
Get-ChildItem -Recurse -File
```

**Domande:**

1. Qual è la differenza tra copiare e spostare un file?
2. Perché è utile organizzare i file in directory distinte?
3. Quali rischi possono derivare da una directory condivisa senza controlli di accesso?

---

## 4. Parte B – Comprendere i permessi Linux

In Linux ogni file e directory possiede un insieme di permessi che determina quali operazioni possono essere effettuate dagli utenti.

Il modello tradizionale distingue tre categorie:

| Categoria    | Significato            |
| ------------ | ---------------------- |
| `u` – User   | Proprietario del file  |
| `g` – Group  | Gruppo proprietario    |
| `o` – Others | Tutti gli altri utenti |
| `a` – All    | Tutte le categorie     |

I permessi fondamentali sono:

| Permesso | Simbolo | Valore numerico | Significato su un file  |
| -------- | ------- | --------------: | ----------------------- |
| Read     | `r`     |               4 | Leggere il contenuto    |
| Write    | `w`     |               2 | Modificare il contenuto |
| Execute  | `x`     |               1 | Eseguire il file        |

### 4.1 Interpretare i permessi

Eseguire:

```bash
ls -l
```

Un risultato possibile:

```text
-rw-r--r-- 1 utente utente 120 nov 19 09:00 relazione.txt
```

La prima parte:

```text
- rw- r-- r--
  |   |   |
  |   |   └── Permessi degli altri utenti
  |   └────── Permessi del gruppo
  └────────── Permessi del proprietario
```

Il primo carattere indica il tipo di elemento:

| Carattere | Significato    |
| --------- | -------------- |
| `-`       | File regolare  |
| `d`       | Directory      |
| `l`       | Link simbolico |

Nel caso `-rw-r--r--`:

- Il proprietario può leggere e scrivere.
- Gli utenti appartenenti al gruppo possono leggere.
- Gli altri utenti possono leggere.
- Nessuno dispone del permesso di esecuzione.

### 4.2 Differenza tra permessi su file e directory

I permessi `rwx` assumono un significato differente a seconda che siano applicati a un file oppure a una directory.

| Permesso | File                    | Directory                                                              |
| -------- | ----------------------- | ---------------------------------------------------------------------- |
| `r`      | Leggere il contenuto    | Elencare i nomi degli elementi                                         |
| `w`      | Modificare il contenuto | Creare, eliminare e rinominare elementi, se è disponibile anche `x`    |
| `x`      | Eseguire il file        | Attraversare la directory e accedere agli elementi tramite il percorso |

**Attenzione:** il permesso `w` su una directory non garantisce da solo la possibilità di creare o eliminare file: normalmente è necessario anche `x`.

### 4.3 Osservare i permessi dei file

Eseguire:

```bash
ls -l documenti
ls -l script
```

Per visualizzare anche i permessi in formato numerico:

```bash
stat -c "%A %a %U %G %n" documenti/relazione.txt
```

Il comando mostra:

- Permessi in formato simbolico.
- Permessi in formato numerico.
- Proprietario.
- Gruppo.
- Nome del file.

Su Windows PowerShell è possibile visualizzare le autorizzazioni NTFS con:

```powershell
Get-Acl documenti/relazione.txt | Format-List
```

**Domande:**

1. Qual è la differenza tra `rwxr-xr-x` e `rw-r--r--`?
2. Un utente che non possiede il permesso `x` su una directory può attraversarla?
3. Perché i permessi di una directory sono differenti da quelli di un file?

---

## 5. Parte C – Modificare i permessi con chmod

Il comando `chmod` consente di modificare i permessi di file e directory in Linux.

Esistono due modalità principali:

- Notazione simbolica: utilizza lettere come `u`, `g`, `o`, `r`, `w`, `x`.
- Notazione numerica: utilizza i valori 4, 2 e 1.

### 5.1 Notazione simbolica

La sintassi generale è:

```bash
chmod categoria operazione permesso file
```

Gli operatori disponibili sono:

| Operatore | Significato                             |
| --------- | --------------------------------------- |
| `+`       | Aggiunge un permesso                    |
| `-`       | Rimuove un permesso                     |
| `=`       | Imposta esattamente i permessi indicati |

Esempi:

```bash
# Aggiunge il permesso di esecuzione al proprietario
chmod u+x script/controllo.sh

# Rimuove il permesso di lettura agli altri utenti
chmod o-r documenti/relazione.txt

# Imposta lettura e scrittura per il proprietario
chmod u=rw documenti/appunti.txt

# Aggiunge la lettura al gruppo
chmod g+r documenti/relazione.txt
```

Per osservare le modifiche:

```bash
ls -l documenti script
```

### 5.2 Notazione numerica

La notazione numerica si basa sulla somma dei valori dei permessi:

| Permessi | Calcolo   | Valore |
| -------- | --------- | -----: |
| `---`    | 0         |      0 |
| `--x`    | 1         |      1 |
| `-w-`    | 2         |      2 |
| `-wx`    | 2 + 1     |      3 |
| `r--`    | 4         |      4 |
| `r-x`    | 4 + 1     |      5 |
| `rw-`    | 4 + 2     |      6 |
| `rwx`    | 4 + 2 + 1 |      7 |

Ogni cifra rappresenta una categoria:

```text
chmod 754 file.txt

    7       5       4
  rwx     r-x     r--
   |       |       |
utente  gruppo  altri
```

Esempi:

```bash
# Proprietario: lettura e scrittura
# Gruppo: sola lettura
# Altri: nessun permesso
chmod 640 documenti/relazione.txt

# Proprietario: lettura, scrittura ed esecuzione
# Gruppo e altri: lettura ed esecuzione
chmod 755 script/controllo.sh

# Solo il proprietario può leggere e scrivere
chmod 600 documenti/appunti.txt
```

### 5.3 Verifica pratica

Applicare i seguenti permessi:

| File            | Permessi richiesti                       | Comando                             |
| --------------- | ---------------------------------------- | ----------------------------------- |
| `relazione.txt` | Proprietario RW, gruppo R, altri nessuno | `chmod 640 documenti/relazione.txt` |
| `appunti.txt`   | Solo proprietario RW                     | `chmod 600 archivio/appunti.txt`    |
| `controllo.sh`  | Proprietario RWX, gruppo RX, altri RX    | `chmod 755 script/controllo.sh`     |

Verificare:

```bash
ls -l documenti archivio script
```

**Domande:**

1. Che cosa rappresenta il numero 6 nella notazione numerica?
2. Qual è la differenza tra `chmod 644` e `chmod 600`?
3. Perché uno script deve avere il permesso di esecuzione per essere avviato direttamente?
4. Perché non è opportuno assegnare indiscriminatamente `777` a tutti i file?

---

## 6. Parte D – Il principio del minimo privilegio

Il principio del minimo privilegio (Principle of Least Privilege) prevede che ogni utente, processo o servizio disponga esclusivamente dei permessi necessari per svolgere le proprie attività.

In ambito cybersecurity questo principio riduce:

- La possibilità di accessi non autorizzati.
- I danni causati da errori umani.
- L'impatto di un account compromesso.
- Le possibilità di modifica o cancellazione dei dati.
- La propagazione di un attacco attraverso il sistema.

### 6.1 Esempio applicativo

Immaginiamo un sistema informatico utilizzato da tre categorie di utenti:

| Utente          | Attività                           | Permessi necessari                     |
| --------------- | ---------------------------------- | -------------------------------------- |
| Amministratore  | Gestisce tutti i documenti         | Lettura e scrittura                    |
| Analista        | Consulta le relazioni              | Sola lettura                           |
| Utente standard | Consulta alcuni documenti pubblici | Sola lettura sui documenti autorizzati |

Non sarebbe corretto concedere a tutti gli utenti i permessi di lettura, scrittura ed esecuzione su ogni file.

### 6.2 Simulazione con chmod

Impostare i permessi della relazione affinché:

- Il proprietario possa leggere e modificare il documento.
- Il gruppo possa solamente leggerlo.
- Gli altri utenti non abbiano accesso tramite i permessi tradizionali.

```bash
chmod 640 documenti/relazione.txt
```

Impostare invece un file contenente informazioni riservate:

```bash
chmod 600 archivio/appunti.txt
```

In questo modo, secondo i permessi Unix tradizionali, soltanto il proprietario può leggere e modificare il file.

**Nota:** `chmod 600` non garantisce da solo la riservatezza assoluta. Occorre considerare anche proprietario, privilegi amministrativi, ACL, backup e accessi indiretti.

### 6.3 Il rischio dei permessi troppo permissivi

Consideriamo:

```bash
chmod 777 documento.txt
```

Il risultato è:

```text
-rwxrwxrwx
```

Tutti gli utenti possono leggere, modificare ed eseguire il file.

Questa configurazione può introdurre rischi, soprattutto quando il file contiene dati sensibili oppure viene utilizzato da un servizio.

Un altro esempio è:

```bash
chmod -R 777 directory/
```

L'opzione `-R` applica la modifica ricorsivamente a tutti gli elementi contenuti nella directory.

**Non eseguire questo comando sul sistema operativo o su directory di sistema.** Nell'esercitazione è sufficiente discuterne il significato e i rischi.

---

## 7. Parte E – Permessi e sicurezza in Windows

Windows utilizza un sistema di autorizzazioni differente da quello Linux.

Sui file system NTFS vengono utilizzate le ACL, che consentono di definire autorizzazioni per utenti e gruppi.

Alcuni permessi comuni sono:

| Permesso Windows | Significato           |
| ---------------- | --------------------- |
| Read             | Lettura               |
| Write            | Scrittura             |
| Modify           | Modifica              |
| Read & Execute   | Lettura ed esecuzione |
| Full Control     | Controllo completo    |

### 7.1 Visualizzare i permessi

Da PowerShell:

```powershell
Get-Acl documenti/relazione.txt
```

Per ottenere una visualizzazione più dettagliata:

```powershell
(Get-Acl documenti/relazione.txt).Access |
    Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited
```

### 7.2 Utilizzare icacls

Il comando `icacls` permette di visualizzare e modificare le autorizzazioni NTFS.

Visualizzare i permessi:

```powershell
icacls documenti\relazione.txt
```

Visualizzare le autorizzazioni della directory:

```powershell
icacls documenti
```

Esempio di assegnazione di un'autorizzazione di lettura e scrittura al solo utente corrente:

```powershell
icacls documenti\relazione.txt /grant:r "$($env:USERNAME):(R,W)"
```

**Attenzione:** questa operazione modifica le ACL del file. Eseguirla soltanto sui file creati per il laboratorio e verificare sempre il risultato con `icacls`.

Per esplorare graficamente i permessi:

1. Aprire Esplora file.
2. Fare clic con il tasto destro sul file.
3. Selezionare Proprietà.
4. Aprire la scheda Sicurezza.
5. Esaminare utenti, gruppi e autorizzazioni.

**Domande:**

1. Qual è la differenza tra il modello Linux `rwx` e le ACL NTFS?
2. Che cosa significa autorizzazione ereditata?
3. Perché un utente può avere accesso a un file anche se non compare direttamente nell'elenco delle autorizzazioni?

---

## 8. Esercitazione riepilogativa – Proteggere i documenti di un sistema

### Scenario

Un'organizzazione utilizza una directory condivisa per archiviare documenti e script di analisi.

Gli utenti devono poter accedere alle risorse in base al proprio ruolo.

Si richiede di configurare una struttura di directory e applicare permessi coerenti con il principio del minimo privilegio.

### Attività

1. Creare una directory denominata `sistema-analisi`.
2. Creare al suo interno le directory `pubblici`, `riservati` e `script`.
3. Creare un file `report.txt` in `pubblici`.
4. Creare un file `credenziali.txt` in `riservati`.
5. Creare uno script `analisi.sh` in `script`.
6. Inserire contenuti di esempio nei file.
7. Applicare i seguenti permessi:

| Risorsa                     | Proprietario | Gruppo  | Altri   |
| --------------------------- | ------------ | ------- | ------- |
| `pubblici/report.txt`       | RW           | R       | R       |
| `riservati/credenziali.txt` | RW           | Nessuno | Nessuno |
| `script/analisi.sh`         | RWX          | RX      | Nessuno |

### Soluzione di riferimento Linux

```bash
mkdir -p sistema-analisi/{pubblici,riservati,script}

echo "Report di analisi del sistema" > sistema-analisi/pubblici/report.txt

echo "Dati riservati di esempio" > sistema-analisi/riservati/credenziali.txt

cat > sistema-analisi/script/analisi.sh <<'EOF'
#!/bin/bash

echo "Avvio analisi del sistema"
date
echo "Analisi completata"
EOF

chmod 644 sistema-analisi/pubblici/report.txt

chmod 600 sistema-analisi/riservati/credenziali.txt

chmod 750 sistema-analisi/script/analisi.sh
```

Verificare:

```bash
ls -lR sistema-analisi
```

**Osservazione:** nell'esempio `750` assegna al proprietario `rwx`, al gruppo `r-x` e agli altri nessun permesso.

I permessi richiesti nell'attività sono riferiti ai singoli file. Per proteggere realmente una struttura condivisa occorre considerare anche i permessi delle directory superiori, la proprietà dei file e gli eventuali gruppi e ACL.

### Domande di riflessione

1. Perché il file `credenziali.txt` deve avere permessi più restrittivi?
2. Quali problemi potrebbero verificarsi se lo script fosse modificabile da tutti gli utenti?
3. Perché il principio del minimo privilegio è importante in un sistema multiutente?
4. Quali rischi si presentano quando un servizio viene eseguito con privilegi amministrativi?
5. I permessi Linux sono sufficienti a proteggere un file da un amministratore del sistema? Motivare la risposta.

---

## 9. Report e consegna

Ogni studente deve consegnare una breve relazione contenente:

1. La struttura delle directory realizzata.
2. I comandi utilizzati per creare file e directory.
3. Il risultato di `ls -l` e `stat` per i file Linux.
4. Una tabella con i permessi simbolici e numerici applicati.
5. Una descrizione delle differenze tra permessi Linux e autorizzazioni Windows.
6. Le risposte alle domande di riflessione.
7. Un breve commento sul principio del minimo privilegio.

### Tabella di raccolta dei risultati

| File            | Permessi simbolici | Permessi numerici | Motivazione |
| --------------- | ------------------ | ----------------- | ----------- |
| report.txt      |                    |                   |             |
| credenziali.txt |                    |                   |             |
| analisi.sh      |                    |                   |             |

### Criteri di valutazione

| Criterio                                         | Punteggio |
| ------------------------------------------------ | --------: |
| Creazione corretta di file e directory           |         2 |
| Interpretazione dei permessi `rwx`               |         2 |
| Utilizzo corretto di `chmod`                     |         2 |
| Comprensione del principio del minimo privilegio |         2 |
| Completezza della relazione e delle risposte     |         2 |
| **Totale**                                       |    **10** |

## 10. Risultato atteso

Al termine dell'esercitazione lo studente dovrà aver acquisito la capacità di:

- Gestire file e directory da terminale.
- Interpretare i permessi di accesso in Linux.
- Modificare i permessi con `chmod`.
- Riconoscere configurazioni eccessivamente permissive.
- Comprendere il rapporto tra autorizzazioni e sicurezza dei dati.
- Applicare il principio del minimo privilegio a uno scenario concreto.

## 11. Collegamenti con la cybersecurity

La gestione dei permessi è un elemento fondamentale della sicurezza dei sistemi informatici.

Una configurazione errata può consentire a un utente non autorizzato di:

- Leggere informazioni riservate.
- Modificare file di configurazione.
- Alterare script eseguiti da altri utenti.
- Cancellare dati.
- Interferire con il funzionamento di servizi e applicazioni.

Questi concetti saranno ripresi nelle attività successive dedicate alla sicurezza del sistema, all'analisi dei log, all'automazione e alla gestione degli accessi.

**Nota** l'attività è prevalentemente osservativa e operativa. Non richiede la creazione di nuovi utenti o gruppi, né modifiche ai permessi di directory di sistema. Per approfondire la gestione delle autorizzazioni è possibile proporre successivamente un laboratorio dedicato a `chown`, `chgrp`, `umask`, ACL e permessi speciali SUID, SGID e sticky bit.