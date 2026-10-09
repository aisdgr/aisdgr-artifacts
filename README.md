# AISDGR Artifacts

Public reference artifacts accompanying the Behavior Rule Architecture (BRA)
and Viewpoint-Structured Specification (VSS) research series. The papers and
their revision histories remain in the separate
[`aisdgr/papers`](https://github.com/aisdgr/papers) repository; this repository
contains schemas, rules, rulesets, implementation templates, and research
snapshots.

## Start here

| Area | Purpose | Status |
| --- | --- | --- |
| [`bra/`](bra/) | BRA language, representation, rule, and ruleset artifacts | Reference implementation; source status varies by file |
| [`vss/`](vss/) | VSS specification-template implementations | Reference templates, not a standards declaration |
| [`archive/`](archive/) | Historical AIDDM, AIGD, and AIGM snapshots | Historical research material; not current guidance |
| [`provenance/`](provenance/SOURCE-MAP.md) | Source mapping, exclusions, and validation findings | Repository-maintenance evidence |

There is no `shared/` directory at this time. No imported artifact was
confirmed as jointly normative for both BRA and VSS merely because the two
research lines are related.

## Papers

- **Behavior Rule Architecture: Rule-Based Governance of AI System Behavior**:
  [paper repository](https://github.com/aisdgr/papers/blob/main/manuscripts/2026-03_behavior-rule-architecture_v1.0.md),
  [Zenodo DOI 10.5281/zenodo.19174636](https://doi.org/10.5281/zenodo.19174636),
  [engrXiv DOI 10.31224/6681](https://doi.org/10.31224/6681).
- **Viewpoint-Structured Specification (VSS)**:
  [paper repository](https://github.com/aisdgr/papers/blob/main/manuscripts/2026-03_viewpoint-structured-specification_v1.0.md),
  [Zenodo DOI 10.5281/zenodo.18930951](https://doi.org/10.5281/zenodo.18930951),
  [engrXiv DOI 10.31224/6612](https://doi.org/10.31224/6612).

## Version and status policy

Git commit identifiers are the authoritative versions of repository content.
A release or tag may provide a stable citation point in the future, but none is
implied by a historical directory name. Terms such as `normative`, `draft`, or
`example` retain only the meaning explicitly stated inside the source artifact;
directory placement alone does not grant standards status.

Current reference artifacts are under `bra/` and `vss/`. Files under
`archive/` preserve historical terminology and may conflict with current
concepts. See the [validation report](provenance/VALIDATION.md) before consuming
rulesets programmatically.

## License

This curated republication is licensed under the
[Creative Commons Attribution 4.0 International License](LICENSE). The license
applies to this repository as published; it does not assert that every stage of
the legacy source repository historically carried the same license.
