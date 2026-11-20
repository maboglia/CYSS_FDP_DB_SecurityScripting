# 04 – Rappresentazione delle informazioni

## 1. Obiettivi didattici

Al termine della lezione lo studente sarà in grado di:

- Comprendere come le informazioni vengono rappresentate all'interno di un sistema informatico.
- Distinguere bit, byte e multipli del byte.
- Comprendere il funzionamento dei sistemi di numerazione binario, decimale ed esadecimale.
- Eseguire conversioni tra numeri decimali, binari ed esadecimali.
- Comprendere come vengono rappresentati e codificati i caratteri.
- Distinguere ASCII, Unicode, UTF-8 e UTF-16.
- Comprendere la differenza tra encoding, cifratura e hashing.
- Utilizzare Python per convertire numeri e rappresentare dati.
- Riconoscere l'importanza della rappresentazione delle informazioni nell'ambito della cybersecurity.

---

## 2. Introduzione: come vengono rappresentate le informazioni

Un computer elabora e memorizza informazioni attraverso sequenze di valori binari.

A differenza degli esseri umani, che utilizzano prevalentemente il sistema decimale, i sistemi informatici lavorano con due soli valori:

- `0`
- `1`

Questi valori rappresentano gli stati logici utilizzati dai circuiti elettronici.

Una sequenza di bit può rappresentare informazioni di natura differente:

- Numeri interi e reali.
- Caratteri e testi.
- Immagini.
- Audio.
- Video.
- Istruzioni eseguibili.
- Dati utilizzati da applicazioni e sistemi informatici.

Il computer non memorizza direttamente una parola, un'immagine o un documento come li percepiamo noi: memorizza sequenze di bit che vengono interpretate secondo specifiche regole di rappresentazione e codifica.

### 2.1 Il concetto di rappresentazione

Consideriamo il numero decimale:

```text
13
```

Lo stesso valore può essere rappresentato in sistemi di numerazione differenti:

| Sistema | Rappresentazione |
| --- | --- |
| Decimale | 13 |
| Binario | 1101 |
| Esadecimale | D |

Il valore non cambia: cambia il sistema utilizzato per rappresentarlo.

Questo principio è fondamentale per comprendere il funzionamento dei computer e l'analisi dei dati digitali.

---

## 3. Bit e byte

### 3.1 Il bit

Il bit (binary digit) è la più piccola unità di informazione utilizzata nell'informatica.

Può assumere esclusivamente due valori:

```text
0 oppure 1
```

Dal punto di vista elettronico, questi valori possono corrispondere a differenti livelli di tensione o stati di un circuito.

Un singolo bit può rappresentare due possibilità:

- 0 = falso / spento.
- 1 = vero / acceso.

La corrispondenza è concettuale: i significati effettivi dipendono dal contesto e dalla convenzione utilizzata.

### 3.2 Il byte

Un byte è composto da 8 bit.

Esempio:

```text
10110101
```

Un byte può rappresentare 256 combinazioni differenti:

\[
2^8 = 256
\]

Quindi, utilizzando 8 bit, è possibile rappresentare valori compresi tra:

```text
00000000 = 0
11111111 = 255
```

Quando si considera un byte come numero intero senza segno, il suo intervallo è quindi 0–255.

### 3.3 Multipli del byte

Le unità di misura della memoria vengono utilizzate per descrivere la quantità di dati memorizzati o trasferiti.

| Unità | Simbolo | Dimensione |
| --- | --- | ---: |
| Bit | b | 1 bit |
| Byte | B | 8 bit |
| Kilobyte | kB | 1.000 byte |
| Megabyte | MB | 1.000.000 byte |
| Gigabyte | GB | 1.000.000.000 byte |
| Terabyte | TB | 1.000.000.000.000 byte |

Esistono anche le unità binarie:

| Unità | Simbolo | Dimensione |
| --- | --- | ---: |
| Kibibyte | KiB | 1.024 byte |
| Mebibyte | MiB | 1.024 KiB |
| Gibibyte | GiB | 1.024 MiB |
| Tebibyte | TiB | 1.024 GiB |

**Attenzione:** MB e MiB non sono sinonimi. I prefissi decimali utilizzano potenze di 10, mentre quelli binari utilizzano potenze di 2.

### 3.4 Esempio pratico

Un file di 10 MB, considerando la convenzione decimale, occupa:

\[
10 \times 1.000.000 = 10.000.000 \text{ byte}
\]

In bit:

\[
10.000.000 \times 8 = 80.000.000 \text{ bit}
\]

Questa distinzione è importante anche quando si confrontano dimensioni dei file e velocità di trasmissione in rete.

Ad esempio:

- MB/s indica megabyte al secondo.
- Mb/s indica megabit al secondo.

Un collegamento da 100 Mb/s, in condizioni ideali, può trasferire:

\[
100 / 8 = 12,5 \text{ MB/s}
\]

---

## 4. I sistemi di numerazione

Un sistema di numerazione è un insieme di simboli e regole utilizzati per rappresentare i numeri.

