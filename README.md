# LiU CSS Thesis Quarto Template

This repository provides a Quarto template for the **Linköping University Master's Thesis in Computational Social Science (IEI)**.

The template uses the official `liuthesis.cls` LaTeX class and automatically generates the required `settings.tex` file during rendering.

## Usage

All thesis metadata should be filled in the **YAML header of `template.qmd`**.

Example:

```yaml
msc-thesis:
  author-name: "Your Name"
  publication-year: "2026"
  thesis-number: "001"
  department: "Institutionen för ekonomisk och industriell utveckling"
  department-english: "Department of Management and Engineering"
  department-short: "IEI"
  area: "FILFAK"
  thesis-subject: "Computational Social Science"
  thesis-subject-english: "Computational Social Science"
  keywords: "computational social science, symbolic boundaries"
  keywords-swedish: ""
  title-english: "Your Thesis Title"
  title-swedish: ""
  subtitle-english: "Subtitle"
  subtitle-swedish: ""
  supervisor: "Supervisor Name"
  examiner: "Examiner Name"
```

The rendering process will:
- Read thesis metadata from the YAML header
- Automatically generate settings.tex
- Compile the document using liuthesis.cls

# Notes
- All configuration should be done in the YAML header of `template.qmd` unless you know what you are editing.
- The abstract and acknowledgments are written separately in `abstract.tex` and `acknowledgments.tex`. Edit those files to change these sections.