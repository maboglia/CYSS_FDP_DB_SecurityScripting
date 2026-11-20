# Esercitazione 03 – Rappresentazione binaria e codifica delle informazioni

## 1. Obiettivi dell'esercitazione

L'obiettivo è comprendere come i computer rappresentano e memorizzano le informazioni attraverso sequenze di bit e come i diversi sistemi numerici permettono di rappresentare gli stessi valori.

Al termine dell'esercitazione lo studente sarà in grado di:

- Comprendere il concetto di bit e byte.
- Distinguere i sistemi numerici binario, decimale ed esadecimale.
- Convertire numeri dal sistema decimale al binario e viceversa.
- Convertire numeri dal sistema binario all'esadecimale e viceversa.
- Riconoscere il significato delle rappresentazioni numeriche utilizzate in informatica.
- Utilizzare Python per effettuare conversioni tra basi numeriche.
- Comprendere il funzionamento generale della codifica Base64.
- Distinguere codifica, cifratura e hashing.
- Riconoscere alcune applicazioni di questi concetti in ambito cybersecurity.

## 2. Ambiente di lavoro

L'esercitazione può essere svolta utilizzando:

| Strumento          | Utilizzo                   |
| ------------------ | -------------------------- |
| Carta e penna      | Conversioni manuali        |
| Python 3           | Verifica delle conversioni |
| Terminale Linux    | Esecuzione degli script    |
| PowerShell Windows | Esecuzione degli script    |
| Editor di testo    | Scrittura del codice       |

Non è necessario installare librerie Python aggiuntive: verranno utilizzate esclusivamente librerie standard.

### Verifica dell'ambiente Python

Aprire il terminale o PowerShell ed eseguire:

```bash
python3 --version
```

Su Windows potrebbe essere necessario utilizzare:

```powershell
python --version
```

In alternativa, su Windows:

```powershell
py --version
```

L'esercitazione utilizza Python 3.

---

## 3. Parte A – Bit e byte

### 3.1 Il bit

Il bit (Binary Digit) è la più piccola unità di informazione utilizzata nei sistemi digitali.

Può assumere soltanto due valori:

- `0`
- `1`

Questa rappresentazione è basata sul sistema numerico binario.

Un bit può rappresentare due stati distinti, ad esempio:

- Spento / Acceso.
- Falso / Vero.
- Assenza / Presenza di un segnale.

### 3.2 Il byte

Un byte è composto da 8 bit.

Esempio:

```text
10110010
```

La sequenza contiene 8 bit e rappresenta un byte.

Con 8 bit è possibile rappresentare:

\[
2^8 = 256
\]

combinazioni differenti, corrispondenti ai valori da 0 a 255 quando si utilizza una rappresentazione senza segno.

### 3.3 Multipli del byte

| Unità      |        Valore |
| ---------- | ------------: |
| 1 bit      | Unità binaria |
| 1 byte (B) |         8 bit |
| 1 KB       |    1.000 byte |
| 1 MB       |      1.000 KB |
| 1 GB       |      1.000 MB |
| 1 TB       |      1.000 GB |

In informatica si utilizzano anche le unità basate sulle potenze di 2:

| Unità |     Valore |
| ----- | ---------: |
| 1 KiB | 1.024 byte |
| 1 MiB |  1.024 KiB |
| 1 GiB |  1.024 MiB |
| 1 TiB |  1.024 GiB |

È importante distinguere KB da KiB e GB da GiB: non rappresentano esattamente la stessa quantità.

### 3.4 Esercizio

Rispondere alle seguenti domande:

1. Quanti bit contiene un byte?
2. Quante combinazioni differenti possono essere rappresentate con 4 bit?
3. Quante combinazioni possono essere rappresentate con 8 bit?
4. Qual è il valore massimo rappresentabile con 8 bit senza segno?
5. Quanti byte sono presenti in 1 KiB?
6. Qual è la differenza tra MB e MiB?

---

## 4. Parte B – Il sistema numerico decimale

Il sistema decimale è il sistema numerico utilizzato comunemente nella vita quotidiana.

Utilizza dieci simboli:

```text
0 1 2 3 4 5 6 7 8 9
```

È un sistema posizionale: il valore di una cifra dipende dalla posizione che occupa.

Ad esempio:

\[
345 = 3 \cdot 100 + 4 \cdot 10 + 5 \cdot 1
\]

Oppure:

