# Ruleset Catalog

This directory contains the **AISDGR ruleset catalog**, which defines
**composable rule collections** for AI-assisted and automated
software engineering activities.

Rulesets are **scenario-driven compositions** of rules from a single domain.
They do not define new semantics — they only select, version, and
contextualize existing rules.

---

## 1. Design Principles

The AISDGR rulesets follow the following non-negotiable principles:

1. **Single-Domain Composition**
   Each ruleset composes rules from **exactly one domain** (CODE, SPEC, or LANG).
   Cross-domain application uses overlay composition at execution time.

2. **Version-Bound References**
   Rulesets reference rules by ID and version constraint.
   This ensures reproducibility and enables safe rule evolution.

3. **Context-Driven Applicability**
   Rulesets declare `applicability` constraints:
   - **CODE**: artifact type + intent (e.g., source_code.add)
   - **SPEC**: document type (e.g., srs, sds, sts)
   - **LANG**: programming language (e.g., go, java, python)

4. **Scenario-Encoded Selection**
   Rulesets encode usage scenarios through rule selection.
   Different scenarios (add/change/fix/refactor) select different
   rule combinations.

5. **Metadata-Only Governance**
   Ruleset `governance` sections contain **metadata only**:
   - Intent and purpose declarations
   - Responsibility assignments (ai/human/system)
   - Audit scope and risk category classifications
   - **NOT** normative constraints (those are in rules)

---

## 2. Ruleset ID Naming Convention

All rulesets follow the identifier format:

```
<domain>.<context>
```

Example:
- `source_code.add` (CODE domain, add scenario)
- `spec.srs` (SPEC domain, SRS document type)
- `lang.go` (LANG domain, Go language)

Where:
- **domain** indicates the primary domain:
  - `source_code` / `test_code` — CODE domain
  - `spec` — SPEC domain
  - `lang` — LANG domain
- **context** indicates the applicability context:
  - CODE: intent (add, change, fix, refactor, execution)
  - SPEC: document type (srs, sds, sts, cas, cis, css)
  - LANG: language code (go, java, javascript, typescript, python, rust)

---

## 3. Ruleset Classification Overview

| Domain | Organization Principle | Ruleset Count | Description |
| ------ | ---------------------- | ------------- | ----------- |
| CODE   | Artifact × Intent       | 8             | Source/test code scenarios |
| SPEC   | Document Type           | 6             | Specification document types |
| LANG   | Programming Language    | 6             | Language coding standards |
| **Total** | —                   | **20**        |             |

---

## 4. Ruleset Catalog

### CODE Rulesets (8)

Rulesets for code generation and modification scenarios.

| Ruleset ID           | Artifact    | Intent    | Rule Count | Description |
| -------------------- | ----------- | --------- | ---------- | ----------- |
| source_code.add      | source_code | add       | 28         | Adding new source code |
| source_code.change   | source_code | change    | 27         | Modifying existing code |
| source_code.fix      | source_code | fix       | 31         | Bug fixes and corrections |
| source_code.refactor | source_code | refactor  | 32         | Structural improvements |
| test_code.add        | test_code   | add       | 32         | Adding new tests |
| test_code.change     | test_code   | change    | 32         | Modifying existing tests |
| test_code.fix        | test_code   | fix       | 32         | Fixing test issues |
| test.execution       | test_code   | execution | 11         | Test execution validation |

### SPEC Rulesets (6)

Rulesets for specification document generation.

| Ruleset ID | Document Type | Rule Count | Description |
| ---------- | ------------- | ---------- | ----------- |
| spec.srs   | srs           | 44         | Software Requirements Specification |
| spec.sds   | sds           | 44         | Software Design Specification |
| spec.sts   | sts           | 44         | Software Test Specification |
| spec.cas   | cas           | 44         | Coding Architecture Specification |
| spec.cis   | cis           | 44         | Coding Implementation Specification |
| spec.css   | css           | 44         | Coding Style Specification |

Each SPEC ruleset includes:
- TR(6) + BD(7) + AR(5) + ST(6) + CN(3) + LG(9) + CC(7) = 44 rules

### LANG Rulesets (6)

Rulesets for language-specific coding standards.

| Ruleset ID      | Language   | Rule Count | Composition |
| --------------- | ---------- | ---------- | ----------- |
| lang.go         | Go         | 13         | 11 Pattern + 2 Concrete |
| lang.java       | Java       | 15         | 11 Pattern + 4 Concrete |
| lang.javascript | JavaScript | 14         | 11 Pattern + 3 Concrete |
| lang.typescript | TypeScript | 14         | 11 Pattern + 3 Concrete |
| lang.python     | Python     | 14         | 11 Pattern + 3 Concrete |
| lang.rust       | Rust       | 14         | 11 Pattern + 3 Concrete |

---

## 5. Ruleset Structure

Every ruleset YAML follows this structure:

```yaml
ruleset:
  id: <ruleset_id>

  # Included Rules (from single domain)
  includes:
    - rule_id: <RULE-ID>
      version: ">=1.0.0"
    # ... more rule references

  # Applicability Constraints
  applicability:
    domain: [<domain>]
    # Domain-specific constraints:
    # CODE: artifact_type, intent
    # SPEC: document_type, stage
    # LANG: language, stage

  # Governance Metadata
  governance:
    version: "1.0.0"
    status: draft | active | deprecated
    owner: aisdgr

    intent:
      purpose: [...]
      notes: [...]

    responsibilities:
      ai: [...]
      human: [...]
      system: [...]

    governance_impact:
      audit_scope: [...]
      reporting: [...]
      risk_category: [...]
```

---

## 6. Cross-Domain Composition

Rulesets from different domains are applied together as overlays:

```
CODE ruleset + LANG ruleset = Full coding constraints
  Example: source_code.add + lang.go

CODE ruleset + SPEC ruleset = Mutually exclusive
  (Different execution paths, not applied together)

SPEC ruleset + LANG ruleset = Not applicable
  (Different artifact types)
```

**Overlay Behavior:**
- Rules from each ruleset are additive
- No rule priority or override mechanisms
- Conflicts are design errors (should not exist)

---

## 7. Versioning and Evolution

- **Ruleset Version**: Tracks ruleset structure changes
- **Rule Version Constraints**: Each rule reference specifies
  acceptable version range (e.g., `">=1.0.0"`)
- **Stability**: Rule IDs never change; ruleset IDs never change
- **Deprecation**: Rulesets can be deprecated but not deleted

---

## 8. Summary

The AISDGR ruleset catalog provides **scenario-driven rule composition**
for AI-assisted software engineering.

Rulesets bridge the gap between **domain-specific rules** and
**context-specific application** without introducing new semantics.

If you need to compose rules across domains, apply multiple rulesets
as overlays at execution time.
