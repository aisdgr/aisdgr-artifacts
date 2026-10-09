# TES — TASK EXECUTION SPECIFICATION

## ID
(NORMATIVE)

TES-[SCOPE]-[SERIAL]

This ID uniquely identifies this Task Execution Specification.
Once referenced by any execution log, it MUST be immutable.

---

## DESCRIPTION
(NON-NORMATIVE)

Human-readable description for understanding context.
This section MUST NOT be used for execution decisions.

---

## GOAL
(NORMATIVE)

GOAL defines the authoritative purpose and justification
for this execution.

When no upstream specification exists, this section
SHALL be treated as the origin source document for
execution and audit purposes.

When upstream specifications exist, this section
MUST NOT redefine or override their intent.

---

## EXECUTION MODE / TYPE
(NORMATIVE)

Declares how this execution is classified.

- MODE
  - <ANALYSIS | CHAT | EXECUTION>

- TYPE
  - <ADD | CHANGE | FIX | REFACTOR>

This section declares classification only.
It does NOT initiate execution.

---

## BOUNDARY
(NORMATIVE)

BOUNDARY defines the applicability limits of this specification.

- When execution impact is unknown, BOUNDARY constrains
  the source input domain.
- When execution impact is known, BOUNDARY constrains
  the affected output domain.

BOUNDARY SHALL be applied according to SOURCE INPUT rules
defined in this document.

---

## SOURCE INPUT
(NORMATIVE)

Declares all authoritative inputs required for execution.

If USER FILE INJECTION is defined, the execution base
MUST be derived from the USER FILE INJECTION content,
and further constrained by BOUNDARY.

If USER FILE INJECTION is NOT defined, the execution base
SHALL rely entirely on BOUNDARY.

### SYSTEM
- <KIND>:<NAME>:<PATH>

### USER
- <KIND>:<NAME>:<PATH>

---

## RESULT CONDITION
(NORMATIVE, REQUIRED)

RESULT CONDITION MUST be explicitly defined.
Execution without RESULT CONDITION is INVALID.

RESULT CONDITION defines how execution outcomes are evaluated
and how execution flow decisions are determined.

Execution results are evaluated in three aspects:
- Success determination
- Failure semantics
- Post-result handling

---

### SUCCESS CONDITION
(NORMATIVE)

Success MUST be explicitly defined using ONE of the
following approaches.

If the execution result does NOT satisfy the declared
SUCCESS CONDITION, it SHALL be treated as FAILURE.

**SCENARIO-BASED (OPTIONAL)**

Used when no upstream specification exists.

Scenario <NAME>:
- GIVEN <CONTEXT>
- WHEN <EVENT>
- THEN <EXPECTED OUTCOME>

**REFERENCE-BASED (OPTIONAL)**

Used when upstream specifications already exist.

Success is determined solely by conformance to
the referenced documents.

- <KIND>:<ID>
- <KIND>:<ID>

---

### FAILURE SEMANTICS
(NORMATIVE)

Any execution outcome that does not satisfy the
declared SUCCESS CONDITION SHALL be considered FAILURE.

---

### POST-RESULT HANDLING
(NORMATIVE)

Defines how execution flow proceeds after result evaluation.

- ON SUCCESS:
  - <CONTINUE | COMPLETE>

- ON FAILURE:
  - <RETRY | ABORT | ESCALATE>

---

## OUTPUT ARTIFACT
(NORMATIVE)

Declares expected or affected output artifacts.

Actual outputs MUST be recorded in execution logs.

- TYPE
  - <DOCUMENT | SOURCE_CODE | TEST_CODE>

- PATH
  - <PATH>

- LANGUAGE
  - <EN-US | ZH-TW | JA-JP | ...>
  - <PYTHON | TS | JAVA | GO | ...>