\[
345 = 3 \cdot 10^2 + 4 \cdot 10^1 + 5 \cdot 10^0
\]

Ogni posizione rappresenta una potenza di 10.

## 5. Parte C – Il sistema numerico binario

Il sistema binario utilizza soltanto due simboli:

```text
0 1
```

Ogni posizione rappresenta una potenza di 2.

Le prime posizioni, partendo da destra, sono:

| Posizione | Potenza | Valore |
| --------: | ------: | -----: |
|         0 | \(2^0\) |      1 |
|         1 | \(2^1\) |      2 |
|         2 | \(2^2\) |      4 |
|         3 | \(2^3\) |      8 |
|         4 | \(2^4\) |     16 |
|         5 | \(2^5\) |     32 |
|         6 | \(2^6\) |     64 |
|         7 | \(2^7\) |    128 |

### 5.1 Conversione da binario a decimale

Consideriamo il numero:

```text
101101
```

Ogni cifra viene moltiplicata per la potenza di 2 corrispondente alla sua posizione.

| Cifra | Posizione | Potenza |     Calcolo |
| ----: | --------: | ------: | ----------: |
|     1 |         5 |      32 | 1 × 32 = 32 |
|     0 |         4 |      16 |  0 × 16 = 0 |
|     1 |         3 |       8 |   1 × 8 = 8 |
|     1 |         2 |       4 |   1 × 4 = 4 |
|     0 |         1 |       2 |   0 × 2 = 0 |
|     1 |         0 |       1 |   1 × 1 = 1 |

Sommiamo i risultati:

\[
32 + 8 + 4 + 1 = 45
\]

Quindi:

\[
(101101)_2 = (45)_{10}
\]

### 5.2 Conversione da decimale a binario

Per convertire un numero decimale in binario si effettuano divisioni successive per 2.

Consideriamo il numero 45.

| Divisione | Quoziente | Resto |
| --------- | --------: | ----: |
| 45 / 2    |        22 |     1 |
| 22 / 2    |        11 |     0 |
| 11 / 2    |         5 |     1 |
| 5 / 2     |         2 |     1 |
| 2 / 2     |         1 |     0 |
| 1 / 2     |         0 |     1 |

I resti devono essere letti dal basso verso l'alto:

```text
101101
```

Quindi:

\[
(45)_{10} = (101101)_2
\]

### 5.3 Esercizio pratico

Convertire manualmente i seguenti numeri.

**Da binario a decimale:**

| Numero binario | Risultato decimale |
| -------------- | ------------------ |
| 1010           |                    |
| 1100           |                    |
| 1111           |                    |
| 10001          |                    |
| 101010         |                    |
| 110101         |                    |
| 11111111       |                    |

**Da decimale a binario:**

| Numero decimale | Risultato binario |
| --------------: | ----------------- |
|               5 |                   |
|              10 |                   |
|              15 |                   |
|              18 |                   |
|              25 |                   |
|              42 |                   |
|             100 |                   |
|             255 |                   |

Per ogni conversione mostrare il procedimento utilizzato.

---

## 6. Parte D – Il sistema numerico esadecimale

Il sistema esadecimale utilizza sedici simboli:

```text
0 1 2 3 4 5 6 7 8 9 A B C D E F
```

Le lettere rappresentano i valori da 10 a 15.

| Decimale | Esadecimale |
| -------: | ----------- |
|        0 | 0           |
|        1 | 1           |
|        2 | 2           |
|        3 | 3           |
|        4 | 4           |
|        5 | 5           |
|        6 | 6           |
|        7 | 7           |
|        8 | 8           |
|        9 | 9           |
|       10 | A           |
|       11 | B           |
|       12 | C           |
|       13 | D           |
|       14 | E           |
|       15 | F           |

Ogni posizione rappresenta una potenza di 16.

### 6.1 Conversione da esadecimale a decimale

Consideriamo:

```text
2F
```

Calcoliamo:

\[
2 \cdot 16^1 + 15 \cdot 16^0
\]

\[
32 + 15 = 47
\]

Quindi:

\[
(2F)_{16} = (47)_{10}
\]

### 6.2 Conversione da decimale a esadecimale

Consideriamo il numero 255.

Dividiamo successivamente per 16.

| Divisione | Quoziente |  Resto |
| --------- | --------: | -----: |
| 255 / 16  |        15 | 15 (F) |
| 15 / 16   |         0 | 15 (F) |