In informatica sono particolarmente importanti:

- Sistema decimale: base 10.
- Sistema binario: base 2.
- Sistema esadecimale: base 16.

### 4.1 Sistema decimale

Il sistema decimale è quello utilizzato comunemente nella vita quotidiana.

Utilizza dieci cifre:

```text
0 1 2 3 4 5 6 7 8 9
```

È un sistema posizionale: il valore di una cifra dipende dalla posizione occupata.

Esempio:

```text
538
```

Può essere scomposto in:

\[
538 = 5 \times 10^2 + 3 \times 10^1 + 8 \times 10^0
\]

Quindi:

\[
538 = 500 + 30 + 8
\]

### 4.2 Sistema binario

Il sistema binario utilizza soltanto due cifre:

```text
0 1
```

Ogni posizione rappresenta una potenza di 2.

Esempio:

```text
1101
```

La conversione in decimale si ottiene sommando i valori delle posizioni che contengono 1:

| Cifra | Posizione | Potenza | Valore |
| --- | ---: | ---: | ---: |
| 1 | 3 | 2³ | 8 |
| 1 | 2 | 2² | 4 |
| 0 | 1 | 2¹ | 0 |
| 1 | 0 | 2⁰ | 1 |

Quindi:

\[
1101_2 = 8 + 4 + 0 + 1 = 13_{10}
\]

Il numero binario `1101` rappresenta quindi il numero decimale 13.

### 4.3 Conversione da decimale a binario

Per convertire un numero decimale in binario si può utilizzare il metodo delle divisioni successive per 2.

Esempio: convertire 13 in binario.

| Divisione | Quoziente | Resto |
| --- | ---: | ---: |
| 13 / 2 | 6 | 1 |
| 6 / 2 | 3 | 0 |
| 3 / 2 | 1 | 1 |
| 1 / 2 | 0 | 1 |

Leggendo i resti dal basso verso l'alto:

```text
13 = 1101₂
```

### 4.4 Sistema esadecimale

Il sistema esadecimale utilizza 16 simboli:

```text
0 1 2 3 4 5 6 7 8 9 A B C D E F
```

Le lettere rappresentano i valori:

| Simbolo | Valore decimale |
| --- | ---: |
| A | 10 |
| B | 11 |
| C | 12 |
| D | 13 |
| E | 14 |
| F | 15 |

Ogni posizione rappresenta una potenza di 16.

Esempio:

```text
2F
```

La conversione in decimale è:

\[
2F_{16} = 2 \times 16^1 + 15 \times 16^0
\]

\[
= 32 + 15 = 47
\]

Quindi:

```text
2F₁₆ = 47₁₀
```

### 4.5 Perché utilizzare il sistema esadecimale?

Le rappresentazioni binarie possono diventare molto lunghe e difficili da leggere.

Il sistema esadecimale permette di rappresentare in modo compatto sequenze binarie.

Ogni cifra esadecimale corrisponde esattamente a 4 bit.

| Binario | Esadecimale |
| --- | --- |
| 0000 | 0 |
| 0001 | 1 |
| 0010 | 2 |
| 0011 | 3 |
| 0100 | 4 |
| 0101 | 5 |
| 0110 | 6 |
| 0111 | 7 |
| 1000 | 8 |
| 1001 | 9 |
| 1010 | A |
| 1011 | B |
| 1100 | C |
| 1101 | D |
| 1110 | E |
| 1111 | F |

Esempio:

```text
Binario:      1101 1010
Esadecimale:    D    A
```

Quindi:

```text
11011010₂ = DA₁₆
```

### 4.6 Riepilogo dei sistemi numerici

| Decimale | Binario | Esadecimale |
| ---: | ---: | ---: |
| 0 | 0000 | 0 |
| 1 | 0001 | 1 |
| 5 | 0101 | 5 |
| 10 | 1010 | A |
| 13 | 1101 | D |
| 15 | 1111 | F |
| 16 | 10000 | 10 |
| 31 | 11111 | 1F |
| 64 | 1000000 | 40 |
| 255 | 11111111 | FF |

---

## 5. Rappresentazione dei numeri in Python

Python mette a disposizione funzioni integrate per convertire i numeri tra diversi sistemi di numerazione.

### 5.1 La funzione bin()

La funzione `bin()` restituisce la rappresentazione binaria di un numero intero.

```python
numero = 13

risultato = bin(numero)

print(risultato)
```

Output:

```text
0b1101
```

Il prefisso `0b` indica che il numero è rappresentato in base 2.

### 5.2 La funzione hex()

La funzione `hex()` restituisce la rappresentazione esadecimale.

```python
numero = 255

risultato = hex(numero)

print(risultato)
```

Output:

```text
0xff
```

Il prefisso `0x` indica una rappresentazione in base 16.

### 5.3 La funzione int()

La funzione `int()` permette di convertire una stringa numerica in un intero, specificando la base.

Esempio: conversione da binario a decimale.

