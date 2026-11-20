# 02. Algoritmi e Rappresentazione

La progettazione di un software richiede una fase fondamentale di astrazione in cui l'algoritmo viene ideato, formalizzato e verificato prima di essere tradotto in un linguaggio di programmazione eseguibile. Affidarsi direttamente alla scrittura di codice sorgente senza una chiara rappresentazione intermedia espone al rischio di ambiguità strutturali, errori di logica e codice ingarbugliato (*spaghetti code*).

Per descrivere gli algoritmi in modo rigoroso e indipendente dalla sintassi di uno specifico linguaggio (come Python, C o Java), l'informatica si avvale di due notazioni complementari:
* **I Diagrammi di Flusso (Flow-Chart)**: una rappresentazione grafica basata su blocchi geometrici standardizzati legati da frecce direzionali.
* **Lo Pseudocodice (Pseudolinguaggio)**: una rappresentazione testuale strutturata che impiega parole chiave e regole sintattiche rigorose ma espresse in linguaggio naturale.

---

## 1. Dalla Logica alla Rappresentazione: Il Ruolo dei Linguaggi Intermedi

Un algoritmo è definibile come una sequenza finita di istruzioni elementari, non ambigue ed eseguibili che porta alla risoluzione di un problema. Tuttavia, il linguaggio naturale umano presenta un elevato grado di ambiguità intrinseca (polisemia, contesto implicito, sintassi flessibile) che lo rende del tutto inadatto alla comunicazione diretta con un esecutore automatico.

D'altra parte, i linguaggi di programmazione ad alto livello impongono vincoli sintattici e dettagli di memoria legati allo specifico ecosistema di sviluppo. L'adozione di un **linguaggio intermedio di rappresentazione** risponde a tre esigenze fondamentali:

1. **Univocità e Non Ambiguità**: ogni blocco grafico o parola chiave possiede un unico significato semantico formale, interpretabile allo stesso modo da qualsiasi analista o sviluppatore.
2. **Indipendenza dalla Piattaforma**: la logica risolutiva espressa in un flow-chart o in uno pseudocodice rimane valida a prescindere dall'architettura hardware e dal linguaggio di codifica finale.
3. **Facilità di Debugging Logico**: permette di verificare la correttezza formale dell'algoritmo (mediante simulazione manuale) prima di investire risorse nella fase di sviluppo software.

---

## 2. I Diagrammi di Flusso (Flow-Chart): Sintassi e Simbologia Standard

I diagrammi di flusso rappresentano lo sviluppo logico dell'algoritmo attraverso un grafo orientato i cui nodi sono costituiti da forme geometriche convenzionali, ciascuna delle quali identifica una specifica tipologia di azione.

### 2.1 La Simbologia Grafica Standardizzata

I simboli grafici utilizzati nella stesura dei flow-chart sono regolamentati a livello internazionale (ISO/IEC) e si articolano nei seguenti oggetti fondamentali:

| Oggetto Grafico | Denominazione | Significato e Funzione |
| :--- | :--- | :--- |
| **Ovale / Ellisse** | **Inizio / Fine** | Rappresenta il punto di partenza univoco (`INIZIO`) o il punto di arresto dell'esecuzione (`FINE`). |
| **Parallelogramma** | **Ingresso / Uscita (I/O)** | Rappresenta l'acquisizione di dati dall'esterno (`Leggi`) o l'emissione dei risultati prodotti (`Scrivi`). |
| **Rettangolo** | **Elaborazione** | Contiene una o più operazioni aritmetico-logiche, comandi o assegnazioni di valori a variabili (es. $S = b \cdot h$). |
| **Rombo** | **Test / Decisione** | Rappresenta il controllo del grado di verità di una condizione booleana. Presenta un connettore d'ingresso e due uscite (`Vero` / `Falso`). |
| **Freccia Direzionale** | **Linea di Flusso** | Unisce i blocchi indicando l'esatta sequenza temporale di esecuzione delle istruzioni. |
| **Cerchio piccolo** | **Connessione** | Rappresenta un punto di giunzione o di rinvio del flusso graficamente distante (contiene una lettera o un numero). |

### 2.2 Regole di Buona Formazione dei Flow-Chart

