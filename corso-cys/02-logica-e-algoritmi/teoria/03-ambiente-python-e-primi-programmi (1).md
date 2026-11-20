# 03 - Ambiente Python e Primi Programmi

L'informatica teorica trova la sua concretizzazione nel momento in cui un algoritmo, espresso in forma astratta tramite diagrammi di flusso o pseudocodice, viene tradotto in un linguaggio di programmazione eseguibile da una macchina. In questo capitolo viene esplorato il passaggio dalla notazione algoritmica alla scrittura di programmi reali, analizzando il modello esecutivo del calcolatore, la natura dell'interprete Python e la struttura fondamentale dei programmi basati sul paradigma Input-Elaborazione-Output (I-P-O).

---

## 1. Il Modello Esecutivo del Calcolatore e l'Interprete Python

Un calcolatore elettronico è un esecutore rigido, deterministico e del tutto privo di intuito o "senso comune". Quando un essere umano riceve un'istruzione sintetica come *"passa attraverso quella porta"*, utilizza la propria esperienza per dedurre che, se la porta è chiusa, occorre prima ruotare la maniglia ed aprirla. Un esecutore automatico, al contrario, interpreta gli ordini in modo strettamente letterale: se gli viene comandato di avanzare verso una porta chiusa senza indicare l'azione di apertura, la macchina tenterà di attraversare l'ostacolo fisico, provocando un errore o un blocco.

Per guidare un esecutore privo di discrezionalità è necessario utilizzare un **linguaggio di programmazione**, ovvero un linguaggio formale dotato di una sintassi rigorosa e non ambigua.

```
+------------------------------------+
|  Codice Sorgente Python (.py)      |
|  (Linguaggio ad alto livello)      |
+------------------------------------+
                 |
                 v
+------------------------------------+
|  Interprete Python (python3)       |
|  - Analisi sintattica              |
|  - Traduzione riga per riga        |
|  - Esecuzione immediata            |
+------------------------------------+
                 |
                 v
+------------------------------------+
|  Istruzioni Macchina / CPU         |
|  (Esecuzione dei comandi)          |
+------------------------------------+
```

### Linguaggi ad Alto Livello vs Linguaggi Macchina

Il processore (CPU) comprende ed esegue esclusivamente istruzioni in **linguaggio macchina**, formate da sequenze binarie di bit (zeri e uno). Scrivere programmi direttamente in codice binario è un'operazione complessa, lenta e soggetta a fallimenti. Per questo motivo sono stati sviluppati i **linguaggi ad alto livello** come Python, C o Pascal, che impiegano parole chiave di facile lettura per l'essere umano (come `print`, `if`, `while`, `input`).

### Il Ruolo dell'Interprete

Per colmare il divario tra il codice ad alto livello e il linguaggio macchina, si utilizzano strumenti di traduzione software. Python adotta un **modello di esecuzione interpretato**:

1. **Lettura sequenziale**: L'interprete legge il file sorgente (`.py`) riga per riga, dall'alto verso il basso.
2. **Analisi sintattica**: Ogni riga viene verificata per accertare che rispetti rigorosamente le regole grammaticali del linguaggio.
3. **Traduzione ed esecuzione immediata**: L'istruzione validata viene tradotta in comandi macchina ed eseguita immediatamente prima di passare alla riga successiva.

A differenza dei linguaggi **compilati** (come C o Fortran), che traducono l'intero programma in un file eseguibile binario separato prima dell'esecuzione, l'interprete Python esegue il codice in tempo reale. Ciò rende lo sviluppo fluido e rapido, consentendo di testare immediatamente singoli blocchi di codice.

---

## 2. Architettura Fondamentale di un Programma: Input, Elaborazione, Output (I-P-O)

Ogni algoritmo di elaborazione dati strutturato si fonda sul ciclo **Input-Elaborazione-Output (I-P-O)**. Questo paradigma descrive il percorso dell'informazione dall'ambiente esterno verso la memoria del calcolatore e viceversa.

| Fase | Descrizione | Funzione Python | Notazione Pseudocodice | Notazione Flow-Chart |
| :--- | :--- | :--- | :--- | :--- |
| **Input** | Acquisizione di dati forniti dall'utente o da dispositivi esterni | `input()` | `LEGGI` | Parallelogramma (Ingresso) |
| **Elaborazione** | Trasformazione dei dati tramite operazioni aritmetiche o logiche | Operatori (`+`, `-`, `*`, `/`) | `ASSEGNA` / `CALCOLA` | Rettangolo (Elaborazione) |
| **Output** | Comunicazione dei risultati verso lo schermo o dispositivi di uscita | `print()` | `SCRIVI` / `MOSTRA` | Parallelogramma (Uscita) |

