# 07 – File system e permessi

## 1. Obiettivi didattici

Al termine della lezione lo studente sarà in grado di:

- Comprendere il concetto di file system e la sua funzione.
- Distinguere file, directory e collegamenti simbolici.
- Comprendere la struttura gerarchica del file system Linux.
- Distinguere percorsi assoluti e relativi.
- Comprendere il ruolo degli utenti e dei gruppi.
- Interpretare i permessi di lettura, scrittura ed esecuzione (`rwx`).
- Comprendere la differenza tra permessi di proprietario, gruppo e altri utenti.
- Interpretare la rappresentazione numerica dei permessi.
- Utilizzare i comandi `chmod`, `chown` e `umask`.
- Comprendere il funzionamento dei permessi predefiniti.
- Applicare il principio del minimo privilegio.
- Identificare configurazioni errate che possono compromettere la sicurezza di un sistema Linux.

---

## 2. Introduzione al file system

Un file system è il componente del sistema operativo che permette di organizzare, memorizzare e recuperare le informazioni presenti sui dispositivi di archiviazione.

Attraverso il file system è possibile gestire:

- File.
- Directory.
- Permessi di accesso.
- Proprietari.
- Metadati.
- Collegamenti tra file.
- Informazioni sulla posizione dei dati.

I dispositivi di archiviazione possono essere:

- Hard disk.
- SSD.
- Chiavette USB.
- Schede di memoria.
- Volumi di rete.
- Dispositivi virtuali.

### 2.1 Che cos'è un file?

Un file è un'unità logica utilizzata per memorizzare informazioni.

Può contenere:

- Testo.
- Immagini.
- Audio.
- Video.
- Programmi.
- Script.
- Documenti.
- Dati strutturati.
- Informazioni binarie.

Esempi:

```text
documento.txt
immagine.png
programma.py
configurazione.conf
database.sql
```

In Linux il nome di un file non determina necessariamente il suo contenuto o il modo in cui viene interpretato.

Ad esempio, un file chiamato `documento.txt` potrebbe contenere dati binari anziché testo.

### 2.2 Che cos'è una directory?

Una directory è una struttura utilizzata per organizzare file e altre directory.

È comunemente chiamata cartella.

Esempio:

```text
documenti/
├── relazione.txt
├── appunti.md
└── immagini/
    ├── foto1.png
    └── foto2.jpg
```

Le directory permettono di organizzare i dati in modo gerarchico.

### 2.3 Struttura gerarchica

Linux utilizza una struttura gerarchica che parte da una directory principale chiamata root.

Il simbolo utilizzato per identificarla è:

```text
/
```

Esempio:

```text
/
├── bin/
├── boot/
├── dev/
├── etc/
├── home/
│   ├── studente/
│   └── amministratore/
├── lib/
├── media/
├── mnt/
├── opt/
├── proc/
├── root/
├── run/
├── sbin/
├── srv/
├── sys/
├── tmp/
├── usr/
└── var/
```

Ogni elemento può contenere ulteriori directory e file.

---

## 3. Le principali directory di Linux

Il file system Linux segue una struttura organizzata secondo convenzioni definite dal Filesystem Hierarchy Standard (FHS).

Le directory principali hanno funzioni specifiche.

| Directory | Funzione |
| --- | --- |
| `/` | Directory principale |
| `/bin` | Comandi essenziali per gli utenti |
| `/sbin` | Strumenti essenziali di amministrazione |
| `/boot` | File necessari per l'avvio |
| `/dev` | File dispositivo |
| `/etc` | File di configurazione |
| `/home` | Directory personali degli utenti |
| `/root` | Directory personale dell'amministratore root |
| `/lib` | Librerie essenziali |
| `/media` | Punti di montaggio dei dispositivi rimovibili |
| `/mnt` | Punti di montaggio temporanei |
| `/opt` | Software aggiuntivo |
| `/proc` | File system virtuale con informazioni sui processi e sul kernel |
| `/run` | Dati temporanei relativi all'esecuzione del sistema |
| `/srv` | Dati utilizzati dai servizi |
| `/sys` | Informazioni e interfacce relative al kernel e ai dispositivi |
| `/tmp` | File temporanei |
| `/usr` | Programmi, librerie e dati condivisi |
| `/var` | Dati variabili, log, cache e spool |

### 3.1 La directory /home

La directory `/home` contiene normalmente le directory personali degli utenti.

Esempio:

```text
/home/
├── mario/
│   ├── Documenti/
│   ├── Download/
│   ├── Immagini/
│   └── Progetti/
└── anna/
    ├── Documenti/
    └── Progetti/
```

Ogni utente dispone di uno spazio personale.

### 3.2 La directory /etc

La directory `/etc` contiene numerosi file di configurazione del sistema.

Esempi:

```text
/etc/passwd
/etc/group
/etc/shadow
/etc/hosts
/etc/hostname
/etc/fstab
```

Questi file sono importanti anche dal punto di vista della sicurezza.

Ad esempio:

- `/etc/passwd`: informazioni sugli account locali.
- `/etc/shadow`: informazioni relative alle password e alla loro gestione.
- `/etc/group`: informazioni sui gruppi.
- `/etc/hosts`: associazioni locali tra nomi e indirizzi IP.
- `/etc/sudoers`: configurazione dei privilegi amministrativi tramite sudo.

**Attenzione:** la presenza di un file in `/etc` non significa che sia leggibile o modificabile da qualsiasi utente.

### 3.3 La directory /var/log

La directory `/var/log` contiene numerosi log di sistema e applicazioni.

Esempi:

```text
/var/log/syslog
/var/log/auth.log
/var/log/kern.log
```

La disponibilità e il nome dei file dipendono dalla distribuzione e dalla configurazione dei servizi di logging.

I log sono importanti per:

