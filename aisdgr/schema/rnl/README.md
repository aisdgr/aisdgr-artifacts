# RNL (Rule Normative Language) README

---

## 1. Purpose

RNL defines a **Rule Normative Language** for expressing
**mandatory behavioral constraints** to AI systems.

RNL is designed to:
- Reduce semantic drift caused by natural language ambiguity
- Lock behavioral boundaries using explicit modality
- Provide stable, repeatable constraint expressions

RNL does **not** describe:
- Intent or motivation
- Background or requirements
- Governance processes or SOPs
- Desired outcomes or preferences

RNL expresses **only enforceable behavioral constraints**.

---

## 2. Scope


RNL applies to **any interaction where AI behavior must be constrained**.

It is independent of:
- Domain (code, document, agent, pipeline, chat)
- Tooling or platform
- Governance or workflow systems

RNL may be used:
- Directly in AI prompts
- Embedded within structured artifacts (e.g. rules)
- As input to validation or analysis tools

Its applicability is determined solely by whether
**AI behavior must be constrained**, not by use case category.

---

## 3. Normative Keywords

RNL restricts normative modality to a minimal, explicit set:

- MUST
- MUST NOT
- SHOULD
- SHOULD NOT

These keywords define obligation strength and are interpreted literally.
No other modal expressions are permitted.

---

## 4. Forbidden and Discouraged Words

### ❌ Forbidden

The following words introduce ambiguity and **MUST NOT appear** in RNL:

- may / might
- try / attempt
- possibly
- if possible
- as appropriate

### ⚠️ Discouraged

- should (unless explicitly defined as SHALL)
- normally / usually
- best effort
- recommended

Core rule:

> **RNL MUST NOT contain ambiguity or optionality.**

---

## 5. Sentence Structure

RNL follows a constrained sentence structure to reduce ambiguity
while preserving natural language readability.

The structure is **conceptual**, not grammatical enforcement.
It exists to guide disciplined writing, not to define a parser-driven DSL.

The conceptual structure is:

<Subject> <Normative Keyword> <Action> <Target> [Condition]

---

### 5.1 Linguistic Roles (Conceptual)

The sentence structure is composed of **linguistic roles**, not schema fields.

| Role              | Meaning                                                      |
| ----------------- | ------------------------------------------------------------ |
| Subject           | The artifact, output, or execution context being constrained |
| Normative Keyword | Obligation strength (MUST, MUST NOT, SHOULD, SHOULD NOT)     |
| Action            | The constrained behavior                                     |
| Target            | The object of the action                                     |
| Condition         | Optional narrowing condition                                 |

These roles:

- Are not explicitly annotated
- Are not required to appear in fixed positions
- Are not extracted or validated by syntax rules

They exist to **shape how constraints are written**, not how they are parsed.

---

### 5.2 Subject Selection Principle

RNL strongly prefers **artifact-oriented subjects**
over conversational or role-based subjects.

The subject SHOULD represent:

- A concrete artifact (e.g. report, output, file)
- An execution state (e.g. execution, validation)
- An observable result

The subject SHOULD NOT represent:

- A conversational persona
- An implied speaker or listener

**Design Principle**

> Prefer **what must exist or change**  
> over **who must perform the action**.

This reduces conversational bias and stabilizes interpretation across contexts.

---

### 5.3 Action and Target Clarity

Actions SHOULD be:
- Concrete
- Observable
- Unambiguous

Targets SHOULD be:
- Explicit artifacts (e.g. report, file, output)
- Clearly bounded concepts (e.g. FILE_SCOPE, INPUT_SET)

Avoid vague or evaluative phrasing that requires inference.

---

### 5.4 Conditions (Optional)

Conditions may be used to narrow applicability.

Conditions:

- MUST NOT introduce execution logic
- MUST NOT describe procedures
- SHOULD remain simple and factual

Conditions exist to limit **when** a constraint applies,
not **how** it should be handled.

---

### 5.5 Structural Discipline, Not Grammar Enforcement

RNL does NOT require:

- Fixed sentence templates
- Parser-enforced grammar
- Explicit tagging of roles

The structure exists to:

- Reduce interpretation variance
- Improve consistency across constraints
- Help both AI and humans recognize boundaries

RNL remains a **language discipline**, not a programming language.

---

## 6. Examples

This section provides **illustrative examples** of RNL usage.

Examples demonstrate **writing quality**, not exhaustive correctness.
They are grouped by clarity and constraint strength.

---

### 6.1 Preferred Examples (Good)

```text
Report MUST include a count of all warning-level findings.
Execution MUST stop when required input is missing.
Output MUST NOT contain data outside FILE_SCOPE.
```

Characteristics:

- Artifact-oriented subjects
- Explicit actions
- Clear targets
- Strong normative keywords

---

### 6.2 Acceptable Examples

```text
The system MUST generate a validation report.
The execution process MUST terminate on failure.
```

Characteristics:

- Clear constraints
- Slightly more abstract subjects
- Still enforceable and unambiguous

---

### 6.3 Discouraged Examples

```text
You MUST include a count of all warning-level findings.
The AI MUST stop when something is wrong.
```

Problems:

- Conversational or persona-based subjects
- Implicit or vague targets
- Increased risk of interpretation drift

---

### 6.4 Invalid Examples

```text
Please try to include warnings if possible.
It would be better to stop execution when input is missing.
```

Problems:

- No normative keywords
- Polite or advisory tone
- No enforceable constraint

---

### 6.5 Comparative Example: Artifact vs Conversational Subject

```text
Report MUST list all validation warnings before execution continues.
```

is preferred over:

```text
You MUST list all validation warnings before continuing.
```

Because:

- The constraint is anchored to an observable artifact
- It avoids conversational role assumptions
- It remains valid regardless of prompt framing or system role

---

## 7. Schema Purpose

The RNL schema exists **to constrain language**, not to execute logic.

Its goals:

1.  Restrict sentence shape
2.  Lock normative keywords
3.  Signal to AI, tools, and humans:  
    **“This text is a constraint.”**

The schema itself is a **constraint artifact**.

---

## 8. Schema Usage Examples

### 8.1 cnl.schema.yaml (Structural Definition)

```yaml
normative_keywords:
  - MUST
  - MUST NOT
  - SHALL
  - SHALL NOT

sentence_patterns:
  - "<Subject> <Normative> <Action> <Target>"
  - "<Subject> <Normative> <Action> <Target> on <Condition>"
```

---

### 8.2 cnl.yaml (RNL Artifact)

```yaml
statements:
  - "Generator MUST stop on test failure."
  - "System MUST NOT modify files outside FILE_SCOPE."
  - "Report MUST count warning entries."
```

---

### 8.3 Embedded in a Rule

```yaml
rule:
  id: RULE-STOP-001
  description:
    ref: cnl.schema.yaml
    text: "Generator MUST stop on test failure."
```

---

### 8.4 Direct Prompt Usage

```text
You are an AI agent.

The following constraints apply:

- Generator MUST stop on test failure.
- System MUST NOT modify files outside FILE_SCOPE.
```

---

## 9. Key Takeaway

RNL is not about making AI smarter.

It is about making AI **less free to drift**.

By combining:

- Restricted keywords
- Restricted sentence patterns
- Structural enforcement

RNL reduces AI behavior from **unbounded interpretation**  
to **controlled variability**.

---

**RNL is language — but it is constrained language.**
