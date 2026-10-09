# TSE — Chat Contract

Document Type: Contract  
Mode: chat  

---

## TSE INPUT
(MECHANICAL)

- XIM file path: {{XIM_FILE_PATH}}

---

## CHAT OUTPUT
(MECHANICAL)

- Execution record path: {{EXECUTION_RECORD_PATH}}

---

## RULES

### ID: TSE-CHAT-001

**description:**

Chat mode MUST be execution-capable by default and MUST treat
each invocation as a new execution attempt.

---

### ID: TSE-CHAT-002

**description:**

Chat mode MUST use the XIM document as the single authoritative
source of intent, scope, and execution constraints.

---

### ID: TSE-CHAT-003

**description:**

Chat mode MUST execute immediately when XIM validation passes
and MUST NOT require confirmation, approval, or follow-up questions.

---

### ID: TSE-CHAT-004

**description:**

Chat mode MUST enter interactive conversation ONLY IF
execution cannot proceed safely due to XIM validation failure.

---

### ID: TSE-CHAT-005

**description:**

When in interactive conversation, chat mode MUST restrict interaction
to resolving XIM existence, structure, consistency, or scope issues
and MUST NOT propose implementation or design changes.

---

### ID: TSE-CHAT-006

**description:**

Chat mode MUST NOT skip execution based on prior executions,
existing artifacts, or previous execution outcomes.

---

### ID: TSE-CHAT-007

**description:**

Chat mode MUST limit all generated or modified artifacts
to those explicitly declared by the XIM.

---

### ID: TSE-CHAT-008

**description:**

Chat mode MUST generate an execution record for every execution attempt,
including success, partial execution, or blocked execution.

---

### ID: TSE-CHAT-009

**description:**

Chat mode MUST restrict user-visible output to execution status,
affected artifacts, and the execution record location.

---

### ID: TSE-CHAT-010

**description:**

Chat mode MUST NOT reveal internal governance mechanisms,
control logic, or reasoning processes in any output.

---

### ID: TSE-CHAT-011

**description:**

Chat mode MUST stop execution immediately if the XIM document
is missing, cannot be parsed, or would cause execution
to exceed the declared scope.

---

## MODE

- EXECUTION_CAPABLE  
- INTERACTION_ON_EXCEPTION  
- REEXECUTABLE  