- Analizzare errori.
- Monitorare gli accessi.
- Individuare attività anomale.
- Ricostruire eventi.
- Supportare attività di troubleshooting e digital forensics.

---

## 4. Percorsi assoluti e relativi

Per identificare un file o una directory è necessario specificarne il percorso.

Linux distingue due modalità principali.

### 4.1 Percorso assoluto

Un percorso assoluto parte dalla directory principale `/`.

Esempio:

```text
/home/mario/documenti/relazione.txt
```

Il percorso identifica la posizione del file indipendentemente dalla directory corrente.

### 4.2 Percorso relativo

Un percorso relativo viene interpretato rispetto alla directory corrente.

Esempio:

```text
documenti/relazione.txt
```

Se la directory corrente è `/home/mario`, il percorso identifica:

```text
/home/mario/documenti/relazione.txt
```

### 4.3 Simboli speciali

Linux utilizza alcuni simboli per rappresentare percorsi particolari.

| Simbolo | Significato |
| --- | --- |
| `/` | Directory principale |
| `.` | Directory corrente |
| `..` | Directory superiore |
| `~` | Directory personale dell'utente |

Esempi:

```bash
# Directory corrente
pwd

# Directory superiore
cd ..

# Directory personale
cd ~

# Percorso assoluto
cd /var/log

# Percorso relativo
cd Documenti
```

### 4.4 Esempio pratico

Supponiamo che la directory corrente sia:

```text
/home/mario/progetti
```

Il comando:

```bash
cd ..
```

porta a:

```text
/home/mario
```

Il comando:

```bash
cd ../anna
```

porta invece a:

```text
/home/mario/anna
```

se la directory esiste.

---

## 5. Tipologie di file in Linux

Linux utilizza differenti tipologie di file.

Non tutti gli elementi visualizzati nel file system corrispondono a normali file contenenti dati.

### 5.1 File regolari

Sono i file utilizzati per memorizzare contenuti.

Esempi:

```text
documento.txt
script.py
immagine.png
database.db
```

### 5.2 Directory

Contengono riferimenti ad altri file e directory.

### 5.3 Link simbolici

Un link simbolico è un riferimento a un altro percorso.

Esempio:

```bash
ln -s /var/log/syslog syslog-link
```

Il comando crea un collegamento simbolico chiamato `syslog-link`.

Visualizzazione:

```bash
ls -l syslog-link
```

Output indicativo:

```text
lrwxrwxrwx 1 mario mario 14 ... syslog-link -> /var/log/syslog
```

Il link simbolico contiene il percorso di destinazione.

Se il percorso di destinazione non esiste più, il link diventa pendente.

### 5.4 Link fisici

Un hard link è un altro nome associato allo stesso inode di un file.

Esempio:

```bash
ln documento.txt documento-copia.txt
```

I due nomi fanno riferimento allo stesso contenuto attraverso lo stesso inode.

Le modifiche effettuate attraverso uno dei due nomi riguardano lo stesso file.

Gli hard link hanno alcune limitazioni:

- Normalmente non possono essere creati per directory dagli utenti ordinari.
- Non possono attraversare filesystem differenti.
- La cancellazione di un nome non elimina necessariamente i dati finché esistono altri hard link.

### 5.5 File speciali

Linux utilizza anche file speciali per rappresentare dispositivi e altre risorse.

| Tipologia | Significato |
| --- | --- |
| `-` | File regolare |
| `d` | Directory |
| `l` | Link simbolico |
| `c` | Dispositivo a caratteri |
| `b` | Dispositivo a blocchi |
| `p` | FIFO o named pipe |
| `s` | Socket Unix |

Esempi di dispositivi:

```text
/dev/null
/dev/zero
/dev/sda
```

Questi elementi permettono al sistema operativo di gestire dispositivi e comunicazioni attraverso un'interfaccia simile a quella dei file.

---

## 6. Utenti e gruppi

Linux è un sistema multiutente.

Più utenti possono utilizzare lo stesso sistema, anche contemporaneamente, disponendo di differenti privilegi.

Ogni utente possiede un identificativo numerico chiamato UID (User Identifier).

I gruppi permettono di associare più utenti a un insieme comune di permessi.

Ogni gruppo possiede un identificativo numerico chiamato GID (Group Identifier).

### 6.1 L'utente root

L'utente `root` è l'amministratore del sistema.

Possiede privilegi molto elevati e può eseguire operazioni normalmente non consentite agli utenti ordinari.

Esempi:

- Modificare file di sistema.
- Installare software.
- Gestire utenti.
- Modificare configurazioni.
- Cambiare proprietà e permessi.
- Arrestare servizi.

L'utilizzo di root deve essere limitato alle attività amministrative necessarie.

### 6.2 Utenti ordinari

Gli utenti ordinari dispongono di privilegi limitati.

Ogni utente ha normalmente:

- UID.
- GID principale.
- Eventuali gruppi supplementari.
- Directory personale.
- Shell.
- Permessi specifici.

### 6.3 Visualizzare gli utenti

Il file `/etc/passwd` contiene informazioni sugli account locali.

Per visualizzarne il contenuto:

```bash
cat /etc/passwd
```

Esempio di riga:

```text
mario:x:1000:1000:Mario Rossi:/home/mario:/bin/bash
```

I campi sono separati dal carattere `:`.

| Campo | Significato |
| --- | --- |
| mario | Nome utente |
| x | Password gestita attraverso il sistema shadow |
| 1000 | UID |
| 1000 | GID principale |
| Mario Rossi | Informazioni descrittive |
| /home/mario | Directory personale |
| /bin/bash | Shell predefinita |

La presenza del valore `x` indica che le informazioni relative alle password non sono memorizzate direttamente in questo campo.

### 6.4 Visualizzare i gruppi

Il file `/etc/group` contiene le informazioni sui gruppi locali.

```bash
cat /etc/group
```

