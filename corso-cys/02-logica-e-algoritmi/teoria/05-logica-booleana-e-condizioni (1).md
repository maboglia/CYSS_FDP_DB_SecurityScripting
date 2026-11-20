# Capitolo 05: Logica Booleana e Strutture di Condizione

## 1. Introduzione alla Logica Booleana e alla Valutazione di Verità

La **Logica Booleana**, fondata sui lavori del matematico George Boole, rappresenta il pilastro teorico su cui poggia l'intera architettura dei calcolatori e l'analisi algoritmica. Nell'elaborazione automatica delle informazioni, ogni decisione logica si riduce alla valutazione di proposizioni che possono assumere esclusivamente uno tra due valori distinti e mutuamente esclusivi: **Vero** (*True*) oppure **Falso** (*False*).

Dal punto di vista dell'architettura dell'informazione (come evidenziato nelle attività *Computer Science Unplugged*), questa natura binaria corrisponde alla presenza o assenza di carica elettrica nei condensatori della memoria, alla commutazione *ON/OFF* dei transistor o alla rappresentazione tramite bit $1$ (Vero) e $0$ (Falso). Un'espressione booleana è quindi una combinazione di variabili, costanti e operatori il cui risultato finale si valuta univocamente nel dominio booleano $\mathbb{B} = \{0, 1\}$.

Nell'ingegnerizzazione degli algoritmi, le espressioni booleane costituiscono le **condizioni di controllo**: clausole logiche che l'esecutore analizza al fine di determinare il flusso esecutivo da intraprendere tra percorsi alternativi.

---

## 2. Operatori Relazionali e Condizioni Semplici

Una **condizione semplice** è una proposizione formulata mediante l'uso di **operatori relazionali** (o di confronto), i quali mettono in relazione due espressioni algebriche o alfanumeriche per produrre un risultato booleano.

| Operatore Relazionale | Significato | Esempio | Risultato con $A = 5, B = 8$ |
| :--- | :--- | :--- | :--- |
| `=` / `==` | Uguale a | $A = B$ | **Falso** ($0$) |
| `!=` / `<>` | Diverso da | $A \neq B$ | **Vero** ($1$) |
| `<` | Minore di | $A < B$ | **Vero** ($1$) |
| `>` | Maggiore di | $A > B$ | **Falso** ($0$) |
| `<=` | Minore o uguale a | $A \le B$ | **Vero** ($1$) |
| `>=` | Maggiore o uguale a | $A \ge B$ | **Falso** ($0$) |

### Natura e Precedenza dei Confronti
Quando l'esecutore valuta una condizione semplice come $X > Y$, esegue prima il calcolo dei valori contenuti nei due operandi e successivamente applica il confronto relazionale. Il valore restituito non è un numero, ma uno stato booleano puro. 

Nel tracciamento formale tramite *Trace Table*, le colonne dedicate ai test condizionali non memorizzano valori numerici, ma registrano lo stato esplicito `Vero` o `Falso` nell'istante temporale della valutazione.

---

## 3. Operatori Logici e Tabelle di Verità

Le **condizioni composte** (o complesse) si ottengono combinando due o più condizioni semplici attraverso gli **operatori logici fondamentali**: `NOT` (negazione), `AND` (congiunzione) e `OR` (disgiunzione).

### 1. Operatore Unario `NOT` (Negazione)
L'operatore `NOT` inverte il valore di verità dell'espressione a cui è applicato. Se l'espressione $P$ è Vera, $\text{NOT}(P)$ risulta Falsa, e viceversa.

$$\text{NOT}(1) = 0 \quad \text{e} \quad \text{NOT}(0) = 1$$

### 2. Operatore Binario `AND` (Congiunzione Logica)
L'operatore `AND` restituisce il valore **Vero** se e solo se **entrambe** le proposizioni componenti sono Vere. Se anche una sola proposizione è Falsa, l'intera condizione risulta Falsa.

### 3. Operatore Binario `OR` (Disgiunzione Logica)
L'operatore `OR` restituisce il valore **Vero** se **almeno una** delle proposizioni componenti è Vera. Risulta Falso esclusivamente quando entrambe le proposizioni sono False.

### Tabelle di Verità Integrate

