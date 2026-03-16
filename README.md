# LiU CSS Thesis Quarto Template

This repository provides a **Quarto extension for writing a Master's thesis in Computational Social Science at Linköping University**.

The template uses the official `liuthesis.cls` LaTeX class and automatically generates the required `settings.tex` file during rendering.

## Usage

All thesis metadata should be filled in the **YAML header of `template.qmd`**.

Example:

```yaml
msc-thesis:
  author-name: "Your Name"
  publication-year: "Spring 2026"
  thesis-number: "00001"
  department-english: "Department of Management and Engineering"
  department-short: "IEI"
  area: "FIL"
  thesis-subject: "Master's programme"
  title-english: "Your Thesis Title"
  subtitle-english: "Subtitle"
  supervisor: "Supervisor Name"
  examiner: "Examiner Name"

format: liu-css-thesis-pdf
bibliography: references.bib
```

The rendering process will:
- read thesis metadata from the YAML header
- generate `settings.tex`
- compile the PDF document using `liuthesis.cls`

# Notes
- All configuration should be done in the YAML header of `template.qmd`, unless you know what you are editing.
- The abstract and acknowledgments are written separately in `abstract.tex` and `acknowledgments.tex`. Edit these files to modify these sections.