Esempio:

```text
developers:x:1002:mario,anna
```

Significato:

- `developers`: nome del gruppo.
- `1002`: GID.
- `mario,anna`: utenti associati al gruppo supplementare.

### 6.5 Comandi per conoscere l'identità dell'utente

Visualizzare l'utente corrente:

```bash
whoami
```

Visualizzare UID e GID:

```bash
id
```

Visualizzare i gruppi:

```bash
groups
```

Visualizzare le informazioni di un utente specifico:

```bash
id mario
```

Esempio di output:

```text
uid=1000(mario) gid=1000(mario) groups=1000(mario),27(sudo),1002(developers)
```

L'utente appartiene al gruppo principale `mario` e ai gruppi supplementari `sudo` e `developers`.

---

## 7. Permessi dei file: rwx

Uno degli aspetti fondamentali della sicurezza Linux è la gestione dei permessi.

Ogni file e directory possiede informazioni che determinano chi può accedervi e quali operazioni può eseguire.

I permessi principali sono:

- `r`: read, lettura.
- `w`: write, scrittura.
- `x`: execute, esecuzione.

I permessi vengono definiti per tre categorie:

1. Proprietario (owner).
2. Gruppo (group).
3. Altri utenti (others).

### 7.1 Esempio di permessi

Consideriamo il seguente risultato:

```bash
ls -l documento.txt
```

Output:

```text
-rw-r--r-- 1 mario developers 1024 nov 18 10:30 documento.txt
```

La prima parte:

```text
-rw-r--r--
```

indica il tipo di file e i permessi.

La scomposizione è:

```text
-   rw-   r--   r--
|    |     |     |
|    |     |     |
|    |     |     +-- Altri utenti
|    |     +-------- Gruppo
|    +-------------- Proprietario
+------------------- Tipo di file
```

Interpretazione:

| Categoria | Permessi | Significato |
| --- | --- | --- |
| Proprietario | `rw-` | Lettura e scrittura |
| Gruppo | `r--` | Soltanto lettura |
| Altri | `r--` | Soltanto lettura |

Il proprietario può leggere e modificare il file.

Gli utenti appartenenti al gruppo possono leggerlo.

Gli altri utenti possono leggerlo.

### 7.2 Significato dei permessi sui file

Per un file regolare:

| Permesso | Significato |
| --- | --- |
| `r` | Leggere il contenuto |
| `w` | Modificare il contenuto |
| `x` | Eseguire il file, se compatibile |

Esempio:

```text
-rwxr-xr-x
```

Il proprietario può leggere, scrivere ed eseguire il file.

Il gruppo e gli altri utenti possono leggerlo ed eseguirlo.

### 7.3 Significato dei permessi sulle directory

Per una directory i permessi hanno un significato differente.

| Permesso | Significato |
| --- | --- |
| `r` | Elencare i nomi degli elementi contenuti |
| `w` | Creare, eliminare o rinominare elementi, se associato al permesso `x` |
| `x` | Attraversare la directory e accedere agli elementi conoscendone il percorso |

Il permesso `x` sulle directory è particolarmente importante.

Senza il permesso di attraversamento, un utente non può accedere normalmente ai contenuti della directory, anche se conosce il nome del file.

### 7.4 Esempio: directory protetta

Supponiamo di avere:

```text
/home/mario/documenti
```

Permessi:

```text
drwx------
```

Soltanto il proprietario dispone di tutti i permessi.

Gli altri utenti non possono attraversare la directory né elencarne il contenuto.

Questa configurazione è utile per proteggere documenti personali.

### 7.5 Il controllo dei permessi

Quando un processo tenta di accedere a un file, il kernel verifica i permessi in base alle credenziali del processo.

In generale:

1. Viene verificato se l'utente è il proprietario.
2. In caso contrario, viene verificata l'appartenenza al gruppo proprietario.
3. Se non appartiene a nessuna delle due categorie, vengono applicati i permessi degli altri utenti.

Le categorie non vengono sommate: viene applicata la categoria corrispondente.

---

## 8. Permessi in modalità numerica

I permessi possono essere rappresentati anche attraverso valori numerici.

Questa modalità utilizza i valori:

| Permesso | Valore |
| --- | ---: |
| `r` | 4 |
| `w` | 2 |
| `x` | 1 |
| `-` | 0 |

I valori vengono sommati per ottenere il permesso desiderato.

### 8.1 Tabella delle combinazioni

| Valore | Permesso | Significato |
| ---: | --- | --- |
| 0 | `---` | Nessun permesso |
| 1 | `--x` | Solo esecuzione |
| 2 | `-w-` | Solo scrittura |
| 3 | `-wx` | Scrittura ed esecuzione |
| 4 | `r--` | Solo lettura |
| 5 | `r-x` | Lettura ed esecuzione |
| 6 | `rw-` | Lettura e scrittura |
| 7 | `rwx` | Tutti i permessi |

### 8.2 Esempio: permessi 755

Il valore `755` è composto da tre cifre:

```text
7 5 5
```

La prima cifra riguarda il proprietario.

La seconda riguarda il gruppo.

La terza riguarda gli altri utenti.

Calcolo:

```text
7 = 4 + 2 + 1 = rwx
5 = 4 + 1     = r-x
5 = 4 + 1     = r-x
```

Quindi:

```text
755 = rwxr-xr-x
```

### 8.3 Esempio: permessi 644

```text
644
```

Calcolo:

```text
6 = 4 + 2 = rw-
4 = 4     = r--
4 = 4     = r--
```

Risultato:

```text
644 = rw-r--r--
```

È una configurazione comune per file di testo che devono essere modificabili dal proprietario e leggibili dagli altri utenti.

### 8.4 Permessi comunemente utilizzati

