# Ambiente Python 3.12

## Verifica dell'installazione

```bash
python3.12 --version
```

Su Windows è possibile usare:

```powershell
py -3.12 --version
```

## Creazione di un ambiente virtuale

```bash
python3.12 -m venv .venv
```

Attivazione su Linux/macOS:

```bash
source .venv/bin/activate
```

Attivazione su Windows PowerShell:

```powershell
.venv\Scripts\Activate.ps1
```

Disattivazione:

```bash
deactivate
```

## Esecuzione di uno script

```bash
python nome_script.py
```

L'uso di un ambiente virtuale permette di isolare gli strumenti e le dipendenze
dei diversi progetti didattici.
