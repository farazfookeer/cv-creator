#!/usr/bin/env bash
# check-deps.sh — verify pandoc + a PDF engine are installed.
# Exits 0 if Markdown-only is OK; 0 if both PDF + DOCX paths are available;
# 2 if pandoc missing entirely.

set -e

missing=0
have_pandoc=0
have_pdf_engine=0
pdf_engine=""

if command -v pandoc >/dev/null 2>&1; then
  have_pandoc=1
  echo "✓ pandoc: $(pandoc --version | head -n1)"
else
  echo "✗ pandoc: not found"
  missing=1
fi

for engine in xelatex lualatex pdflatex tectonic wkhtmltopdf weasyprint; do
  if command -v "$engine" >/dev/null 2>&1; then
    have_pdf_engine=1
    pdf_engine="$engine"
    echo "✓ PDF engine: $engine ($(command -v "$engine"))"
    break
  fi
done

if [ $have_pdf_engine -eq 0 ]; then
  echo "✗ PDF engine: none of {xelatex, lualatex, pdflatex, tectonic, wkhtmltopdf, weasyprint} found"
fi

echo

if [ $missing -eq 1 ]; then
  echo "Pandoc is required to build PDF or DOCX from Markdown."
  echo
  echo "Install:"
  case "$(uname -s)" in
    Darwin)  echo "  brew install pandoc" ;;
    Linux)   echo "  sudo apt install pandoc        # Debian/Ubuntu"
             echo "  sudo dnf install pandoc        # Fedora/RHEL" ;;
    *)       echo "  See https://pandoc.org/installing.html" ;;
  esac
  exit 2
fi

if [ $have_pdf_engine -eq 0 ]; then
  echo "PDF generation needs a TeX engine (recommended: xelatex via TeX Live)."
  echo "DOCX will still work without a TeX engine."
  echo
  echo "Install a TeX engine:"
  case "$(uname -s)" in
    Darwin)  echo "  brew install --cask mactex-no-gui     # ~1.5 GB, full"
             echo "  brew install --cask basictex          # smaller, then: sudo tlmgr install collection-fontsrecommended xetex" ;;
    Linux)   echo "  sudo apt install texlive-xetex texlive-fonts-recommended texlive-latex-extra" ;;
    *)       echo "  https://tug.org/texlive/" ;;
  esac
  echo
  echo "Or use an HTML→PDF fallback engine:"
  case "$(uname -s)" in
    Darwin)  echo "  brew install weasyprint" ;;
    Linux)   echo "  pip install weasyprint" ;;
  esac
  exit 1
fi

echo "All build dependencies satisfied."
echo "PDF engine: $pdf_engine"
exit 0