| Modalità | Permessi | Utilizzo tipico |
| ---: | --- | --- |
| 600 | `rw-------` | File privati |
| 640 | `rw-r-----` | File leggibili dal gruppo |
| 644 | `rw-r--r--` | Documenti e file di configurazione non sensibili |
| 700 | `rwx------` | Directory private o script privati |
| 750 | `rwxr-x---` | Directory accessibili al proprietario e al gruppo |
| 755 | `rwxr-xr-x` | Directory e programmi eseguibili pubblicamente accessibili |
| 770 | `rwxrwx---` | Risorse condivise tra proprietario e gruppo |
| 775 | `rwxrwxr-x` | Directory condivise con altri utenti in lettura e attraversamento |
| 777 | `rwxrwxrwx` | Tutti possono leggere, scrivere ed eseguire |

**Attenzione:** `777` concede permessi molto ampi e, nella maggior parte dei casi, rappresenta una configurazione da evitare.

---

## 9. Il comando chmod

Il comando `chmod` permette di modificare i permessi di file e directory.

La sintassi generale è:

```bash
chmod PERMESSI FILE
```

È possibile utilizzare la modalità numerica oppure simbolica.

### 9.1 chmod in modalità numerica

Esempio:

```bash
chmod 644 documento.txt
```

Imposta:

```text
rw-r--r--
```

Un altro esempio:

```bash
chmod 700 script.sh
```

Imposta:

```text
rwx------
```

Soltanto il proprietario può leggere, modificare ed eseguire il file.

### 9.2 chmod in modalità simbolica

La modalità simbolica permette di specificare categoria e operazione.

Categorie:

| Simbolo | Significato |
| --- | --- |
| `u` | User, proprietario |
| `g` | Group, gruppo |
| `o` | Others, altri |
| `a` | All, tutti |

Operatori:

| Simbolo | Significato |
| --- | --- |
| `+` | Aggiunge un permesso |
| `-` | Rimuove un permesso |
| `=` | Imposta esattamente i permessi indicati |

Esempi:

Aggiungere il permesso di esecuzione al proprietario:

```bash
chmod u+x script.sh
```

Rimuovere la scrittura agli altri utenti:

```bash
chmod o-w documento.txt
```

Consentire al gruppo di leggere il file:

```bash
chmod g+r documento.txt
```

Impostare i permessi del proprietario e del gruppo:

```bash
chmod u=rw,g=r,o= documento.txt
```

Risultato:

```text
-rw-r-----
```

### 9.3 Modifica ricorsiva

Il parametro `-R` permette di applicare i permessi anche agli elementi contenuti nelle directory.

Esempio:

```bash
chmod -R 750 progetto/
```

Il comando applica la modalità 750 alla directory e a tutti gli elementi contenuti.

**Attenzione:** applicare ricorsivamente gli stessi permessi a file e directory può produrre risultati non desiderati. Un file regolare non dovrebbe ricevere automaticamente il permesso di esecuzione soltanto perché si trova in una directory.

Prima di utilizzare `chmod -R` è opportuno verificare la struttura e distinguere file e directory.

### 9.4 Verificare i permessi

```bash
ls -l documento.txt
```

Per visualizzare informazioni più dettagliate:

```bash
stat documento.txt
```

---

## 10. Il comando chown

Il comando `chown` permette di modificare il proprietario e il gruppo associati a un file o a una directory.

Sintassi:

```bash
chown NUOVO_PROPRIETARIO FILE
```

Esempio:

```bash
sudo chown mario documento.txt
```

Il proprietario del file diventa `mario`.

### 10.1 Modificare proprietario e gruppo

```bash
sudo chown mario:developers progetto/
```

Il proprietario diventa `mario` e il gruppo diventa `developers`.

### 10.2 Modificare soltanto il gruppo

```bash
sudo chown :developers documento.txt
```

### 10.3 Modifica ricorsiva

```bash
sudo chown -R mario:developers progetto/
```

Il comando modifica proprietario e gruppo della directory e dei suoi contenuti.

**Attenzione:** l'opzione ricorsiva deve essere utilizzata con cautela, soprattutto quando si opera su directory di sistema.

### 10.4 Verificare proprietario e gruppo

```bash
ls -l documento.txt
```

Esempio:

```text
-rw-r--r-- 1 mario developers 1024 nov 18 10:30 documento.txt
```

La seconda e la terza informazione dopo i permessi indicano rispettivamente proprietario e gruppo.

---

## 11. Il comando umask

Il comando `umask` definisce la maschera dei permessi che viene utilizzata per determinare i permessi predefiniti dei nuovi file e delle nuove directory creati da un processo.

È importante comprendere che `umask` non assegna direttamente i permessi: indica quali permessi devono essere rimossi dai valori iniziali richiesti alla creazione.

### 11.1 Valori predefiniti

In generale, i valori di partenza sono:

- File regolari: `666` (`rw-rw-rw-`).
- Directory: `777` (`rwxrwxrwx`).

Questi valori non includono normalmente i permessi di esecuzione per i file regolari.

Il sistema applica successivamente la maschera `umask`.

### 11.2 Esempio con umask 022

Visualizzare la maschera corrente:

```bash
umask
```

Output:

```text
0022
```

Per i file:

```text
666
-022
----
644
```

Per le directory:

```text
777
-022
----
755
```

Quindi:

| Elemento | Permessi risultanti |
| --- | --- |
| Nuovo file | 644 |
| Nuova directory | 755 |

### 11.3 Esempio con umask 077

Impostare:

```bash
umask 077
```

Per i file:

```text
666
-077
----
600
```

Per le directory:

```text
777
-077
----
700
```

Risultato:

| Elemento | Permessi risultanti |
| --- | --- |
| Nuovo file | 600 |
| Nuova directory | 700 |

Questa configurazione è utile quando si desidera che i nuovi file e le nuove directory siano accessibili soltanto al proprietario.

### 11.4 Attenzione al calcolo di umask