Affinché un diagramma di flusso sia sintatticamente e logicamente corretto, deve rispettare le seguenti regole strutturali:
* **Unicità di Inizio e Fine**: deve esistere un solo blocco `INIZIO` e un solo blocco `FINE` (o convergente verso di esso).
* **Flusso Orientato Monodirezionale**: ogni blocco di elaborazione o di I/O deve avere una sola linea d'ingresso e una sola linea d'uscita.
* **Biforcazione Esclusiva del Test**: il blocco di decisione (rombo) deve avere una sola linea d'ingresso e esattamente due linee d'uscita etichettate esplicitamente come `Vero` (o `Sì`) e `Falso` (o `No`).
* **Assenza di Percorsi Ciechi**: ogni blocco inserito nel diagramma deve essere raggiungibile a partire dal blocco `INIZIO` e deve condurre al blocco `FINE`.

---

## 3. Lo Pseudocodice: La Strutturazione Testuale Rigorosa

Lo pseudocodice (o pseudolinguaggio) è una forma di descrizione degli algoritmi che sostituisce i simboli grafici del flow-chart con un insieme di parole chiave e costrutti testuali rigorosi.

### 3.1 Caratteristiche dello Pseudolinguaggio

Non esiste uno pseudolinguaggio unico o universalmente standardizzato; team aziendali o contesti accademici adottano differenti convenzioni. Tuttavia, tutti i formati condivisi presentano caratteristiche comuni:
* **Uso di Parole Chiave Formali**: verbi e termini riservati scritti in maiuscolo (es. `INIZIO`, `FINE`, `LEGGI`, `SCRIVI`, `SE`, `ALLORA`, `ALTRIMENTI`, `MENTRE`, `DO`, `RIPETI`, `FINCHÈ`).
* **Indentazione Strutturale**: il codice viene indentato verso destra per evidenziare visivamente l'annidamento dei blocchi logici (corpi dei cicli o rami condizionali).
* **Dichiarazione delle Variabili**: identificazione dei nomi delle celle di memoria destinate a contenere i dati in ingresso, intermedi ed in uscita.

### 3.2 L'Operazione di Assegnazione

L'assegnazione è l'istruzione fondamentale con cui si attribuisce il valore di un'espressione a una variabile di memoria. Nello pseudocodice viene espressa formalmente con la notazione:

$$\text{Variabile} \leftarrow \text{Espressione}$$

o mediante la dicitura esplicita:

$$\text{Assegna a } S \text{ il valore } b \cdot h$$

L'operatore di assegnazione deve essere nettamente distinto dal confronto di uguaglianza aritmetica: l'espressione alla destra viene valutata per prima, ed il valore calcolato viene memorizzato nella variabile indicata alla sinistra.

---

## 4. Analisi Comparativa e Casi di Studio Risolti

Di seguito vengono analizzati tre problemi classici, mettendo a confronto diretto la rappresentazione tramite **Diagramma di Flusso** e **Pseudocodice**.

### Caso di Studio 1: Calcolo dell'Area del Rettangolo (Struttura di Sequenza)

**Traccia del Problema**: Dati in input la misura della base $b$ e dell'altezza $h$ di un rettangolo, calcolare e mostrare in output l'area $S$.

#### Pseudocodice
```text
PROGRAMMA AreaRettangolo
INIZIO
    LEGGI b
    LEGGI h
    S <- b * h
    SCRIVI S
FINE
```

#### Struttura del Flow-Chart Corrispondente
1. Blocco Ovale: `INIZIO`
2. Parallelogramma: `Leggi b`
3. Parallelogramma: `Leggi h`
4. Rettangolo di Elaborazione: `S = b * h`
5. Parallelogramma: `Scrivi S`
6. Blocco Ovale: `FINE`

---

### Caso di Studio 2: Determinazione del Massimo tra Due Numeri (Struttura di Selezione)

**Traccia del Problema**: Dati due numeri $a$ e $b$, determinare e mostrare in output il valore maggiore.

#### Pseudocodice
```text
PROGRAMMA MassimoTraDueNumeri
INIZIO
    LEGGI a
    LEGGI b
    SE a > b ALLORA
        SCRIVI a
    ALTRIMENTI
        SCRIVI b
    FINE_SE
FINE
```

