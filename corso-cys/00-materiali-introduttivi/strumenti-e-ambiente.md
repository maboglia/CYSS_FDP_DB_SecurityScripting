# Strumenti e ambiente di sviluppo

## 1. Introduzione

Durante il percorso saranno utilizzati strumenti software
per lo sviluppo, l'esecuzione e il test di programmi,
script, database e applicazioni backend.

L'ambiente di riferimento è Linux Ubuntu.

Se non è possibile installare o configurare subito Ubuntu sul computer
personale, sarà possibile iniziare le attività utilizzando Windows.
Windows è quindi un ambiente temporaneo o alternativo per le prime
esercitazioni: quando disponibile, si consiglia di passare a Ubuntu
per lavorare in modo uniforme con gli strumenti e le attività Linux
previste dal corso.

Gli strumenti potranno essere installati sul computer personale
oppure utilizzati attraverso ambienti di laboratorio predisposti.

## 2. Sistema operativo

### Linux Ubuntu

Il sistema operativo di riferimento è Ubuntu Linux.

Competenze iniziali richieste:

- Utilizzo del desktop.
- Apertura del terminale.
- Navigazione tra directory.
- Gestione di file.
- Installazione di software.
- Utilizzo dei permessi.

Comandi fondamentali:

```bash
pwd
ls -la
cd
mkdir
touch
cp
mv
rm
cat
less
grep
find
chmod
```

### Windows (ambiente alternativo)

Se Ubuntu non è ancora disponibile, è possibile utilizzare Windows 10
o Windows 11 per le attività iniziali di programmazione.

Strumenti consigliati:

- **PowerShell** o **Windows Terminal** per eseguire i comandi.
- **Esplora file** per la gestione di file e directory.
- **Visual Studio Code** come editor.
- **Git for Windows**, che include Git Bash e permette di utilizzare
  molti comandi e script Bash.
- **Python 3.12 per Windows**.

Comandi PowerShell equivalenti per le operazioni di base:

```powershell
Get-Location
Get-ChildItem
Set-Location nome-cartella
New-Item -ItemType Directory nome-cartella
New-Item nome-file.txt
Copy-Item origine destinazione
Move-Item origine destinazione
Remove-Item nome-file
Get-Content nome-file.txt
```

Per le esercitazioni specifiche su Bash sarà necessario utilizzare
**Git Bash** oppure **WSL (Windows Subsystem for Linux)**.
Quando richiesto dal docente, gli esercizi dovranno essere eseguiti
in un ambiente Linux, nativo o virtualizzato.

Docker Desktop su Windows può essere utilizzato quando previsto
dal laboratorio; la configurazione può richiedere WSL 2.

## 3. Python

### Versione di riferimento

Python 3.12.

Verifica dell'installazione:

```bash
python3 --version
```

Verifica di pip:

```bash
python3 -m pip --version
```

### Ambiente virtuale

Ogni progetto Python dovrà utilizzare, preferibilmente,
un ambiente virtuale dedicato.

Creazione:

```bash
python3 -m venv .venv
```

Attivazione su Linux:

```bash
source .venv/bin/activate
```

Attivazione su Windows PowerShell:

```powershell
.venv\\Scripts\\Activate.ps1
```

Attivazione su Windows Prompt dei comandi (cmd):

```cmd
.venv\\Scripts\\activate.bat
```

Se PowerShell impedisce l'esecuzione dello script di attivazione,
è possibile utilizzare il Prompt dei comandi oppure seguire le
indicazioni del docente per configurare la policy di esecuzione.
Non è necessario modificare le impostazioni di sicurezza del sistema
senza averne compreso gli effetti.

Aggiornamento di pip:

```bash
python -m pip install --upgrade pip
```

Disattivazione:

```bash
deactivate
```

### Gestione delle dipendenze

Le librerie utilizzate nei progetti saranno documentate
nel file requirements.txt.

Installazione:

```bash
pip install -r requirements.txt
```

Esportazione:

```bash
pip freeze > requirements.txt
```

## 4. Editor e IDE

Si consiglia l'utilizzo di:

- Visual Studio Code.
- VSCodium.
- PyCharm Community Edition.

Estensioni consigliate per Visual Studio Code:

- Python.
- Pylance.
- Python Debugger.
- GitLens.
- REST Client.
- SQLTools.

L'editor dovrà essere configurato per utilizzare
l'interprete Python dell'ambiente virtuale del progetto.

## 5. Bash scripting

Bash è la shell di riferimento per le attività di scripting
e automazione su Linux.

Su Windows, in attesa di Ubuntu, Bash può essere utilizzato tramite
**Git Bash** oppure **WSL**. PowerShell è una shell differente:
i relativi comandi e script non sono sempre intercambiabili con Bash.

Verifica della versione:

```bash
bash --version
```

Esecuzione di uno script:

```bash
bash script.sh
```

Permessi di esecuzione:

```bash
chmod +x script.sh
```

Esecuzione diretta:

```bash
./script.sh
```

