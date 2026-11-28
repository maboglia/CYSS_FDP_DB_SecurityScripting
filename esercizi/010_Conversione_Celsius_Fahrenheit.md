# **1. Programma che converte una temperatura tra due unità di misura**

L'esempio mostra un programma che converte una temperatura tra due unità di misura:

- Celsius (°C) → Fahrenheit (°F)
- Fahrenheit (°F) → Celsius (°C)

Il programma utilizza la struttura condizionale `if..elif..else` per decidere quale operazione eseguire in base all'unità di misura inserita dall'utente.

## **Codice python**

```python

# Richiede all'utente l'unità di misura della temperatura
# C = Celsius, F = Fahrenheit
unit = input("La temperatura è espressa in Celsius o Fahrenheit (C/F)? ")

# Richiede la temperatura e converte il valore inserito in un numero decimale
temp = float(input("Inserisci la temperatura: "))

# Verifica se l'utente ha scelto Celsius
if unit == "C":

    # Conversione da Celsius a Fahrenheit
    # Formula: F = (9 * C) / 5 + 32
    # round(..., 1) arrotonda il risultato a una cifra decimale
    temp = round((9 * temp) / 5 + 32, 1)

    # Visualizza la temperatura convertita
    print(f"La temperatura in Fahrenheit è: {temp}°F")

# Se la prima condizione è falsa, verifica se l'utente ha scelto Fahrenheit
elif unit == "F":

    # Conversione da Fahrenheit a Celsius
    # Formula: C = (F - 32) * 5 / 9
    temp = round((temp - 32) * 5 / 9, 1)

    # Visualizza la temperatura convertita
    print(f"La temperatura in Celsius è: {temp}°C")

# Se nessuna delle due condizioni è vera, l'unità inserita non è valida
else:

    # Segnala un errore nella scelta dell'unità di misura
    print(f"{unit} non è un'unità di misura valida")


```

## **2. Come funziona la struttura if..elif..else**

La struttura condizionale permette al programma di scegliere quale blocco di istruzioni eseguire.

**Schema logico**

**IF** – Prima condizione

`unit == "C"`

VERO

Esegue la conversione Celsius → Fahrenheit

ALTRIMENTI

**ELIF** – Seconda condizione

`unit == "F"`

VERO

Esegue la conversione Fahrenheit → Celsius

ALTRIMENTI

**ELSE** – Nessuna condizione verificata

Visualizza un messaggio di errore

Ricordiamo tre regole:

1. `if`: verifica la prima condizione.
2. `elif`: verifica un'altra condizione, solo se quelle precedenti sono false. Si possono utilizzare più `elif`.
3. `else`: viene eseguito quando nessuna delle condizioni precedenti è vera.

**Attenzione:** viene eseguito un solo ramo della struttura condizionale.

## **3. Esercizio applicativo – Classificazione dei tentativi di accesso**

Esercitazione ITS Cybersecurity

Livello base

**Titolo:** Sistema di valutazione dei tentativi di accesso falliti.

## **Scenario**

Un sistema informatico registra il numero di tentativi di autenticazione falliti effettuati da un utente.

Vogliamo realizzare un semplice programma Python che analizzi il numero di tentativi e restituisca un messaggio in base al livello di rischio.

## **Traccia**

Scrivere un programma Python che:

1. Chieda all'utente il numero di tentativi di accesso falliti.
2. Acquisisca il valore come numero intero.
3. Valuti il numero di tentativi utilizzando `if..elif..else`.
4. Visualizzi un messaggio appropriato.

## **Regole da implementare**

| Tentativi falliti | Classificazione | Messaggio                        |
| ----------------- | --------------- | -------------------------------- |
| 0 – 2             | Normale         | Attività nella norma             |
| 3 – 5             | Sospetto        | Attenzione: attività sospetta    |
| Oltre 5           | Critico         | Accesso temporaneamente bloccato |

```python

# scrivere il codice Python per classificare i tentativi di accesso falliti








```

## **4. Proviamo a eseguire il programma**

**Simulatore di accesso**

Inserisci un numero di tentativi falliti per verificare il comportamento del programma.

RISULTATO

Sospetto

Attenzione: attività sospetta

## **5. Domande per gli studenti**

1. Che cosa succede se il numero di tentativi è uguale a 2?
2. Che cosa succede se il numero di tentativi è uguale a 5?
3. Perché utilizziamo `elif` anziché tre `if` separati?
4. Che cosa succederebbe se eliminassimo il ramo `else`?
5. Come modificheresti il programma per bloccare l'accesso dopo 10 tentativi, distinguendo tra livello di attenzione e livello critico?

**Estensione facoltativa:** chiedere anche il nome utente e visualizzarlo nel messaggio di allarme utilizzando le f-string.

**Obiettivo didattico:** consolidare l'utilizzo delle condizioni, degli operatori di confronto (`>=`, `<=`, `>`) e degli operatori logici (`and`), applicandoli a uno scenario introduttivo di cybersecurity.
