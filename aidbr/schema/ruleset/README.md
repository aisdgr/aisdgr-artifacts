# Ruleset Specification

*(Structured Constraint Representation – Ruleset Profile)*

---

## 1. Purpose

This document defines the conceptual specification of a **Ruleset** within the  
**AISL / Structured Constraint Representation (SCR)** framework.

A Ruleset is a **governance-level grouping artifact** that organizes multiple **Rule** artifacts into a coherent, auditable set for application, review, and lifecycle management.

A Ruleset is:

- **Not a rule**
- **Not an execution engine**
- **Not a governance workflow**
- **Not a policy enforcement mechanism**

It is a **structural aggregation artifact**, designed to provide **context, scope, and governance meaning** to a collection of Rules.

---

## 2. What a Ruleset Is — and Is Not

### 2.1 What a Ruleset Is

A Ruleset is:

- A **named collection of Rule references**
- A **governance-scoped constraint bundle**
- A unit of **versioning, ownership, and lifecycle control**
- A container for **governance metadata shared across rules**
- A boundary object between **constraint definition** and **constraint application**

In short:

> **Ruleset = a governed grouping of Rules**

---

### 2.2 What a Ruleset Is Not

A Ruleset does **not**:

- Define new constraints
- Modify or override Rule semantics
- Execute or evaluate rules
- Resolve conflicts between rules
- Decide enforcement order or priority
- Represent runtime behavior

All normative behavior remains **inside individual Rules**.

---

## 3. Design Principles

This specification follows these principles:

1. **Rules Remain Atomic**  
   A Ruleset MUST NOT change the meaning of a Rule.
2. **Aggregation Without Interpretation**  
   Rulesets group rules but do not interpret them.
3. **Governance-First Structure**  
   Rulesets exist to support governance, audit, and lifecycle management.
4. **Execution-Neutral**  
   Rulesets carry no execution semantics.
5. **Reference Over Duplication**  
   Rules are referenced, not embedded or rewritten.

---

## 4. Minimal Ruleset Concept

The smallest valid Ruleset is intentionally minimal.

```yaml
ruleset:
  id: RULESET-001
  includes:
    - rule_id: RULE-001
```

This minimal Ruleset already provides:

- A governance handle
- A stable grouping identity
- A reference boundary for tooling

Everything beyond this exists to **support scale, auditability, and governance clarity**.

---

## 5. Ruleset Structure Overview

Conceptually, a Ruleset consists of four parts:

1. **Identity** — ruleset id and version
2. **Includes** — references to rule artifacts
3. **Governance** — descriptive governance metadata
4. **Scope Context** — optional applicability framing

The Ruleset itself is **non-normative**.

---

## 6. Includes (Rule References)

### 6.1 Purpose

The `includes` section declares **which Rules belong to this Ruleset**.

Each entry MUST reference a Rule by its `rule_id`.

Example:

```yaml
includes:
  - rule_id: GEN-NEW-CODE-ADD-JWT
  - rule_id: GEN-NEW-CODE-JWT-VALIDATION
```

---

### 6.2 Reference Semantics

- `includes` contains **references only**
- The Rule content MUST exist as a separate artifact
- Ruleset validation MAY fail if referenced rules are missing

Rulesets **do not inline, copy, or redefine rules**.

---

## 7. Governance

### 7.1 Purpose

The `governance` section provides **descriptive metadata** for the Ruleset as a whole.

It supports:

- Ownership clarity
- Lifecycle tracking
- Audit readiness
- Organizational alignment

Governance metadata MUST NOT influence rule execution.

---

### 7.2 Typical Governance Fields

Governance MAY include:

- Version and status
- Owner or maintaining entity
- Responsibilities (AI / human / system / committee)
- Applicability or deployment context
- Governance intent or rationale

All fields are **informational only**.

---

## 8. Versioning and Lifecycle

Rulesets are **versioned independently** from individual Rules.

- Updating a Rule does NOT automatically change a Ruleset version
- Updating rule membership SHOULD result in a new Ruleset version
- Rulesets act as **stable governance snapshots**

Lifecycle states (e.g., draft, active, deprecated) are descriptive only.

---

## 9. Responsibilities

`responsibilities` define **governance accountability**, not execution roles.

Example:

```yaml
responsibilities:
  ai:
    - generator
  human:
    - reviewer
    - approver
```

Responsibilities:

- Do NOT define behavior
- Do NOT assign authority
- Exist solely for governance clarity

---

## 10. Applicability Context

Rulesets MAY define a shared `applicability_context`.

This context:

- Is descriptive
- Is non-executable
- Does NOT act as a trigger condition

It provides **why and where** this ruleset is relevant from a governance viewpoint.

---

## 11. Relationship Between Rules and Rulesets

| Aspect           | Rule  | Ruleset    |
| ---------------- | ----- | ---------- |
| Normative        | ✅ Yes | ❌ No       |
| Atomic           | ✅ Yes | ❌ No       |
| Executable       | ❌ No  | ❌ No       |
| Governance Scope | Local | Aggregated |
| Versioned        | Yes   | Yes        |

A Ruleset is **greater than one Rule**, but **less than a governance system**.

---

## 12. Validation Model

Ruleset validation checks:

- Structural correctness
- Presence of required fields
- Valid rule references
- Governance metadata shape

It does NOT check:

- Constraint correctness
- Policy intent
- Risk suitability
- Enforcement feasibility

---

## 13. Representation and Schema Files

YAML schemas are **reference representations** designed to:

- Support tooling
- Enable static validation
- Improve interoperability

They are **not the AISL standard itself**.

---

## 14. Mental Model

Think of a Ruleset as:

> A **governance envelope**  
> that gives multiple Rules a **shared identity**,  
> without changing what any Rule means.

That is the entire purpose of a Ruleset.
