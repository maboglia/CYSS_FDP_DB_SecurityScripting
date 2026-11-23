#!/usr/bin/env python3
"""
Crea un repository a partire da un manifesto JSON o TXT.

JSON:
{
  "project": "04-bash-scripting",
  "directories": ["dispense/01-..."],
  "files": [{"path": "README.md", "content": "# Titolo\n"}]
}

TXT:
  DIR<TAB>percorso/relativo
  FILE<TAB>percorso/relativo<TAB>contenuto (supporta escape \\n, \\t e \\\\)

Per impostazione predefinita non sovrascrive i file esistenti.
"""
from __future__ import annotations
import argparse
import json
import sys
from pathlib import Path


def safe_path(root: Path, relative: str) -> Path:
    rel = Path(relative)
    if rel.is_absolute() or ".." in rel.parts:
        raise ValueError(f"Percorso non consentito: {relative}")
    target = (root / rel).resolve()
    base = root.resolve()
    if target != base and base not in target.parents:
        raise ValueError(f"Percorso fuori dalla destinazione: {relative}")
    return target


def parse_text(path: Path) -> dict:
    directories, files = [], []
    for line_no, raw in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        if not raw.strip() or raw.lstrip().startswith("#"):
            continue
        parts = raw.split("\t", 2)
        kind = parts[0].strip().upper()
        if kind == "DIR" and len(parts) == 2:
            directories.append(parts[1].strip())
        elif kind == "FILE" and len(parts) == 3:
            # Decodifica solo le sequenze dichiarate, senza interpretare escape arbitrarie.
            content = parts[2].replace(r"\n", "\n").replace(r"\t", "\t").replace(r"\\", "\\")
            files.append({"path": parts[1].strip(), "content": content})
        else:
            raise ValueError(f"{path}:{line_no}: riga non valida")
    return {"directories": directories, "files": files}


def load_manifest(path: Path) -> dict:
    suffix = path.suffix.lower()
    if suffix == ".json":
        data = json.loads(path.read_text(encoding="utf-8"))
    elif suffix in {".txt", ".manifest"}:
        data = parse_text(path)
    else:
        raise ValueError("Formato non supportato: usare .json o .txt")
    if not isinstance(data, dict):
        raise ValueError("Il manifesto deve descrivere un oggetto")
    if not isinstance(data.get("directories", []), list) or not isinstance(data.get("files", []), list):
        raise ValueError("'directories' e 'files' devono essere liste")
    return data


def main() -> int:
    parser = argparse.ArgumentParser(description="Inizializza la struttura di un repository da JSON o TXT.")
    parser.add_argument("manifesto", type=Path, help="File .json o .txt con la struttura")
    parser.add_argument("-o", "--output", type=Path, default=Path("."), help="Directory in cui creare il progetto (default: corrente)")
    parser.add_argument("--project-name", help="Nome della cartella progetto; prevale sul campo project del JSON")
    parser.add_argument("--force", action="store_true", help="Sovrascrive i file già esistenti")
    parser.add_argument("--dry-run", action="store_true", help="Mostra le operazioni senza creare nulla")
    args = parser.parse_args()

    try:
        data = load_manifest(args.manifesto)
        project_name = args.project_name or data.get("project", "04-bash-scripting")
        if Path(project_name).name != project_name or project_name in {"", ".", ".."}:
            raise ValueError("Nome progetto non valido")
        root = (args.output / project_name).resolve()
        operations = []
        for directory in data.get("directories", []):
            if not isinstance(directory, str):
                raise ValueError("Ogni directory deve essere una stringa")
            operations.append(("DIR", safe_path(root, directory), None))
        for item in data.get("files", []):
            if not isinstance(item, dict) or not isinstance(item.get("path"), str):
                raise ValueError("Ogni file deve avere il campo 'path'")
            content = item.get("content", "")
            if not isinstance(content, str):
                raise ValueError(f"Il contenuto di {item['path']} deve essere testuale")
            operations.append(("FILE", safe_path(root, item["path"]), content))

        for kind, target, content in operations:
            if args.dry_run:
                print(f"[DRY-RUN] {kind}: {target}")
                continue
            if kind == "DIR":
                target.mkdir(parents=True, exist_ok=True)
                print(f"[DIR]  {target}")
            else:
                target.parent.mkdir(parents=True, exist_ok=True)
                if target.exists() and not args.force:
                    print(f"[SKIP] File già esistente: {target}")
                    continue
                target.write_text(content, encoding="utf-8")
                if target.suffix == ".sh":
                    target.chmod(target.stat().st_mode | 0o111)
                print(f"[FILE] {target}")
        if args.dry_run:
            print("Nessuna modifica effettuata.")
        else:
            print(f"Repository inizializzato in: {root}")
        return 0
    except (OSError, ValueError, json.JSONDecodeError) as exc:
        print(f"Errore: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
