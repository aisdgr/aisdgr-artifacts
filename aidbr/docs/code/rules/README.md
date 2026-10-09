# CODE Rule Catalog

This directory contains the **CODE rule catalog**, which defines
**code-level structured constraints** for AI-assisted and automated
code generation and modification.

These rules are **scenario-agnostic**, **document-independent**, and
**governance-neutral by design**.

They define **what code-level actions are allowed or forbidden**,
not *why*, *when*, or *by whom* they should occur.

---

## 1. Design Principles

The CODE rules follow the following non-negotiable principles:

1. **Code-Level Only**  
   Rules apply strictly to code artifacts and code-generation behavior.
   They do not reference documents, specifications, approvals,
   organizational roles, or governance authorities.

2. **Scenario-Free**  
   Rules do **not** encode intent such as `add`, `change`, `fix`, or
   `refactor`.  
   Scenarios are composed later by selecting appropriate rules
   into a ruleset.

3. **Boundary-First and Fail-Stop**  
   When required boundaries are missing, conflicting, or invalid,
   execution MUST stop immediately.

4. **Composable and Reusable**  
   Each rule is atomic and reusable across multiple rulesets.
   Rules never depend on other rules or policies.

5. **Execution Rules vs. Governance Guardrails**

   CODE explicitly distinguishes between two semantic types of rules:

   - **Execution Rules (MUST)**  
     These define *engineering obligations* such as completeness,
     hygiene, or consistency at the code level.  
     Violations indicate missing or incomplete work and are typically
     remediable.

   - **Governance Guardrails (MUST NOT)**  
     These define *hard prohibitions*.  
     Any verified violation constitutes an **evidence-based governance
     trigger** and MUST result in execution stop, recording, and escalation
     by higher-layer governance systems.

   **only violations of governance guardrails (MUST NOT) produce
   hard governance triggers**.

---

## 2. Rule ID Naming Convention

All rules in this directory follow the same identifier format:

```
CODE-<CATEGORY>-<NN>
```

Example:
- `CODE-BD-01`

Where:
- **CODE** indicates the code domain
- **CATEGORY** indicates the rule classification
- **NN** is a sequential number within the category

Rule IDs are **stable** and **never change** due to ruleset composition.

---

## 3. Rule Classification Overview

The CODE rule catalog is organized into **seven fixed categories**.
Each category represents a distinct **engineering risk domain**.

For governance-relevant risk domains, **at least one rule in the category
MUST be a governance guardrail (MUST NOT)** to provide an explicit
evidence-based trigger.

| Category | Name                  | Risk Domain Focus                                |
| -------- | --------------------- | ------------------------------------------------ |
| TR       | Traceability          | Trace identifiers and non-orphan code            |
| BD       | Boundary & Stop       | Execution boundaries and hard stop conditions    |
| AR       | Artifact Isolation    | Cross-artifact contamination                     |
| ST       | Structural Change     | Structural and behavioral integrity              |
| TI       | Test Integrity        | Misuse of test artifacts                         |
| CN       | Constraint Neutrality | Inference and scope expansion                    |
| LG       | Logging & Report      | Execution transparency and evidence completeness |

No rule may exist outside these categories.

---

## 4. Rule List and Descriptions

### TR — Traceability

Ensures that all generated or modified code is traceable and auditable.  
This category contains both execution rules and governance guardrails.

#### **CODE-TR-01**
- category: execution  
- description: Generated code MUST include a Trace ID.

#### **CODE-TR-02**
- category: execution  
- description: Trace IDs MUST be embedded within the source code artifact itself and MUST NOT exist solely in external metadata.

#### **CODE-TR-03**
- category: execution  
- description: A single code change MUST contain exactly one Trace ID.

#### **CODE-TR-04**
- category: governance  
- description: Existing Trace IDs MUST NOT be removed.

#### **CODE-TR-05**
- category: governance  
- description: Orphan code without Trace IDs MUST NOT be generated.

---

### BD — Boundary & Stop Rules

Defines **non-negotiable execution guardrails**.  
All rules in this category are governance guardrails.

#### **CODE-BD-01**
- category: governance  
- description: Code execution MUST stop if no boundary is declared.

#### **CODE-BD-02**
- category: governance  
- description: Code execution MUST stop if declared boundaries conflict.

