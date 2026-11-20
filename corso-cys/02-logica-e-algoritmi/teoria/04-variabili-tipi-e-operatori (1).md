# 04. Variabili, Tipi di Dati ed Operatori

Nel modello esecutivo della von Neumann Architecture e della programmazione strutturata, la gestione delle informazioni richiede che l'esecutore possa memorizzare, leggere e manipolare dati in modo sistematico. Mentre le istruzioni descrivono la sequenza logica di trasformazione, i **dati** costituiscono la materia prima dell'elaborazione. 

Per interagire con la memoria dell'elaboratore senza dover gestire direttamente indirizzi fisici binari o registri di sistema, i linguaggi di programmazione ad alto livello introducono l'astrazione di **variabile**. In questo capitolo si esaminano i concetti di variabile, la classificazione dei tipi di dati primitivi, il funzionamento dell'operatore di assegnazione e la combinazione delle variabili all'interno di espressioni aritmetiche e relazionali.

---

## 1. La Variabile come Astrazione della Memoria Principale

La memoria di lavoro dell'elaboratore (RAM) è strutturata come una sequenza contigua di celle elementari capaci di memorizzare bit, aggregati convenzionalmente in gruppi di 8 bit denominati **byte**. A livello hardware, ciascun byte è associato a un indirizzo numerico univoco espresso in forma binaria o esadecimale.

Gestire direttamente gli indirizzi di memoria durante la stesura di un algoritmo risulterebbe estremamente complesso ed esposto a errori. La variabile risolve questo problema fungendo da etichetta simbolica:

> **Definizione**: Una **variabile** è un contenitore astratto associato a una locazione di memoria dell'elaboratore, identificato da un nome (*identificatore*), che conserva un valore soggetto a variazione nel corso dell'esecuzione del programma.

```text
Struttura astratta della memoria:

+-------------------+-------------------+-------------------+
| Indirizzo Fisico  | Identificatore    | Contenuto (Valore)|
+-------------------+-------------------+-------------------+
| 0x7FFF5FBFF010    | base              | 12                |
| 0x7FFF5FBFF018    | altezza           | 5                 |
| 0x7FFF5FBFF020    | area              | 60                |
+-------------------+-------------------+-------------------+
```

### Proprietà Fondamentali di una Variabile

Ciascuna variabile all'interno di un programma è definita da tre caratteristiche chiave:

1. **Identificatore (Nome)**: La sequenza alfanumerica usata nel codice per fare riferimento alla cella di memoria (es. `base`, `prezzo_totale`, `contatore`). Deve seguire regole sintattiche precise: non può iniziare con una cifra, non può contenere spazi o caratteri speciali (eccetto il trattino basso `_`) e non può coincidere con le parole chiave riservate del linguaggio.
2. **Valore**: Il dato effettivo memorizzato nella cella in un determinato istante dell'esecuzione (es. il numero intero `12` o il testo `"Attenzione"`).
3. **Tipo di Dato**: La specifica che definisce l'insieme dei valori che la variabile può assumere, lo spazio di memoria richiesto e le operazioni ammesse su di essa.

In Python, la gestione della memoria avviene in modo dinamico: non occorre dichiarare preventivamente il tipo di una variabile. L'interprete assegna automaticamente il tipo appropriato in base al valore fornito al momento dell'assegnazione (**tipizzazione dinamica**).

---

## 2. I Tipi di Dati Primitivi e la Rappresentazione Digitale

Qualsiasi informazione elaborata da un calcolatore — numeri, caratteri testuali o stati logici — viene rappresentata internamente mediante sequenze di bit ($0$ e $1$). Il **tipo di dato** indica all'interprete come interpretare le sequenze binarie conservate nella memoria.

I linguaggi di programmazione mettono a disposizione una serie di **tipi di dati primitivi** (o scalari):