Il calcolo non deve essere interpretato come una semplice sottrazione aritmetica.

La maschera indica quali bit di permesso vengono rimossi.

In particolare:

```text
Valore iniziale: 666
Umask:           022
Risultato:       644
```

### 11.5 Impostare umask temporaneamente

Esempio:

```bash
umask 077

touch documento-privato.txt

mkdir directory-privata

ls -l documento-privato.txt
ls -ld directory-privata
```

Risultato atteso:

```text
-rw------- documento-privato.txt
drwx------ directory-privata
```

La maschera impostata con `umask` vale per la shell corrente e viene ereditata dai processi figli.

La configurazione può essere resa persistente inserendo il comando nei file di inizializzazione della shell, secondo le esigenze dell'ambiente.

---

## 12. Gruppi e condivisione delle risorse

I gruppi permettono di gestire i permessi di accesso per più utenti senza dover configurare ogni account singolarmente.

Sono particolarmente utili in ambienti aziendali e laboratori condivisi.

### 12.1 Creazione di un gruppo

```bash
sudo groupadd developers
```

### 12.2 Aggiunta di un utente a un gruppo

```bash
sudo usermod -aG developers mario
```

L'opzione `-aG` aggiunge il gruppo supplementare senza sostituire quelli già presenti.

Per applicare la nuova appartenenza nelle sessioni, l'utente potrebbe dover effettuare nuovamente l'accesso.

### 12.3 Creazione di una directory condivisa

```bash
sudo mkdir /srv/progetto
```

Assegnare proprietario e gruppo:

```bash
sudo chown root:developers /srv/progetto
```

Impostare i permessi:

```bash
sudo chmod 2770 /srv/progetto
```

Il valore iniziale `2` attiva il bit setgid sulla directory.

### 12.4 Il bit setgid sulle directory

Quando il bit setgid è impostato su una directory, i nuovi file e le nuove directory create al suo interno ereditano normalmente il gruppo proprietario della directory padre.

Questo facilita la gestione di cartelle condivise.

Esempio:

```text
drwxrws--- root developers /srv/progetto
```

La lettera `s` nella posizione del permesso di esecuzione del gruppo indica la presenza del bit setgid.

### 12.5 Permessi e collaborazione

Supponiamo che il gruppo `developers` contenga:

```text
mario
anna
luca
```

La directory condivisa può essere configurata per permettere ai membri del gruppo di lavorare sugli stessi file.

Per garantire la collaborazione è necessario considerare anche la maschera `umask` e i permessi dei file creati.

Una configurazione possibile:

```bash
sudo chmod 2770 /srv/progetto
```

e, nelle sessioni degli utenti interessati:

```bash
umask 007
```

Con questa configurazione i nuovi file e le nuove directory possono essere creati senza concedere accesso agli altri utenti, mantenendo i permessi necessari al gruppo.

---

## 13. Permessi speciali

Oltre ai permessi standard `rwx`, Linux supporta tre bit speciali:

- SUID.
- SGID.
- Sticky Bit.

Questi meccanismi modificano il comportamento dei permessi tradizionali.

### 13.1 SUID – Set User ID

Il bit SUID, applicato a un file eseguibile, consente al programma di essere eseguito con l'UID effettivo del proprietario del file, secondo le regole del sistema.

Esempio:

```bash
ls -l /usr/bin/passwd
```

Su molti sistemi Linux il comando `passwd` utilizza il bit SUID per poter aggiornare le informazioni relative alle password attraverso meccanismi privilegiati.

Esempio di permessi:

```text
-rwsr-xr-x
```

La lettera `s` nella posizione di esecuzione del proprietario indica la presenza del bit SUID.

**Rischio di sicurezza:** un programma SUID vulnerabile può diventare un punto di ingresso per ottenere privilegi elevati.

### 13.2 SGID – Set Group ID

Il bit SGID, applicato a un file eseguibile, permette al processo di utilizzare il GID effettivo del gruppo proprietario, secondo le regole del sistema.

Sulle directory, invece, permette normalmente ai nuovi elementi di ereditare il gruppo della directory padre.

Esempio:

```bash
chmod 2775 directory-condivisa
```

### 13.3 Sticky Bit

Lo sticky bit è utilizzato soprattutto nelle directory condivise.

Impedisce normalmente agli utenti non proprietari del file, non proprietari della directory e privi di privilegi amministrativi di eliminare o rinominare file appartenenti ad altri utenti.

Un esempio è:

```text
/tmp
```

Verifica:

```bash
ls -ld /tmp
```

Output indicativo:

```text
drwxrwxrwt
```

La lettera `t` indica la presenza dello sticky bit.

### 13.4 Riepilogo dei permessi speciali

| Bit | Valore numerico | Funzione |
| --- | ---: | --- |
| SUID | 4 | Esecuzione con UID effettivo del proprietario |
| SGID | 2 | Esecuzione con GID effettivo del gruppo; ereditarietà del gruppo nelle directory |
| Sticky Bit | 1 | Limitazione della cancellazione nelle directory condivise |

Esempio:

```bash
chmod 4755 programma
```

Imposta SUID.

```bash
chmod 2770 directory
```

Imposta SGID.

```bash
chmod 1777 directory
```

Imposta sticky bit.

**Nota di sicurezza:** SUID e SGID devono essere utilizzati soltanto quando strettamente necessari. La presenza di questi bit su programmi non affidabili o non correttamente configurati può aumentare significativamente il rischio di escalation dei privilegi.

---

## 14. ACL – Access Control Lists

I permessi tradizionali Linux gestiscono tre categorie:

- Proprietario.
- Gruppo proprietario.
- Altri utenti.

In alcune situazioni questa struttura non è sufficiente.

Le ACL (Access Control Lists) permettono di assegnare permessi specifici a utenti e gruppi aggiuntivi.

