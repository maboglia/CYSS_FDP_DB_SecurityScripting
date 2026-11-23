# 04 – Input, output, redirezioni e pipeline

<text>Durata indicativa: 60 minuti · Livello: base</text>

## Obiettivi di apprendimento
Riconoscere i tre flussi standard, acquisire input da tastiera, redirigere output e
errori, concatenare comandi con pipeline, leggere file riga per riga in modo affidabile.

## 1. I flussi standard (10 minuti)
Ogni processo avviato da una shell dispone normalmente di tre flussi:
- **stdin (0)**: ingresso standard, spesso la tastiera o un file;
- **stdout (1)**: uscita standard, spesso il terminale;
- **stderr (2)**: uscita degli errori, spesso il terminale.

Separare output normale ed errori aiuta a registrare i risultati e diagnosticare problemi.

## 2. Acquisire input con read (10 minuti)
`read` legge una riga e la assegna a una o più variabili. `-r` impedisce che il backslash
sia interpretato come carattere di escape:

```bash
read -r -p "Nome: " nome
printf 'Ciao, %s\\n' "$nome"
```

Usare `printf` con un formato e variabili quotate. Evitare di usare input non validato
come parte di un comando costruito dinamicamente.

## 3. Redirezioni (15 minuti)
- `>` crea o sovrascrive un file;
- `>>` aggiunge in fondo;
- `<` usa un file come stdin;
- `2>` redirige stderr;
- `2>&1` collega stderr alla destinazione corrente di stdout.

```bash
printf 'Avvio\\n' > esito.txt
printf 'Fine\\n' >> esito.txt
ls percorso-inesistente 2> errori.txt
```

Attenzione: `>` sovrascrive il contenuto precedente. Per gli esercizi, usare file
temporanei creati nella cartella di laboratorio.

## 4. Pipeline (10 minuti)
Il carattere `|` collega stdout del comando a sinistra a stdin del comando a destra.
Esempio:

```bash
grep 'ERROR' log.txt | wc -l
```

`grep` seleziona le righe; `wc -l` le conta. Ogni comando svolge un compito semplice.
La pipeline è quindi una composizione di strumenti. Per capire il risultato, provare
prima i singoli comandi separatamente.

## 5. Lettura riga per riga (5 minuti)
Un modello robusto per leggere un file è:

```bash
while IFS= read -r riga || [[ -n "$riga" ]]; do
    printf '%s\\n' "$riga"
done < "$file"
```

`IFS=` evita la rimozione degli spazi iniziali/finali; `-r` conserva i backslash;
la seconda condizione gestisce anche un'ultima riga senza newline finale.

## 6. Laboratorio (10 minuti)
- `codice/04-input-output-redirezioni/04-input-read.sh`: acquisire un nome.
- `codice/04-input-output-redirezioni/05-redirezioni-pipeline.sh`: creare un log e
  contare le righe `ERROR`.
Modificare il log aggiungendo un evento `WARNING` e verificare che il conteggio degli
errori non cambi.

## Collegamento ai file di codice
- `codice/04-input-output-redirezioni/04-input-read.sh`
- `codice/04-input-output-redirezioni/05-redirezioni-pipeline.sh`
- `codice/06-cicli-e-iterazioni/09-leggi-file.sh`

## Verifica
Che differenza c'è tra `>` e `>>`? Qual è il descrittore di stderr? Che cosa passa
attraverso una pipeline? Perché si usa `read -r`?
