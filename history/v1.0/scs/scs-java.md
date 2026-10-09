---
document: SCS
id: SCS-JAVA
version: 1.0.0
layer: Language
language: Java
status: Active
owner: AIDDM / Community
applies_with:
  - SCS_STD.md
---

# Software Coding Standard — Java

## Role & Positioning (Normative)

This document defines **Java-specific coding constraints and conventions**
within the AIDDM Software Coding Standard (SCS) model.

This document represents **Layer 2 (Language Foundation)** and MUST be applied
together with `SCS_STD.md`.

When conflicts arise between organizational coding rules and Java language
constraints, **language constraints take precedence** unless a safe,
equivalent alternative exists.

---

## Language References

The Java coding standard aligns with the following publicly available
and widely adopted reference:

- **Google Java Style Guide**

This reference defines the baseline for Java naming, formatting,
file organization, and documentation practices.

This document **does not restate** the referenced standard.

---

## Java-Specific Rules

### SCS-JAVA-001 — Explicit structure and readability

**description**  
Java code MUST favor explicit structure and readability over excessive
abstraction or meta-programming.

**rationale**  
Explicit structure improves maintainability, code review efficiency,
and AI-assisted code generation stability.

---

### SCS-JAVA-002 — Clear class and method responsibilities

**description**  
Classes and methods SHOULD have clear, focused responsibilities and
avoid unnecessary complexity.

**rationale**  
Clear responsibility boundaries reduce coupling and support testability
and long-term evolution.

---

### SCS-JAVA-003 — Explicit exception handling

**description**  
Exceptions MUST be handled explicitly. Catching overly broad exceptions
(e.g., `Exception` or `Throwable`) SHOULD be avoided unless justified.

**rationale**  
Explicit exception handling improves diagnosability and prevents
unexpected control flow masking.

---

### SCS-JAVA-004 — Meaningful naming and documentation

**description**  
Class, method, and variable names SHOULD be descriptive and follow
standard Java naming conventions. Public APIs SHOULD include
documentation comments.

**rationale**  
Meaningful naming and documentation improve readability for humans
and provide stable semantic signals for AI tooling.

---

### SCS-JAVA-005 — Predictable and testable behavior

**description**  
Java code SHOULD avoid hidden side effects, global state, or
non-deterministic behavior that complicates testing.

**rationale**  
Predictable behavior is essential for reliable automated testing,
debugging, and AI-generated code validation.

---

## Compatibility & Extension

- This document MAY be extended by community-contributed Java standards.
- Additional rules MUST NOT conflict with `SCS_STD.md`.
- Organization-specific preferences MUST be defined in a separate
  Layer 3 document (e.g., `SCS_Org.md`).

---

## Notes

This document intentionally provides a **minimal Java language standard**
to demonstrate SCS composability and layering, rather than exhaustive
rule coverage.
