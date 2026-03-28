# LiU CSS Thesis Quarto Template

A Quarto extension for writing a Master's thesis in Computational Social Science at Linköping University (FilFak). The template uses a streamlined version of the official `liuthesis.cls` and automatically generates the required `settings.tex` during rendering.

## Quick Start

1. Fill in your thesis metadata in the YAML header of `template.qmd`.
2. Write your abstract in `abstract.tex`.
3. Write your acknowledgments in `acknowledgments.tex` (or disable them via `show-acknowledgments: false`).
4. Edit `ai_statement.tex` and `ethics_statement.tex` as needed.
5. Render with `quarto render template.qmd`.

## YAML Metadata Reference

All metadata goes in the `msc-thesis` block of `template.qmd`:

```yaml
msc-thesis:
  author-name: "Your Name"
  publication-year: "Spring 2026"
  thesis-number: "00001"
  department-english: "Department of Management and Engineering"
  department-short: "IEI"
  area: "FIL"
  thesis-subject: "Master's programme in Computational Social Science"
  title-english: "Your Thesis Title"
  subtitle-english: "Your Subtitle"
  supervisor: "Supervisor Name"
  examiner: "Examiner Name"

format: liu-css-thesis-pdf
bibliography: references.bib
```

### All supported fields

| Field | Description | Required |
|---|---|---|
| `author-name` | Full name of the author | Yes |
| `publication-year` | E.g. `"Spring 2026"` | Yes |
| `thesis-number` | Sequential thesis number for the year | Yes |
| `department-english` | Full English department name | Yes |
| `department-short` | Short department code (e.g. `IEI`) | Yes |
| `area` | Subject area code (e.g. `FIL`) | Yes |
| `thesis-subject` | Programme name shown on title page | Yes |
| `title-english` | Thesis title in English | Yes |
| `subtitle-english` | Subtitle in English | No |
| `title-swedish` | Thesis title in Swedish | No |
| `subtitle-swedish` | Subtitle in Swedish | No |
| `supervisor` | Name of main supervisor | Yes |
| `examiner` | Name of examiner | Yes |
| `keywords` | Comma-separated keywords (English) | No |
| `keywords-swedish` | Comma-separated keywords (Swedish) | No |
| `thesis-subject-english` | English subject label (defaults to `thesis-subject`) | No |
| `show-acknowledgments` | `true` (default) or `false` | No |

### Optional features

**Dedication** — add `\dedication{For someone}` in `settings.tex` (generated file; add it after re-generating or use a separate LaTeX include).

**External supervisor** — add `\externalsupervisor{Name}` in `settings.tex`.

**Swedish thesis** — add `lang: sv` to the YAML header; the title page and front matter will switch to Swedish labels.

**Printer-friendly mode** — add `classoption: printerfriendly` to the YAML header to force chapters to start on odd pages.

## File Reference

| File | Purpose |
|---|---|
| `template.qmd` | Main document: YAML metadata + thesis chapters |
| `references.bib` | BibTeX bibliography |
| `abstract.tex` | Abstract text (no heading needed) |
| `acknowledgments.tex` | Acknowledgments (heading included) |
| `ai_statement.tex` | Generative AI declaration |
| `ethics_statement.tex` | Ethics compliance statement |

### Extension files (no need to edit normally)

| File | Purpose |
|---|---|
| `_extensions/liu-css-thesis/liuthesis.cls` | LaTeX document class |
| `_extensions/liu-css-thesis/hyperpdfx.sty` | PDF/A compliance package |
| `_extensions/liu-css-thesis/write-settings.lua` | Lua filter: reads YAML and writes `settings.tex` |
| `_extensions/liu-css-thesis/include-settings.tex` | Inputs the generated `settings.tex` |
| `_extensions/liu-css-thesis/_extension.yml` | Quarto extension configuration |
| `_extensions/liu-css-thesis/asa.csl` | ASA citation style |
| `_extensions/liu-css-thesis/figures/` | LiU logo files |

## How It Works

1. `write-settings.lua` reads `msc-thesis` metadata from the YAML header and writes `settings.tex` with the corresponding LaTeX commands.
2. `include-settings.tex` (loaded via `include-in-header`) inputs `settings.tex` into the LaTeX preamble.
3. `liuthesis.cls` uses these commands to build the title page, ISRN number, and front matter.
4. XeLaTeX compiles the document with PDF/A compliance via `hyperpdfx`.

## Notes

- Do not edit `settings.tex` directly — it is overwritten on every render.
- The PDF engine is XeLaTeX. Georgia font is used for the title page if available on your system.
- Citations use ASA style by default. To change it, replace the `csl` field in `_extension.yml`.
