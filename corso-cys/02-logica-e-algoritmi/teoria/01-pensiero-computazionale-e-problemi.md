# Pensiero Computazionale e Risoluzione dei Problemi

Il pensiero computazionale costituisce l'impalcatura concettuale su cui poggia l'intera scienza dell'informazione. Per uno sviluppatore software di livello EQF5, comprendere l'algoritmica significa acquisire la capacità di trasformare problemi complessi e ambigui del mondo reale in sequenze rigorose, esplicite e deterministiche di istruzioni. Questo capitolo introduce le fondamenta della risoluzione algoritmica dei problemi, analizzando le proprietà formali degli algoritmi, il ruolo dell'esecutore meccanico e la transizione dalla logica concettuale alla stesura delle istruzioni.

---

## 1. Il Paradigma del Pensiero Computazionale

Il **pensiero computazionale** è un processo mentale di *problem solving* che consente di formulare problemi e le relative soluzioni in una forma tale da poter essere eseguite da un agente elaboratore di informazioni (sia esso un essere umano o un calcolatore elettronico). Tale approccio si articola su tre livelli di astrazione fondamentali:

1. **Il Problema**: Esprime la situazione di partenza, il vincolo o l'esigenza informativa a cui si intende dare risposta (ad esempio calcolare l'area di una figura, trovare il cammino minimo in una rete o determinare il Massimo Comune Divisore).
2. **La Strategia Risolutiva**: Rappresenta l'idea logica o il modello matematico adottato per superare l'ostacolo espresso dal problema.
3. **L'Algoritmo**: È la formalizzazione operativa della strategia in una sequenza ordinata di istruzioni elementari, non ambigue ed eseguibili.

In ambito informatico, l'algoritmo funge da ponte tra la comprensione umana del problema e l'esecuzione automatizzata da parte della macchina.

---

## 2. Origine Storica ed Etimologia

Il termine **algoritmo** affonda le sue radici storiche nel nome del matematico arabo **Abu Ja'far Muhammad ibn Musa Al-Khwarizmi** (vissuto attorno all'800 d.C. presso la *Casa della Sapienza* a Baghdad). Al-Khwarizmi formalizzò le regole sistematiche per eseguire le operazioni aritmetiche fondamentali (come la moltiplicazione mediante incolonnamento delle cifre) sfruttando la notazione posizionale.

Quando i suoi trattati matematici vennero tradotti in latino nel XII secolo (circa 1120 d.C.), il testo si apriva con la locuzione *"Dixit Algorismi"* ("Così ha detto Al-Khwarizmi"). Con il passare dei secoli, la traslitterazione *Algorismi* è evoluta nel vocabolo moderno "algoritmo", arrivando a designare qualsiasi procedimento di calcolo sistematico e strutturato.

---

## 3. Definizione Formale e Proprietà dell'Algoritmo

In informatica, un **algoritmo** è definito come un *procedimento risolutivo costituito da una sequenza finita di istruzioni elementari, espresso in un linguaggio comprensibile all'uomo e predisposto per essere tradotto in un programma eseguibile*.

Affinché una sequenza di istruzioni possa essere classificata come un algoritmo valido, deve soddisfare rigorosamente sette **proprietà formali**:

| Proprietà | Descrizione Tecnica e Vincolo Formale |
| :--- | :--- |
| **Finitura** | L'algoritmo deve essere composto da un numero finito di istruzioni e deve terminare in un tempo finito per qualsiasi insieme di dati di ingresso. |
| **Inizio e Fine** | Deve possedere punti di attivazione (*Inizio*) ed interruzione (*Fine*) univoci e chiaramente identificabili. |
| **Eseguibilità** | Ogni singola istruzione deve poter essere eseguita materialmente dall'esecutore con le risorse a disposizione. |
| **Non Ambiguità** | Ogni istruzione deve essere formulata in modo chiaro e univoco, garantendo la medesima interpretazione da parte di qualsiasi esecutore. |
| **Generalità** | L'algoritmo non deve risolvere una singola istanza specifica, ma una classe generale di problemi afferenti al medesimo dominio (es. calcolare l'area di *qualsiasi* rettangolo, non di uno solo). |
| **Determinismo** | A parità di dati di ingresso (*input*), l'algoritmo deve produrre i medesimi dati di uscita (*output*), eseguendo la stessa sequenza di passi indipendentemente dall'esecutore. |
| **Completezza** | L'algoritmo deve contemplare e gestire esplicitamente tutti i casi e le condizioni particolari che si possono verificare durante l'esecuzione. |

Se anche una sola di queste proprietà viene meno, la sequenza cessa di essere un algoritmo ed incorre in fallimenti operativi o stalli logici.

---

## 4. Il Ruolo dell'Esecutore ed Esecuzione Letterale

Un aspetto cruciale del pensiero computazionale risiede nella comprensione della natura dell'**esecutore**:

* **Esecutore Umano**: Interpreta le istruzioni integrandole con l'esperienza, il contesto ed il buonsenso. Ad esempio, di fronte all'ordine *"Varca quella porta"*, un umano verifica autonomamente se la porta sia aperta o chiusa, ed eventualmente la apre prima di attraversarla.
* **Esecutore Calcolatore (Macchina)**: È un agente del tutto privo di intelligenza o capacità deduttiva contestuale. Esegue le istruzioni in modo strettamente **letterale**. Se programmato per muoversi in avanti senza verificare lo stato della porta, impatterà contro l'ostacolo.

La rigidità letterale dell'esecutore elettronico impone al programmatore di esplicitare ogni singolo dettaglio operativo. La mancata previsione di un evento o la presenza di una formulazione sintattica/logica errata genera un **bug** (termine storico derivato dall'inserimento materiale di una falena tra i relè elettromeccanici di uno dei primi calcolatori negli anni '40). Il processo sistematico di individuazione ed eliminazione degli errori prende il nome di **debugging**.

---

## 5. Caso di Studio: Il Problema del Trasporto sulla Sponda

Per comprendere come un problema apparentemente colloquiale debba essere formalizzato algoritmicamente, analizziamo il classico problema del trasporto del *Lupo*, della *Pecora* e del *Cavolo* da una sponda A ad una sponda B di un fiume.

### Vincoli del Problema:
1. Il barcaiolo può trasportare solo un elemento alla volta.
2. Se lasciati soli senza il barcaiolo, il Lupo mangia la Pecora.
3. Se lasciati soli senza il barcaiolo, la Pecora mangia il Cavolo.
4. Il Lupo non mangia il Cavolo.

### Formulazione Algoritmica
L'algoritmo risolutivo, per essere esecutivo e non ambiguo, si articola nella seguente sequenza finita di passi:

1. **Inizio**
2. Traghettare la *Pecora* dalla sponda A alla sponda B (lasciando Lupo e Cavolo sulla sponda A).
3. Ritornare con la barca vuota dalla sponda B alla sponda A.
4. Traghettare il *Cavolo* dalla sponda A alla sponda B (lasciando il Lupo sulla sponda A).
5. Riportare la *Pecora* dalla sponda B alla sponda A (lasciando il Cavolo sulla sponda B).
6. Traghettare il *Lupo* dalla sponda A alla sponda B (lasciando la Pecora sulla sponda A).
7. Ritornare con la barca vuota dalla sponda B alla sponda A.
8. Traghettare la *Pecora* dalla sponda A alla sponda B.
9. **Fine**

Questo procedimento rispetta integralmente le proprietà formali: è finito (9 passi), deterministico, non ambiguo e garantisce il completamento sicuro della classe di problema descritta senza violare i vincoli operativi.
