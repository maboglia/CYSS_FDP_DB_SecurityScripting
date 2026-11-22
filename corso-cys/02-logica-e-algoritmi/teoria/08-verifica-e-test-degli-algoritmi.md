# 08 – Verifica, Test e Qualità degli Algoritmi

Nel ciclo di vita dello sviluppo software, la scrittura del codice rappresenta soltanto una parte del lavoro. Un algoritmo non può essere considerato completo o affidabile fino a quando non ne viene verificata formalmente la correttezza rispetto ai requisiti di partenza. Gli esecutori automatici elaborano le istruzioni con rigore puramente letterale, privo di senso comune: se una sequenza contiene una falla logica, il calcolatore la eseguirà fedelmente producendo risultati errati o bloccando l'esecuzione.

Questo modulo affronta le metodologie sistematiche per verificare, testare e irrobustire un algoritmo prima e dopo la sua codifica. Verranno analizzate le tecniche di tracciamento manuale mediante *trace table*, la progettazione di suite di test articolate su dati ordinari, limite e non validi, la classificazione dei bug e le buone pratiche di leggibilità e programmazione difensiva.

---

## 1. La Verifica della Correttezza Algoritmica

Garantire che un algoritmo risolva correttamente il problema per cui è stato progettato richiede un approccio metodico. La verifica di correttezza si articola su due livelli fondamentali:

* **Correttezza Parziale**: Se l'algoritmo termina, produce il risultato corretto per ogni insieme di dati di input ammissibili.
* **Terminazione**: L'algoritmo non entra mai in cicli infiniti ed esegue un numero finito di passi per qualsiasi configurazione di input.

Quando un algoritmo soddisfa entrambe le condizioni, si parla di **correttezza totale**. 

A livello didattico ed ingegneristico, verificare un algoritmo significa sottoporlo a prove strutturate per evidenziare eventuali discrepanze tra il comportamento reale e le specifiche attese. Il test non può mai dimostrare in modo assoluto l'assenza di bug nell'algoritmo per ogni possibile combinazione di input infinita, ma una progettazione accurata dei casi di prova riduce drasticamente il rischio di malfunzionamenti.

---

## 2. Tracciamento Manuale dell'Esecuzione (Trace Table)

La **tabella di traccia** (*trace table* o *dry run*) è lo strumento concettuale primario per simulare l'esecuzione di un algoritmo senza ricorrere a un calcolatore. Essa permette di tracciare l'evoluzione dello stato di memoria (valore delle variabili) e il flusso di controllo riga per riga.

### Struttura di una Trace Table

Una tabella di traccia si compone di colonne dedicate agli elementi chiave del controllo:
1. **Passo / Riga**: Il numero della linea di codice o del blocco eseguito.
2. **Condizione**: L'esito di verifica Booleana (Vero/Falso) per i nodi di selezione o ciclo.
3. **Variabili**: Una colonna per ciascuna variabile presente nell'algoritmo.
4. **Input / Output**: I valori letti dall'esterno o mostrati a schermo.

### Caso di Studio: Tracciamento del Prodotto tramite Somme Successive

Si consideri l'algoritmo per il calcolo del prodotto tra due numeri interi positivi $A$ e $B$ mediante somme ripetute.

```text
PROGRAMMA ProdottoSomme
INIZIO
    LEGGI (A)
    LEGGI (B)
    Contatore <- 0
    Prodotto <- 0
    MENTRE Contatore < B FAI
        Contatore <- Contatore + 1
        Prodotto <- Prodotto + A
    FINE MENTRE
    SCRIVI (Prodotto)
FINE
```

Simulando l'esecuzione con dati di input $A = 4$ e $B = 3$, la tabella di traccia si sviluppa nel seguente modo:

| Passo / Riga | Condizione `Contatore < B` | Variabile `A` | Variabile `B` | Variabile `Contatore` | Variabile `Prodotto` | Output |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **1-2** | - | 4 | - | - | - | - |
| **3** | - | 4 | 3 | - | - | - |
| **4** | - | 4 | 3 | 0 | - | - |
| **5** | - | 4 | 3 | 0 | 0 | - |
| **6** | `0 < 3` (Vero) | 4 | 3 | 0 | 0 | - |
| **7** | - | 4 | 3 | 1 | 0 | - |
| **8** | - | 4 | 3 | 1 | 4 | - |
| **6** | `1 < 3` (Vero) | 4 | 3 | 1 | 4 | - |
| **7** | - | 4 | 3 | 2 | 4 | - |
| **8** | - | 4 | 3 | 2 | 8 | - |
| **6** | `2 < 3` (Vero) | 4 | 3 | 2 | 8 | - |
| **7** | - | 4 | 3 | 3 | 8 | - |
| **8** | - | 4 | 3 | 3 | 12 | - |
| **6** | `3 < 3` (Falso) | 4 | 3 | 3 | 12 | - |
| **10** | - | 4 | 3 | 3 | 12 | **12** |