| Tipo di Dato (Python) | Categoria Logica | Descrizione ed Esempi | Spazio e Rappresentazione |
| :--- | :--- | :--- | :--- |
| `int` | Numerico Intero | Numeri relativi senza parte frazionaria.<br>Esempi: `42`, `-7`, `0` | Rappresentazione binaria pura (complemento a due per i valori negativi). |
| `float` | Numerico Reale | Numeri con virgola o in notazione scientifica.<br>Esempi: `3.14159`, `-0.001`, `2.5e3` | Rappresentazione in virgola mobile (standard IEEE 754 con mantissa ed esponente). |
| `str` | Testuale (Stringa) | Sequenze ordinate di caratteri racchiuse tra virgolette.<br>Esempi: `"Roma"`, `'A'`, `"123"` | Codifica dei caratteri mediante tabelle standard (ASCII a 8 bit per caratteri base o Unicode/UTF-8). |
| `bool` | Logico (Booleano) | Valori di verità appartenenti all'algebra booleana.<br>Valori ammessi: `True`, `False` | Rappresentazione binaria essenziale ($1$ per `True`, $0$ per `False`). |

### Conversione tra Tipi di Dati (Type Casting)

Poiché il tipo determina le operazioni valide, l'interprete distingue rigorosamente tra valori numerici e rappresentazioni testuali. Ad esempio, la sequenza numerica `123` e la stringa `"123"` occupano strutture diverse in memoria: il primo è un valore aritmetico calcolabile, il secondo è un insieme di caratteri grafici.

Per convertire esplicitamente un dato da un tipo all'altro si utilizzano le funzioni di casting:

* `int("45")` converte la stringa `"45"` nell'intero `45`.
* `float(10)` converte l'intero `10` nel valore reale `10.0`.
* `str(100)` converte l'intero `100` nella stringa `"100"`.
* `bool(1)` converte l'intero `1` nel valore booleano `True`.

---

## 3. L'Operatore di Assegnazione e la Mutabilità del Contenuto

L'operazione fondamentale con cui si scrive o si aggiorna il valore contenuto in una variabile è l'**assegnazione**, rappresentata in Python dal simbolo `=`.

```text
Identificatore = Espressione
```

> **Regola di Valutazione dell'Assegnazione**: L'assegnazione **non** è un'equazione matematica di uguaglianza, ma un comando d'azione imperativo. L'esecutore valuta prima l'espressione situata a **destra** del simbolo `=` e successivamente memorizza il risultato ottenuto nella variabile specificata a **sinistra**.

```python
# Esempio di assegnazione semplice
base = 8
altezza = 5
area = base * altezza
```

### Sovrascrittura Distruttiva della Memoria

Quando si assegna un nuovo valore a una variabile preesistente, il valore precedente memorizzato nella relativa cella di memoria viene sovrascritto e perso in modo distruttivo.

Si consideri la seguente sequenza di istruzioni:

```python
x = 10
x = 25
x = x + 1
```

1. **`x = 10`**: Alla cella `x` viene associato il valore intero `10`.
2. **`x = 25`**: Il valore `10` viene eliminato e sostituito da `25`.
3. **`x = x + 1`**: L'esecutore legge il valore corrente di `x` ($25$), calcola la somma $25 + 1 = 26$, e infine sovrascrive la cella `x` con il nuovo risultato $26$.

---

## 4. Espressioni ed Operatori: Aritmetici, Relazionali e Priorità

Un'**espressione** è una combinazione valida di variabili, costanti ed operatori che l'esecutore calcola per produrre un singolo valore di output.

### Operatori Aritmetici

Gli operatori aritmetici eseguono calcoli matematici sui tipi numerici (`int` e `float`):

| Operatore | Operazione | Esempio Python | Risultato con `a=14`, `b=4` |
| :---: | :--- | :---: | :---: |
| `+` | Addizione | `a + b` | `18` |
| `-` | Sottrazione | `a - b` | `10` |
| `*` | Moltiplicazione | `a * b` | `56` |
| `/` | Divisione Reale (restituisce sempre un `float`) | `a / b` | `3.5` |
| `//` | Divisione Intera (tronca la parte decilamale) | `a // b` | `3` |
| `%` | Modulo (calcola il resto della divisione intera) | `a % b` | `2` |
| `**` | Elevamento a Potenza | `a ** b` | `38416` ($14^4$) |

