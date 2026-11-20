# Esercitazioni — Modulo 01: Sintassi e Variabili

La seguente scheda contiene esercitazioni pratiche e progressive relative al modulo **01: Sintassi e Variabili**. Gli esercizi sono strutturati per livelli di difficoltà crescente e si concludono con una sfida integrata finale.

---

## Livello 1 — Riscaldamento e Concetti Base

### Esercizio 1.1 — Creazione di variabili e controllo dei tipi
**Obiettivo**: Esercitarsi con l'assegnazione e l'ispezione dei tipi di dato base.
1. Definisci quattro variabili contenenti rispettivamente:
   * Il nome di un articolo informatico (stringa)
   * Il suo prezzo unitario in euro (numero decimale)
   * La quantità presente in magazzino (numero intero)
   * Un booleano che indichi se l'articolo è in garanzia
2. Stampa il valore di ciascuna variabile.
3. Stampa il tipo di ciascuna variabile utilizzando la funzione `type()`.
4. Riscrivi le definizioni delle quattro variabili aggiungendo i **type hints**.

---

### Esercizio 1.2 — Correzione sintattica e naming convention
**Obiettivo**: Riconoscere ed eliminare errori di sintassi nei nomi delle variabili.
Considera il seguente blocco di codice errato:

```python
# Codice da correggere:
1item_price = 12.50
user-name = "Mario Rossi"
class = "Informatica"
total price = 25.00
```

1. Individua l'errore presente in ciascuna riga.
2. Correggi il codice applicando la convenzione standard **snake_case**.

---

### Esercizio 1.3 — Operazioni aritmetiche e calcolo del modulo
**Obiettivo**: Utilizzare gli operatori matematici e comprendere la divisione intera e il modulo.
Dati due numeri interi `a = 17` e `b = 5`:
1. Calcola e stampa la somma, la differenza e il prodotto.
2. Calcola la divisione con virgola (`/`) e la divisione intera (`//`).
3. Calcola il resto della divisione con l'operatore modulo (`%`).
4. Utilizza l'operatore `%` per verificare se un valore numerico assegnato a una variabile `numero = 24` è pari o dispari (stampa `0` per pari, `1` per dispari).

---

## Livello 2 — Stringhe, Slicing e Metodi

### Esercizio 2.1 — Escape sequence e Raw String
**Obiettivo**: Formattare stringhe complesse e gestire i percorsi di sistema.
1. Utilizza una sola istruzione `print()` con le sequenze di escape `\n` e `\t` per produrre l'output seguente:

```text
TABELLA PRODOTTI:
ID	Prodotto	Prezzo
01	Mouse		15.50 €
02	Tastiera	29.90 €
```

2. Definisci una variabile `percorso_windows` contenente il testo `C:\Users\Studente\Nuova_Cartella`.
3. Stampa il percorso gestendo correttamente i backslash sia tramite il doppio backslash (`\\`) sia mediante una **raw string** (`r"..."`).

---

### Esercizio 2.2 — Indicizzazione e Slicing
**Obiettivo**: Estrarre sottostringhe e manipolare posizioni di caratteri.
Data la riga di codice: `testo = "Programmazione"`
1. Stampa il primo e l'ultimo carattere utilizzando indici positivi e negativi.
2. Estrai e stampa i primi 4 caratteri (`"Prog"`).
3. Estrai e stampa gli ultimi 7 caratteri (`"mazione"`).
4. Crea una nuova variabile `testo_inverso` contenente la stringa invertita usando lo slicing con passo negativo.

---

### Esercizio 2.3 — Pulizia e Metodi delle Stringhe
**Obiettivo**: Normalizzare il testo con i metodi integrati delle stringhe.
Dato il testo con spazi sporchi: `dati_input = "   PytHon è un Linguaggio Potente   "`
1. Rimuovi gli spazi bianchi all'inizio e alla fine usando `.strip()`.
2. Converti il testo interamente in maiuscolo e poi interamente in minuscolo.
3. Sostituisci la parola `"Potente"` con la parola `"Versatile"`.
4. Verifica con `.endswith()` se la stringa pulita termina con la parola `"Versatile"`.

---

## Livello 3 — Input dell'Utente, Casting e Formattazione