```python
numero_binario = "1101"

risultato = int(numero_binario, 2)

print(risultato)
```

Output:

```text
13
```

Conversione da esadecimale a decimale:

```python
numero_hex = "FF"

risultato = int(numero_hex, 16)

print(risultato)
```

Output:

```text
255
```

Conversione da binario a esadecimale:

```python
numero_binario = "11011010"

valore_decimale = int(numero_binario, 2)

valore_hex = hex(valore_decimale)

print(valore_hex)
```

Output:

```text
0xda
```

### 5.4 Esempio completo: convertitore numerico

```python
# Richiede all'utente un numero decimale
numero = int(input("Inserisci un numero intero: "))

# Converte il numero in binario
binario = bin(numero)

# Converte il numero in esadecimale
esadecimale = hex(numero)

# Visualizza i risultati
print("Numero decimale:", numero)
print("Numero binario:", binario)
print("Numero esadecimale:", esadecimale)
```

Esempio di esecuzione:

```text
Inserisci un numero intero: 42

Numero decimale: 42
Numero binario: 0b101010
Numero esadecimale: 0x2a
```

### 5.5 Attenzione: numeri e stringhe

Una rappresentazione binaria può essere trattata come una stringa.

```python
valore = "1010"

print(type(valore))
```

Output:

```text
<class 'str'>
```

Per interpretare la stringa come numero binario occorre specificare la base:

```python
numero = int("1010", 2)

print(numero)
```

Output:

```text
10
```

Non bisogna confondere il valore numerico con la sua rappresentazione testuale.

---

## 6. Codifica delle informazioni

Un computer deve poter rappresentare non soltanto numeri, ma anche caratteri, testi, immagini e altri contenuti.

Per fare questo utilizza sistemi di codifica.

Una codifica stabilisce una corrispondenza tra un insieme di informazioni e una rappresentazione digitale.

### 6.1 Codifica del testo

Per rappresentare un carattere è necessario associargli un valore numerico.

Ad esempio, il carattere:

```text
A
```

può essere rappresentato dal valore decimale 65 secondo la codifica ASCII.

In binario:

```text
65 = 01000001
```

Il computer memorizza quindi una sequenza di bit che, interpretata secondo la codifica corretta, corrisponde al carattere `A`.

### 6.2 ASCII

ASCII (American Standard Code for Information Interchange) è uno standard storico per la rappresentazione dei caratteri.

ASCII standard utilizza 7 bit, permettendo di rappresentare:

\[
2^7 = 128
\]

caratteri.

Comprende:

- Lettere maiuscole.
- Lettere minuscole.
- Numeri.
- Segni di punteggiatura.
- Caratteri di controllo.

Esempi:

| Carattere | Decimale | Binario |
| --- | ---: | --- |
| A | 65 | 01000001 |
| B | 66 | 01000010 |
| C | 67 | 01000011 |
| a | 97 | 01100001 |
| 0 | 48 | 00110000 |

ASCII standard non comprende direttamente tutti i caratteri accentati e gli alfabeti utilizzati nel mondo.

### 6.3 Unicode

Unicode è uno standard progettato per assegnare un codice a caratteri appartenenti a numerosi sistemi di scrittura.

Comprende:

- Alfabeti occidentali.
- Caratteri accentati.
- Alfabeti greci e cirillici.
- Caratteri asiatici.
- Simboli matematici.
- Emoji.

Ogni carattere Unicode possiede un identificativo chiamato *code point*.

Esempi:

| Carattere | Code point |
| --- | --- |
| A | U+0041 |
| à | U+00E0 |
| € | U+20AC |
| 😀 | U+1F600 |

Unicode definisce i caratteri e i relativi identificativi, ma non stabilisce un'unica modalità di memorizzazione.

Per questo vengono utilizzate diverse codifiche, tra cui UTF-8 e UTF-16.

### 6.4 UTF-8

UTF-8 è una codifica Unicode a lunghezza variabile.

Utilizza da 1 a 4 byte per rappresentare un carattere.

Caratteristiche principali:

- Compatibile con ASCII per i primi 128 caratteri.
- Utilizza un numero variabile di byte.
- È ampiamente utilizzata sul Web.
- Permette di rappresentare caratteri di numerosi alfabeti.

Esempi:

| Carattere | Rappresentazione UTF-8 in esadecimale | Byte |
| --- | --- | ---: |
| A | 41 | 1 |
| B | 42 | 1 |
| à | C3 A0 | 2 |
| € | E2 82 AC | 3 |
| 😀 | F0 9F 98 80 | 4 |

### 6.5 Esempio Python: codifica e decodifica UTF-8

Python consente di convertire una stringa in una sequenza di byte utilizzando il metodo `encode()`.

```python
testo = "Ciao mondo"

# Codifica il testo in UTF-8
dati = testo.encode("utf-8")

print(dati)
print(type(dati))
```

Output:

```text
b'Ciao mondo'
<class 'bytes'>
```

Il prefisso `b` indica che il risultato è una sequenza di byte.

