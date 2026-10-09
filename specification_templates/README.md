# Viewpoint-Structured Specification artifacts

This directory contains implementation templates associated with
**Viewpoint-Structured Specification (VSS)**. VSS structures intent as a
versioned, multi-viewpoint specification before AI-assisted code generation.

Start with the machine-readable definitions in [`schema/`](schema/), then use
the corresponding Markdown authoring examples in [`examples/`](examples/).
Six specification families are supplied in both forms:

- CAS — Coding Architecture Specification
- CIS — Coding Implementation Specification
- CSS — Coding Style Specification
- SDS — Software Design Specification
- SRS — Software Requirements Specification
- STS — Software Test Specification

These are reference implementations inherited from legacy source commit
`c36fb8df4221195b4c4a9801e8911a0af2378b83`. Their presence does not by itself
declare a normative standard or a complete VSS conformance suite.

The files in `examples/` retain template placeholders such as `{{purpose}}`.
They illustrate the expected Markdown structure and are not completed,
project-specific specifications.

Paper: [Viewpoint-Structured Specification](https://doi.org/10.5281/zenodo.18930951).
