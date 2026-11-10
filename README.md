# Master’s Thesis — The Keel–Mori Theorem

Jonathan Wassermann

A master's thesis on Deligne–Mumford stacks and coarse moduli spaces,
with an emphasis on descent, finite-group quotients, and
local-to-global constructions.

## Download the thesis

- [Download latest PDF](https://github.com/jonathanwa01/Masterarbeit/releases/latest/download/thesis.pdf)

The document is a working draft and may contain incomplete arguments or material subject to revision.

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
chmod +x .scripts/build.sh
./scripts/build.sh
```

The generated PDF is:

```text
Masterarbeit/main.pdf
```

The script runs PDFLaTeX, Biber, and further PDFLaTeX passes to resolve the bibliography and cross-references up to a maximum of 5 reruns.

## Repository structure

```text
.
├── .github/
│   └── workflows/
│       ├── ci.yml            # Continuous integration
│       └── release.yml       # Release publishing
├── Masterarbeit/             # LaTeX sources and supporting files
├── scripts/
│   └── build.sh              # Local and CI build script
│   └── reference-check.sh    # Local script to list unused references
│   └── reference-check.sh    # test tex file to run reference checker
├── LICENSE
└── README.md
```

## GitHub Actions

The repository has separate workflows for pull-request checks and releases:

- **CI** ([`ci.yml`](.github/workflows/ci.yml)) runs for pull requests targeting
  `main`. It builds the thesis, checks the LaTeX log for errors and unresolved
  references, and uploads the PDF and build logs as artifacts for 14 days.
- **Release** ([`release.yml`](.github/workflows/release.yml)) runs when a
  version tag such as `v1.2.3` or `v1.2.3-rc1` is pushed. It verifies the
  tagged commit is on `main`, builds and checks the thesis, then creates a
  GitHub release with versioned and latest-name PDF assets. Tags containing a
  hyphen are published as prereleases.

Ordinary pushes to branches do not trigger either workflow.

[View workflow runs](https://github.com/jonathanwa01/Masterarbeit/actions)

## Author

Jonathan Wassermann  
[GitHub](https://github.com/jonathanwa01)

## License

See [LICENSE](LICENSE) for the repository's license terms.