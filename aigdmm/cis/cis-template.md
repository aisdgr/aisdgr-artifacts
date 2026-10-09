---
document: CIS
id: <CIS-ID>
version: <version>
stage: <Draft | Review | Approved | Released>
status: <status>
owner: <owner>
created: <YYYY-MM-DD>
updated: <YYYY-MM-DD>
---

# Conceptual Implementation Specification (CIS)

CIS defines design-level decision structures that describe
how a system interprets conditions and produces outcomes.

CIS does NOT define execution flow.

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

---

## 2. Conceptual Model Overview

### 2.1 Concept Perspective
[[CONCEPT_PERSPECTIVE]]

### 2.2 Concept Boundaries
[[CONCEPT_BOUNDARIES]]

---

## 3. Meta Definitions

Meta defines neutral conceptual keys.
Meta MUST NOT encode behavior or logic.

### Meta List

#### [[META-GROUP-NAME]]

- `<META_KEY>` - [[META_VALUE]]
- `<META_KEY>` - [[META_VALUE]]

---

## 4. Rule Specifications

Rules define composable decision fragments.
Rule order is NOT significant.

### [[RULE-GROUP-NAME]]

#### RULE-<GROUP_ID>-<RULE_ID>

**Description**
[[RULE_DESCRIPTION]]

**Referenced Meta**
- <META_KEY>

**Condition**
- [[CONDITION_EXPRESSION]]

**Outcome**
- [[OUTCOME_EXPRESSION]]

**Trace**
- <kind>:<namespace>:<id>

---

## Appendix A. Authoring Rules

- CIS MUST NOT define execution flow
- Rules define condition-to-outcome only
- Meta MUST remain neutral
- Structure MUST NOT be altered manually
