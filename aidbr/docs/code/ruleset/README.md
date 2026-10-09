# CODE Rulesets

This directory contains **CODE rulesets**, which compose
scenario-specific execution constraints from atomic CODE rules.

Rulesets do not define new behavior.
They only **select and activate existing rule categories**
based on artifact type and execution intent.

---

## 1. Rules vs Rulesets

- **Rules** define *what is allowed or forbidden* at the code-behavior level.
- **Rulesets** define *when and where* those rules apply.

Rulesets:
- do NOT introduce normative language (MUST / MUST NOT)
- do NOT encode intent semantics
- do NOT reference documents or governance authority

---

## 2. Artifact Mutation vs Execution Action

| Type              | Description                 | Example         |
| ----------------- | --------------------------- | --------------- |
| Artifact Mutation | Changes repository contents | source_code:add |
| Execution Action  | Executes without mutation   | test.execution  |

This separation prevents conflation between verification and modification.

---

## 3. Ruleset Naming Convention

Rulesets follow the pattern:

```
<artifact_or_action>.<intent>
```

Examples:
- `source_code.add`
- `test_code.change`
- `test.execution`

---

## 4. Available Rulesets

### Source Code Mutation

| Ruleset              | Purpose                                |
| -------------------- | -------------------------------------- |
| source_code.add      | Add new production source code         |
| source_code.change   | Modify existing production source code |
| source_code.fix      | Apply minimal corrective fixes         |
| source_code.refactor | Perform structural refactoring         |

---

### Test Execution

| Ruleset        | Purpose                                          |
| -------------- | ------------------------------------------------ |
| test.execution | Execute existing tests without artifact mutation |

---

### Test Code Mutation

| Ruleset          | Purpose                        |
| ---------------- | ------------------------------ |
| test_code.add    | Add new test artifacts         |
| test_code.change | Modify existing test artifacts |
| test_code.fix    | Fix defective test artifacts   |

---

## 5. Rule Category Inclusion Model

Rulesets select rules by **category**, not by rule ID.

Common categories include:

- **BD** — Boundary & Stop
- **CN** — Constraint Neutrality
- **TR** — Traceability
- **AR** — Artifact Isolation
- **ST** — Structural Change
- **TI** — Test Integrity
- **LG** — Logging & Evidence

This model allows new rules to be added without changing existing rulesets.

---

## 6. Design Rationale

- CODE rules define the **minimum enforceable contract**
- rulesets define **execution context only**
- governance authority, documents, and approval flows are handled externally

---

## 7. Summary

If a behavior cannot be governed through rule composition,
it does not belong in CODE.
