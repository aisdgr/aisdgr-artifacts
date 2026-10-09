# Viewpoint-Structured Specification artifacts

This directory contains implementation templates associated with
**Viewpoint-Structured Specification (VSS)**. VSS structures intent as a
versioned, multi-viewpoint specification before AI-assisted code generation.

Start with the machine-readable definitions in [`schema/`](schema/), then read
the corresponding concrete Identity Service examples in
[`examples/`](examples/). Six specification families are supplied in both
forms:

- CAS — Coding Architecture Specification
- CIS — Coding Implementation Specification
- CSS — Coding Style Specification
- SDS — Software Design Specification
- SRS — Software Requirements Specification
- STS — Software Test Specification

The YAML template definitions are inherited from legacy source commit
`c36fb8df4221195b4c4a9801e8911a0af2378b83`. The Markdown files form a newly
authored, internally consistent example covering login, user management,
role-based authorization, and JWT access tokens. Their presence does not by
itself declare a normative standard or a complete VSS conformance suite.

The example is fictional and uses reserved `.test` email addresses. It contains
no deployable credentials or production configuration. Begin with
[`srs.example.md`](examples/srs.example.md), then follow the requirement and
test IDs across CAS, CIS, CSS, SDS, and STS.

Paper: [Viewpoint-Structured Specification](https://doi.org/10.5281/zenodo.18930951).