| Proposizione $P$ | Proposizione $Q$ | $\text{NOT } P$ | $P \text{ AND } Q$ | $P \text{ OR } Q$ |
| :---: | :---: | :---: | :---: | :---: |
| Falso ($0$) | Falso ($0$) | Vero ($1$) | Falso ($0$) | Falso ($0$) |
| Falso ($0$) | Vero ($1$) | Vero ($1$) | Falso ($0$) | Vero ($1$) |
| Vero ($1$) | Falso ($0$) | Falso ($0$) | Falso ($0$) | Vero ($1$) |
| Vero ($1$) | Vero ($1$) | Falso ($0$) | Vero ($1$) | Vero ($1$) |

### Valutazione a Cortocircuito (Short-Circuit Evaluation)
Negli esecutori moderni e nei linguaggi ad alto livello, la valutazione delle condizioni composte segue la logica del **cortocircuito**:
* In una catena $P \text{ AND } Q$, se $P$ viene valutato **Falso**, l'esecutore interrompe immediatamente l'analisi senza valutare $Q$, poiché l'intera espressione non potrà mai risultare Vera.
* In una catena $P \text{ OR } Q$, se $P$ viene valutato **Vero**, l'esecutore interrompe la valutazione di $Q$, poiché l'espressione è già garantita essere Vera.

Questa proprietà è cruciale per prevenire errori a tempo di esecuzione, come ad esempio la verifica di validità di un divisore prima di eseguire la divisione:
$$\text{SE } (B \neq 0) \text{ AND } (A / B > 2) \text{ ALLORA ...}$$

---

## 4. La Struttura di Selezione nell'Algoritmica

In accordo con il **Teorema di Böhm-Jacopini (1966)**, la **selezione** (o struttura alternativa) è uno dei tre costrutti fondamentali necessari e sufficienti per esprimere qualsiasi algoritmo. Essa consente di deviare il percorso esecutivo lineare sulla base della verifica di una condizione booleana.

Si distinguono tre forme principali di selezione:

### 1. Selezione ad una via (Selezione Semplice)
Viene eseguito un blocco di istruzioni solo se la condizione è Vera; se la condizione è Falsa, il blocco viene ignorato e l'esecuzione prosegue con l'istruzione successiva.

```text
SE Condizione ALLORA
    Istruzione A
FINE SE
```

### 2. Selezione a due vie (Selezione Alternativa Completa)
L'esecutore seleziona obbligatoriamente uno tra due rami distinti: esegue l'*Istruzione A* se la condizione è Vera, oppure l'*Istruzione B* se la condizione risulta Falsa.

```text
SE Condizione ALLORA
    Istruzione A (Ramo Vero)
ALTRIMENTI
    Istruzione B (Ramo Falso)
FINE SE
```

### 3. Selezione Annidata e a Più Vie
Quando occorre discriminare tra più di due scenari mutuamente esclusivi, le strutture di selezione vengono nidificate inserendo un nuovo test all'interno del ramo `ALTRIMENTI`.

```text
SE Condizione_1 ALLORA
    Istruzione A
ALTRIMENTI
    SE Condizione_2 ALLORA
        Istruzione B
    ALTRIMENTI
        Istruzione C
    FINE SE
FINE SE
```

---

## 5. Rappresentazione Formale: Flow-chart e Pseudocodice

Nei **diagrammi di flusso** (flow-chart), la struttura di selezione è rappresentata graficamente da un blocco a forma di **rombo** (*Test*), che ammette una singola linea di flusso in ingresso e possiede esattamente due linee di flusso in uscita, chiaramente etichettate con **Vero** (o *Sì*) e **Falso** (o *No*).

```text
          [ Ingresso ]
               |
               v
        /--------------\
       /   Condizione   \
       \    (Test)      /
        \--------------/
          /          \
  Falso  /            \  Vero
        v              v
  [Istruzione B]  [Istruzione A]
        \              /
         \            /
          v          v
         ( Ricongiungimento )
               |
               v
```

### Casi di Studio Algoritmici

#### Caso 1: Verifica della Validità per il Calcolo della Radice Quadrata
Prima di calcolare la radice quadrata di un numero $N$, l'algoritmo deve verificare la reale eseguibilità dell'operazione nel dominio dei numeri reali ($N \ge 0$).

*Pseudocodice*:
```text
INIZIO
    LEGGI N
    SE N < 0 ALLORA
        SCRIVI "Attenzione: impossibile calcolare la radice di un numero negativo!"
    ALTRIMENTI
        R <- RADICE(N)
        SCRIVI "La radice quadrata è: ", R
    FINE SE
FINE
```

#### Caso 2: Selezione del Massimo tra Due Numeri $A$ e $B$
Date due variabili $A$ e $B$, determinare ed emettere in output il valore maggiore.

