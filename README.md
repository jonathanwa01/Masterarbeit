# Master’s Thesis — The Keel–Mori Theorem

Jonathan Wassermann

A master's thesis on Deligne–Mumford stacks and coarse moduli spaces,
with an emphasis on descent, finite-group quotients, and
local-to-global constructions.

## Mathematical focus

- Delign-Mumford stacks and coarse moduli spaces
- Descent and the reconstruction of global objects from local data
- Quotients by finite groups and invariant rings
- Étale local constructions and gluing
- The Keel–Mori theorem

The exposition follows an approach informed by Jarod Alper's notes.

## Build locally

### Requirements

- Bash
- A LaTeX distribution providing `pdflatex` and the required packages
- Biber

From the repository root, run:

```bash
chmod +x build.sh
./build.sh
```

The generated PDF is:

```text
Masterarbeit/main.pdf
```

The script runs PDFLaTeX, Biber, and two further PDFLaTeX passes
to resolve the bibliography and cross-references.

## Repository structure

```text
.
├── .github/
│   └── workflows/
│       └── build-thesis.yml   # Compilation and PDF release publishing
├── Masterarbeit/             # LaTeX sources and supporting files
├── build.sh                  # Local and CI build script
├── LICENSE
└── README.md
```

## Automated publication

GitHub Actions compiles the thesis whenever `main` is updated and
publishes the resulting PDF as a downloadable release asset.

The workflow:

1. Installs the LaTeX build dependencies.
2. Compiles the thesis using `./build.sh`.
3. Uploads the PDF as a workflow artifact.
4. Publishes the PDF to the latest GitHub release.

Feature-branch pushes do not trigger this workflow.

[View workflow runs](https://github.com/jonathanwa01/Masterarbeit/actions)

## Author

Jonathan Wassermann  
[GitHub](https://github.com/jonathanwa01)

## License

See [LICENSE](LICENSE) for the repository's license terms.