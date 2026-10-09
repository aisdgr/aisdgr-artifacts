# Source map

## Source baselines

| Source                           | Reference                                                               |
| -------------------------------- | ----------------------------------------------------------------------- |
| Legacy artifact repository       | `aisdgr/templates` (local audit path `D:\github\writings\templates`)    |
| Final legacy commit              | `c36fb8df4221195b4c4a9801e8911a0af2378b83`                              |
| Paper and terminology repository | [`aisdgr/papers`](https://github.com/aisdgr/papers)                     |
| Papers reference inspected       | `23dbcd6cdb2770c22b39e263f1a5072df922a856`                              |
| Curated repository               | [`aisdgr/aisdgr-artifacts`](https://github.com/aisdgr/aisdgr-artifacts) |

## Final-path mapping

| New path                                   | Legacy path       | Source commit | Treatment                                           | Research association |
| ------------------------------------------ | ----------------- | ------------- | --------------------------------------------------- | -------------------- |
| `rule_library/schema/`                     | `aisdgr/schema/`  | `c36fb8d…`    | Byte-preserving move                                | BRA                  |
| `rule_library/rules/`                      | `aisdgr/rules/`   | `c36fb8d…`    | Byte-preserving move                                | BRA                  |
| `rule_library/ruleset/`                    | `aisdgr/ruleset/` | `c36fb8d…`    | Byte-preserving move; inherited findings documented | BRA                  |
| `specification_templates/schema/*.yaml`    | `templates/*.yaml` | `c36fb8d…`   | Byte-preserving move                                | VSS                  |
| `specification_templates/examples/*.md`    | `templates/*.md`   | `c36fb8d…`   | Replaced with concrete, newly authored examples     | VSS                  |
| `archive/history/`                         | `history/`        | `c36fb8d…`    | Byte-preserving move of complete selected snapshot  | Historical research  |
| Repository navigation and provenance files | None              | New curation  | Newly authored                                      | Repository-level     |

The pre-layout reconstructed commits record selected legacy source SHAs through
`Original-Commit`, `Original-Date`, and `Source-Branch` trailers. They form a
new linear public history; they are not cherry-picked commits and do not retain
legacy authorship, timestamps, hashes, merges, refs, or reflogs.

## Materially curated or excluded

- The repository license begins with CC BY 4.0. Legacy MIT/proprietary license
  transitions were not imported.
- Development-only chat exports, task/TODO/plan files, migration notes, and
  stash-style experimental branches were excluded.
- Product-specific `.copilot-instructions.md` was excluded from the prompt-era
  checkpoint.
- Generated validation-result examples were omitted from early reconstructed
  checkpoints when the plan identified them as nonessential. R22 then aligned
  current BRA content to the verified final source tree; the final source's
  intentional deletion of `aisdgr/ruleset/code.test.fix.validation.yaml` is
  retained.
- Final-source `aigdmm/` overview files are not classified as current BRA, VSS,
  or confirmed shared artifacts, so they are absent from the public-layout
  tree. Selected AIGDMM/TES evolution remains visible in earlier reconstructed
  commits and in historical AIGM material.
- No source article text was copied into this repository.

## Content changes

Imported artifact bytes were not rewritten during the final layout move.
Newly authored README, citation, ignore, line-ending, source-map, validation,
and checksum files are repository curation material. See
[`VALIDATION.md`](VALIDATION.md) for known source inconsistencies.

The six Markdown VSS authoring templates were subsequently replaced by a
coherent Identity Service example and renamed from `*.template.md` to
`*.example.md`. The YAML template definitions remain byte-preserving imports.