Per decodificare i byte e ottenere nuovamente una stringa si utilizza `decode()`.

```python
testo_originale = dati.decode("utf-8")

print(testo_originale)
```

Output:

```text
Ciao mondo
```

### 6.6 Analizzare i byte di una stringa

```python
testo = "CIAO"

dati = testo.encode("utf-8")

for byte in dati:
    print(byte, bin(byte), hex(byte))
```

Output:

```text
67 0b1000011 0x43
73 0b1001001 0x49
65 0b1000001 0x41
79 0b1001111 0x4f
```

Ogni carattere ASCII è rappresentato da un byte.

### 6.7 Perché la codifica è importante?

Una codifica errata può produrre caratteri illeggibili.

Ad esempio, se un testo codificato in UTF-8 viene interpretato con una codifica differente, possono comparire caratteri anomali.

Questo fenomeno è spesso chiamato *mojibake*.

La gestione corretta delle codifiche è importante per:

- Applicazioni Web.
- Database.
- File di testo.
- Log di sistema.
- Comunicazioni tra servizi.
- Scambio di dati attraverso API.

---

## 7. Encoding, cifratura e hashing

In cybersecurity è fondamentale distinguere tre concetti che spesso vengono confusi:

1. Encoding (codifica).
2. Cifratura (encryption).
3. Hashing.

Queste tecniche possono produrre sequenze di caratteri apparentemente simili, ma hanno obiettivi e proprietà completamente differenti.

### 7.1 Encoding: codifica

L'encoding trasforma i dati da una rappresentazione a un'altra, secondo regole definite.

Il suo obiettivo è rendere i dati compatibili con un determinato formato o sistema.

Non è una tecnica di protezione crittografica.

Esempi:

- UTF-8.
- ASCII.
- Base64.
- URL encoding.

Esempio: Base64.

```python
import base64

testo = "Cybersecurity"

# Codifica in Base64
codificato = base64.b64encode(testo.encode("utf-8"))

print(codificato)

# Decodifica
decodificato = base64.b64decode(codificato).decode("utf-8")

print(decodificato)
```

Output:

```text
b'Q3liZXJzZWN1cml0eQ=='
Cybersecurity
```

Chiunque conosca la tecnica può decodificare il contenuto senza utilizzare una chiave segreta.

**Attenzione:** Base64 non protegge le informazioni. Non deve essere utilizzato per nascondere password o dati riservati.

### 7.2 Cifratura: encryption

La cifratura trasforma un dato leggibile (*plaintext*) in un dato non direttamente comprensibile (*ciphertext*), utilizzando un algoritmo crittografico e una chiave.

Il suo obiettivo è proteggere la riservatezza delle informazioni.

Schema:

```text
             CHIAVE
                |
                v
TESTO ORIGINALE ---> CIFRATURA ---> TESTO CIFRATO
                                         |
                                         |
                                      DECIFRATURA
                                         |
                                         v
                                  TESTO ORIGINALE
```

Per recuperare il contenuto originale è necessario disporre della chiave corretta e utilizzare l'operazione di decifratura prevista dall'algoritmo.

Esistono due principali categorie:

**Cifratura simmetrica**

Utilizza la stessa chiave per cifrare e decifrare.

Esempio: AES.

```text
Chiave segreta
      |
      v
   Cifratura
      |
      v
 Dati cifrati
      |
      v
  Decifratura
      |
      v
 Dati originali
```

**Cifratura asimmetrica**

Utilizza una coppia di chiavi matematicamente correlate:

- Chiave pubblica.
- Chiave privata.

La chiave pubblica può essere distribuita, mentre quella privata deve essere mantenuta segreta.

Esempi di algoritmi e schemi crittografici: RSA ed ECC.

Applicazioni:

- HTTPS/TLS.
- Comunicazioni sicure.
- Protezione dei file.
- Cifratura dei dischi.
- Scambio sicuro di chiavi.

### 7.3 Hashing

L'hashing è una trasformazione che produce un valore di lunghezza definita a partire da un dato di dimensione arbitraria.

Il risultato è chiamato hash o digest.

Schema:

```text
TESTO ORIGINALE
       |
       v
  FUNZIONE HASH
       |
       v
  HASH / DIGEST
```

Caratteristiche:

- È una funzione unidirezionale.
- Non prevede un'operazione di decifratura.
- Lo stesso input produce lo stesso hash con lo stesso algoritmo.
- Una piccola modifica dell'input produce normalmente un digest molto differente.
- Due input differenti possono teoricamente produrre lo stesso hash: si parla di collisione.

Esempi di algoritmi:

- SHA-256.
- SHA-512.
- SHA-3.

Algoritmi come MD5 e SHA-1 sono considerati non sicuri per applicazioni che richiedono resistenza alle collisioni.

### 7.4 Esempio Python: SHA-256

Python mette a disposizione il modulo `hashlib`.