## 6. Git e GitHub

Git sarà utilizzato per il controllo di versione del codice.

GitHub sarà utilizzato per la condivisione dei materiali
e la gestione del repository didattico.

Verifica:

```bash
git --version
```

Configurazione iniziale:

```bash
git config --global user.name "Nome Cognome"
git config --global user.email "email@example.com"
```

Comandi principali:

```bash
git init
git status
git add .
git commit -m "Descrizione modifica"
git log
git pull
git push
```

Ogni studente dovrà acquisire familiarità con:

- Repository.
- Commit.
- Branch.
- Merge.
- Clone.
- Pull e push.
- README e documentazione Markdown.

Non inserire mai password, token, chiavi private o credenziali
all'interno del repository.

## 7. Database PostgreSQL

PostgreSQL sarà utilizzato per le esercitazioni sui database
relazionali.

Strumenti consigliati:

- PostgreSQL Server.
- psql.
- pgAdmin.

Verifica del client:

```bash
psql --version
```

Operazioni previste:

- Creazione di database.
- Creazione di tabelle.
- Definizione di chiavi primarie ed esterne.
- Inserimento e modifica dei dati.
- Query SQL.
- Join e aggregazioni.
- Gestione degli utenti e dei privilegi.

## 8. FastAPI

FastAPI sarà utilizzato per introdurre lo sviluppo
di applicazioni backend e API REST.

Installazione:

```bash
pip install fastapi "uvicorn[standard]"
```

Esempio di avvio:

```bash
uvicorn main:app --reload
```

Documentazione interattiva:

```text
http://127.0.0.1:8000/docs
```

## 9. Pydantic e SQLAlchemy

Pydantic sarà utilizzato per validare e serializzare
i dati ricevuti dalle API.

SQLAlchemy sarà utilizzato per la gestione della persistenza
e dell'interazione con i database.

Installazione:

```bash
pip install pydantic sqlalchemy
```

## 10. Docker

Docker sarà utilizzato per introdurre la containerizzazione
e predisporre ambienti di laboratorio isolati.

Verifica:

```bash
docker --version
docker compose version
```

Le attività potranno prevedere l'esecuzione di database
e servizi applicativi all'interno di container.

## 11. Struttura consigliata di un progetto Python

```text
mio-progetto/
|
├── .venv/
├── app/
│   ├── __init__.py
│   └── main.py
|
├── tests/
├── requirements.txt
├── .gitignore
└── README.md
```

La directory .venv non deve essere inserita nel repository Git.

## 12. Convenzioni di sviluppo

Durante le esercitazioni si richiede di:

- Utilizzare nomi significativi per variabili e funzioni.
- Applicare le convenzioni PEP 8 per Python.
- Scrivere commenti quando necessari.
- Organizzare il codice in moduli.
- Evitare duplicazioni inutili.
- Gestire correttamente gli errori.
- Documentare le funzionalità principali.
- Verificare il funzionamento del codice.

## 13. Sicurezza dell'ambiente di lavoro

Durante le attività pratiche è necessario:

- Utilizzare credenziali dedicate ai laboratori.
- Non pubblicare password o token.
- Non utilizzare dati personali reali senza autorizzazione.
- Non eseguire test su sistemi non autorizzati.
- Mantenere aggiornati gli strumenti.
- Utilizzare ambienti isolati per le prove di sicurezza.
- Prestare attenzione ai permessi di file e directory.

## 14. Checklist iniziale

Prima di iniziare le esercitazioni verificare:

- [ ] Ubuntu o altro ambiente Linux disponibile; in alternativa,
      Windows 10/11 configurato per le attività iniziali.
- [ ] Se si utilizza Windows: PowerShell/Windows Terminal e,
      quando richiesto, Git Bash oppure WSL disponibili.
- [ ] Python 3.12 installato.
- [ ] pip funzionante.
- [ ] Ambiente virtuale configurabile.
- [ ] Visual Studio Code o altro IDE installato.
- [ ] Bash disponibile.
- [ ] Git installato.
- [ ] Account GitHub disponibile.
- [ ] PostgreSQL disponibile.
- [ ] Docker disponibile, se richiesto dal laboratorio.

## 15. Risorse ufficiali

- Python: https://www.python.org/
- Documentazione Python: https://docs.python.org/3.12/
- Ubuntu: https://ubuntu.com/
- Microsoft Windows: https://www.microsoft.com/windows/
- Windows Subsystem for Linux: https://learn.microsoft.com/windows/wsl/
- Git for Windows: https://gitforwindows.org/
- Visual Studio Code: https://code.visualstudio.com/
- VSCodium: https://vscodium.com/
- Git: https://git-scm.com/
- GitHub: https://github.com/
- PostgreSQL: https://www.postgresql.org/docs/
- FastAPI: https://fastapi.tiangolo.com/
- Pydantic: https://docs.pydantic.dev/
- SQLAlchemy: https://www.sqlalchemy.org/
- Docker: https://docs.docker.com/
- OWASP: https://owasp.org/
