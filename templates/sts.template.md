---
id: {{meta.id}}
document: {{meta.title}}
version: {{version.version}}
status: {{version.status}}
author: {{version.author}}
created: {{version.date}}
updated: {{version.date}}
---

# Software Test Specification (STS)

> This document defines a **structural test specification**.
>
> It specifies **externally observable behaviors and acceptance conditions**
> without assuming any test framework, tooling, or implementation strategy.

---

## Change History

| Version             | Date             | Author             | Description     |
| ------------------- | ---------------- | ------------------ | --------------- |
| {{version.version}} | {{version.date}} | {{version.author}} | {{description}} |

---

## 1. Introduction

### 1.1 Purpose
{{purpose}}

### 1.2 Scope
{{scope}}

### 1.3 Definitions, Acronyms, Abbreviations

| Term     | Description     |
| -------- | --------------- |
| {{term}} | {{description}} |

### 1.4 References
{{references}}

### 1.5 Document Overview
{{document_overview}}

---

## 2. Overall Test Description

### 2.1 Test Perspective
{{test_perspective}}

### 2.2 Test Scope and Coverage
{{test_scope_and_coverage}}

### 2.3 Test Roles and Responsibilities
> Roles MUST be explicitly declared.  
> No implicit or assumed actors are allowed.
{{test_roles}}

### 2.4 Test Environment Assumptions
{{test_environment_assumptions}}

### 2.5 Test Constraints
{{test_constraints}}

### 2.6 Assumptions and Dependencies
{{assumptions_dependencies}}

---

## 3. Test Specifications

> Each test specification MUST be uniquely identifiable,
> traceable, and objectively verifiable.

### 3.x {{test_area.title}}

#### {{test_case.id}}

**TITLE**  
{{test_case.title}}

**DESCRIPTION**  
{{description}}

**GIVEN / PREREQUISITES**  
{{test_prerequisites}}  
> Represents the initial system state or context.  
> Compatible with *Given* in BDD / TDD workflows.

**WHEN / TEST_STEPS**  
{{test_steps}}  
> Describes the stimulus or action applied to the system.  
> MUST remain implementation-agnostic.

**THEN / EXPECTED_RESULT**  
{{expected_result}}  
> Defines objectively observable outcomes.

**TRACE**  
- SRS: {{trace.srs}}
- SDS: {{trace.sds}}
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
