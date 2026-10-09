---
document: SCS
id: SCS-TYPESCRIPT
version: 1.0.0
layer: Language
language: TypeScript
status: Active
owner: AIDDM / Community
applies_with:
  - SCS_STD.md
---

# Software Coding Standard — TypeScript

## Role & Positioning (Normative)

This document defines **TypeScript-specific coding constraints and conventions**
within the AIDDM Software Coding Standard (SCS) model.

This document represents **Layer 2 (Language Foundation)** and MUST be applied
together with `SCS_STD.md`.

When conflicts arise between organizational coding rules and TypeScript
language constraints, **language constraints take precedence** unless a safe,
equivalent alternative exists.

---

## Language References

The TypeScript coding standard aligns with the following publicly available
and widely adopted references:

- **TypeScript Handbook** (official)
- **ESLint — recommended ruleset**

These references define the baseline for type usage, syntax, and common
error-prevention practices.

This document **does not restate** the referenced standards.

---

## TypeScript-Specific Rules

### SCS-TS-001 — Prefer explicit typing at boundaries

**description**  
Public APIs, module boundaries, and external interfaces SHOULD use explicit
types.

**rationale**  
Explicit boundary typing improves correctness, readability, and AI-assisted
code generation stability.

---

### SCS-TS-002 — Avoid unsafe type assertions

**description**  
Unsafe type assertions (e.g., `as any`, unchecked casts) SHOULD be avoided
unless justified and localized.

**rationale**  
Unchecked assertions undermine type safety and increase runtime risk.

---

### SCS-TS-003 — Favor type inference internally

**description**  
Within local scopes, type inference MAY be used when it improves readability
without sacrificing clarity.

**rationale**  
Balanced use of inference reduces verbosity while preserving intent.

---

### SCS-TS-004 — Clear separation of runtime and type-level logic

**description**  
Type-level constructs SHOULD NOT obscure runtime behavior. Complex type logic
MUST NOT compromise code readability.

**rationale**  
Clear separation prevents confusion for reviewers and avoids brittle designs,
especially in AI-generated code.

---

### SCS-TS-005 — Deterministic and testable behavior

**description**  
TypeScript code SHOULD avoid hidden side effects and non-deterministic behavior,
particularly in asynchronous flows.

**rationale**  
Predictable behavior is essential for reliable testing and safe automation.

---

## Compatibility & Extension

- This document MAY be extended by community-contributed TypeScript standards.
- Additional rules MUST NOT conflict with `SCS_STD.md`.
- Organization-specific preferences MUST be defined in a separate
  Layer 3 document (e.g., `SCS_Org.md`).

---

## Notes

This document intentionally provides a **minimal TypeScript language standard**
to demonstrate SCS composability across static, dynamic, and hybrid languages.
