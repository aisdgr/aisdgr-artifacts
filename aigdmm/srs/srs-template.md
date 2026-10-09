---
document: SRS
id: <SRS-ID>
version: <version>
stage: <Draft | Review | Approved | Released>
status: <status>
owner: <owner>
created: <YYYY-MM-DD>
updated: <YYYY-MM-DD>
---

# Software Requirements Specification (SRS)

> This document defines a **structural requirements specification template**.  
> It contains **no implied business domain, system type, or implementation context**.

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

## 2. Overall Description

### 2.1 Product Perspective
[[PRODUCT_PERSPECTIVE]]

### 2.2 Product Functions
> Descriptive only. No normative requirements are allowed in this section.
[[PRODUCT_FUNCTIONS]]

### 2.3 User Classes and Characteristics
> Roles MUST be explicitly declared.  
> No implicit, inferred, or assumed actors are allowed.
[[USER_CLASSES]]

### 2.4 Operating Environment
[[OPERATING_ENVIRONMENT]]

### 2.5 Design and Implementation Constraints
[[DESIGN_CONSTRAINTS]]

### 2.6 Assumptions and Dependencies
[[ASSUMPTIONS_AND_DEPENDENCIES]]

---

## 3. Functional Requirements

> Each functional requirement MUST be uniquely identifiable, traceable, and testable.

### 3.x Module: <MODULE_ID>

#### FR-<ID>

**TITLE**  
[[FR_TITLE]]

**DESCRIPTION**  
[[FR_DESCRIPTION]]

**RATIONALE**  
[[FR_RATIONALE]]

**ACCEPTANCE_CRITERIA**  
[[FR_ACCEPTANCE_CRITERIA]]

---

## 4. Non-Functional Requirements

### 4.1 Performance

#### NFR-PERF-<ID>

**TITLE**  
[[NFR_TITLE]]

**DESCRIPTION**  
[[NFR_DESCRIPTION]]

**ACCEPTANCE_CRITERIA**  
[[NFR_ACCEPTANCE_CRITERIA]]

---

### 4.2 Security

#### NFR-SEC-<ID>

**TITLE**  
[[NFR_TITLE]]

**DESCRIPTION**  
[[NFR_DESCRIPTION]]

**ACCEPTANCE_CRITERIA**  
[[NFR_ACCEPTANCE_CRITERIA]]

---

### 4.3 Reliability

#### NFR-REL-<ID>

**TITLE**  
[[NFR_TITLE]]

**DESCRIPTION**  
[[NFR_DESCRIPTION]]

**ACCEPTANCE_CRITERIA**  
[[NFR_ACCEPTANCE_CRITERIA]]

---

### 4.4 Usability

#### NFR-USA-<ID>

**TITLE**  
[[NFR_TITLE]]

**DESCRIPTION**  
[[NFR_DESCRIPTION]]

**ACCEPTANCE_CRITERIA**  
[[NFR_ACCEPTANCE_CRITERIA]]

---

### 4.5 Maintainability

#### NFR-MAI-<ID>

**TITLE**  
[[NFR_TITLE]]

**DESCRIPTION**  
[[NFR_DESCRIPTION]]

**ACCEPTANCE_CRITERIA**  
[[NFR_ACCEPTANCE_CRITERIA]]

---

### 4.6 Portability

#### NFR-POR-<ID>

**TITLE**  
[[NFR_TITLE]]

**DESCRIPTION**  
[[NFR_DESCRIPTION]]

**ACCEPTANCE_CRITERIA**  
[[NFR_ACCEPTANCE_CRITERIA]]

---

## 5. Business Rules

#### BR-<ID>

**DESCRIPTION**  
[[BR_DESCRIPTION]]

**ACCEPTANCE_CRITERIA**  
[[BR_ACCEPTANCE_CRITERIA]]

---

## 6. User Interface Requirements (Optional)

#### UIR-<ID>

**DESCRIPTION**  
[[UIR_DESCRIPTION]]

**ACCEPTANCE_CRITERIA**  
[[UIR_ACCEPTANCE_CRITERIA]]

---

## 7. External Interface Requirements

### 7.1 API Interfaces

#### API-<ID>

**DESCRIPTION**  
[[API_DESCRIPTION]]

**ENDPOINTS**  
[[API_ENDPOINTS]]

**DATA_FORMAT**  
[[API_DATA_FORMAT]]

**ERROR_HANDLING**  
[[API_ERROR_HANDLING]]

---

### 7.2 Data Interfaces

#### DATA-IF-<ID>

**DESCRIPTION**  
[[DATA_INTERFACE_DESCRIPTION]]

**DATA_SCHEMA**  
[[DATA_SCHEMA]]

**DIRECTION**  
[[DATA_FLOW_DIRECTION]]

---

## 8. System Constraints

#### CON-<ID>

**DESCRIPTION**  
[[CONSTRAINT_DESCRIPTION]]

---

## Appendix A. Traceability Policy (Informative)

> This appendix defines how this SRS is allowed to participate in
> traceability, transformation, and verification pipelines.
> It does not define system requirements.

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
- All identifiers MUST be explicitly declared.
- Free-form narrative outside defined placeholders is not allowed.

---

## Appendix C. Notes
