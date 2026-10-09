---
document: STS
id: <STS-ID>
version: <version>
stage: <Draft | Review | Approved | Released>
status: <status>
owner: <owner>
created: <YYYY-MM-DD>
updated: <YYYY-MM-DD>
---

# Software Test Specification (STS)

> This document defines a **structural test specification**.
>
> It specifies **externally observable behaviors and acceptance conditions**
> without assuming any test framework, tooling, or implementation strategy.

---

## 0. Change History

| Version | Date | Author | Description |
| ------- | ---- | ------ | ----------- |

---

## 1. Introduction

### 1.1 Purpose
[[PURPOSE]]

### 1.2 Scope
[[SCOPE]]

### 1.3 Definitions, Acronyms, Abbreviations

| Term | Description |
| ---- | ----------- |

### 1.4 References
[[REFERENCES]]

### 1.5 Document Overview
[[DOCUMENT_OVERVIEW]]

---

## 2. Overall Test Description

### 2.1 Test Perspective
[[TEST_PERSPECTIVE]]

### 2.2 Test Scope and Coverage
[[TEST_SCOPE_AND_COVERAGE]]

### 2.3 Test Roles and Responsibilities
> Roles MUST be explicitly declared.  
> No implicit or assumed actors are allowed.
[[TEST_ROLES]]

### 2.4 Test Environment Assumptions
[[TEST_ENVIRONMENT_ASSUMPTIONS]]

### 2.5 Test Constraints
[[TEST_CONSTRAINTS]]

### 2.6 Assumptions and Dependencies
[[ASSUMPTIONS_AND_DEPENDENCIES]]

---

## 3. Test Specifications

> Each test specification MUST be uniquely identifiable,
> traceable, and objectively verifiable.

### 3.x Test Area: <AREA_ID>

#### TS-<AREA_ID>-<ID>

**DESCRIPTION**  
[[TEST_DESCRIPTION]]

**GIVEN / PREREQUISITES**  
[[TEST_PREREQUISITES]]  
> Represents the initial system state or context.  
> Compatible with *Given* in BDD / TDD workflows.

**WHEN / TEST_STEPS**  
[[TEST_STEPS]]  
> Describes the stimulus or action applied to the system.  
> MUST remain implementation-agnostic.

**THEN / EXPECTED_RESULT**  
[[EXPECTED_RESULT]]  
> Defines objectively observable outcomes.

**TRACE**  
- SRS: FR-XXX (optional)
- SDS: SDS-XXX (optional)

---

## Appendix A. Traceability Policy (Informative)

> This appendix defines how this STS participates in
> traceability, verification, and reporting pipelines.
>
> It does not define test content.

### A.1 Trace Enablement
[[TRACE_ENABLEMENT]]

### A.2 Trace Scope
[[TRACE_SCOPE]]

### A.3 Partial Trace and Exceptions
[[TRACE_EXCEPTIONS]]

---

## Appendix B. Authoring and Structural Constraints (Informative)

### B.1 Heading Hierarchy
- Section levels are fixed.
- No additional heading levels are allowed.

### B.2 Mandatory Fields
- All test items MUST declare an ID.
- All test items MUST include:
  - DESCRIPTION
  - GIVEN / PREREQUISITES
  - TEST_STEPS / WHEN
  - EXPECTED_RESULT / THEN
- Free-form narrative outside defined placeholders is not allowed.

### B.3 Test Item Identification Rules
- Test item IDs MUST follow the format: `TS-<AREA_ID>-<ID>`.
- `<AREA_ID>` MUST match the enclosing Test Area identifier.
- `<ID>` MUST be unique within the same `<AREA_ID>`.

---

## Appendix C. Methodology Compatibility Notes (Informative)

- This STS structure is compatible with TDD, BDD, and ATDD workflows.
- Given / When / Then semantics are supported through structured fields.
- Methodology usage does not alter document authority or governance.

---

## Appendix D. Notes
