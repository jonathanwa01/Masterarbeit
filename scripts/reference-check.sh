#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR/Masterarbeit"

build_dir="$(mktemp -d "${TMPDIR:-/tmp}/reference-check.XXXXXX")"
trap 'rm -rf "$build_dir"' EXIT
log_file="${build_dir}/reference-check.log"


latexmk \
    -cd- \
    -pdf \
    -interaction=nonstopmode \
    -halt-on-error \
    "-outdir=${build_dir}" \
    ../scripts/reference-check.tex >/dev/null 2>&1

if [[ ! -f "$log_file" ]]; then
  printf 'Error: compilation log not found: %s\n' "$log_file" >&2
  exit 1
fi

if grep -E '^Package refcheck Warning: Unused label\b' "$log_file"; then
  printf '\nReference check failed: unused labels found.\n' >&2
  exit 1
else
  status=$?
  if [[ "$status" -ne 1 ]]; then
    printf 'Error: could not check the compilation log.\n' >&2
    exit "$status"
  fi
fi

printf 'No unused labels reported.\n'