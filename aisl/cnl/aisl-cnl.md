# AIGDCNL
AI Governance Deontic & Constraint Normative Language

Version: 1.0  
Status: Active  
Audience: Human authors, validators, generators

---

## 1. PURPOSE

AIGDCNL defines a controlled normative language used to express governance rules,
constraints, and invariants in AIGDMM-related documents.

This specification is intended for:
- Validating governance documents
- Generating rule-based policies
- Enforcing consistency across G-class documents

AIGDCNL is NOT designed as an AI prompt language.

---

## 2. CONCEPTS

### 2.1 Rule

A **Rule** expresses an obligation, prohibition, permission, or recommendation.

A Rule:
- MUST be declarative
- MUST be testable
- MUST be referencable by ID

Example:
> Generator MUST produce an output document. (RULE:GEN-001)

---

### 2.2 Constraint

A **Constraint** limits allowable behavior or structure.

Constraints:
- Often restrict scope, boundary, or structure
- MAY be enforced before or during execution

Example:
> Generator MUST NOT modify files outside declared scope. (CONSTRAINT:GEN-014)

---

### 2.3 Invariant

An **Invariant** is a rule that MUST hold at all times.

Invariants:
- MUST NOT depend on execution mode
- Violations MUST block execution

Example:
> Governance rules MUST remain human-reviewable. (INVARIANT:CORE-001)

---

## 3. NORMATIVE KEYWORDS

The following keywords are defined with strict meaning:

| Keyword    | Meaning               |
| ---------- | --------------------- |
| MUST       | Absolute requirement  |
| MUST NOT   | Absolute prohibition  |
| SHOULD     | Strong recommendation |
| SHOULD NOT | Strong discouragement |
| MAY        | Optional behavior     |

Notes:
- SHALL is NOT permitted
- Keywords are case-sensitive

---

## 4. STATEMENT STRUCTURE

Each normative statement MUST follow this logical form:

```
<Subject> <Normative Keyword> <Action> [<Condition>] [<Exception>].
```

Where:
- Subject: generator, validator, system, user, auditor, pipeline, etc.
- Action: observable behavior
- Condition: when / if / unless clauses
- Exception: explicitly stated

---

## 5. IDENTIFIERS

Every Rule, Constraint, or Invariant MUST include an identifier.

Format:

```
<RULE|CONSTRAINT|INVARIANT>:<DOMAIN>-<NUMBER>
```

Examples:
- RULE:GEN-001
- CONSTRAINT:CAS-012
- INVARIANT:CORE-001

---

## 6. PROHIBITED LANGUAGE

The following terms are prohibited in normative statements:

- best effort
- as needed
- etc.
- and/or
- try to
- maybe
- usually
- generally

Reason: These terms are not machine-verifiable.

---

## 7. USAGE SCOPE

AIGDCNL applies to:
- GCG
- GCS
- GEC
- GEP
- All derived governance policies

---

## 8. NON-GOALS

AIGDCNL does NOT define:
- Execution workflows
- AI prompting strategies
- Model-specific instructions