L'analisi della tabella evidenzia come il ciclo si interrompa esattamente dopo 3 iterazioni, restituendo il valore `12` in output.

---

## 3. Progettazione dei Casi di Test (Test Cases)

I test di un algoritmo non devono essere eseguiti su valori casuali. Una suite di test efficace deve suddividere il dominio dei dati di input in classi di equivalenza e verificare il comportamento del sistema su tre categorie fondamentali di valori.

### Categorie di Dati di Input

1. **Casi Ordinari (Nominali)**:
   * Dati rappresentativi del funzionamento comune e quotidiano dell'algoritmo.
   * *Esempio*: Calcolo della media aritmetica su tre valori positivi standard ($10, 20, 30$).
2. **Casi Limite (Boundary Conditions)**:
   * Valori posti ai confini del dominio valido di input o di transizione delle condizioni.
   * *Esempio*: Array vuoto, sequenza con $N = 1$, valore $0$, valore massimo rappresentabile, o condizioni $X = Y$ nei confronti.
3. **Casi Non Validi o Eccezionali**:
   * Dati fuori dagli intervalli ammissibili o di tipo errato.
   * *Esempio*: Inserimento di una lunghezza negativa ($N < 0$), divisione con divisore uguale a zero, o testo al posto di numeri.

### Matrice dei Test

La pianificazione dei test richiede la redazione di una matrice che mette a confronto l'input fornito, il comportamento atteso e l'esito finale della prova:

| ID Test | Categoria | Input | Risultato Atteso | Comportamento Reale | Esito |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **TC-01** | Ordinario | $A = 5, B = 3$ | Prodotto = $15$ | Prodotto = $15$ | PASSED |
| **TC-02** | Limite | $A = 5, B = 0$ | Prodotto = $0$ | Prodotto = $0$ | PASSED |
| **TC-03** | Limite | $A = 0, B = 5$ | Prodotto = $0$ | Prodotto = $0$ | PASSED |
| **TC-04** | Non Valido | $A = 5, B = -2$ | Errore / Rifiuto input | Ciclo infinito | **FAILED** |

La rilevazione dell'esito **FAILED** per il test `TC-04` evidenzia la presenza di una vulnerabilità logica nell'algoritmo quando riceve un valore negativo.

---

## 4. Tassonomia degli Errori: Sintassi, Runtime e Logica

Durante le fasi di progettazione e codifica, gli errori (comunemente definita *bug*) possono presentarsi in forme differenti. Riconoscere la natura di un errore è il primo passo per una risoluzione efficace.

### 1. Errori di Sintassi (Syntax Errors)
* **Origine**: Violazione delle regole grammaticali e sintattiche del linguaggio di programmazione o dello pseudolinguaggio formale.
* **Rilevazione**: Immediata, da parte del compilatore o dell'interprete prima o durante la fase di parsing.
* **Esempi**: Parentesi non chiuse, parole chiave storpiate (`WHILEE` invece di `WHILE`), mancanza di indentazione richiesta.

### 2. Errori di Runtime (Execution Errors)
* **Origine**: Eventi anomali che si verificano mentre il programma è in fase di esecuzione, quando un'istruzione valida sintatticamente richiede un'operazione impossibile.
* **Rilevazione**: Durante l'esecuzione, causando l'interruzione brusca del programma (*crash*) o il sollevamento di un'eccezione.
* **Esempi**: Divisione per zero, tentativo di estrarre la radice quadrata di un numero negativo ($\sqrt{-N}$ in campo reale), accesso ad un indice fuori dai limiti di una sequenza.

### 3. Errori Logici o Semantici (Logic Errors)
* **Origine**: Impostazione errata della strategia risolutiva o dei passi dell'algoritmo. Il programma viene eseguito senza errori sintattici né arresti anomali, ma produce un risultato sbagliato.
* **Rilevazione**: Attraverso il tracciamento manuale, l'analisi dell'output e l'esecuzione della suite di test.
* **Esempi**: Uso di `>` al posto di `<` nella ricerca del minimo, errata inizializzazione di un accumulatore a $1$ anziché a $0$ per una somma, o assenza di incremento del contatore all'interno di un ciclo.

