#!/usr/bin/env bash
# build.sh — convert a Markdown CV into PDF + DOCX via pandoc.
# Usage: build.sh <cv.md> [output-dir]
#
# Produces:
#   <output-dir>/<basename>.pdf
#   <output-dir>/<basename>.docx
#
# Output dir defaults to the input file's directory.

set -e

if [ $# -lt 1 ]; then
  echo "Usage: $0 <cv.md> [output-dir]" >&2
  exit 1
fi

input="$1"
if [ ! -f "$input" ]; then
  echo "Error: input file not found: $input" >&2
  exit 1
fi

out_dir="${2:-$(dirname "$input")}"
mkdir -p "$out_dir"

base="$(basename "$input" .md)"
pdf="$out_dir/$base.pdf"
docx="$out_dir/$base.docx"

# Resolve skill dir so styles/ is found regardless of caller's cwd.
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
skill_dir="$(dirname "$script_dir")"
css="$skill_dir/styles/classic.css"
html_template="$skill_dir/styles/cv.html5"

if ! command -v pandoc >/dev/null 2>&1; then
  echo "Error: pandoc not installed. Run: bash $script_dir/check-deps.sh" >&2
  exit 2
fi

# --- DOCX ---
echo "Building DOCX → $docx"
pandoc "$input" -o "$docx" --standalone

# --- PDF ---
# Prefer xelatex; fall back to other engines; final fallback to HTML→PDF via weasyprint.
pdf_built=0
for engine in xelatex lualatex tectonic pdflatex; do
  if command -v "$engine" >/dev/null 2>&1; then
    echo "Building PDF (via $engine) → $pdf"
    pandoc "$input" -o "$pdf" \
      --pdf-engine="$engine" \
      -V geometry:margin=0.75in \
      -V mainfont="Helvetica" \
      -V fontsize=10pt \
      --standalone || {
        echo "Warning: $engine build failed; trying next engine." >&2
        continue
      }
    pdf_built=1
    break
  fi
done

if [ $pdf_built -eq 0 ] && command -v weasyprint >/dev/null 2>&1; then
  echo "Building PDF (HTML→PDF via weasyprint) → $pdf"
  html_tmp="$out_dir/$base.html"
  pandoc "$input" -o "$html_tmp" \
    --standalone \
    --template="$html_template" \
    --css="$css"
  weasyprint "$html_tmp" "$pdf"
  rm -f "$html_tmp"
  pdf_built=1
fi

if [ $pdf_built -eq 0 ]; then
  echo "Warning: no PDF engine available. DOCX written but PDF skipped." >&2
  echo "Run: bash $script_dir/check-deps.sh   # for install instructions"
  exit 1
fi

echo
echo "✓ Done."
echo "  PDF:  $pdf"
echo "  DOCX: $docx"
