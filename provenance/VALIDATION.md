# Validation report

This report distinguishes mechanical validity from conceptual consistency. It
documents inherited source findings rather than silently changing historical or
current artifact semantics.

## Checks performed

- Parsed every included `.yaml` and `.yml` document with PyYAML.
- Compared R21 and R22 selected trees with their recorded legacy source trees.
- Checked ruleset `rule_id` references against IDs declared by current rule
  files.
- Checked relative Markdown links in current repository documentation.
- Scanned for private-key headers, common access-token forms, password/API-key
  assignments, personal filesystem paths, old license text, and unexpected
  license files.
- Generated SHA-256 checksums for the published tree.

## Public-layout checkpoint results

- 250 YAML files parsed successfully; no syntax errors were reported.
- The five moved artifact subtrees (`rule_library/schema`,
  `rule_library/rules`, `rule_library/ruleset`,
  `specification_templates/templates`, and `archive/history`) have the same
  Git tree objects as their mapped paths at legacy commit `c36fb8d…`.
- Thirteen relative links in 17 current/navigation Markdown files were checked;
  none were broken. Historical archive links were not rewritten and are outside
  this current-link assertion.
- The ruleset index names 20 YAML files; all 20 exist. The rules catalog
  declares 112 distinct rule IDs with no ID duplicated across files.
- The checksum manifest contains 374 entries and verifies successfully.
- Both BRA publication links, both VSS publication links, and the
  `aisdgr/papers` repository returned HTTP 200 during the 2026-10-09 check.
- Exactly one license file was found. The old MIT/proprietary license-text and
  sensitive-pattern scans produced no artifact-content findings.

## Ruleset reference findings

At the R21 source checkpoint, the 20 active ruleset YAML files contain 563 rule
reference occurrences covering 111 distinct IDs. Thirty-nine distinct IDs (221
occurrences) do not exactly match an ID in the imported current rule catalog:

- `CODE-AR-01` through `CODE-AR-05`
- `CODE-BD-01` through `CODE-BD-06`
- `CODE-CN-01` through `CODE-CN-03`
- `CODE-LG-01` through `CODE-LG-09`
- `CODE-ST-01` through `CODE-ST-05`
- `CODE-TI-01` through `CODE-TI-05`
- `CODE-TR-01` through `CODE-TR-05`
- `SPEC-ST-P01`

The CODE catalog uses IDs with concrete/pattern qualifiers such as
`CODE-BD-C01` and `CODE-BD-P01`, while the rulesets use the earlier unqualified
form. `SPEC-ST-P01` has no corresponding file in the selected SPEC catalog.
These references are therefore unresolved unless a consumer supplies an
explicit compatibility mapping. No mapping is asserted here.

The ruleset index also presents dotted IDs such as `code.source.add` and
`code.test.add`, while the YAML payloads declare underscore forms such as
`source_code.add` and `test_code.add`. Seven CODE rulesets exhibit this naming
difference. Filenames follow the dotted index convention except for the
inherited `code.test.change.ruleset.yaml` suffix.

## Terminology and status

- Current paper terminology is **Behavior Rule Architecture**, not the older
  “AI Struct Language” wording retained in some imported material.
- Historical AIDDM/AIGD/AIGM terms are intentionally unmodified.
- The VSS templates are identified as implementations associated with VSS, not
  as proof of formal conformance or standards status.
- No artifact was placed in a shared BRA/VSS area without evidence of joint
  use.

## Limitations

YAML parsing establishes syntax validity only. It does not establish schema
conformance, semantic correctness, rule compatibility, or executable safety.
Historical Markdown may contain context-dependent examples or links that were
meaningful only in its original repository layout. External DOI and repository
links are publication references; their long-term availability is outside this
repository's control.