---

## 5. Tecniche di Debugging e Scomposizione Modulare

Il **debugging** è il processo sistematico di individuazione, isolamento e correzione dei bug all'interno di un algoritmo.

### Strategie di Isolamento degli Errori

1. **Scomposizione in Moduli Verificabili**:
   * Suddividere un algoritmo complesso in sottoproblemi o blocchi funzionali distinti.
   * Verificare la correttezza di ogni singolo blocco isolatamente (unit testing concettuale) prima di integrarlo nell'algoritmo generale.
2. **Ispezione dello Stato Intermedio**:
   * Inserire punti di controllo (*print debugging* o nodi di tracciamento) per mostrare i valori delle variabili critiche al termine di ogni iterazione o selezione.
3. **Approccio Dichotomic / Bisezione**:
   * Se l'algoritmo fallisce, isolare il punto medio dell'esecuzione e verificare se lo stato della memoria è corretto a metà percorso. Questo dimezza l'area di ricerca dell'errore.

---

## 6. Qualità del Software: Leggibilità e Clean Code

Un algoritmo corretto ma incomprensibile è difficile da mantenere, aggiornare e correggere. La qualità dell'algoritmo si misura anche attraverso la sua chiarezza strutturale e la manutenibilità.

### Principi di Leggibilità

* **Nomi Significativi per le Variabili**:
  * Utilizzare nomi che ne descrivano la funzione concettuale.
  * *Esempio*: Utilizzare `SommaParziale` e `ContatoreStudenti` al posto di generici `S` e `C` o variabili ambigue come `X1`, `X2`.
* **Indentazione e Struttura Visiva**:
  * Allineare le istruzioni annidate all'interno di selezioni e cicli per evidenziare la gerarchia del flusso di controllo.
* **Commenti di Intenzione**:
  * I commenti devono spiegare *perché* viene eseguita un'operazione e la logica sottostante, non ripetere *cosa* fa la sintassi.
  * *Esempio Corretto*: `# Inizializzo il divisore per evitare la divisione per zero nel calcolo della media`.

---

## 7. Programmazione Difensiva e Gestione degli Input Inattesi

La **programmazione difensiva** è la pratica di progettare gli algoritmi assumendo che gli input possano essere incompleti, errati o deliberatamente non validi. L'algoritmo deve essere in grado di rilevare l'anomalia prima di eseguire operazioni critiche e gestire l'eccezione in modo controllato.

### Pattern di Validazione dell'Input

L'inserimento dei dati deve essere protetto da costrutti di filtraggio o cicli di re-inserimento fino a quando il dato fornito non soddisfa i vincoli del problema.

```text
PROGRAMMA RadiceQuadrataSicura
INIZIO
    LEGGI (N)
    
    // Ciclo di validazione dell'input difensivo
    MENTRE N < 0 FAI
        SCRIVI ("Errore: Impossibile calcolare la radice di un numero negativo.")
        SCRIVI ("Inserire un valore maggiore o uguale a zero:")
        LEGGI (N)
    FINE MENTRE
    
    Risultato <- CalcolaRadice(N)
    SCRIVI (Risultato)
FINE
```

L'adozione di cicli di validazione previene l'insorgere di errori di runtime e garantisce che il flusso principale operi esclusivamente su dati congruenti.

---

## 8. Sintesi Didattica e Domande di Autoverifica

### Concetti Chiave da Ricordare

1. **Test vs Correttezza**: I test identificano la presenza di errori, ma la correttezza totale richiede sia la precisione del risultato sia la garanzia di terminazione.
2. **Classificazione degli Errori**: Gli errori di sintassi bloccano la traduzione, quelli di runtime interrompono l'esecuzione, quelli logici producono risultati errati senza avvisi di sistema.
3. **Importanza della Trace Table**: La simulazione riga per riga della memoria è la tecnica principale per individuare gli errori di logica nei cicli e nelle selezioni.
4. **Casi Limite**: La maggior parte degli errori logici si concentra sui confini dei domini di input ($0$, valori negativi, liste vuote, parità dei confini).

### Quesiti di Autoverifica

1. Qual è la differenza sostanziale tra un errore di runtime e un errore logico?
2. Data una condizione di ciclo `MENTRE Contatore <= N`, quale caso limite è fondamentale verificare nella tabella di traccia?
3. Come si gestisce l'inserimento di un input non valido in modo che l'algoritmo non vada in crash?
4. Quali sono le tre colonne fondamentali che non possono mai mancare in una tabella di traccia?
