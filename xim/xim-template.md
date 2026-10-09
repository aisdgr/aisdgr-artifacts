# XIM
> Execution Intent Manifest

## XIM ID
xim-[scope]-[serial]

---

## PURPOSE
<One-sentence goal of this execution.>

---

## DETAIL
<Free-form explanation, background, or human instructions. 
This section is readable by AI but is not a contract.
Do NOT include file paths or execution parameters here.>

---

## EXECUTION INTENT

- TYPE
  - <add | change | fix | refactor>

- TARGET
  - <code | test | doc>

- LANGUAGE
  - <python | ts | java | go | markdown | ...>

---

## SCOPE

- <scope item>
  - <description or identifier>

### Option A: Scenario-based (Optional)

Used when no formal STS or specification exists.

Scenario <name>:
- Given <context>
- When <event>
- Then <expected outcome>

### Option B: Reference-based (Optional)

Used when formal specifications already exist.

- <kind>:<id>
- <kind>:<id>

---

## FILE INJECTION

### System Auto Injection

- <KIND>:<NAME>:<PATH>

- TEMPLATE:SRS:.aigd/aigddm/srs/srs-template.md
- TEMPLATE:SDS:.aigd/aigddm/sds/sds-template.md
- TEMPLATE:STS:.aigd/aigddm/sts/sts-template.md
- TEMPLATE:CAS:.aigd/aigddm/cas/cas-template.md
- TEMPLATE:CIS:.aigd/aigddm/cis/cis-template.md
- TEMPLATE:CIS:.aigd/aigddm/css/css-template.md
- POLICY:EXECUTION:.aigd/aigddm/srs/execution-policy.yaml
- POLICY:EXECUTION:.aigd/aigddm/sds/execution-policy.yaml
- POLICY:EXECUTION:.aigd/aigddm/sts/execution-policy.yaml
- POLICY:EXECUTION:.aigd/aigddm/cas/execution-policy.yaml
- POLICY:EXECUTION:.aigd/aigddm/cis/execution-policy.yaml
- POLICY:EXECUTION:.aigd/aigddm/css/execution-policy.yaml
- POLICY:EXECUTION:.aigd/aigdcm/code/add/execution-policy.yaml
- POLICY:EXECUTION:.aigd/aigdcm/code/change/execution-policy.yaml
- POLICY:EXECUTION:.aigd/aigdcm/code/fix/execution-policy.yaml
- POLICY:EXECUTION:.aigd/aigdcm/code/refactor/execution-policy.yaml
- POLICY:EXECUTION:.aigd/aigdcm/code/refactor/execution-policy.css.yaml
- POLICY:EXECUTION:.aigd/aigdcm/test/add/execution-policy.yaml
- POLICY:EXECUTION:.aigd/aigdcm/test/change/execution-policy.yaml
- POLICY:GENERATE:.aigd/aigddm/srs/generate-policy.yaml
- POLICY:GENERATE:.aigd/aigddm/sds/generate-policy.yaml
- POLICY:GENERATE:.aigd/aigddm/sts/generate-policy.yaml
- POLICY:GENERATE:.aigd/aigddm/cas/generate-policy.yaml
- POLICY:GENERATE:.aigd/aigddm/cis/generate-policy.yaml
- POLICY:GENERATE:.aigd/aigddm/css/generate-policy.yaml
- POLICY:GENERATE:.aigd/aigdcm/code/add/generate-policy.yaml
- POLICY:GENERATE:.aigd/aigdcm/code/change/generate-policy.yaml
- POLICY:GENERATE:.aigd/aigdcm/code/fix/generate-policy.yaml
- POLICY:GENERATE:.aigd/aigdcm/code/refactor/generate-policy.yaml
- POLICY:GENERATE:.aigd/aigdcm/code/refactor/generate-policy.css.yaml
- POLICY:GENERATE:.aigd/aigdcm/test/add/generate-policy.yaml
- POLICY:GENERATE:.aigd/aigdcm/test/change/generate-policy.yaml
- STANDARD:CGG:.aigd/aigdcm/cgg/execution-policy.yaml
- STANDARD:CSS-CORE:.aigd/aigdcm/ccs/generate-policy.core.yaml
- STANDARD:CSS-LANG:.aigd/aigdcm/ccs/generate-policy.go.yaml
- STANDARD:CSS-LANG:.aigd/aigdcm/ccs/generate-policy.java.yaml
- STANDARD:CSS-LANG:.aigd/aigdcm/ccs/generate-policy.javascript.yaml
- STANDARD:CSS-LANG:.aigd/aigdcm/ccs/generate-policy.python.yaml
- STANDARD:CSS-LANG:.aigd/aigdcm/ccs/generate-policy.rust.yaml
- STANDARD:CSS-LANG:.aigd/aigdcm/ccs/generate-policy.typescript.yaml

### User File Injection

- <KIND>:<NAME>:<PATH>

- DOC:SRS:docs/spec/srs.md
- DOC:SDS:docs/spec/sds.md
- DOC:STS:docs/spec/sts.md
- DOC:CAS:docs/spec/cas.md
- DOC:CIS:docs/spec/cis.md
- DOC:CIS:docs/spec/css.md
- DOC:API:docs/spec/a-b-api.md
- DOC:IM:docs/goals/goal.md

---

## ARTIFACT

- TYPE
  - <document | source_code | test_code | config>

- PATH
  - docs/spec/srs.md
  - docs/spec/sds.md
  - docs/spec/sts.md
  - docs/spec/cas.md
  - docs/spec/cis.md
  - docs/spec/cil.md
  - tests/
  - src/
  - src/auth/jwt.py

- LANGUAGE
  - <en-US | zh-TW | ja-JP ...>
  - <python | ts | ...>
