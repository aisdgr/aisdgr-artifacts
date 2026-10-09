---
document: SCS
id: <SCS-ID>                     # REQUIRED. Globally unique
version: 1.1.0
stage: Stable                 # Draft / Review / Approved / Released
status: Approved
owner: AIDDM
created: 2025-12-01
updated: 2025-12-14
scope:
  - language: generic
  - level: template
---

# Software Coding Standard (SCS)

## 1. Purpose
This document defines the **standard structure** for writing
Software Coding Standards (SCS) within the AIDDM ecosystem.

The goal is to ensure that coding standards are:
- Human-readable where explanation is required
- Machine-decidable where compliance must be enforced
- Suitable for AI-governed development workflows

## 2. Core Principle (Normative)

**Description explains intent for humans.**  
**All other fields MUST be machine-decidable.**

If a condition cannot be enumerated or evaluated deterministically,
it **MUST NOT** appear outside `description`.

---

## 3. Terminology (Normative)

- **Standard Item**  
  A normative clause defining an obligation or constraint.

- **Rule**  
  An executable check implemented by a Check or Audit Engine.  
  Rules are derived from Standard Items but are NOT defined here.

---

## 4. Standard Item Structure (Normative)

Each Standard Item **MUST** follow this structure:

```markdown
### <SCS-ID> — <Short Title>

#### description
Human-readable explanation.  
Natural language, examples, and abstract concepts are allowed.

#### applies_to
Structured applicability conditions.  
MUST be enumerable and machine-decidable.

#### role
- AI | Human | Both

#### intent
Action-oriented phrase.  
Avoid abstract nouns and subjective language.

#### severity
MUST | SHOULD | MAY
```
---

## 5. Writing Rules (Normative)

- **description**
  - MAY include abstract concepts (e.g., DTO, API, Model, CLI)
  - MAY include rationale, background, or examples
- **applies_to, role, intent, severity**
  - MUST NOT use abstract or subjective language
  - MUST be interpretable without contextual inference