#### Struttura del Flow-Chart Corrispondente
1. Blocco Ovale: `INIZIO`
2. Parallelogrammi consequenziali: `Leggi a`, `Leggi b`
3. Rombo di Test: `a > b ?`
   * Ramo `Vero`: Parallelogramma `Scrivi a`
   * Ramo `Falso`: Parallelogramma `Scrivi b`
4. I due rami confluiscono in un punto di giunzione prima del blocco Ovale `FINE`.

---

### Caso di Studio 3: Somma dei Primi N Numeri Naturali (Struttura Iterativa Precondizionale)

**Traccia del Problema**: Dato un numero intero positivo $N$, calcolare la somma di tutti i numeri interi compresi tra $1$ ed $N$ senza utilizzare la formula diretta di Gauss.

#### Pseudocodice
```text
PROGRAMMA SommaPrimiNNumeri
INIZIO
    LEGGI N
    Contatore <- 0
    Somma <- 0
    MENTRE Contatore < N FAI
        Contatore <- Contatore + 1
        Somma <- Somma + Contatore
    FINE_MENTRE
    SCRIVI Somma
FINE
```

---

## 5. Verifica Formale: La Trace Table (Tabella di Traccia)

La **Trace Table** (o Tabella di Traccia / Prova a Secco) è uno strumento fondamentale di verifica manuale. Permette di simulare l'esecuzione passo-passo dell'algoritmo compilando una griglia in cui:
* Le **colonne** rappresentano il numero di riga dell'istruzione, le condizioni booleane analizzate e lo stato istantaneo delle variabili in memoria.
* Le **righe** rappresentano la sequenza cronologica di esecuzione delle istruzioni.

### Tracciamento Passo-Passo (Trace Table per $N = 5$)

Eseguiamo la traccia dell'algoritmo del **Caso di Studio 3** ipotizzando un dato di ingresso $N = 5$:

| Istruzione N° | Istruzione Eseguita | Condizione (`Contatore < N`) | Stato `Contatore` | Stato `Somma` | Output Prodotto |
| :---: | :--- | :---: | :---: | :---: | :---: |
| **1** | `INIZIO` | - | *non definito* | *non definito* | - |
| **2** | `LEGGI N` | - | - | - | Input $N = 5$ |
| **3** | `Contatore <- 0` | - | **0** | - | - |
| **4** | `Somma <- 0` | - | 0 | **0** | - |
| **5** | Test `Contatore < 5` (0 < 5) | **Vero** | 0 | 0 | - |
| **6** | `Contatore <- 0 + 1` | - | **1** | 0 | - |
| **7** | `Somma <- 0 + 1` | - | 1 | **1** | - |
| **5** | Test `Contatore < 5` (1 < 5) | **Vero** | 1 | 1 | - |
| **6** | `Contatore <- 1 + 1` | - | **2** | 1 | - |
| **7** | `Somma <- 1 + 2` | - | 2 | **3** | - |
| **5** | Test `Contatore < 5` (2 < 5) | **Vero** | 2 | 3 | - |
| **6** | `Contatore <- 2 + 1` | - | **3** | 3 | - |
| **7** | `Somma <- 3 + 3` | - | 3 | **6** | - |
| **5** | Test `Contatore < 5` (3 < 5) | **Vero** | 3 | 6 | - |
| **6** | `Contatore <- 3 + 1` | - | **4** | 6 | - |
| **7** | `Somma <- 6 + 4` | - | 4 | **10** | - |
| **5** | Test `Contatore < 5` (4 < 5) | **Vero** | 4 | 10 | - |
| **6** | `Contatore <- 4 + 1` | - | **5** | 10 | - |
| **7** | `Somma <- 10 + 5` | - | 5 | **15** | - |
| **5** | Test `Contatore < 5` (5 < 5) | **Falso** | 5 | 15 | *Esci dal ciclo* |
| **8** | `SCRIVI Somma` | - | 5 | 15 | **Stampa: 15** |
| **9** | `FINE` | - | 5 | 15 | - |

L'analisi della tabella di traccia dimostra la correttezza formale dell'algoritmo: l'uscita dal ciclo avviene esattamente quando `Contatore` raggiunge $N$ ($5$), producendo il risultato $15$ ($1+2+3+4+5$).
