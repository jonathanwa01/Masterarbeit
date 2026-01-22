#!/usr/bin/env bash
set -euo pipefail

# Go into the LaTeX project folder (relative to this script's location)
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/Masterarbeit"

# Build
pdflatex -synctex=1 -interaction=nonstopmode main.tex
biber main
pdflatex -synctex=1 -interaction=nonstopmode main.tex
pdflatex -synctex=1 -interaction=nonstopmode main.tex