```python
import hashlib

testo = "Cybersecurity"

# Converte la stringa in byte
dati = testo.encode("utf-8")

# Calcola l'hash SHA-256
digest = hashlib.sha256(dati).hexdigest()

print(digest)
```

Il metodo `hexdigest()` restituisce il digest in formato esadecimale.

SHA-256 produce un digest di 256 bit, equivalente a 32 byte o 64 caratteri esadecimali.

### 7.5 Dimostrazione dell'effetto valanga

Una proprietà importante delle funzioni hash crittografiche è il cosiddetto *effetto valanga*.

Una piccola variazione dell'input produce un risultato molto differente.

```python
import hashlib

testi = [
    "Cybersecurity",
    "cybersecurity",
    "Cybersecurity!"
]

for testo in testi:
    digest = hashlib.sha256(testo.encode("utf-8")).hexdigest()

    print("Testo:", testo)
    print("Hash: ", digest)
    print()
```

Anche una semplice variazione tra maiuscole e minuscole produce un digest completamente differente.

### 7.6 Confronto tra encoding, cifratura e hashing

| Caratteristica | Encoding | Cifratura | Hashing |
| --- | --- | --- | --- |
| Obiettivo | Rappresentazione dei dati | Riservatezza | Integrità e verifica |
| Utilizza una chiave segreta | No | Sì, secondo lo schema crittografico | No |
| Reversibile | Sì, con decodifica | Sì, con decifratura e chiave | No, non è progettato per essere invertito |
| Recupero del dato originale | Sì | Sì, con la chiave corretta | Non direttamente |
| Esempi | Base64, UTF-8 | AES, RSA | SHA-256, SHA-3 |
| Applicazione | Trasmissione e formattazione | Protezione dei dati | Verifica e autenticazione |

### 7.7 Un caso concreto: gestione delle password

Un'applicazione Web deve gestire le password degli utenti.

Una soluzione scorretta consiste nel memorizzare le password in chiaro:

```text
utente: mario
password: Password123
```

Se il database viene compromesso, le password diventano immediatamente accessibili.

Anche utilizzare Base64 non risolve il problema:

```text
Password123
     |
     v
   Base64
     |
     v
UGFzc3dvcmQxMjM=
```

La password è semplicemente codificata e può essere recuperata facilmente.

Per la memorizzazione delle password si utilizzano algoritmi specifici di derivazione delle chiavi, progettati per essere lenti e resistenti agli attacchi di forza bruta.

Tra i principali:

- Argon2id.
- bcrypt.
- scrypt.
- PBKDF2.

Questi algoritmi utilizzano un salt casuale e parametri di costo configurabili.

Il salt è un valore casuale associato alla password prima del calcolo del risultato. Non deve essere mantenuto segreto.

Esempio concettuale:

```text
Password inserita dall'utente
             |
             v
       Aggiunta del salt
             |
             v
      Algoritmo Argon2id
             |
             v
      Hash memorizzato
             |
             v
       Database utenti
```

Durante il login:

1. L'utente inserisce la password.
2. Il sistema recupera il salt e i parametri associati.
3. Viene eseguita nuovamente la funzione di derivazione.
4. Il risultato viene confrontato con quello memorizzato.
5. L'accesso viene autorizzato se la verifica ha esito positivo.

**Nota di sicurezza:** per la gestione delle password non bisogna utilizzare SHA-256 applicato direttamente alla password. È necessario utilizzare un algoritmo specifico per password hashing, come Argon2id, bcrypt, scrypt o PBKDF2.

---

## 8. Rappresentazione di immagini, audio e altri dati

I principi di rappresentazione binaria non si applicano soltanto ai numeri e ai testi.

Anche immagini, audio e video vengono rappresentati mediante sequenze di bit.

### 8.1 Immagini digitali

Un'immagine digitale può essere rappresentata attraverso una griglia di punti chiamati pixel.

Ogni pixel contiene informazioni sul colore.

In un'immagine RGB, il colore viene rappresentato attraverso tre componenti:

- Red (rosso).
- Green (verde).
- Blue (blu).

Ogni componente può essere rappresentata da un valore compreso tra 0 e 255.

Esempi:

| Colore | R | G | B |
| --- | ---: | ---: | ---: |
| Nero | 0 | 0 | 0 |
| Bianco | 255 | 255 | 255 |
| Rosso | 255 | 0 | 0 |
| Verde | 0 | 255 | 0 |
| Blu | 0 | 0 | 255 |

Un colore RGB può quindi essere rappresentato utilizzando 24 bit:

\[
3 \times 8 = 24 \text{ bit}
\]

Esempio di colore rosso:

```text
RGB: (255, 0, 0)

Esadecimale: #FF0000
```

Il formato esadecimale viene utilizzato frequentemente nei fogli di stile CSS.

```css
body {
    background-color: #FF0000;
}
```

### 8.2 Audio digitale

Un segnale audio analogico viene trasformato in una sequenza di valori numerici attraverso un processo di campionamento e quantizzazione.

I principali parametri sono:

- Frequenza di campionamento: numero di campioni al secondo.
- Profondità in bit: numero di bit utilizzati per rappresentare ciascun campione.
- Numero di canali: mono, stereo o multicanale.

Esempio:

```text
Audio CD:
- Frequenza: 44.100 Hz
- Profondità: 16 bit
- Canali: 2
```

La rappresentazione digitale permette di memorizzare, elaborare e trasmettere segnali audio.

### 8.3 Video digitale

Un video è composto da una sequenza di immagini chiamate frame, riprodotte a una determinata frequenza.

Esempio:

```text
30 FPS = 30 fotogrammi al secondo
```

Un video digitale contiene generalmente:

- Informazioni sulle immagini.
- Informazioni audio.
- Metadati.
- Informazioni temporali.

I codec permettono di comprimere e decomprimere i dati video e audio.

---

## 9. Collegamenti con la cybersecurity

La corretta interpretazione delle informazioni è fondamentale in numerose attività di sicurezza informatica.

### 9.1 Analisi dei dati di rete

Durante l'analisi del traffico di rete, gli strumenti di packet analysis mostrano spesso i dati in formato esadecimale.

Ad esempio, Wireshark permette di osservare:

- Byte trasmessi.
- Header dei protocolli.
- Payload.
- Indirizzi e identificativi.
- Sequenze di dati.

Conoscere il sistema esadecimale consente di interpretare meglio il contenuto dei pacchetti.

### 9.2 Analisi dei file

Durante un'attività di digital forensics può essere necessario analizzare il contenuto binario di un file.

Strumenti come `xxd` e `hexdump` permettono di visualizzare i byte in formato esadecimale.

Esempio su Ubuntu:

```bash
# Crea un file di testo
echo "Cybersecurity" > esempio.txt

# Visualizza il contenuto esadecimale
xxd esempio.txt
```

Esempio di output:

```text
00000000: 4379 6265 7273 6563 7572 6974 790a  Cybersecurity.
```

Il valore `0a` finale rappresenta il carattere di nuova riga inserito da `echo`.

### 9.3 Verifica dell'integrità dei file

Un hash può essere utilizzato per verificare se un file è stato modificato.

Su Ubuntu:

```bash
sha256sum esempio.txt
```

Il comando restituisce il digest SHA-256 del file.

Se il contenuto cambia, il digest sarà differente, salvo la possibilità teorica di una collisione.

Questo meccanismo è utilizzato per:

- Verificare file scaricati.
- Controllare l'integrità di backup.
- Analizzare evidenze digitali.
- Verificare immagini di installazione.
- Confrontare copie di file.

**Attenzione:** un hash permette di verificare la corrispondenza tra contenuti, ma da solo non dimostra chi abbia creato il file o garantisce che il file provenga da una fonte affidabile. Per autenticare una distribuzione si possono utilizzare firme digitali e canali ufficiali.

### 9.4 Analisi di malware e file sospetti

L'analisi di un file sospetto può richiedere:

- Identificazione della struttura binaria.
- Analisi degli header.
- Riconoscimento di stringhe.
- Calcolo degli hash.
- Confronto con database di indicatori di compromissione.

Esempio:

```bash
# Identifica il tipo di file
file documento_sospetto

# Visualizza alcune stringhe leggibili
strings documento_sospetto

# Calcola l'hash
sha256sum documento_sospetto
```

Questi comandi permettono di raccogliere informazioni preliminari senza eseguire il file.

Le analisi devono essere svolte in un ambiente controllato e autorizzato, evitando di eseguire file potenzialmente malevoli sul sistema principale.

---

## 10. Laboratorio pratico Linux

### Obiettivo

Utilizzare i comandi Linux per osservare la rappresentazione binaria ed esadecimale dei dati.

### 10.1 Creazione di un file

```bash
echo "ITS Cybersecurity" > corso.txt
```

### 10.2 Visualizzazione del contenuto

```bash
cat corso.txt
```

### 10.3 Visualizzazione esadecimale

```bash
xxd corso.txt
```

### 10.4 Visualizzazione dei byte

```bash
od -An -t x1 corso.txt
```

Il comando mostra i byte del file in formato esadecimale.

### 10.5 Calcolo dell'hash

```bash
sha256sum corso.txt
```

### 10.6 Modifica del file e nuovo hash

```bash
echo "Nuovo contenuto" >> corso.txt

sha256sum corso.txt
```

Confrontare il risultato con quello precedente.

### 10.7 Verifica della dimensione

```bash
wc -c corso.txt
```

Il comando restituisce il numero di byte contenuti nel file.

---

## 11. Laboratorio Python: analisi e conversione dei dati

### Esercizio guidato 1 – Convertitore numerico

Realizzare un programma che:

1. Richieda un numero intero.
2. Visualizzi la rappresentazione binaria.
3. Visualizzi la rappresentazione esadecimale.
4. Verifichi che la conversione inversa restituisca il valore originale.