### Acquisizione dell'Input con `input()`

In Python, la funzione integrata `input()` sospende l'esecuzione del programma e attende che l'utente digiti una sequenza di caratteri dalla tastiera, confermando con il tasto Invio. Il valore restituito da `input()` viene sempre trattato come una **stringa di testo** (`str`).

```python
# Acquisizione di un dato testuale dall'utente
nome_utente = input("Inserisci il tuo nome: ")
```

Se il dato richiesto deve essere elaborato matematicamente, è necessario convertirlo esplicitamente in un tipo numerico (come `int` per i numeri interi o `float` per i numeri decimali):

```python
# Acquisizione e conversione immediata in numero intero
eta = int(input("Inserisci la tua età: "))
```

### Emissione dell'Output con `print()`

La funzione `print()` stampa sullo schermo i valori passati come argomenti, separandoli con uno spazio predefinito e aggiungendo un carattere di nuova riga finale.

```python
# Stampa di testo statico e variabili
print("Benvenuto nel corso di informatica!")
print("Utente collegato:", nome_utente)
```

---

## 3. Scrittura ed Esecuzione del Primo Script Python

Un programma Python è contenuto all'interno di un file di testo semplice con estensione `.py`. La sua esecuzione avviene indicando all'interprete il percorso del file sorgente tramite riga di comando o all'interno di un ambiente di sviluppo (IDE).

### Analisi della Struttura di uno Script

Consideriamo un programma lineare che calcola il prezzo totale di un acquisto applicando una tassa fissa:

```python
# =========================================================
# Programma: Calcolo Totale Acquisto
# Descrizione: Acquisizione prezzo e calcolo totale con tassa
# =========================================================

# 1. Fase di Input
prezzo_base = float(input("Inserisci il prezzo base dell'articolo (€): "))
tassa = float(input("Inserisci l'importo della tassa (€): "))

# 2. Fase di Elaborazione
prezzo_totale = prezzo_base + tassa

# 3. Fase di Output
print("--- RIEPILOGO ACQUISTO ---")
print("Prezzo Base:", prezzo_base, "€")
print("Tassa:", tassa, "€")
print("Prezzo Totale da Pagare:", prezzo_totale, "€")
```

### Regole di Scrittura e Convenzioni

1. **Commenti**: Le righe che iniziano con il simbolo cancelletto `#` sono ignorate dall'interprete. Servono per documentare il codice a beneficio del programmatore.
2. **Sensibilità al maiuscolo/minuscolo (Case Sensitivity)**: Python distingue rigorosamente tra lettere maiuscole e minuscole. La funzione `print()` non equivale a `Print()` o `PRINT()`; queste ultime genereranno un errore.
3. **Sequenzialità rigorosa**: L'interprete esegue le istruzioni esattamente nell'ordine in cui sono scritte. Non è possibile utilizzare una variabile prima che essa sia stata definita e valorizzata.

---

## 4. Gestione degli Errori: Bug, SyntaxError e Debugging

Nella scrittura dei programmi è inevitabile riscontrare malfunzionamenti o anomalie. La storia dell'informatica attribuisce il termine **bug** (scarafaggio) a un episodio del settembre 1947, quando la scienziata e pioniera dell'informatica Grace Hopper e il suo team trovarono una falena incastrata tra i contatti di un relè elettromeccanico del calcolatore *Mark II* all'Università di Harvard. L'insetto causava un malfunzionamento hardware; rimosso l'insetto, il calcolatore riprese a funzionare regolarmente. Da allora, l'identificazione e la correzione degli errori nei programmi prende il nome di **debugging**.

```
+-----------------------------------------------------------------+
|                       TIPOLOGIE DI ERRORI                       |
+-----------------------------------------------------------------+
|                                                                 |
|  1. ERRORI DI SINTASSI (SyntaxError)                            |
|     - Violazione delle regole grammaticali del linguaggio.       |
|     - Rilevati dall'interprete PRIMA dell'esecuzione.           |
|     - Esempio: print("Ciao) -> Mancanza della virgoletta.       |
|                                                                 |
|  2. ERRORI DI RUNTIME (RuntimeError / TypeError / ValueError)  |
|     - Si verificano DURANTE l'esecuzione del programma.         |
|     - Esempio: int("abc") -> Impossibile convertire testo.      |
|                                                                 |
|  3. ERRORI LOGICI (LogicError)                                  |
|     - Il programma viene eseguito senza crash, ma calcola     |
|       risultati errati a causa di una logica sbagliata.         |
|     - Esempio: media = a + b / 2 -> Mancanza di parentesi.      |
|                                                                 |
+-----------------------------------------------------------------+
```