#### **CODE-BD-03**
- category: governance  
- description: Code execution MUST stop if declared boundaries contain no actionable targets.

#### **CODE-BD-04**
- category: governance  
- description: Code MUST NOT modify artifacts outside the declared boundary.

#### **CODE-BD-05**
- category: governance  
- description: Code MUST NOT access modules or resources outside the boundary.

#### **CODE-BD-06**
- category: governance  
- description: Code MUST NOT introduce undeclared external dependencies.

---

### AR — Artifact Isolation

Prevents unintended interaction between artifact types.

#### **CODE-AR-01**
- category: execution  
- description: Permission to create new artifacts MUST be explicitly defined.

#### **CODE-AR-02**
- category: governance  
- description: Creation of undeclared artifact types is forbidden.

#### **CODE-AR-03**
- category: governance  
- description: Modification of undeclared artifact types is forbidden.

#### **CODE-AR-04**
- category: governance  
- description: Code execution MUST NOT modify multiple artifact types simultaneously.

#### **CODE-AR-05**
- category: execution  
- description: All generated artifacts MUST be addressable and locatable.

---

### ST — Structural Change

Controls structural and behavioral modifications.

#### **CODE-ST-01**
- category: execution  
- description: Permission for structural refactoring MUST be explicit.

#### **CODE-ST-02**
- category: governance  
- description: Unauthorized structural refactoring is forbidden.

#### **CODE-ST-03**
- category: governance  
- description: Structural refactoring and logic changes MUST NOT occur together.

#### **CODE-ST-04**
- category: governance  
- description: Introduction of new functionality is forbidden unless explicitly allowed.

#### **CODE-ST-05**
- category: governance  
- description: Removal of existing behavior is forbidden unless explicitly allowed.

---

### TI — Test Integrity

Ensures test artifacts are not misused or manipulated.

#### **CODE-TI-01**
- category: governance  
- description: Test artifacts MUST NOT modify or affect production code.

#### **CODE-TI-02**
- category: governance  
- description: Test changes MUST NOT expand validation scope.

#### **CODE-TI-03**
- category: governance  
- description: Tests MUST NOT redefine expected behavior.

#### **CODE-TI-04**
- category: execution  
- description: Test modifications MUST preserve original structure and intent.

#### **CODE-TI-05**
- category: governance  
- description: Tests MUST NOT infer requirements or behavior from implementation.

---

### CN — Constraint Neutrality

Forbids implicit inference and hidden expansion.

#### **CODE-CN-01**
- category: governance  
- description: Undeclared boundaries MUST NOT be inferred.

#### **CODE-CN-02**
- category: governance  
- description: Undeclared requirements MUST NOT be inferred.

#### **CODE-CN-03**
- category: governance  
- description: Undeclared validation targets MUST NOT be inferred.

---

### LG — Logging & Report

Ensures execution transparency and auditable records.

#### **CODE-LG-01**
- category: execution  
- description: Each execution MUST produce a locatable execution record.

#### **CODE-LG-02**
- category: execution  
- description: Execution records MUST be linked to the corresponding Trace ID.

#### **CODE-LG-03**
- category: execution  
- description: Each execution MUST include a rationale.

#### **CODE-LG-04**
- category: governance  
- description: Rationales MUST NOT be empty or purely repetitive.

#### **CODE-LG-05**
- category: execution  
- description: A change summary MUST be provided.

#### **CODE-LG-06**
- category: execution  
- description: Change summaries MUST match actual code changes.

#### **CODE-LG-07**
- category: execution  
- description: A rule-evaluation report MUST be generated.

#### **CODE-LG-08**
- category: execution / governance  
- description: Rule reports MUST include per-rule evaluation results.

#### **CODE-LG-09**
- category: governance  
- description: Rule violations MUST NOT be silently ignored.

---

## 5. Notes on Rulesets and Future Extensions

- **Rulesets** only select and compose rules.
  They do not define new semantics.

- Governance severity, risk classification, and escalation logic
  are intentionally **out of scope** for CODE.

- Future domains will use separate namespaces, for example:
  - `docSCR-DOC-*`
  - `vpSCR-VIEWPOINT-*`

---

## 6. Summary

The CODE rule catalog defines the **minimum enforceable contract**
for safe, traceable, and bounded code generation.

If a constraint cannot be evaluated at the code-behavior level,
it does not belong here.
