# Rendered example outputs

Pre-built PDF + DOCX versions of the example CVs in `../`, generated via:

```bash
bash skills/cv-creator/scripts/build.sh skills/cv-creator/examples/<name>.md \
     skills/cv-creator/examples/rendered
```

Use these to preview what the skill produces without installing pandoc + weasyprint locally.

## Pipeline used to generate these

- **pandoc** 3.9
- **weasyprint** 68.1 (HTML→PDF fallback path)

A LaTeX-based render (xelatex via MacTeX) will produce typographically nicer PDFs and is the default if a TeX engine is installed.

## Note on staleness

These files are checked-in artifacts of the source `.md` files. If a template, style, or example is edited, **regenerate**:

```bash
bash skills/cv-creator/scripts/build.sh skills/cv-creator/examples/tech-us.md \
     skills/cv-creator/examples/rendered
# repeat for nurse-uae.md and academic-uk.md
```

CI could be added later to rebuild on PRs that touch templates or examples.
