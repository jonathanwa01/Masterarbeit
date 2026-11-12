#!/usr/bin/env bash
set -euo pipefail

# Go into the LaTeX project folder (relative to this script's location)
ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR/Masterarbeit"

compile() {
  pdflatex -synctex=1 -interaction=nonstopmode -halt-on-error main.tex
}

compile
biber main

max_passes=5
for ((pass = 1; pass <= max_passes; pass++)); do
  compile
  if ! grep -qF 'Please rerun LaTeX' main.log; then
    exit 0
  fi
done

echo "LaTeX did not converge after $max_passes passes." >&2
exit 1