### 14.1 Esempio

Supponiamo di avere:

```text
documento-riservato.txt
```

Il proprietario è `mario`, il gruppo è `developers`.

Vogliamo consentire anche all'utente `anna` di leggere il file, senza modificare il gruppo proprietario.

Utilizziamo:

```bash
setfacl -m u:anna:r documento-riservato.txt
```

Verificare:

```bash
getfacl documento-riservato.txt
```

L'utente `anna` dispone ora di un permesso specifico.

### 14.2 Permessi ACL per i gruppi

Esempio:

```bash
setfacl -m g:analisti:r documento-riservato.txt
```

Il gruppo `analisti` ottiene il permesso di lettura.

### 14.3 Rimuovere una ACL

```bash
setfacl -x u:anna documento-riservato.txt
```

Rimuovere tutte le ACL aggiuntive:

```bash
setfacl -b documento-riservato.txt
```

### 14.4 ACL e mask

Le ACL utilizzano anche una mask che limita i permessi effettivi delle voci di gruppo e degli utenti nominati.

Di conseguenza, il permesso visualizzato per un utente o gruppo non sempre coincide con quello effettivamente applicato.

Quando si analizzano le ACL è importante verificare il valore `mask`.

---

## 15. Il principio del minimo privilegio

Il principio del minimo privilegio stabilisce che ogni utente, processo o servizio deve disporre esclusivamente dei permessi necessari per svolgere le proprie attività.

È uno dei principi fondamentali della sicurezza informatica.

### 15.1 Esempio

Consideriamo un server Web che utilizza un'applicazione Python.

Una configurazione non corretta potrebbe prevedere l'esecuzione dell'applicazione come root.

```text
Applicazione Web
       |
       v
   UTENTE ROOT
       |
       v
Privilegi amministrativi
```

Se l'applicazione viene compromessa, l'attaccante potrebbe ottenere un livello di accesso molto elevato.

Una configurazione migliore prevede un utente dedicato:

```text
Applicazione Web
       |
       v
   UTENTE APP
       |
       v
Permessi limitati
```

L'utente dell'applicazione dovrebbe poter accedere soltanto ai file e alle risorse necessari.

### 15.2 Applicazione del minimo privilegio

Alcune buone pratiche:

- Non utilizzare root per attività quotidiane.
- Utilizzare `sudo` soltanto quando necessario.
- Creare account dedicati ai servizi.
- Limitare i permessi sui file di configurazione.
- Evitare directory scrivibili da tutti.
- Proteggere le credenziali.
- Limitare l'accesso ai log.
- Separare i dati degli utenti.
- Evitare l'uso indiscriminato di `chmod 777`.
- Verificare periodicamente i permessi.

### 15.3 Esempio: file contenente credenziali

Supponiamo che un'applicazione utilizzi un file:

```text
/opt/app/config/database.env
```

Il file contiene:

```text
DB_HOST=localhost
DB_USER=appuser
DB_PASSWORD=segreto
```

Una configurazione appropriata potrebbe essere:

```bash
sudo chown appuser:appgroup /opt/app/config/database.env
sudo chmod 600 /opt/app/config/database.env
```

Soltanto il proprietario può leggere e modificare il file.

La configurazione deve essere coerente con l'utente effettivo che esegue il servizio e con le modalità di distribuzione dell'applicazione.

### 15.4 File e directory sensibili

| Elemento | Configurazione da valutare |
| --- | --- |
| Chiavi private | Accesso limitato al proprietario o al servizio |
| File con credenziali | Permessi restrittivi |
| Log di autenticazione | Accesso limitato |
| Script amministrativi | Scrittura riservata agli amministratori |
| Directory condivise | Permessi assegnati tramite gruppi |
| File pubblici Web | Sola lettura per il processo Web, quando possibile |

---

## 16. Comandi Linux per la gestione del file system

In questa sezione vengono riepilogati i principali comandi utili per amministrare file, directory e permessi.

### 16.1 Gestione delle directory

Creare una directory:

```bash
mkdir progetto
```

Creare una struttura di directory:

```bash
mkdir -p progetto/src progetto/docs progetto/logs
```

Visualizzare la directory corrente:

```bash
pwd
```

Elencare i contenuti:

```bash
ls
```

Visualizzare dettagli e permessi:

```bash
ls -l
```

Visualizzare anche i file nascosti:

```bash
ls -la
```

### 16.2 Gestione dei file

Creare un file vuoto:

```bash
touch documento.txt
```

Copiare un file:

```bash
cp documento.txt documento-copia.txt
```

Spostare un file:

```bash
mv documento.txt /tmp/
```

Eliminare un file:

```bash
rm documento.txt
```

Eliminare una directory vuota:

```bash
rmdir directory-vuota
```

Eliminare una directory e i suoi contenuti:

```bash
rm -r directory
```

**Attenzione:** `rm` elimina i file senza spostarli automaticamente nel cestino. Prima di eseguire operazioni ricorsive verificare sempre il percorso interessato.

### 16.3 Visualizzare le informazioni dei file

```bash
stat documento.txt
```

Visualizzare il tipo di file:

```bash
file documento.txt
```

Visualizzare dimensioni e occupazione:

```bash
du -sh directory/
```

Visualizzare lo spazio disponibile:

```bash
df -h
```

### 16.4 Ricerca dei file

Ricercare un file per nome:

```bash
find /home/mario -name "*.txt"
```

Ricercare i file appartenenti a un utente:

```bash
find /home -user mario
```

Ricercare file con permessi specifici:

```bash
find /home/mario -type f -perm 0777
```

Questi comandi sono utili per individuare configurazioni anomale.

---

## 17. Laboratorio pratico Linux

### Obiettivo

Creare una struttura di directory, gestire utenti e gruppi e configurare i permessi secondo il principio del minimo privilegio.

