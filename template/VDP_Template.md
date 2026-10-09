---
document: VDP
version: <x.y.z>
status: Draft | Active | Frozen | Released | Archived
created: <YYYY-MM-DD>
updated: <YYYY-MM-DD>
---

# Version Development Plan (VDP)

## 1. Purpose

The Version Development Plan (VDP) is the **single source of truth for the
current state of a specific version**.

VDP provides a consolidated view of:
- Version scope and objectives
- Reviewable work segmentation
- Verification and audit evidence
- Readiness for release or acceptance

VDP is a **living document** and is updated continuously throughout
the version lifecycle.

---

## 2. Version Overview

- **Product / System Name**:
- **Version Identifier**:
- **Version Type**: Feature | Patch | Hotfix | Major
- **Target Release Window**:
- **Current Status**: Draft | Active | Frozen | Released | Archived

---

## 3. Version Objectives

Describe the intent and goals of this version.

- Key functional goals
- Non-functional goals (performance, security, stability)
- Explicit exclusions or constraints

---

## 4. Scope Summary

### 4.1 In Scope

- Features, modules, or behaviors included in this version

### 4.2 Out of Scope

- Explicitly excluded items
- Deferred or postponed work

---

## 5. Specification Baseline (References)

This section defines the **authoritative specifications** used for review
and verification.

- **SRS**: <SRS-ID / Link>
- **SAS**: <SAS-ID / Link>
- **SDS**: <SDS-ID / Link>
- **STS**: <STS-ID / Link>

**Applicable Coding Standards (SCS):**
- SCS_STD.md
- SCS_<Language>.md
- SCS_<Organization>.md

---

## 6. Review Units (RU)

This section defines **independently reviewable and verifiable units of work**.

Each Review Unit is evaluated based on:
- Referenced specifications
- Automated or AI-generated evidence
- A final human gatekeeping decision

Ownership or traditional role assignment is intentionally excluded.

---

### RU-001 — <Review Unit Title>

**Scope**
- Functional or technical boundaries covered by this unit

**References**
- SRS-XXX
- STS-XXX
- Applicable SCS rules

**Evidence (AI / Tool Generated)**
- CAR-XXX (Code Audit Report)
- TR-XXX (Test Report)
- Other automated or AI-assisted review outputs

**Gatekeeper (Human)**
- <Name or Identifier>

**Decision**
- Status: PASS | FAIL | CONDITIONAL
- Decision Notes:

---

### RU-002 — <Review Unit Title>

(Repeat as needed)

---

## 7. Quality & Audit Evidence Summary

This section aggregates **machine-verifiable evidence** linked to this version.

### 7.1 Code Audit

- **CAR**: <CAR-ID / Link>
- Audit Status: PASS | FAIL | CONDITIONAL
- Open Findings Count:

### 7.2 Testing

- **TR**: <TR-ID / Link>
- Test Status: PASS | FAIL | PARTIAL

### 7.3 Acceptance

- **ACR**: <ACR-ID / Link>
- Acceptance Status: ACCEPTED | REJECTED | BLOCKED | PENDING

---

## 8. Risk & Decision Notes

Document known risks, assumptions, or notable decisions that affect
this version.

- Technical risks
- Dependency risks
- Schedule or resource risks

---

## 9. Working Notes & TODO Reference

This section references **non-auditable working materials**.

- TODO File / Location:
- High-priority unresolved items:

> Note: TODO items are not considered audit evidence.

---

## 10. Version Readiness Summary

Provide a consolidated readiness assessment.

- Specification completeness
- Audit readiness
- Test confidence
- Acceptance readiness

---

## 11. Next Actions

Define the next steps for this version.

- Freeze criteria
- Release criteria
- Transition to next version (if applicable)

---

## 12. Change Log

| Date       | Change           | Note |
| ---------- | ---------------- | ---- |
| YYYY-MM-DD | Initial creation |      |
