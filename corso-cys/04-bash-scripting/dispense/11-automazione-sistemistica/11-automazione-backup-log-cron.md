# 11 – Automazione sistemistica: backup, controlli e pianificazione

<text>Durata indicativa: 60 minuti · Livello: intermedio</text>

## Obiettivi di apprendimento
Individuare attività ripetitive adatte all'automazione, progettare un backup elementare,
verificare input e destinazioni, registrare l'esito, comprendere la pianificazione
periodica con cron.

## 1. Automazione: criteri di progetto (10 minuti)
Uno script di automazione deve avere uno scopo circoscritto, input chiari, controlli
preliminari, output verificabile e gestione degli errori. Prima di automatizzare,
descrivere la procedura manuale e identificare le operazioni irreversibili.

## 2. Backup elementare (15 minuti)
Un backup didattico può copiare file selezionati in una directory datata. Le fasi sono:
1. validare la directory sorgente;
2. definire una destinazione separata;
3. creare una directory con timestamp;
4. copiare i file previsti;
5. contare le operazioni e segnalare l'esito.

Il backup non è completo solo perché il comando `cp` è terminato: occorre verificare
la presenza dei file copiati e considerare spazio disponibile, permessi e criteri di
conservazione. Per scenari reali servono inoltre test di ripristino e protezione della
destinazione.

## 3. Anteprima e operazioni massive (10 minuti)
Per rinominare o spostare molti file, creare prima una modalità di anteprima che mostri
origine e destinazione. Controllare collisioni (un nome di destinazione già esistente),
estensioni e directory di lavoro. Attivare le modifiche solo dopo aver verificato
l'elenco previsto.

## 4. Cron (15 minuti)
`crontab -e` apre la pianificazione dell'utente. La sintassi tradizionale contiene:

```text
minuto ora giorno-del-mese mese giorno-della-settimana comando
```

Esempio illustrativo: `30 2 * * * /home/utente/bin/backup.sh`.
Prima di inserire una pianificazione:
- eseguire manualmente lo script;
- usare percorsi assoluti;
- redirigere log e diagnostica;
- considerare che `PATH` e ambiente sono più limitati;
- non pianificare script non testati.

Non modificare la crontab del sistema durante il laboratorio.

## 5. Laboratorio (10 minuti)
- Eseguire `codice/11-automazione-sistemistica/18-backup-txt.sh` su una cartella di prova.
- Controllare la cartella creata e il numero di file.
- Eseguire `codice/11-automazione-sistemistica/19-rinomina-jpg-preview.sh`.
- Verificare che lo script di rinomina mostri soltanto l'anteprima e non modifichi i file.

## Collegamento ai file di codice
- `codice/11-automazione-sistemistica/18-backup-txt.sh` – backup datato.
- `codice/11-automazione-sistemistica/19-rinomina-jpg-preview.sh` – anteprima rinomina.
- `codice/10-debugging-ed-errori/16-controllo-errori-copia.sh` – controllo esito copia.

## Verifica
Quali controlli precedono un backup? Perché una destinazione separata è importante?
Quali problemi si incontrano quando uno script viene eseguito da cron?