*Pseudocodice*:
```text
INIZIO
    LEGGI A
    LEGGI B
    SE A > B ALLORA
        MAX <- A
    ALTRIMENTI
        MAX <- B
    FINE SE
    SCRIVI "Il valore massimo è: ", MAX
FINE
```

*Trace Table per $A = 3, B = 5$*:

| Passo | Istruzione | $A$ | $B$ | $A > B$ (Test) | $MAX$ | Output |
| :---: | :--- | :---: | :---: | :---: | :---: | :---: |
| 1 | INIZIO | - | - | - | - | - |
| 2 | LEGGI A | $3$ | - | - | - | - |
| 3 | LEGGI B | $3$ | $5$ | - | - | - |
| 4 | SE $A > B$ | $3$ | $5$ | **Falso** | - | - |
| 5 | Branch `ALTRIMENTI`: $MAX \leftarrow B$ | $3$ | $5$ | Falso | $5$ | - |
| 6 | SCRIVI $MAX$ | $3$ | $5$ | Falso | $5$ | **5** |
| 7 | FINE | $3$ | $5$ | Falso | $5$ | 5 |

#### Caso 3: Controllo della Parità di un Numero
Verifica se un numero intero $X$ è pari o dispari sfruttando l'operatore resto (modulo).

*Pseudocodice*:
```text
INIZIO
    LEGGI X
    RESTO <- X MOD 2
    SE RESTO = 0 ALLORA
        SCRIVI "Il numero è PARI"
    ALTRIMENTI
        SCRIVI "Il numero è DISPARI"
    FINE SE
FINE
```

---

## 6. Alberi di Decisione e Complessità delle Scelte

Quando un problema logico richiede di identificare un singolo stato all'interno di un insieme di $N$ alternative distinte, l'algoritmo costruisce strutturalmente un **albero di decisione binario**.

Come analizzato nei modelli della Teoria dell'Informazione (Claude Shannon), ogni test condizionale con esito binario (Vero/Falso, Sì/No) equivale esattamente a **$1$ bit di informazione**, dimezzando lo spazio delle alternative rimanenti.

$$\text{Numero di decisioni necessarie } k = \lceil \log_2(N) \rceil$$

Se un albero di decisione possiede altezza $k$, il numero massimo di stati distinti discriminabili tramite $k$ valutazioni condizionali nidificate è pari a $2^k$.

```text
                    [ Condizione 1? ]
                     /            \
              Sì    /              \   No
                   v                v
         [ Condizione 2A? ]   [ Condizione 2B? ]
          /            \       /            \
        Sì/            No\   Sì/            No\
         v               v    v               v
      Stato 1         Stato 2 Stato 3       Stato 4
```

---

## 7. Esercizi di Verifica e Tracciamento Logico

### Quesito 1: Valutazione di Condizioni Composte
Date le variabili $A = 10, B = 20, C = 5$, determinare il valore booleano espresso da ciascuna delle seguenti clausole:
1. $(A < B) \text{ AND } (C > A)$
2. $(A + C = 15) \text{ OR } (B < C)$
3. $\text{NOT}(B \ge A)$

*Soluzioni analitiche*:
1. $(10 < 20) \rightarrow \text{Vero}$; $(5 > 10) \rightarrow \text{Falso}$; $\text{Vero AND Falso} \rightarrow \mathbf{Falso}$.
2. $(10 + 5 = 15) \rightarrow \text{Vero}$; $(20 < 5) \rightarrow \text{Falso}$; $\text{Vero OR Falso} \rightarrow \mathbf{Vero}$.
3. $(20 \ge 10) \rightarrow \text{Vero}$; $\text{NOT}(\text{Vero}) \rightarrow \mathbf{Falso}$.

### Quesito 2: Tracciamento Logico di Selezione Annidata
Si consideri il seguente frammento di pseudocodice con input $X = 12, Y = 12$:

```text
SE X > Y ALLORA
    RIS <- X - Y
ALTRIMENTI
    SE X = Y ALLORA
        RIS <- 0
    ALTRIMENTI
        RIS <- Y - X
    FINE SE
FINE SE
SCRIVI RIS
```

*Tracciamento*:
1. Valutazione del primo test $X > Y \rightarrow (12 > 12) \rightarrow \mathbf{Falso}$.
2. L'esecutore entra nel ramo `ALTRIMENTI` ed esegue il secondo test $X = Y \rightarrow (12 = 12) \rightarrow \mathbf{Vero}$.
3. Viene eseguita l'assegnazione $\text{RIS} \leftarrow 0$.
4. L'output finale stampato a schermo è **0**.
