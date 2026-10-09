# AI Struct Language (BRA)

AI Struct Language (BRA) is a layered language system designed to define,
constrain, and stabilize AI behavior through explicit structure rather than
implicit interpretation.

focuses on **minimizing semantic drift** by separating:
- human-readable normative intent,
- machine-parseable constrained language,
- rule-level execution structures,
- and document-level structural validation.

is not a prompt format, not a policy engine, and not a metadata framework.
It is a **structural language family** for AI behavior governance.

---

## Why Exists

Modern AI systems are highly capable of inference, but this strength introduces
a fundamental risk: **semantic drift**.

AI tends to:
- reinterpret instructions,
- optimize away constraints,
- infer missing intent,
- and normalize ambiguity.

addresses this by enforcing a single principle:

> **AI behavior must be constrained by structure, not interpretation.**

Instead of relying on hidden system prompts or opaque policies, makes
constraints explicit, layered, and inspectable.

---

## Core Design Principles

is built on the following principles:

1. **Structure over inference**  
   Explicit structure is preferred over implicit meaning.

2. **Language over configuration**  
   defines how rules are *written*, not how they are *executed*.

3. **Minimal authority surface**  
   Only normative language defines behavior.
   All other fields exist solely to reduce drift.

4. **Separation of concerns**  
   Semantic expression, behavioral rules, and document structure are isolated
   into distinct layers.

---

## Language Layers

is not a single language. It is a **language family** composed of four
cooperating layers.

```
AI Struct Language (BRA)
├─ NNL (Normative Natural Language)
├─ CNL (Constraint Normative Language)
├─ Rule (Rule Struct Language)
└─ Doc (Document Struct Language)
```

Each layer has a clearly defined responsibility and boundary.

---

### 1. NNL — Normative Natural Language

**Purpose:**  
Express normative intent in natural language.

**Characteristics:**
- Human-readable
- Conceptual and expressive
- Suitable for discussion, explanation, and review
- Not guaranteed to be machine-verifiable

**Role:**  
NNL is the *conceptual source* of norms.

---

### 2. CNL — Constraint Normative Language

**Purpose:**  
Reduce ambiguity and prevent reinterpretation.

**Characteristics:**
- Controlled grammar
- Explicit normative keywords (e.g. MUST, MUST NOT)
- One statement, one obligation
- Parsable and checkable

**Role:**  
CNL is the *authoritative expression* of normative behavior.

Only statements written in CNL are considered behavior-defining.

---

### 3. Rule — Rule Struct Language

**Purpose:**  
Bind a normative statement to a minimal execution context.

**Characteristics:**
- No policy generation
- No enforcement logic
- No enumerated vocabularies
- No metadata authority

**Structure:**
- A single authoritative CNL description
- Optional structured hints to reduce interpretation drift

**Role:**  
Rule defines **what AI must do**, not **how systems enforce it**.

---

### 4. Doc — Document Struct Language

**Purpose:**  
Define the valid structure of documents that contain rules.

**Characteristics:**
- Explicit section definitions
- Enumerated structural elements
- Order and containment rules
- Parser- and validator-oriented

**Role:**  
Doc governs **document shape**, not AI behavior.

Enumerations are intentionally allowed here, as they describe
static structure rather than semantic intent.

---

## What Is Not

explicitly does **not** attempt to be:

- A prompt engineering framework
- A policy execution engine
- A rule enforcement system
- A metadata or workflow manager

defines **language and structure only**.

Execution, validation, enforcement, auditing, and governance are
expected to exist *above* or *beside* BRA, not inside it.

---

## Relationship to AIGDMM

serves as the **language foundation** of AIGDMM (AI-Guided, Document-Driven
Methodology).

Within AIGDMM:
- provides the stable language core
- Documents provide execution context
- Pipelines provide orchestration
- Systems provide enforcement

This separation ensures that AI behavior remains understandable,
inspectable, and evolvable over time.

---

## Guiding Principle

> **AI should not guess what we mean.  
> We should structure what we mean.**

exists to make that structure explicit.

---

## Status

is an evolving language family.
Its core layers are intentionally minimal to ensure long-term stability.

Extensions may be introduced, but the foundational principles are expected
to remain unchanged.
