# Software Coding Standard (SCS)

The Software Coding Standard (SCS) defines **composable, enforceable coding
constraints** for both AI-assisted code generation and human developers.

SCS is part of the AIDDM methodology and is designed to:

- Constrain AI-generated code in a predictable and safe manner
- Provide a shared engineering contract for human developers
- Support layering, customization, and conflict resolution
- Avoid exposing proprietary implementation details

SCS is **not a style guide** and does **not** provide implementation samples.

---

## 1. Concept Overview

SCS is structured as a **three-layer constraint model**.

Each layer has a clear responsibility and precedence rule.

```
Layer 1: Core (SCS_STD) — Non-negotiable engineering constraints
Layer 2: Language (SCS_<Lang>) — Language-specific technical foundations
Layer 3: Org / Customer — Organizational policy and acceptance rules
```

All layers are applied together to form an **effective constraint set**.

---

## 2. File Structure

A typical SCS directory structure is as follows:

```
/scs/
├─ SCS_Template.md            # Meta-specification (format & rules)
├─ SCS_STD.md                 # Layer 1: Core constraints (always applied)
├─ SCS_Python.md              # Layer 2: Language module
├─ SCS_Java.md
├─ SCS_TypeScript.md
├─ SCS_Org_Example.md         # Layer 3: Organization / customer overlay
└─ README.md # This document
```

Only **Layer documents** (`STD`, `Language`, `Org`) are applied to AI and
engineering workflows.  
`SCS_Template.md` is **not** applied to code generation.

---

## 3. Layer Definitions

### 3.1 Layer 1 — Core (SCS_STD.md)

- Defines non-negotiable engineering safety rules
- Applies to all languages and organizations
- MUST NOT be overridden or weakened

Examples:
- Explicit error handling
- Readability and determinism
- Safe logging practices

---

### 3.2 Layer 2 — Language (SCS_<Language>.md)

- Defines language-specific constraints and conventions
- Reflects technical facts and idioms of the language
- MUST comply with Layer 1

Examples:
- Python: PEP 8 / PEP 257 alignment
- Java: Google Java Style Guide alignment
- TypeScript: TypeScript Handbook + ESLint recommended

Language constraints take precedence over organizational preferences.

---

### 3.3 Layer 3 — Organization / Customer (SCS_<Org>.md)

- Defines organizational culture, policy, and acceptance requirements
- Expresses preferences, not technical limitations
- MUST comply with Layer 1
- SHOULD avoid conflicts with Layer 2

Examples:
- Documentation requirements
- Test coverage expectations
- Logging and observability policies
- Customer acceptance traceability

---

## 4. Conflict Resolution Rules

When multiple SCS layers are applied, conflicts are resolved as follows:

1. **Layer 1 MUST NOT be violated**
2. **Language constraints represent technical facts**
3. Organizational rules SHOULD be adjusted if conflicts arise
4. Policy preferences MUST NOT redefine language semantics

> Language limitations are technical realities.  
> Organizational rules are policy choices.

---

## 5. Using SCS with AI (Recommended)

SCS is designed to be **directly consumable by AI tooling**, such as MCP
servers or CLI-based generators.

### Example — Generate Java Code

Apply the following constraint set:

```markdown
SCS_STD.md
- SCS_Java.md
- SCS_Org_Example.md
```

### Example — Generate Python Code

Apply the following constraint set:

```markdown
SCS_STD.md
- SCS_Python.md
- SCS_Org_Example.md
```

### YAML-style Configuration (Illustrative)

```yaml
scs:
  core: SCS_STD.md
  language: SCS_Python.md
  organization: SCS_Org_Example.md
```

The same constraint set may also be used for:
- Human code review
- Static analysis
- QA and acceptance validation

---

## 6. Why SCS Has No Samples

SCS does not provide implementation samples.

Providing full samples would effectively publish executable
engineering constraints and reduce flexibility.

Instead, SCS:
- Declares alignment to existing public standards
- Defines enforceable constraints and layering rules
- Enables safe, composable usage by AI and humans

---

## 7. Community Extension

SCS is designed to be extended by the community:
- New language modules MAY be added
- Organization overlays MAY be customized
- All extensions MUST respect the three-layer model

The goal is to establish a shared, evolvable engineering contract for the AI-assisted development era.

---

## 8. Summary

SCS is a governance layer, not a coding tutorial.

It defines:
- What must never be violated
- What language realities must be respected
- What organizational policies may be applied

By separating these concerns, SCS enables safe, scalable, and controllable AI-assisted software development.
