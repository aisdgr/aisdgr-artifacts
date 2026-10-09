---
id: {{meta.id}}
document: {{meta.title}}
version: {{version.version}}
status: {{version.status}}
author: {{version.author}}
created: {{version.date}}
updated: {{version.date}}
---

# Conceptual Implementation Specification (CIS)

> This document defines **conceptual decision structures** that describe
> how a system interprets conditions and produces outcomes.
>
> This document **does NOT define execution flow, algorithms, or implementation details**.

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

## 2. Conceptual Model Overview

### 2.1 Conceptual Context
{{conceptual.context}}

### 2.2 Conceptual Approach
{{conceptual.approach}}

### 2.3 Conceptual Patterns
{{conceptual.patterns}}

---

## 3. Decision Structure

> Each decision MUST be uniquely identifiable, declarative, and composable.
> Decision order is NOT significant.

#### {{decision.id}}

**TITLE**
{{decision.title}}

**DESCRIPTION**
{{decision.description}}

**RATIONALE**
{{decision.rationale}}

**TRADEOFFS**
{{decision.tradeoffs}}

**ALTERNATIVES**
{{decision.alternatives}}

**IMPACT**
{{decision.impact}}

---
