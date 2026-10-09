# SPEC Rule Catalog

This directory contains the **SPEC rule catalog**, which defines
**specification document-level structured constraints** for AI-assisted
and automated specification generation and modification.

These rules are **scenario-agnostic**, **document-type-independent**, and
**governance-neutral by design**.

They define **what spec-level actions are allowed or forbidden**,
not *why*, *when*, or *by whom* they should occur.

---

## 1. Design Principles

The SPEC rules follow the following non-negotiable principles:

1. **Specification-Level Only**
   Rules apply strictly to specification document artifacts and
   spec-generation behavior.
   They do not reference organizational roles, approval workflows,
   or external governance authorities.

2. **Scenario-Free**
   Rules do **not** encode intent such as `add`, `change`, or `review`.
   Scenarios are composed later by selecting appropriate rules
   into a ruleset based on document type.

3. **Boundary-First and Fail-Stop**
   When required boundaries are missing, conflicting, or invalid,
   execution MUST stop immediately.

4. **Composable and Reusable**
   Each rule is atomic and reusable across multiple rulesets.
   Rules never depend on other rules or policies.

5. **Execution Rules vs. Governance Guardrails**

   SPEC explicitly distinguishes between two semantic types of rules:

   - **Execution Rules (MUST)**
     These define *specification obligations* such as completeness,
     traceability, or consistency at the document level.
     Violations indicate missing or incomplete work and are typically
     remediable.

   - **Governance Guardrails (MUST NOT)**
     These define *hard prohibitions*.
     Any verified violation constitutes an **evidence-based governance
     trigger** and MUST result in execution stop, recording, and escalation
     by higher-layer governance systems.

   **Only violations of governance guardrails (MUST NOT) produce
   hard governance triggers**.

---

## 2. Rule ID Naming Convention

All rules in this directory follow the identifier format:

```
SPEC-<CATEGORY>-<TYPE><NN>
```

Example:
- `SPEC-BD-P01` (permission-based execution rule)
- `SPEC-BD-C01` (constraint-based governance guardrail)

Where:
- **SPEC** indicates the specification domain
- **CATEGORY** indicates the rule classification (TR, BD, AR, ST, CN, LG, CC)
- **TYPE** indicates the rule semantic type:
  - **P** = Permission-based (execution rules, typically MUST)
  - **C** = Constraint-based (governance guardrails, typically MUST NOT)
- **NN** is a sequential number within the category and type

Rule IDs are **stable** and **never change** due to ruleset composition.

---

## 3. Rule Classification Overview

The SPEC rule catalog is organized into **seven fixed categories**.
Each category represents a distinct **specification risk domain**.

| Category | Name                  | Risk Domain Focus                                |
| -------- | --------------------- | ------------------------------------------------ |
| TR       | Traceability          | Trace identifiers and spec chain integrity       |
| BD       | Boundary & Stop       | Execution boundaries and hard stop conditions    |
| AR       | Artifact Isolation    | Cross-document-type contamination                |
| ST       | Structural Change     | Template structure and section integrity         |
| CN       | Constraint Neutrality | Inference and scope expansion                    |
| LG       | Logging & Report      | Execution transparency and evidence completeness |
| CC       | Content Constraints   | Section type authority and generation limits     |

No rule may exist outside these categories.

---

## 4. Rule Categories and Descriptions

### TR — Traceability

Ensures that all generated or modified specifications are traceable
and maintain reference integrity with upstream documents.

**Rules:** SPEC-TR-P01~P03, SPEC-TR-C01~C03 (6 rules)

### BD — Boundary & Stop

Defines **non-negotiable execution guardrails** for specification scope.

**Rules:** SPEC-BD-P01~P03, SPEC-BD-C01~C04 (7 rules)

### AR — Artifact Isolation

Prevents unintended interaction between specification document types
(e.g., SRS, SDS, STS, CAS, CIS, CSS).

**Rules:** SPEC-AR-P01~P02, SPEC-AR-C01~C03 (5 rules)

### ST — Structural Change

Controls modifications to template-defined section structures.
This category enforces **absolute structural integrity**.

**Rules:** SPEC-ST-C01~C06 (6 rules)

### CN — Constraint Neutrality

Forbids implicit inference and hidden expansion in specification content.

**Rules:** SPEC-CN-C01~C03 (3 rules)

### LG — Logging & Report

Ensures execution transparency and auditable records for
specification generation.

**Rules:** SPEC-LG-P01~P07, SPEC-LG-C01~C02 (9 rules)

### CC — Content Constraints

Enforces **section-type authority** and **generation scope limits**
based on GEC (Generalized Engineering Constraints) and
GGC (Generalized Governance Constraints) patterns.

**Rules:** SPEC-CC-C01~C07 (7 rules)

**GEC Pattern Rules (C01~C03):**
- C01: Informative sections MUST be descriptive only
- C02: Boundary sections MUST NOT describe implementation
- C03: Authoritative sections MUST be explicit, declarative, and traceable

**GGC Pattern Rules (C04~C07):**
- C04: AI MUST NOT generate outside declared scope or placeholders
- C05: AI MUST NOT infer, fabricate, or reinterpret content
- C06: AI MUST NOT generate prescriptive content (implementation, logic, mechanisms)
- C07: AI MUST NOT generate appendices by default

**Section Type Mapping:**
File: `SPEC-CC-SECTION-TYPES.yaml`
Defines which sections are informative/boundary/authoritative
for each document type (srs, sds, sts, cas, cis, css).

---

## 5. Statistics

| Category | TR | BD | AR | ST | CN | LG | CC | Total |
| -------- | -- | -- | -- | -- | -- | -- | -- | ----- |
| Rules    | 6  | 7  | 5  | 6  | 3  | 9  | 7  | 43    |

---

## 6. Notes on Rulesets

- **Rulesets** select and compose rules by document type.
- Each document type (srs, sds, sts, cas, cis, css) has its own ruleset.
- Rulesets do not define new semantics.
- Cross-document reference integrity is enforced at the ruleset level.

---

## 7. Summary

The SPEC rule catalog defines the **minimum enforceable contract**
for safe, traceable, and bounded specification generation.

If a constraint cannot be evaluated at the document-behavior level,
it does not belong here.