Leggendo i resti dal basso verso l'alto:

```text
FF
```

Quindi:

\[
(255)_{10} = (FF)_{16}
\]

### 6.3 Relazione tra binario ed esadecimale

Un vantaggio del sistema esadecimale è che ogni cifra rappresenta esattamente 4 bit.

| Binario | Esadecimale |
| ------- | ----------- |
| 0000    | 0           |
| 0001    | 1           |
| 0010    | 2           |
| 0011    | 3           |
| 0100    | 4           |
| 0101    | 5           |
| 0110    | 6           |
| 0111    | 7           |
| 1000    | 8           |
| 1001    | 9           |
| 1010    | A           |
| 1011    | B           |
| 1100    | C           |
| 1101    | D           |
| 1110    | E           |
| 1111    | F           |

Esempio:

```text
Binario:      11001010
Raggruppato:  1100 1010
Esadecimale:  C    A
```

Quindi:

\[
(11001010)_2 = (CA)_{16}
\]

### 6.4 Esercizio pratico

Convertire i seguenti valori.

**Da esadecimale a decimale:**

| Esadecimale | Risultato decimale |
| ----------- | -----------------: |
| A           |                    |
| F           |                    |
| 10          |                    |
| 1A          |                    |
| 2F          |                    |
| 64          |                    |
| FF          |                    |

**Da binario a esadecimale:**

| Binario  | Risultato esadecimale |
| -------- | --------------------- |
| 00001010 |                       |
| 00001111 |                       |
| 00101010 |                       |
| 11110000 |                       |
| 11001010 |                       |
| 11111111 |                       |

**Da esadecimale a binario:**

| Esadecimale | Risultato binario |
| ----------- | ----------------- |
| 5           |                   |
| A           |                   |
| 1F          |                   |
| 2A          |                   |
| C0          |                   |
| FF          |                   |

---

## 7. Parte E – Verifica delle conversioni con Python

Python mette a disposizione alcune funzioni integrate per convertire numeri tra sistemi numerici differenti.

### 7.1 Conversione da decimale a binario

La funzione `bin()` restituisce la rappresentazione binaria di un numero intero.

```python
# Numero decimale
numero = 45

# Conversione in binario
risultato = bin(numero)

print(risultato)
```

Output:

```text
0b101101
```

Il prefisso `0b` indica che il numero è rappresentato in base 2.

### 7.2 Conversione da decimale a esadecimale

```python
numero = 255

risultato = hex(numero)

print(risultato)
```

Output:

```text
0xff
```

Il prefisso `0x` indica una rappresentazione esadecimale.

### 7.3 Conversione da binario a decimale

La funzione `int()` permette di interpretare una stringa specificando la base numerica.

```python
# Numero rappresentato in binario
numero_binario = "101101"

# Conversione in decimale
risultato = int(numero_binario, 2)

print(risultato)
```

Output:

```text
45
```

### 7.4 Conversione da esadecimale a decimale

```python
numero_esadecimale = "FF"

risultato = int(numero_esadecimale, 16)

print(risultato)
```

Output:

```text
255
```

### 7.5 Programma completo di conversione

Creare un file denominato:

`conversioni.py`

Inserire il seguente codice:

```python
# Programma per convertire numeri tra diverse basi

numero = 45

# Conversioni da decimale
print("Numero decimale:", numero)
print("Binario:", bin(numero))
print("Esadecimale:", hex(numero))

# Conversione da binario a decimale
valore_binario = "101101"
print("Binario:", valore_binario)
print("Decimale:", int(valore_binario, 2))

# Conversione da esadecimale a decimale
valore_esadecimale = "FF"
print("Esadecimale:", valore_esadecimale)
print("Decimale:", int(valore_esadecimale, 16))
```

Eseguire il programma.

**Linux:**

```bash
python3 conversioni.py
```

**Windows:**

```powershell
python conversioni.py
```

Oppure:

```powershell
py conversioni.py
```

### 7.6 Attività

Modificare il programma in modo che:

1. Chieda all'utente un numero decimale.
2. Mostri la rappresentazione binaria.
3. Mostri la rappresentazione esadecimale.
4. Chieda all'utente un numero binario.
5. Converta il numero binario in decimale.
6. Chieda all'utente un numero esadecimale.
7. Converta il numero esadecimale in decimale.

Suggerimento:

```python
numero = int(input("Inserisci un numero decimale: "))
```

Per convertire una stringa binaria:

```python
numero = int(input("Inserisci un numero binario: "), 2)
```

Per convertire una stringa esadecimale:

```python
numero = int(input("Inserisci un numero esadecimale: "), 16)
```

### 7.7 Esercizio aggiuntivo – Validazione degli input

Modificare il programma per gestire gli errori di inserimento.

Esempi:

- Un numero binario può contenere soltanto `0` e `1`.
- Un numero esadecimale può contenere cifre da `0` a `9` e lettere da `A` a `F`.
- Un numero decimale deve essere un intero valido.

Utilizzare `try` ed `except` per intercettare eventuali errori di conversione.

---

## 8. Parte F – Rappresentazione delle informazioni e cybersecurity

La rappresentazione binaria ed esadecimale viene utilizzata frequentemente in ambito cybersecurity.

Alcuni esempi:

| Ambito             | Utilizzo                                      |
| ------------------ | --------------------------------------------- |
| Indirizzi IPv4     | Rappresentazione di indirizzi di rete         |
| Indirizzi IPv6     | Rappresentazione esadecimale degli indirizzi  |
| MAC Address        | Identificazione delle interfacce di rete      |
| Analisi forense    | Lettura di file attraverso editor esadecimali |
| Hash               | Rappresentazione esadecimale dei digest       |
| Permessi Linux     | Rappresentazione numerica dei permessi        |
| Analisi di malware | Esame dei contenuti binari dei file           |

### 8.1 Esempio: indirizzo MAC

Un indirizzo MAC identifica un'interfaccia di rete a livello di collegamento dati.

Esempio:

```text
00:1A:2B:3C:4D:5E
```

Ogni coppia di caratteri rappresenta un valore esadecimale di un byte.

Ad esempio:

```text
00 = 0
1A = 26
2B = 43
3C = 60
4D = 77
5E = 94
```

### 8.2 Esercizio

Considerare il seguente indirizzo MAC:

```text
A4:B1:C2:10:20:FF
```

1. Quanti byte contiene?
2. Qual è il valore decimale della prima coppia?
3. Qual è il valore decimale dell'ultima coppia?
4. Perché viene utilizzata la rappresentazione esadecimale?

---

## 9. Parte G – Codifica Base64

Base64 è un sistema di codifica utilizzato per rappresentare dati binari attraverso caratteri testuali.

Viene utilizzato, ad esempio, per:

- Trasmettere allegati nelle email.
- Rappresentare dati binari all'interno di documenti testuali.
- Trasportare informazioni in alcuni formati JSON.
- Codificare contenuti in alcune applicazioni web.

Base64 non è un sistema di cifratura.

Un dato codificato in Base64 può essere facilmente decodificato senza conoscere alcuna chiave segreta.

### 9.1 Esempio

Consideriamo la stringa:

```text
Cybersecurity
```

La codifichiamo utilizzando Base64.

Risultato:

```text
Q3liZXJzZWN1cml0eQ==
```

La decodifica permette di recuperare il testo originale.

### 9.2 Codifica Base64 con Python

Python mette a disposizione il modulo standard `base64`.

Creare un file:

`base64_demo.py`

```python
import base64

# Testo originale
testo = "Cybersecurity"

# Conversione del testo in byte
dati = testo.encode("utf-8")

# Codifica Base64
codificato = base64.b64encode(dati)

print("Originale:", testo)
print("Base64:", codificato.decode("ascii"))

# Decodifica Base64
decodificato = base64.b64decode(codificato)

print("Decodificato:", decodificato.decode("utf-8"))
```

Eseguire:

```bash
python3 base64_demo.py
```

Su Windows:

```powershell
python base64_demo.py
```

### 9.3 Attività

Modificare il programma per:

1. Chiedere una stringa all'utente.
2. Codificarla in Base64.
3. Visualizzare il risultato.
4. Decodificare il risultato.
5. Verificare che il testo ottenuto coincida con quello originale.

Domande:

1. Base64 protegge le informazioni?
2. È necessario conoscere una chiave per decodificare Base64?
3. Perché Base64 viene utilizzato nelle comunicazioni?
4. Perché non deve essere utilizzato per memorizzare password?

---

## 10. Parte H – Codifica, cifratura e hashing

In ambito cybersecurity è fondamentale distinguere tre concetti che spesso vengono confusi.