Le attività che modificano utenti e gruppi richiedono privilegi amministrativi. Devono essere svolte in una macchina di laboratorio o in un ambiente autorizzato.

### Fase 1 – Creazione della struttura

Creare la directory:

```bash
mkdir -p ~/laboratorio-permessi/{documenti,script,riservati,condivisi}
```

Verificare:

```bash
tree ~/laboratorio-permessi
```

Se `tree` non è installato:

```bash
sudo apt install tree
```

### Fase 2 – Creazione dei file

```bash
touch ~/laboratorio-permessi/documenti/relazione.txt

touch ~/laboratorio-permessi/script/analisi.sh

touch ~/laboratorio-permessi/riservati/password.txt
```

### Fase 3 – Impostazione dei permessi

File di documentazione:

```bash
chmod 644 ~/laboratorio-permessi/documenti/relazione.txt
```

Script:

```bash
chmod 700 ~/laboratorio-permessi/script/analisi.sh
```

File riservato:

```bash
chmod 600 ~/laboratorio-permessi/riservati/password.txt
```

### Fase 4 – Verifica

```bash
ls -lR ~/laboratorio-permessi
```

Annotare i permessi assegnati.

### Fase 5 – Analisi dettagliata

```bash
stat ~/laboratorio-permessi/riservati/password.txt
```

Individuare:

- Proprietario.
- Gruppo.
- Permessi.
- Dimensione.
- Inode.

### Fase 6 – Creazione di un gruppo

```bash
sudo groupadd laboratorio
```

Aggiungere l'utente corrente al gruppo:

```bash
sudo usermod -aG laboratorio "$USER"
```

Per verificare la nuova appartenenza potrebbe essere necessario aprire una nuova sessione.

### Fase 7 – Creazione di una directory condivisa

```bash
sudo mkdir -p /srv/laboratorio
```

Assegnare il gruppo:

```bash
sudo chown root:laboratorio /srv/laboratorio
```

Impostare i permessi:

```bash
sudo chmod 2770 /srv/laboratorio
```

Verificare:

```bash
ls -ld /srv/laboratorio
```

### Fase 8 – Verifica dell'ereditarietà del gruppo

Dopo aver aperto una nuova sessione con il gruppo aggiornato:

```bash
touch /srv/laboratorio/prova.txt
```

Verificare:

```bash
ls -l /srv/laboratorio
```

Il gruppo del nuovo file dovrebbe essere `laboratorio`.

### Fase 9 – Analisi di umask

Visualizzare la maschera:

```bash
umask
```

Impostare:

```bash
umask 077
```

Creare un file:

```bash
touch file-privato.txt
```

Creare una directory:

```bash
mkdir directory-privata
```

Verificare:

```bash
ls -ld file-privato.txt directory-privata
```

### Fase 10 – Ripristino dell'ambiente

Al termine del laboratorio eliminare le risorse create, se non più necessarie.

```bash
rm -rf ~/laboratorio-permessi
```

La directory condivisa può essere rimossa con:

```bash
sudo rm -rf /srv/laboratorio
```

Se il gruppo è stato creato esclusivamente per il laboratorio:

```bash
sudo groupdel laboratorio
```

Prima di eseguire la pulizia, verificare che i percorsi siano quelli corretti e che non contengano dati da conservare.

---

## 18. Esercitazioni autonome

### Esercitazione 1 – Interpretazione dei permessi

Analizzare le seguenti stringhe di permessi:

```text
-rw-r--r--
-rwxr-xr-x
-rw-------
drwxr-x---
drwxrwxr-x
-rwxrwxrwx
```

Per ciascuna indicare:

1. Tipo di elemento.
2. Permessi del proprietario.
3. Permessi del gruppo.
4. Permessi degli altri utenti.
5. Operazioni consentite.

### Esercitazione 2 – Conversione numerica

Convertire le seguenti modalità numeriche in rappresentazione simbolica:

| Valore | Permessi simbolici |
| ---: | --- |
| 600 | ? |
| 640 | ? |
| 644 | ? |
| 700 | ? |
| 750 | ? |
| 755 | ? |
| 770 | ? |
| 775 | ? |
| 777 | ? |

Successivamente eseguire le conversioni inverse.

### Esercitazione 3 – Progettazione dei permessi

Un'organizzazione dispone di tre gruppi:

- `amministratori`
- `sviluppatori`
- `analisti`

Deve creare una struttura:

```text
/srv/azienda/
├── amministrazione/
├── sviluppo/
└── analisi/
```

Definire:

1. Proprietario di ogni directory.
2. Gruppo proprietario.
3. Permessi di accesso.
4. Utenti autorizzati.
5. Eventuale utilizzo di ACL.
6. Eventuale utilizzo del bit SGID.

L'obiettivo è impedire agli utenti di un gruppo di accedere ai dati riservati agli altri gruppi.

### Esercitazione 4 – Analisi di configurazioni non sicure

Individuare i rischi nelle seguenti configurazioni:

```bash
chmod 777 /opt/app
```

```bash
chmod -R 777 /var/www
```

```bash
chmod 666 /etc/shadow
```

```bash
chmod 755 /home/mario/documenti/password.txt
```

Per ogni caso:

1. Descrivere il problema.
2. Identificare i possibili rischi.
3. Proporre una configurazione più restrittiva.
4. Spiegare come verificare il risultato.

Non eseguire modifiche sui file di sistema reali: gli esempi sono destinati all'analisi e alla discussione didattica.

### Esercitazione 5 – Analisi dei permessi con find

Scrivere una serie di comandi per individuare:

- File appartenenti all'utente corrente.
- File scrivibili da tutti.
- File eseguibili.
- Directory accessibili al gruppo.
- File con permessi 777.

Esempio:

```bash
find ~/laboratorio -type f -perm 0777
```

Documentare i risultati.

