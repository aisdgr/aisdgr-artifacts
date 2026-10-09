# NNL — Normative Natural Language

**Version:** 0.1  
**Status:** Concept Definition & Usage Notes  

---

## 0. WHAT IS NNL

NNL (Normative Natural Language) is **natural language used with responsibility**.

It is not a new language.
It does not change grammar, syntax, or vocabulary.

NNL simply asks humans to do one thing:

> **Say the important parts more clearly.**

NNL exists because modern AI systems are powerful enough to act,
but still rely on human language to decide *what matters*.

---

## 1. WHAT NNL IS NOT

NNL is **not**:

- a programming language  
- a domain-specific language (DSL)  
- a command syntax  
- a prompt pattern or template  
- a framework or methodology  
- a tool, feature, or product  

NNL introduces **no syntax errors**,  
**no strict rules**,  
and **no execution rejection**.

Everything written in NNL is still plain natural language.

---

## 2. CORE IDEA

### 2.1 SLIGHTLY CLEARER THAN NORMAL SPEECH

NNL does not require formality or technical detail.

It only asks speakers to make explicit:

- what they want,
- what must not be ignored,
- what is critical to success or failure.

Example:

- “Help me handle login.”
- “I want a LOGIN PAGE. Login must verify username and password.”

No implementation detail is added.
Only ambiguity is reduced.

---

### 2.2 REDUCE GUESSING, NOT CONTROL

NNL is not about controlling AI behavior.

Its purpose is to **reduce guessing**.

Most failures do not happen because AI lacks ability,
but because humans leave important assumptions implicit.

NNL externalizes those assumptions into visible language.

---

## 3. NORMATIVE INTENT (NOT KEYWORDS)

NNL does not depend on fixed keywords.

Instead, it relies on **normative intent** —
whether a sentence clearly expresses obligation, importance, or expectation.

For example, all of the following express mandatory intent:

- must  
- 必須  
- 一定要  
- しなければならない  
- अवश्यम्‌

As long as the meaning is clear,
the expression is considered normative.

Language, wording, and script do not matter.
Meaning does.

---

## 4. WHAT NNL IS USED FOR

NNL is mainly used to express three kinds of intent.

---

### 4.1 GOAL CLARIFICATION

Clarify what is actually wanted.

- “Help me implement login.”
- “I want a LOGIN PAGE.”

This reduces scope ambiguity.

---

### 4.2 IMPORTANT CONDITION SIGNALING

Highlight conditions that must not be ignored.

- “Login must verify username and password.”
- “Do not bypass authentication, even in development.”

These statements mean:

> “This part must not be guessed.”

---

### 4.3 EXPECTED RESULT OR BEHAVIOR

State what should happen on success or failure.

- “If authentication fails, deny access.”
- “If login succeeds, redirect to the home page.”

This aligns outcomes with human expectations.

---

## 5. NNL AS A SOFT NORMATIVE LAYER

NNL does not enforce behavior like code.

Violating an NNL statement is not a syntax error.

However, it is a **meaningful deviation**:
the intent was stated but not respected.

This makes responsibility visible.

---

## 6. USING NNL IN CHAT OR PROMPTS

NNL can be written **directly inside any chat or prompt**.

It does not replace prompts.
It precedes them.

Prompt patterns describe *how* an AI should respond.
NNL describes *what must not be misunderstood*.

NNL can exist:

- before a prompt,
- inside a prompt,
- or without any prompt pattern at all.

---

## 7. SUGGEST WORDS AND CONCEPTUAL PATTERNS

This section provides **non-mandatory guidance**.

Nothing needs to be memorized.

---

### 7.1 SUGGEST WORDS (EXAMPLES)

These words are commonly used to signal importance.
They are **suggestions**, not keywords.

**Mandatory / Critical**
- must
- must not
- need to
- cannot skip
- is required to

**Conditional / Result**
- if … then …
- on failure …
- on success …
- otherwise …

**Preference / Expectation**
- should
- expected to
- preferably

Any natural language expression with equivalent meaning is valid.

---

### 7.2 BASIC SENTENCE PATTERNS (CONCEPTUAL)

These are **conceptual patterns**, not syntax rules.

**Pattern A — Goal**

```
I want <something>.
```


**Pattern B — Important Condition**

```
<something> must <important behavior>.
```


**Pattern C — Failure Handling**

```
If <condition> fails, <expected behavior>.
```


Users do not need to follow these patterns strictly.
They are shown only to illustrate clarity.

---

### 7.3 LOGIN EXAMPLE

**Vague request**

```
Help me handle login.
```

**With AIGDCNL-style clarification**

```
I want a LOGIN PAGE.
Login must verify username and password.
If authentication fails, deny access.
```

No technical detail is specified.
However, the intent is now clear and hard to misunderstand.

---

## 8. WHO NNL IS FOR

NNL is for anyone who communicates intent:

- non-programmers
- engineers
- product managers
- designers
- domain experts
- everyday AI users

No technical background is required.

---

## 9. SUMMARY

NNL exists to solve a simple problem:

> **Important things should not be left to guesswork.**

By slightly adjusting how we speak,
NNL makes intent clearer,
expectations visible,
and responsibility explicit.

**No syntax.  
No keywords to memorize.  
Just clearer language.**
