---
document: SCS
id: SCS-ORG-EXAMPLE
version: 1.0.0
layer: Organization
status: Example
owner: AIDDM / Reference
applies_with:
  - SCS_STD.md
  - SCS_<Language>.md
---

# Software Coding Standard — Organization Overlay (Example)

## Role & Positioning (Normative)

This document defines **organization- and customer-specific coding
constraints** within the AIDDM Software Coding Standard (SCS) model.

This document represents **Layer 3 (Organization / Customer Overlay)** and
MUST be applied together with:

- `SCS_STD.md` (Layer 1 — Core, non-negotiable)
- One or more `SCS_<Language>.md` documents (Layer 2 — Language foundation)

This layer expresses **policy preferences and acceptance expectations**,
not technical limitations.

---

## Governance & Conflict Resolution (Normative)

### Layering Rules

1. **Layer 1 (SCS_STD)** MUST NOT be violated.
2. **Layer 2 (Language)** constraints represent technical facts.
3. **Layer 3 (Organization)** rules SHOULD NOT conflict with Layer 2.
4. When conflicts arise, **Layer 3 SHOULD be adjusted**.

Language constraints take precedence over organizational preferences,
as language limitations define what is technically safe and maintainable.

---

## Organizational Coding Expectations

### SCS-ORG-001 — Documentation for public interfaces

**description**  
All public interfaces MUST include clear documentation describing purpose,
inputs, outputs, and error behavior.

**rationale**  
Clear documentation supports maintainability, onboarding, and customer-facing
review.

---

### SCS-ORG-002 — Testability and verification

**description**  
Non-trivial logic SHOULD be covered by automated tests that map clearly to
system behavior or acceptance criteria.

**rationale**  
Test coverage supports regression prevention and customer acceptance.

---

### SCS-ORG-003 — Logging and observability discipline

**description**  
Code SHOULD include sufficient logging to support operational diagnosis,
while avoiding exposure of sensitive data.

**rationale**  
Balanced observability improves support efficiency without compromising
security.

---

### SCS-ORG-004 — Error handling transparency

**description**  
Errors MUST be handled explicitly and surfaced in a manner appropriate for
the system boundary (e.g., API, service, UI).

**rationale**  
Explicit error handling improves diagnosability and customer trust.

---

### SCS-ORG-005 — Simplicity over customization

**description**  
Customization and framework-level abstraction SHOULD be minimized unless
there is a clear business justification.

**rationale**  
Over-customization increases maintenance cost and complicates AI-assisted
code generation and review.