### Esercitazione 6 – Verifica del minimo privilegio

Progettare la struttura dei permessi per un'applicazione Python che:

- Legge un file di configurazione.
- Scrive log.
- Accede a una directory di dati.
- Non deve modificare i file di sistema.
- Non deve essere eseguita come root.

Definire:

1. Utente del servizio.
2. Gruppo del servizio.
3. Proprietà dei file.
4. Permessi delle directory.
5. Permessi dei file.
6. Eventuali ACL.
7. Modalità di gestione delle credenziali.

---

## 19. Domande di autovalutazione

1. Che cos'è un file system?
2. Qual è la funzione della directory `/`?
3. Qual è la differenza tra file e directory?
4. Qual è la differenza tra percorso assoluto e relativo?
5. Che cosa rappresenta la directory `/home`?
6. Quali informazioni contiene `/etc/passwd`?
7. Che cosa rappresenta un UID?
8. Che cosa rappresenta un GID?
9. Qual è il ruolo dell'utente root?
10. Qual è la differenza tra proprietario e gruppo?
11. Che cosa significano i permessi `r`, `w` e `x`?
12. Qual è la differenza tra i permessi di un file e quelli di una directory?
13. Come si interpreta il valore numerico 755?
14. Qual è la differenza tra `chmod` e `chown`?
15. A cosa serve il comando `umask`?
16. Che cosa indica la maschera 077?
17. Che cosa fa il comando `usermod -aG`?
18. Qual è la funzione del bit SGID su una directory?
19. Che cosa rappresenta lo sticky bit?
20. Che cosa sono le ACL?
21. Perché è pericoloso utilizzare `chmod 777`?
22. Che cosa significa applicare il principio del minimo privilegio?
23. Perché un servizio Web non dovrebbe essere eseguito come root?
24. Perché i file contenenti password devono avere permessi restrittivi?

---

## 20. Riepilogo

| Argomento | Concetto fondamentale |
| --- | --- |
| File system | Organizzazione e gestione dei dati |
| File | Unità logica di memorizzazione |
| Directory | Contenitore di file e directory |
| Percorso assoluto | Parte dalla directory `/` |
| Percorso relativo | Dipende dalla directory corrente |
| UID | Identificativo numerico dell'utente |
| GID | Identificativo numerico del gruppo |
| Root | Amministratore del sistema |
| Read | Permesso di lettura |
| Write | Permesso di scrittura |
| Execute | Permesso di esecuzione o attraversamento |
| chmod | Modifica dei permessi |
| chown | Modifica di proprietario e gruppo |
| umask | Maschera dei permessi predefiniti |
| SUID | Esecuzione con UID effettivo del proprietario |
| SGID | Esecuzione con GID effettivo del gruppo; ereditarietà del gruppo nelle directory |
| Sticky Bit | Limitazione della cancellazione nelle directory condivise |
| ACL | Gestione di permessi aggiuntivi |
| Least Privilege | Concessione dei soli privilegi necessari |

### Concetti da ricordare

- Linux è un sistema multiutente.
- Ogni file e directory possiede proprietario, gruppo e permessi.
- I permessi standard sono lettura, scrittura ed esecuzione.
- I permessi possono essere rappresentati in modalità simbolica o numerica.
- `chmod` modifica i permessi.
- `chown` modifica proprietario e gruppo.
- `umask` influenza i permessi dei nuovi file e delle nuove directory.
- I gruppi semplificano la gestione delle risorse condivise.
- SUID, SGID e sticky bit modificano il comportamento dei permessi standard.
- Le ACL permettono una gestione più dettagliata degli accessi.
- Il principio del minimo privilegio riduce i rischi di compromissione.

---

## 21. Collegamenti ai moduli successivi

**Modulo 02 – Logica e algoritmi**

- Gestione dei dati.
- Organizzazione delle informazioni.
- Algoritmi per elaborare file e directory.

**Modulo 03 – Python**

- Lettura e scrittura dei file.
- Gestione dei percorsi.
- Controllo degli errori.
- Accesso ai file e ai metadati.

**Modulo 04 – Bash scripting**

- Gestione automatizzata dei file.
- Controllo dei permessi.
- Script amministrativi.
- Gestione degli utenti e dei gruppi.

**Modulo 05 – Database e SQL**

- Protezione dei file di configurazione.
- Gestione dei backup.
- Permessi sui dati persistenti.

**Modulo 06 – Backend e API**

- Protezione dei file utilizzati dalle applicazioni.
- Gestione delle credenziali.
- Utenti dedicati ai servizi.
- Separazione dei privilegi.

**Modulo 07 – Cybersecurity**

- Hardening dei sistemi Linux.
- Analisi dei permessi anomali.
- Escalation dei privilegi.
- Protezione delle informazioni.
- Analisi dei log.
- Gestione degli account.
- Principio del minimo privilegio.

### Risorse e documentazione

- Linux – Filesystem Hierarchy Standard: <https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html>
- Linux – chmod manual: <https://man7.org/linux/man-pages/man1/chmod.1.html>
- Linux – chown manual: <https://man7.org/linux/man-pages/man1/chown.1.html>
- Linux – umask manual: <https://man7.org/linux/man-pages/man2/umask.2.html>
- Linux – stat manual: <https://man7.org/linux/man-pages/man1/stat.1.html>
- Linux – find manual: <https://man7.org/linux/man-pages/man1/find.1.html>
- Linux – ACL manual: <https://man7.org/linux/man-pages/man5/acl.5.html>
- Ubuntu Server Documentation: <https://documentation.ubuntu.com/server/>
- GNU Coreutils – File permissions: <https://www.gnu.org/software/coreutils/manual/html_node/File-permissions.html>
- OWASP – File Upload Cheat Sheet: <https://cheatsheetseries.owasp.org/cheatsheets/File_Upload_Cheat_Sheet.html>