### Esercizio 3.1 — Calcolatrice da scontrino
**Obiettivo**: Gestire l'input utente, eseguire il casting numerico e formattare con f-string.
Scrivi uno script Python che:
1. Chieda all'utente il nome del prodotto acquistato.
2. Chieda il prezzo unitario (convertendolo opportunamente in `float`).
3. Chieda la quantità acquistata (convertendola in `int`).
4. Calcoli il costo totale dell'acquisto.
5. Visualizzi lo scontrino formattato con esattamente 2 cifre decimali per i prezzi usando lo specificatore `:.2f`:

```text
----- SCONTRINO -----
Prodotto: Tastiera
Prezzo unitario: 24.90 €
Quantità: 3
Totale complessivo: 74.70 €
---------------------
```

---

### Esercizio 3.2 — Analisi anagrafica
**Obiettivo**: Elaborare dati anagrafici e combinare calcoli matematici ed espressioni in f-string.
Scrivi un programma che:
1. Richieda all'utente il proprio nome e il proprio anno di nascita.
2. Calcoli l'età dell'utente ipotizzando l'anno corrente (es. 2026).
3. Stampi un messaggio contenente:
   * Il nome in formato Titolo (`.title()`).
   * L'età calcolata.
   * L'anno in cui l'utente compirà 100 anni.
   * Il numero di caratteri che compongono il nome.

---

## Livello 4 — Sfida Integrata "Scheda Prodotto Magazzino"

### Traccia della Sfida
Realizza uno script Python per la generazione automatica della **Scheda Prodotto Magazzino**.

#### Requisiti del programma:
1. **Acquisizione Dati**:
   Chiedi all'utente di inserire via terminale:
   * Nome del prodotto (`product_name`)
   * Categoria (`category`)
   * Prezzo di listino (`price`)
   * Pezzi disponibili in magazzino (`stock_quantity`)
   * Breve descrizione del prodotto (`description`)

