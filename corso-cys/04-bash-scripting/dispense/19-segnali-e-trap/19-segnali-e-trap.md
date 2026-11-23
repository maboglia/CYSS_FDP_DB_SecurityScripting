# 19 – Segnali e `trap`: interruzione e pulizia

**Durata indicativa:** 60 minuti  
**Obiettivo:** comprendere i segnali Unix più comuni e gestire la terminazione controllata di uno script Bash.

## 1. Che cosa sono i segnali
I segnali sono notifiche asincrone inviate a un processo. Alcuni segnali comuni:
- `SIGINT` (spesso generato da Ctrl+C): interruzione da tastiera;
- `SIGTERM`: richiesta di terminazione;
- `SIGKILL`: terminazione forzata, non intercettabile;
- `SIGHUP`: spesso associato alla chiusura del terminale o alla perdita della sessione.

Un processo può gestire alcuni segnali, ma non può intercettare o ignorare `SIGKILL` e `SIGSTOP`.

## 2. `trap`
`trap` associa un comando a un segnale o a un evento della shell.

```bash
trap 'echo "Interruzione ricevuta"' INT
trap 'rm -f -- "$tmpfile"' EXIT
```

L'evento `EXIT` permette di eseguire una pulizia quando lo script termina, sia normalmente sia a seguito di un errore gestito dalla shell.

## 3. Laboratorio sicuro
Eseguire:
```bash
bash codice/19-segnali-e-trap/32-trap-pulizia.sh
```
Lo script crea un file temporaneo in una directory temporanea, mostra il percorso e attende. Premere Ctrl+C per osservare la gestione di `SIGINT` e la pulizia su `EXIT`.

Per provare `SIGTERM`, in un secondo terminale inviare il segnale al PID mostrato:
```bash
kill -TERM PID
```
Sostituire `PID` con il numero effettivo. Non usare `kill -9` durante il laboratorio: impedirebbe l'esecuzione della pulizia.

## 4. Esercizi
1. Modificare il messaggio mostrato su `SIGINT`.
2. Aggiungere un secondo file temporaneo e rimuoverlo in `EXIT`.
3. Gestire `TERM` con un messaggio e uscita controllata.
4. Verificare cosa accade se lo script viene terminato con `SIGKILL`.

## Verifica
- Qual è la differenza tra `SIGTERM` e `SIGKILL`?
- Perché la pulizia va registrata con `trap ... EXIT`?
- Perché un `trap` non può garantire pulizia dopo `SIGKILL`?

## Sicurezza operativa
Provare i segnali solo sui processi del laboratorio. Prima di terminare un processo reale, identificarlo con attenzione e verificare l'impatto. Un handler non sostituisce la gestione corretta di file temporanei, lock e risorse condivise.