### 10.1 Codifica (Encoding)

La codifica trasforma i dati da una rappresentazione a un'altra.

Obiettivo:

- Rendere i dati compatibili con un determinato formato.
- Facilitare la trasmissione.
- Standardizzare la rappresentazione.

Esempi:

- Base64.
- UTF-8.
- ASCII.
- URL encoding.

La codifica non garantisce riservatezza.

### 10.2 Cifratura (Encryption)

La cifratura trasforma un dato leggibile in un contenuto non comprensibile senza una chiave appropriata.

Obiettivo:

- Proteggere la riservatezza delle informazioni.

La cifratura deve poter essere invertita da chi possiede le informazioni necessarie per decifrare il contenuto.

Esempi:

- AES.
- RSA, per determinati utilizzi crittografici.
- Cifratura dei dischi.
- Comunicazioni HTTPS tramite TLS.

### 10.3 Hashing

L'hashing applica una funzione matematica che produce un valore di lunghezza definita, chiamato digest.

Obiettivo:

- Verificare l'integrità dei dati.
- Supportare il confronto tra contenuti.
- Memorizzare in modo appropriato i verificatori delle password.

Una funzione hash crittografica è progettata per rendere computazionalmente difficile ricavare il contenuto originale dal digest.

Esempi:

- SHA-256.
- SHA-512.
- SHA-3.

Per la memorizzazione delle password non è opportuno utilizzare direttamente un hash veloce come SHA-256. Si utilizzano algoritmi specifici per il password hashing, come Argon2id, scrypt, bcrypt o PBKDF2, con salt e parametri adeguati.

### 10.4 Tabella comparativa

| Proprietà                 | Codifica         | Cifratura                       | Hashing                          |
| ------------------------- | ---------------- | ------------------------------- | -------------------------------- |
| Scopo                     | Rappresentazione | Riservatezza                    | Integrità e verifica             |
| Chiave segreta            | No               | Sì, secondo l'algoritmo         | No, nelle funzioni hash standard |
| Operazione inversa        | Decodifica       | Decifratura                     | Non prevista                     |
| Esempio                   | Base64           | AES                             | SHA-256                          |
| Protegge la riservatezza? | No               | Sì, se correttamente utilizzata | Non è il suo scopo               |

### 10.5 Esempio pratico con Python: SHA-256

Python mette a disposizione il modulo `hashlib`.

Creare il file:

`hash_demo.py`

```python
import hashlib

# Testo da elaborare
testo = "Cybersecurity"

# Conversione in byte
dati = testo.encode("utf-8")

# Calcolo dell'hash SHA-256
digest = hashlib.sha256(dati).hexdigest()

print("Testo originale:", testo)
print("Hash SHA-256:", digest)
```

Eseguire:

```bash
python3 hash_demo.py
```

Su Windows:

```powershell
python hash_demo.py
```

### 10.6 Verifica dell'integrità

Un hash può essere utilizzato per verificare se un file è stato modificato.

Esempio:

```python
import hashlib

def calcola_hash(percorso_file):
    sha256 = hashlib.sha256()

    # Lettura del file in blocchi
    with open(percorso_file, "rb") as file:
        while True:
            blocco = file.read(4096)

            if not blocco:
                break

            sha256.update(blocco)

    return sha256.hexdigest()


# Calcola l'hash del file
risultato = calcola_hash("documento.txt")

print("SHA-256:", risultato)
```

Il programma:

1. Apre il file in modalità binaria.
2. Legge il contenuto a blocchi.
3. Aggiorna progressivamente il calcolo dell'hash.
4. Restituisce il digest finale in formato esadecimale.

Se il contenuto del file cambia, normalmente cambia anche il suo digest SHA-256.

**Nota:** un hash da solo non dimostra che un file sia autentico. Per verificare l'origine e l'autenticità di un file è necessario confrontare il digest con un valore ottenuto da una fonte attendibile oppure utilizzare meccanismi di firma digitale.

### 10.7 Esercizio comparativo

Utilizzare la stringa:

```text
ITS Cybersecurity
```

Effettuare tre operazioni:

1. Codificare la stringa in Base64.
2. Calcolare il suo hash SHA-256.
3. Modificare un carattere della stringa e calcolare nuovamente l'hash.

Rispondere:

- La codifica Base64 è reversibile?
- L'hash può essere decodificato?
- Che cosa succede all'hash quando cambia un carattere?
- Quale delle tre tecniche protegge la riservatezza?
- Quale tecnica può essere utilizzata per verificare l'integrità?

---

## 11. Parte I – Esercitazione riepilogativa

Svolgere autonomamente le seguenti attività.

### Esercizio 1 – Conversioni numeriche

Convertire:

| Numero   | Base di partenza | Base di destinazione |
| -------- | ---------------- | -------------------- |
| 25       | Decimale         | Binario              |
| 100      | Decimale         | Binario              |
| 255      | Decimale         | Esadecimale          |
| 101101   | Binario          | Decimale             |
| 11111111 | Binario          | Decimale             |
| 2A       | Esadecimale      | Decimale             |
| FF       | Esadecimale      | Decimale             |
| CA       | Esadecimale      | Binario              |

Mostrare il procedimento utilizzato.

### Esercizio 2 – Verifica con Python

Scrivere un programma che:

1. Chieda un numero decimale.
2. Lo converta in binario.
3. Lo converta in esadecimale.
4. Mostri i risultati.
5. Verifichi che le conversioni siano corrette riconvertendo i valori nella base decimale.

### Esercizio 3 – Base64

Scrivere un programma che:

1. Chieda una frase.
2. La codifichi in Base64.
3. Visualizzi la stringa codificata.
4. Decodifichi il risultato.
5. Verifichi che la stringa originale sia stata recuperata.

### Esercizio 4 – Hashing

Scrivere un programma che:

1. Chieda una password di esempio.
2. Calcoli il digest SHA-256.
3. Visualizzi il risultato.
4. Modifichi un carattere della password.
5. Calcoli nuovamente il digest.
6. Confronti i due risultati.

Utilizzare esclusivamente password fittizie, senza inserire credenziali personali.

### Esercizio 5 – Riflessione sulla sicurezza

Rispondere:

1. Perché un attaccante può decodificare facilmente una stringa Base64?
2. Perché una password non dovrebbe essere semplicemente codificata?
3. Qual è la differenza tra cifrare un file e calcolarne l'hash?
4. Perché gli hash sono utilizzati nell'analisi forense?
5. Quale tecnica dovrebbe essere utilizzata per proteggere i dati riservati?

---

## 12. Report e consegna

Produrre un documento Markdown denominato:

`esercitazione-03-rappresentazione-binaria-cognome-nome.md`

Il documento deve contenere:

1. Nome e cognome.
2. Risposte alle domande teoriche.
3. Conversioni numeriche svolte manualmente.
4. Risultati delle conversioni verificate con Python.
5. Codice sorgente degli script realizzati.
6. Risultati degli esperimenti Base64 e SHA-256.
7. Risposte alle domande sulla sicurezza.
8. Breve commento conclusivo.

Gli screenshot possono essere utilizzati per documentare l'esecuzione dei programmi, ma non sostituiscono il codice sorgente.

**Modalità di consegna:** caricare il documento e gli eventuali file Python nella cartella o nello spazio condiviso indicato dal docente.

---

## 13. Criteri di valutazione

| Criterio                                        | Punteggio |
| ----------------------------------------------- | --------: |
| Comprensione di bit, byte e sistemi numerici    |         1 |
| Conversioni manuali tra basi numeriche          |         3 |
| Utilizzo corretto di Python                     |         2 |
| Implementazione delle attività Base64 e hashing |         2 |
| Distinzione tra codifica, cifratura e hashing   |         1 |
| Completezza del report                          |         1 |
| **Totale**                                      |    **10** |

## Risultato atteso

Al termine dell'esercitazione lo studente dovrà saper interpretare e convertire rappresentazioni numeriche, utilizzare Python per verificare i risultati e distinguere correttamente le tecniche di codifica, cifratura e hashing.

Queste competenze costituiscono una base importante per le successive attività di programmazione, analisi dei dati, gestione delle reti e cybersecurity.

### Nota

L'esercitazione può essere articolata in tre momenti:

- **Prima fase:** conversioni manuali e comprensione dei sistemi numerici.
- **Seconda fase:** verifica dei risultati con Python.
- **Terza fase:** approfondimento su Base64, SHA-256 e differenze tra codifica, cifratura e hashing.

Per gli studenti meno esperti è opportuno dedicare più tempo alle conversioni binario-decimale prima di introdurre il sistema esadecimale.