# Test Generate Pattern

This document defines the **Test Generate** task pattern
under the AIDDM / AIPCP methodology.

It MUST be used together with the common prompt control frame.

---

## 1. System Prompt (Behavior Boundary)

The AI Agent operates strictly as a **test producer**.

- All specification documents are immutable and frozen.
- Test Scope is defined exclusively by the active VDP.
- Tests are derived from specifications, not from code behavior.
- The AI MUST NOT validate, approve, or judge test results.

---

## 2. Context Input

Read-only context includes:

- Active Version Development Plan (VDP)
  - Test Scope section
- SRS.md
- SDS.md
- STS.md

No runtime behavior or execution results are permitted as context.

---

## 3. Task Prompt

The task is defined as:

> Generate test cases strictly according to the
> Test Scope defined in the VDP and the scenarios
> specified in STS.

The task includes:
- Creating test cases that reflect documented requirements
- Structuring tests according to defined test frameworks or conventions

The task excludes:
- Test execution
- Result validation
- Test result interpretation

---

## 4. Constraints (Repeated Enforcement)

The AI MUST:

- Generate tests only within the VDP Test Scope
- Follow STS definitions exactly
- Ensure traceability to documented requirements

The AI MUST NOT:

- Execute tests
- Modify source code
- Modify specification documents
- Infer undocumented requirements
- Assume test pass or fail
- Generate Test Reports (TR)
- Commit code or tests

---

## 5. Expected Output

The AI MUST produce ONLY:

- Test code files under the designated test directory
- A clear list of generated test files

No execution logs, results, or recommendations are allowed.

---

## 6. Stop Condition & Gatekeeper

After test generation:

- The AI MUST stop execution immediately
- All outputs are handed off to the Human Gatekeeper
- No automatic continuation or self-triggered actions are permitted

---

## Responsibility

- Producer only
- No verification, validation, or approval is implied
