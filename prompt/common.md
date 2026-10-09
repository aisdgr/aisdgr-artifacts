# Prompt Control Frame (Common)

## Purpose

This document defines the **common prompt control structure**
used across all AIDDM documents and Review Units (RU).

It establishes **AI behavioral boundaries**, execution rules,
and human handoff conditions.

This file is **shared by SRS, SAS, SDS, STS, VDP, and all RUs**.

---

## 1. System Prompt (Behavior Boundary)

The AI Agent operates under strict control:

- Specification documents are immutable.
- Any deviation is treated as an implementation defect.
- The AI is not allowed to reinterpret or extend requirements.
- The AI acts as a controlled engineering agent, not an author.

---

## 2. Context Input

Context includes:

- Active Version Development Plan (VDP)
- Immutable specification documents
- Current observed system state (if any)

Context is **read-only** and serves as the execution baseline.

---

## 3. Task Prompt

The task prompt defines:

- The current Review Unit (RU)
- The exact execution scope
- The allowed implementation target

Each RU **must have its own Task Prompt**.

---

## 4. Constraints (Repeated Enforcement)

To prevent AI self-rationalization:

- No document modification
- No inferred requirements
- No placeholder or mock data
- No bypassing of defined models or checks

Constraints **must be repeated explicitly** in every execution.

---

## 5. Expected Output

The AI must produce:

- Only the artifacts explicitly requested
- Clear indication of changes
- No additional suggestions outside scope

---

## 6. Stop Condition & Gatekeeper

After output generation:

- The AI must stop execution
- Human Gatekeeper review is mandatory
- No automatic continuation is allowed

---

## Status

This control frame is mandatory for all AI-driven execution
under the AIDDM methodology.