```python
numero = int(input("Inserisci un numero: "))

binario = bin(numero)
esadecimale = hex(numero)

print("Decimale:", numero)
print("Binario:", binario)
print("Esadecimale:", esadecimale)

# Conversione inversa
verifica_binaria = int(binario, 2)
verifica_esadecimale = int(esadecimale, 16)

print("Verifica binaria:", verifica_binaria)
print("Verifica esadecimale:", verifica_esadecimale)
```

### Esercizio guidato 2 – Analisi dei caratteri

Realizzare un programma che richieda una parola e visualizzi:

- Il carattere.
- Il valore numerico Unicode.
- Il valore binario.
- Il valore esadecimale.
- La codifica UTF-8 in byte.

```python
testo = input("Inserisci una parola: ")

for carattere in testo:

    valore = ord(carattere)

    byte_utf8 = carattere.encode("utf-8")

    print("Carattere:", carattere)
    print("Valore Unicode:", valore)
    print("Binario:", bin(valore))
    print("Esadecimale:", hex(valore))
    print("UTF-8:", byte_utf8.hex(" "))
    print("--------------------")
```

**Osservazione didattica:** `ord()` restituisce il code point Unicode del carattere, mentre `encode("utf-8")` restituisce i byte effettivamente utilizzati dalla codifica UTF-8. I due valori non devono essere confusi.

### Esercizio guidato 3 – Codifica Base64

Realizzare un programma che codifichi e decodifichi una stringa utilizzando Base64.

```python
import base64

testo = input("Inserisci un testo: ")

# Codifica in UTF-8 e successivamente in Base64
codificato = base64.b64encode(testo.encode("utf-8"))

print("Testo codificato:", codificato.decode("ascii"))

# Decodifica
decodificato = base64.b64decode(codificato).decode("utf-8")

print("Testo originale:", decodificato)
```

### Esercizio guidato 4 – Calcolo dell'hash

Realizzare un programma che calcoli l'hash SHA-256 di un testo.

```python
import hashlib

testo = input("Inserisci un testo: ")

digest = hashlib.sha256(
    testo.encode("utf-8")
).hexdigest()

print("Testo:", testo)
print("SHA-256:", digest)
print("Lunghezza:", len(digest), "caratteri")
```

### Esercizio guidato 5 – Verifica dell'integrità di un file

Realizzare un programma che calcoli l'hash SHA-256 di un file.

```python
import hashlib

percorso = input("Percorso del file: ")

sha256 = hashlib.sha256()

try:
    with open(percorso, "rb") as file:

        # Legge il file a blocchi per gestire anche file grandi
        for blocco in iter(lambda: file.read(4096), b""):
            sha256.update(blocco)

    print("SHA-256:", sha256.hexdigest())

except FileNotFoundError:
    print("File non trovato")

except OSError as errore:
    print("Errore durante la lettura:", errore)
```

Il parametro `"rb"` indica che il file viene aperto in modalità binaria.

La lettura a blocchi evita di caricare interamente in memoria file di grandi dimensioni.

---

## 12. Esercitazioni autonome

### Esercitazione 1 – Conversioni numeriche

Convertire i seguenti valori:

| Decimale | Binario | Esadecimale |
| ---: | --- | --- |
| 10 | ? | ? |
| 25 | ? | ? |
| 64 | ? | ? |
| 100 | ? | ? |
| 127 | ? | ? |
| 200 | ? | ? |
| 255 | ? | ? |

Per ogni valore:

1. Eseguire la conversione manualmente.
2. Verificare il risultato con Python.
3. Spiegare il procedimento utilizzato.

### Esercitazione 2 – Analisi di una stringa

Realizzare un programma Python che:

1. Richieda una frase.
2. Calcoli la lunghezza della stringa.
3. Calcoli la lunghezza in byte UTF-8.
4. Visualizzi i byte in formato esadecimale.
5. Visualizzi il contenuto codificato in Base64.
6. Decodifichi Base64 e verifichi che il testo sia identico all'originale.

Provare con una frase contenente caratteri accentati, ad esempio:

```text
La sicurezza è importante.
```

Osservare la differenza tra numero di caratteri e numero di byte.

### Esercitazione 3 – Encoding, cifratura e hashing

Per ciascuna delle seguenti situazioni, individuare la tecnica più appropriata e motivare la risposta:

1. Trasformare un testo in un formato compatibile con un sistema che accetta solo caratteri ASCII.
2. Proteggere un documento riservato in modo che possa essere letto soltanto da chi possiede la chiave.
3. Verificare che un file scaricato non sia stato modificato.
4. Memorizzare in modo sicuro le password degli utenti.
5. Trasmettere un dato binario all'interno di un formato testuale.

Per ogni situazione specificare se è opportuno utilizzare encoding, cifratura, hashing o un algoritmo specifico per password.

### Esercitazione 4 – Verifica integrità dei file

1. Creare un file di testo.
2. Calcolare il suo SHA-256.
3. Modificare un solo carattere.
4. Calcolare nuovamente l'hash.
5. Confrontare i due risultati.
6. Spiegare perché i digest sono differenti.

