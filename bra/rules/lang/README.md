# LANG Rule Catalog

This directory contains the **LANG rule catalog**, which defines
**language-level coding constraints** for AI-assisted and automated
code generation.

These rules are **language-agnostic by design** (Pattern Rules) combined
with **language-specific enforcement** (Concrete Rules).

They define **what coding practices are required or forbidden**,
not *why*, *when*, or *by whom* they should occur.

---

## 1. Design Principles

The LANG rules follow the following non-negotiable principles:

1. **Language-Level Only**
   Rules apply strictly to code generation behavior at the
   programming language level.
   They do not reference organizational policies, project-specific
   conventions, or external governance authorities.

2. **Pattern + Concrete Architecture**
   Rules are organized into two tiers:
   - **Pattern Rules** — Cross-language governance principles (11 rules)
   - **Concrete Rules** — Language-specific enforcement (18 rules)

3. **Safety-First and Explicit-Over-Implicit**
   All rules favor explicit, deterministic, and safe code patterns
   over implicit, magical, or unsafe behaviors.

4. **Composable and Reusable**
   Each rule is atomic and reusable across multiple rulesets.
   Pattern rules apply to all languages; concrete rules are
   selectively composed per language.

5. **Constraint-Based Governance**

   LANG rules are **all constraint-based (MUST NOT)**:
   - They define *hard prohibitions* for AI-generated code.
   - Any verified violation constitutes an **evidence-based quality trigger**.
   - Violations should be flagged, recorded, and addressed.

---

## 2. Rule ID Naming Convention

All rules in this directory follow the identifier format:

```
LANG-CC-<LANG>-<TYPE><NN>
```

Example:
- `LANG-CC-ALL-P01` (cross-language pattern rule)
- `LANG-CC-GO-C01` (Go-specific concrete rule)

Where:
- **LANG** indicates the language domain
- **CC** indicates Content Constraints category
- **LANG** indicates the language code:
  - **ALL** = Cross-language pattern
  - **GO** = Go
  - **JV** = Java
  - **JS** = JavaScript
  - **TS** = TypeScript
  - **PY** = Python
  - **RS** = Rust
- **TYPE** indicates the rule tier:
  - **P** = Pattern Rule (cross-language)
  - **C** = Concrete Rule (language-specific)
- **NN** is a sequential number within the tier

Rule IDs are **stable** and **never change** due to ruleset composition.

---

## 3. Rule Classification Overview

The LANG rule catalog uses **Pattern + Concrete architecture**:

| Tier     | Rule Count | Description                              |
| -------- | ---------- | ---------------------------------------- |
| Pattern  | 11         | Cross-language governance principles     |
| Concrete | 18         | Language-specific enforcement rules      |
| **Total**| **29**     |                                          |

### Pattern Rules (11)

Cross-language principles that apply to all programming languages.

| ID                  | Description                                    |
| ------------------- | ---------------------------------------------- |
| LANG-CC-ALL-P01     | Constrained Execution — AI as bounded executor |
| LANG-CC-ALL-P02     | Validity vs Correctness — structure over meaning|
| LANG-CC-ALL-P03     | Explicit Governance — no implicit intent       |
| LANG-CC-ALL-P04     | Violation Visibility — no silent correction    |
| LANG-CC-ALL-P05     | Deterministic Behavior — no randomness         |
| LANG-CC-ALL-P06     | Explicit Control Flow — no implicit branching  |
| LANG-CC-ALL-P07     | Sensitive Data Safety — no exposure            |
| LANG-CC-ALL-P08     | Explicit Error Handling — no silent ignore     |
| LANG-CC-ALL-P09     | Intent-Revealing Structure — self-documenting  |
| LANG-CC-ALL-P10     | Immutable Preference — avoid mutation          |
| LANG-CC-ALL-P11     | Boundary Validation — validate inputs          |

### Concrete Rules by Language (18)

| Language   | Rule IDs                                        | Count |
| ---------- | ----------------------------------------------- | ----- |
| Go         | LANG-CC-GO-C01, LANG-CC-GO-C02                  | 2     |
| Java       | LANG-CC-JV-C01~C04                              | 4     |
| JavaScript | LANG-CC-JS-C01~C03                              | 3     |
| TypeScript | LANG-CC-TS-C01~C03                              | 3     |
| Python     | LANG-CC-PY-C01~C03                              | 3     |
| Rust       | LANG-CC-RS-C01~C03                              | 3     |

---

## 4. Language-Specific Concrete Rules

### Go (2 rules)

- **LANG-CC-GO-C01**: Concurrency ownership must be explicit
- **LANG-CC-GO-C02**: Interfaces must be minimal

### Java (4 rules)

- **LANG-CC-JV-C01**: Must use explicit types
- **LANG-CC-JV-C02**: Inheritance should be controlled
- **LANG-CC-JV-C03**: Null handling must be explicit
- **LANG-CC-JV-C04**: Exceptions must not be ignored

### JavaScript (3 rules)

- **LANG-CC-JS-C01**: Must use const/let (no var)
- **LANG-CC-JS-C02**: Must use strict equality (===)
- **LANG-CC-JS-C03**: No implicit global variables

### TypeScript (3 rules)

- **LANG-CC-TS-C01**: Must enable strict type checking
- **LANG-CC-TS-C02**: Public APIs must have explicit types
- **LANG-CC-TS-C03**: No unsafe type assertions

### Python (3 rules)

- **LANG-CC-PY-C01**: Exceptions must be explicitly handled
- **LANG-CC-PY-C02**: Core logic must be deterministic
- **LANG-CC-PY-C03**: Inputs should be validated at boundaries

### Rust (3 rules)

- **LANG-CC-RS-C01**: Ownership and borrowing must be correct
- **LANG-CC-RS-C02**: No unsafe code blocks
- **LANG-CC-RS-C03**: Lifetime contracts should be explicit

---

## 5. Statistics

| Language   | Pattern | Concrete | Total |
| ---------- | ------- | -------- | ----- |
| Go         | 11      | 2        | 13    |
| Java       | 11      | 4        | 15    |
| JavaScript | 11      | 3        | 14    |
| TypeScript | 11      | 3        | 14    |
| Python     | 11      | 3        | 14    |
| Rust       | 11      | 3        | 14    |

---

## 6. Notes on Rulesets

- **Rulesets** compose Pattern + Concrete rules per language.
- Each language (go, java, javascript, typescript, python, rust)
  has its own ruleset.
- Pattern rules (P01~P11) are shared across all language rulesets.
- Concrete rules are selectively included based on target language.
- Rulesets are applied as overlays with CODE domain rules.

---

## 7. Source Traceability

LANG rules are derived from v3.0 AIGM (AI Generated-code Management)
Language Standards, consolidating 54 source rules into 29 rules
(11 Pattern + 18 Concrete) following EDR (Eliminate, Deduplicate,
Refine) methodology.

---

## 8. Summary

The LANG rule catalog defines the **minimum enforceable contract**
for safe, deterministic, and explicit code generation across
multiple programming languages.

If a constraint cannot be evaluated at the language-behavior level,
it does not belong here.