2. **Elaborazione e Calcoli**:
   * Calcola il valore totale di magazzino per il prodotto (`stock_value = price * stock_quantity`).
   * Calcola il booleano di disponibilità (`is_available`: vale `True` se `stock_quantity > 0`).
   * Calcola il booleano di scorta minima (`is_low_stock`: vale `True` se `stock_quantity <= 10`).
   * Verifica se la descrizione contiene la parola chiave `"sicurezza"` oppure `"security"`, eseguendo un controllo **case-insensitive** (convertendo la descrizione in minuscolo prima del controllo con l'operatore `in`).

3. **Output Formattato**:
   Visualizza un riepilogo leggibile ed elegante utilizzando le **f-string**.

---

## Soluzioni Complete e Commentate

Di seguito sono riportate le soluzioni consigliate per tutti gli esercizi della scheda.

### Soluzioni Livello 1

```python
# --- Esercizio 1.1 ---
# Definizione variabili
item_name = "Router Wi-Fi"
unit_price = 89.90
stock_qty = 45
in_warranty = True

# Stampa valori e tipi
print(item_name, type(item_name))
print(unit_price, type(unit_price))
print(stock_qty, type(stock_qty))
print(in_warranty, type(in_warranty))

# Versione con Type Hints
item_name_hint: str = "Router Wi-Fi"
unit_price_hint: float = 89.90
stock_qty_hint: int = 45
in_warranty_hint: bool = True


# --- Esercizio 1.2 ---
# Codice corretto in snake_case:
item_price_1 = 12.50       # Non può iniziare con numero
user_name = "Mario Rossi"   # Non si usano trattini
course_class = "Informatica"# 'class' è parola chiave riservata
total_price = 25.00        # Non si usano spazi


# --- Esercizio 1.3 ---
a = 17
b = 5

print("Somma:", a + b)
print("Differenza:", a - b)
print("Prodotto:", a * b)
print("Divisione float:", a / b)
print("Divisione intera:", a // b)
print("Resto (modulo):", a % b)

numero = 24
is_odd = numero % 2  # Restituisce 0 se pari, 1 se dispari
print(f"Il numero {numero} è dispari? (0=No, 1=Sì): {is_odd}")
```

---

### Soluzioni Livello 2

```python
# --- Esercizio 2.1 ---
# Output con tabella formattata
print("TABELLA PRODOTTI:\nID\tProdotto\tPrezzo\n01\tMouse\t\t15.50 €\n02\tTastiera\t29.90 €")

# Gestione backslash
percorso_escape = "C:\\Users\\Studente\\Nuova_Cartella"
percorso_raw = r"C:\Users\Studente\Nuova_Cartella"
print(percorso_escape)
print(percorso_raw)


# --- Esercizio 2.2 ---
testo = "Programmazione"

print("Primo carattere:", testo[0])
print("Ultimo carattere:", testo[-1])
print("Primi 4 caratteri:", testo[:4])
print("Ultimi 7 caratteri:", testo[-7:])

testo_inverso = testo[::-1]
print("Stringa invertita:", testo_inverso)


# --- Esercizio 2.3 ---
dati_input = "   PytHon è un Linguaggio Potente   "

# 1. Pulizia spazi
testo_pulito = dati_input.strip()
print("Testo pulito:", f"'{testo_pulito}'")

# 2. Maiuscolo e minuscolo
print("Maiuscolo:", testo_pulito.upper())
print("Minuscolo:", testo_pulito.lower())

# 3. Sostituzione
testo_modificato = testo_pulito.replace("Potente", "Versatile")
print("Modificato:", testo_modificato)

# 4. Verifica finale
print("Termina con 'Versatile'?:", testo_modificato.endswith("Versatile"))
```

---

### Soluzioni Livello 3

```python
# --- Esercizio 3.1 ---
product = input("Nome prodotto: ")
price = float(input("Prezzo unitario (€): "))
quantity = int(input("Quantità: "))

total_cost = price * quantity

print("\n----- SCONTRINO -----")
print(f"Prodotto: {product}")
print(f"Prezzo unitario: {price:.2f} €")
print(f"Quantità: {quantity}")
print(f"Totale complessivo: {total_cost:.2f} €")
print("---------------------")


# --- Esercizio 3.2 ---
nome = input("Inserisci il tuo nome: ")
anno_nascita = int(input("Inserisci il tuo anno di nascita: "))

anno_corrente = 2026
eta = anno_corrente - anno_nascita
anno_cento = anno_nascita + 100
lunghezza_nome = len(nome.strip())

print(f"\nCiao {nome.strip().title()}!")
print(f"Hai (o compirai) {eta} anni nel {anno_corrente}.")
print(f"Compirai 100 anni nel {anno_cento}.")
print(f"Il tuo nome è composto da {lunghezza_nome} caracteres.")
```

---

### Soluzione Livello 4 (Sfida Integrata)

```python
# =========================================================
# SCHEDA PRODOTTO MAGAZZINO - SFIDA INTEGRATA
# =========================================================

# 1. Acquisizione dati con conversione di tipo
product_name = input("Nome del prodotto: ")
category = input("Categoria: ")
price = float(input("Prezzo di listino (€): "))
stock_quantity = int(input("Pezzi disponibili in magazzino: "))
description = input("Breve descrizione del prodotto: ")

# 2. Calcoli ed elaborazioni
minimum_stock_threshold = 10

stock_value = price * stock_quantity
is_available = stock_quantity > 0
is_low_stock = stock_quantity <= minimum_stock_threshold

# Controllo case-insensitive di parole chiave nella descrizione
desc_lower = description.lower()
is_security_related = ("sicurezza" in desc_lower) or ("security" in desc_lower)

# 3. Output formattato
print()
print("==================================================")
print("            SCHEDA PRODOTTO MAGAZZINO             ")
print("==================================================")
print(f"Prodotto:               {product_name.strip().title()}")
print(f"Categoria:              {category.strip().upper()}")
print(f"Prezzo unitario:        {price:.2f} €")
print(f"Quantità in stock:      {stock_quantity} pezzi")
print(f"Valore totale stock:    {stock_value:.2f} €")
print("--------------------------------------------------")
print(f"Disponibile per la vendita : {is_available}")
print(f"Allarme Scorta Minima      : {is_low_stock}")
print(f"Attinente alla Sicurezza   : {is_security_related}")
print("==================================================")
```