### Esercitazione 5 – Analisi esadecimale

Creare un file contenente:

```text
ABC
```

Utilizzare `xxd` per osservare la rappresentazione esadecimale.

Rispondere:

1. Qual è il valore esadecimale di `A`?
2. Qual è il valore esadecimale di `B`?
3. Qual è il valore esadecimale di `C`?
4. Quanti byte occupa il testo?
5. Qual è la rappresentazione binaria di ciascun carattere?

---

## 13. Domande di autovalutazione

1. Che cosa rappresenta un bit?
2. Quanti bit contiene un byte?
3. Quante combinazioni differenti possono essere rappresentate con 8 bit?
4. Qual è la differenza tra sistema binario e decimale?
5. Perché il sistema esadecimale è utilizzato frequentemente in informatica?
6. Qual è il significato del prefisso `0b` in Python?
7. A cosa serve la funzione `bin()`?
8. Qual è la differenza tra `ord()` ed `encode()`?
9. Che cosa rappresenta un code point Unicode?
10. Qual è la differenza tra ASCII e UTF-8?
11. Che cosa succede quando un testo viene interpretato con una codifica errata?
12. Qual è la differenza tra encoding e cifratura?
13. Perché Base64 non è una tecnica crittografica?
14. Che cosa produce una funzione hash?
15. Perché SHA-256 non è indicato da solo per memorizzare password?
16. Che cosa si intende per salt?
17. In che modo un hash può essere utilizzato per verificare l'integrità di un file?
18. Perché è importante conoscere il formato esadecimale durante un'analisi forense?

---

## 14. Riepilogo

In questa unità sono stati affrontati i principali concetti relativi alla rappresentazione delle informazioni.

| Argomento | Concetto fondamentale |
| --- | --- |
| Bit | Unità minima di informazione binaria |
| Byte | Gruppo di 8 bit |
| Sistema binario | Sistema numerico in base 2 |
| Sistema decimale | Sistema numerico in base 10 |
| Sistema esadecimale | Sistema numerico in base 16 |
| ASCII | Codifica storica dei caratteri |
| Unicode | Standard per rappresentare caratteri |
| UTF-8 | Codifica Unicode a lunghezza variabile |
| Encoding | Trasformazione di rappresentazione |
| Cifratura | Protezione della riservatezza mediante chiavi |
| Hashing | Trasformazione unidirezionale per ottenere un digest |
| SHA-256 | Funzione hash crittografica |
| Argon2id | Algoritmo per la derivazione e verifica delle password |

### Concetti da ricordare

- Tutte le informazioni digitali vengono rappresentate attraverso sequenze di bit.
- Il sistema binario costituisce la base della rappresentazione digitale.
- Il sistema esadecimale rende più leggibili le sequenze binarie.
- Le codifiche permettono di rappresentare testi e caratteri.
- UTF-8 è una codifica molto diffusa negli ambienti Web.
- Encoding, cifratura e hashing hanno finalità differenti.
- La cifratura protegge la riservatezza.
- L'hashing consente di verificare dati e contenuti.
- Le password devono essere gestite con algoritmi specifici come Argon2id o bcrypt, non con semplici codifiche o hash veloci.

---

## 15. Collegamenti ai moduli successivi

Questa unità costituisce la base per comprendere diversi argomenti successivi del percorso.

**Modulo 01 – Fondamenti di informatica**

- Hardware e rappresentazione binaria.
- Memoria e archiviazione.
- Elaborazione dei dati.

**Modulo 02 – Logica e algoritmi**

- Rappresentazione dei valori.
- Operatori logici e binari.
- Elaborazione delle informazioni attraverso algoritmi.

**Modulo 03 – Python**

- Tipi di dato.
- Conversioni.
- Stringhe e byte.
- Elaborazione di file binari.
- Librerie standard.

**Modulo 04 – Bash scripting**

- Analisi di file.
- Comandi di sistema.
- Elaborazione di output e dati.

**Modulo 05 – Database e SQL**

- Memorizzazione dei dati.
- Codifica dei caratteri.
- Integrità e protezione delle informazioni.

**Modulo 07 – Cybersecurity**

- Crittografia.
- Hashing.
- Verifica dell'integrità.
- Analisi di file e traffico di rete.
- Digital forensics.

### Risorse e documentazione

- Python – Built-in Functions: <https://docs.python.org/3/library/functions.html>
- Python – `hashlib`: <https://docs.python.org/3/library/hashlib.html>
- Python – `base64`: <https://docs.python.org/3/library/base64.html>
- Python – Unicode HOWTO: <https://docs.python.org/3/howto/unicode.html>
- Unicode Consortium: <https://www.unicode.org/>
- UTF-8 – RFC 3629: <https://www.rfc-editor.org/rfc/rfc3629>
- NIST – Cryptographic Standards and Guidelines: <https://csrc.nist.gov/projects/cryptographic-standards-and-guidelines>
- OWASP – Password Storage Cheat Sheet: <https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html>