### Operatori Relazionali (di Confronto)

Gli operatori relazionali confrontano due valori e restituiscono un risultato di tipo booleano (`True` o `False`). Sono utilizzati per definire le condizioni nelle strutture di selezione ed iterazione.

| Operatore | Significato Logico | Esempio | Esito con `x=7`, `y=10` |
| :---: | :--- | :---: | :---: |
| `==` | Uguale a (confronto di uguaglianza) | `x == y` | `False` |
| `!=` | Diverso da | `x != y` | `True` |
| `>` | Strettamente Maggiore di | `x > y` | `False` |
| `<` | Strettamente Minore di | `x < y` | `True` |
| `>=` | Maggiore o Uguale a | `x >= y` | `False` |
| `<=` | Minore o Uguale a | `x <= y` | `True` |

### Priorità ed Ordine di Valutazione delle Espressioni

Quando un'espressione contiene più operatori, l'esecutore applica le regole di precedenza matematica standard:

1. **Parentesi `()`**: Le espressioni racchiuse tra parentesi hanno la precedenza massima.
2. **Elevamento a potenza `**`**.
3. **Moltiplicazione `*`, Divisione `/`, `//` e Modulo `%`** (valutati da sinistra a destra).
4. **Addizione `+` e Sottrazione `-`** (valutate da sinistra a destra).
5. **Operatori Relazionali `==`, `!=`, `<`, `>`, `<=`, `>=`**.

```python
# Valutazione di un'espressione complessa
risultato = 10 + 2 * 3 ** 2 > 20
# Passo 1: Elevamento a potenza -> 3 ** 2 = 9
# Passo 2: Moltiplicazione     -> 2 * 9 = 18
# Passo 3: Addizione           -> 10 + 18 = 28
# Passo 4: Confronto           -> 28 > 20 = True
# 'risultato' conterrà il valore Booleano True
```

---

## 5. Il Modello di Scambio delle Variabili: La Variabile di Appoggio

Un problema classico nell'algoritmica è lo **scambio del contenuto di due variabili** (*swap*). Supponiamo di avere due celle di memoria, `numero1` e `numero2`, contenenti rispettivamente i valori $15$ e $6$, e di voler invertire i loro valori.

### Il Problema del Trasferimento Diretto (Errore Concettuale)

Se un programmatore tentasse di scambiare i valori mediante un trasferimento diretto:

```python
# TENTATIVO ERRATO
numero1 = numero2  # numero1 diventa 6, ma il vecchio valore 15 è PERSO PER SEMPRE!
numero2 = numero1  # numero2 riceve 6. Entrambe le variabili ora valgono 6.
```

A causa della natura distruttiva dell'assegnazione, sovrascrivere `numero1` con il valore di `numero2` cancella definitivamente il valore originale di `numero1`, rendendo impossibile il completamento dello scambio.

### La Soluzione Algoritmica: Uso di una Variabile Temporanea (`appoggio`)

Per conservare temporaneamente il valore prima che venga sovrascritto, occorre introdurre una terza variabile di supporto (detta **variabile di appoggio** o `temp`).

#### Procedura in Pseudocodice ed Implementazione Python

```text
INIZIO
    Leggi numero1
    Leggi numero2
    appoggio <- numero1
    numero1 <- numero2
    numero2 <- appoggio
    Scrivi numero1, numero2
FINE
```

```python
# Implementazione strutturata dello scambio
numero1 = 15
numero2 = 6

# Algoritmo di scambio con variabile di appoggio
appoggio = numero1  # Salva 15 in memoria temporanea
numero1 = numero2   # numero1 diventa 6
numero2 = appoggio  # numero2 riceve 15 dalla memoria temporanea
```

#### Verifica tramite Trace Table (Tabella di Traccia)

Costruiamo la tabella di traccia dello stato di memoria per verificare il tracciamento delle celle passo dopo passo:

| Passo Execution | Istruzione Eseguita | Stato `numero1` | Stato `numero2` | Stato `appoggio` | Note ed Effetto in Memoria |
| :---: | :--- | :---: | :---: | :---: | :--- |
| **1** | Inizializzazione `numero1 = 15` | **15** | *non definita* | *non definita* | Assegnazione valore iniziale |
| **2** | Inizializzazione `numero2 = 6` | 15 | **6** | *non definita* | Assegnazione valore iniziale |
| **3** | `appoggio = numero1` | 15 | 6 | **15** | Copia di sicurezza del valore di `numero1` |
| **4** | `numero1 = numero2` | **6** | 6 | 15 | Sovrascrittura di `numero1` con il valore di `numero2` |
| **5** | `numero2 = appoggio` | 6 | **15** | 15 | Recupero del valore originale di `numero1` |

Al termine dell'algoritmo, `numero1` contiene $6$ e `numero2` contiene $15$, confermando la correttezza della sequenza distributiva delle variabili.

---

## 6. Verifica delle Competenze ed Esercizi Concettuali

### Q&A di Verifiche Teoriche

1. **Qual è la differenza fondamentale tra l'operatore di uguaglianza `==` e l'operatore di assegnazione `=`?**
   * *Risposta*: L'operatore `=` è un comando di assegnazione che memorizza il valore del membro destro nella variabile indicata a sinistra. L'operatore `==` è un operatore relazionale di confronto che verifica se i due membri hanno lo stesso valore e restituisce un risultato booleano (`True` o `False`).

2. **Cosa accade se si esegue l'istruzione `x = x + 5` quando `x` vale `10`?**
   * *Risposta*: L'esecutore valuta prima l'espressione a destra ($10 + 5 = 15$) e successivamente sovrascrive il valore precedente nella variabile `x` con il nuovo valore $15$.

3. **Perché per scambiare il contenuto di due variabili occorre una terza variabile temporanea?**
   * *Risposta*: Perché l'assegnazione è una scrittura distruttiva: se si copiasse direttamente il valore della seconda variabile nella prima, il valore originale della prima andrebbe perso, rendendo impossibile la successiva assegnazione alla seconda variabile.

---

### Esercizi di Tracciamento e Debugging

#### Esercizio 1: Analisi di Espressioni e Tipi
Dati i seguenti valori iniziali: `a = 5`, `b = 2`, `c = "10"`. Determinare il valore e il tipo di dato risultante dalle seguenti espressioni:
1. `r1 = a / b`
2. `r2 = a // b`
3. `r3 = a % b`
4. `r4 = int(c) + a`

*Soluzione*:
1. `r1 = 2.5` (tipo `float`, la divisione singola restituisce sempre un numero reale).
2. `r2 = 2` (tipo `int`, la divisione intera tronca i decimali).
3. `r3 = 1` (tipo `int`, resto di $5 / 2$).
4. `r4 = 15` (tipo `int`, conversione di `"10"` in $10$ seguita da addizione $10 + 5$).

#### Esercizio 2: Tracciamento dello Stato di Memoria
Compilare la Trace Table per la seguente sequenza di istruzioni e determinare i valori finali delle variabili `p` e `q`:

```python
p = 4
q = 3
p = p * q
q = p - q
p = p - q
```

*Soluzione (Trace Table)*:

| Istruzione | Valore `p` | Valore `q` | Calcolo Effettuato |
| :--- | :---: | :---: | :--- |
| `p = 4` | **4** | *non definita* | Inizializzazione `p` |
| `q = 3` | 4 | **3** | Inizializzazione `q` |
| `p = p * q` | **12** | 3 | $4 \times 3 = 12$ |
| `q = p - q` | 12 | **9** | $12 - 3 = 9$ |
| `p = p - q` | **3** | 9 | $12 - 9 = 3$ |

*Esito Finale*: `p` vale `3` e `q` vale `9`. Si noti che questo algoritmo matematico esegue lo scambio dei valori di due variabili numeriche senza usare una variabile di appoggio esplicita!
