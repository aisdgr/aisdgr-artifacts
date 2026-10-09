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

## Customer Acceptance Considerations

### SCS-ORG-ACC-001 — Deterministic behavior

**description**  
Externally observable system behavior MUST be deterministic under defined
conditions.

**rationale**  
Deterministic behavior is essential for customer validation, acceptance
testing, and issue reproduction.

---

### SCS-ORG-ACC-002 — Traceability to acceptance criteria

**description**  
Code changes SHOULD be traceable to acceptance criteria defined in STS or
equivalent verification documents.

**rationale**  
Traceability supports structured acceptance and controlled change management.

---

## Compatibility Notes

- This document is an **example organizational overlay** and does not
  represent a complete enterprise policy.
- Organizations MAY define multiple Layer 3 overlays for different customers
  or regulatory contexts.
- Organizational overlays MUST NOT redefine language syntax or semantics.

---

## Notes

This example demonstrates how organizational culture and customer acceptance
requirements can be layered on top of core and language-specific coding
standards without compromising technical correctness or AI controllability.
