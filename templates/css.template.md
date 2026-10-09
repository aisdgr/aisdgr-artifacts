---
id: {{meta.id}}
document: {{meta.title}}
version: {{version.version}}
status: {{version.status}}
author: {{version.author}}
created: {{version.date}}
updated: {{version.date}}
---

# Coding Structure Specification (CSS)

> This document defines **coding-level structural responsibilities**.
> It contains **no implied behavior, logic, algorithm, or implementation detail**.

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

### 1.3 Definitions

| Term     | Description     |
| -------- | --------------- |
| {{term}} | {{description}} |

### 1.4 References
{{references}}

### 1.5 Document Overview
{{document_overview}}

---

## 2. Structure Overview

> This section describes **structural context and hierarchy only**.
> It MUST NOT describe behavioral specifications or implementation details.

### 2.1 Structural Context
{{structure.context}}

### 2.2 Structural Responsibilities
{{structure.responsibilities}}

### 2.3 Structural Hierarchy
{{structure.hierarchy}}

---

## 3. Structural Elements

> Each structural element defines **one and only one responsibility**.

### 3.1 Packages

#### {{package.id}}

**TITLE**
{{package.title}}

**DESCRIPTION**
{{package.description}}

---

### 3.2 Classes

#### {{class.id}}

**TITLE**
{{class.title}}

**DESCRIPTION**
{{class.description}}

**RESPONSIBILITIES**
{{class.responsibilities}}

---

### 3.3 Functions

#### {{function.id}}

**TITLE**
{{function.title}}

**DESCRIPTION**
{{function.description}}

**SIGNATURE**
{{function.signature}}

---

### 3.4 Files

#### {{file.id}}

**PATH**
{{file.path}}

**DESCRIPTION**
{{file.description}}

---