### Classificazione degli Errori

1. **Errori di Sintassi (`SyntaxError`)**: Si verificano quando il codice viola le regole grammaticali di Python (es. parentesi non chiuse, virgolette mancanti, parole chiave scritte in modo errato). L'interprete blocca immediatamente l'esecuzione ed evidenzia la riga contestata.
2. **Errori di Runtime (in fase di esecuzione)**: Si verificano quando un'istruzione sintatticamente corretta tenta un'operazione impossibile durante l'esecuzione (es. divisione per zero `10 / 0`, oppure conversione di un testo non numerico con `int("python")`).
3. **Errori Logici**: Il programma viene eseguito fino al termine senza mostrare messaggi di errore, ma produce risultati sbagliati. Ad esempio, se per calcolare la media tra due valori $a$ e $b$ si scrive `a + b / 2` invece di `(a + b) / 2`, la priorità dell'operatore di divisione altererà il risultato finale.

---

## 5. Esercizi Guidati e Verifiche di Apprendimento

### Esercizio Guidato 1: Generatore di Scheda Utente

**Obiettivo**: Scrivere un programma che acquisisca nome, cognome e anno di nascita dell'utente, calcoli l'età stimata ed emetta un riepilogo formattato.

```python
# 1. Acquisizione input
nome = input("Inserisci il nome: ")
cognome = input("Inserisci il cognome: ")
anno_nascita = int(input("Inserisci l'anno di nascita (YYYY): "))

# 2. Elaborazione (ipotesi anno corrente: 2026)
anno_corrente = 2026
eta_stimata = anno_corrente - anno_nascita

# 3. Output
print("\n=== SCHEDA UTENTE ===")
print("Nome completo:", nome, cognome)
print("Età calcolata:", eta_stimata, "anni")
```

### Esercizio Guidato 2: Calcolatore di Area e Perimetro del Rettangolo

**Obiettivo**: Ricevere in input la misura della base e dell'altezza di un rettangolo, calcolare perimetro e area, e mostrare i risultati.

```python
# Acquisizione delle dimensioni
base = float(input("Inserisci la misura della base (cm): "))
altezza = float(input("Inserisci la misura dell'altezza (cm): "))

# Calcolo di perimetro e area
perimetro = 2 * (base + altezza)
area = base * altezza

# Stampa dei risultati
print("\n=== RISULTATI GEOMETRICI ===")
print("Perimetro del rettangolo:", perimetro, "cm")
print("Area del rettangolo:", area, "cm²")
```

---

## 6. Q&A e Verifiche di Concetto

### Domanda 1
**Perché la funzione `input()` restituisce sempre un tipo stringa anche se l'utente digita un numero come `25`?**
> **Risposta**: La tastiera invia al calcolatore sequenze di caratteri del codice standard (come ASCII o Unicode). La funzione `input()` acquisisce questa sequenza di tasti digitati senza interpretarne il significato matematico. Pertanto, il testo `"25"` è rappresentato in memoria come sequenza di caratteri testuali e deve essere convertito esplicitamente tramite `int("25")` o `float("25")` per poter effettuare operazioni aritmetiche.

### Domanda 2
**Qual è la differenza fondamentale tra un errore di sintassi e un errore logico?**
> **Risposta**: Un errore di sintassi (`SyntaxError`) rappresenta una violazione delle regole grammaticali del linguaggio di programmazione e viene intercettato dall'interprete prima o durante la traduzione, bloccando l'esecuzione. Un errore logico, invece, non viola alcuna regola sintattica: il programma viene eseguito regolarmente, ma produce risultati errati a causa di un difetto nella progettazione dell'algoritmo (es. formulazione errata di un'equazione o scambio involontario di variabili).

### Domanda 3
**Cosa accade se in un programma si tenta di utilizzare una variabile prima di averle assegnato un valore?**
> **Risposta**: L'interprete Python interrompe immediatamente l'esecuzione del programma sollevando un errore di runtime di tipo `NameError`. In Python le variabili vengono create nel momento stesso in cui viene eseguita un'istruzione di assegnazione; accedere ad una variabile inesistente viola il principio di determinismo ed eseguibilità.
