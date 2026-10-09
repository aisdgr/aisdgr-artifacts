# Ruleset Index

規則集總覽，依 Domain 與組織原則分類。

---

## Ruleset 總覽

### CODE Ruleset（程式碼流程約束）

CODE rulesets 按 **Artifact × Intent** 組織，覆蓋程式碼生成與修改的各種場景。

| Ruleset ID           | Artifact    | Intent    | Rule 數 | 說明           |
| -------------------- | ----------- | --------- | ------- | -------------- |
| code.source.add      | code.source | add       | 28      | 新增原始碼     |
| code.source.change   | code.source | change    | 27      | 修改原始碼     |
| code.source.fix      | code.source | fix       | 31      | 修復原始碼缺陷 |
| code.source.refactor | code.source | refactor  | 32      | 重構原始碼結構 |
| code.test.add        | code.test   | add       | 32      | 新增測試程式碼 |
| code.test.change     | code.test   | change    | 32      | 修改測試程式碼 |
| code.test.fix        | code.test   | fix       | 32      | 修復測試問題   |
| test.execution       | code.test   | execution | 11      | 測試執行驗證   |

**組織原則：**
- Artifact: `code.source` 或 `code.test`
- Intent: `add`, `change`, `fix`, `refactor`, `execution`
- 不同 intent 選取不同的 rule 組合

**檔案：**
- `code.source.add.yaml`
- `code.source.change.yaml`
- `code.source.fix.yaml`
- `code.source.refactor.yaml`
- `code.test.add.yaml`
- `code.test.change.ruleset.yaml`
- `code.test.fix.yaml`
- `test.execution.yaml`

---

### SPEC Ruleset（規格文件類型約束）

SPEC rulesets 按 **Document Type** 組織，每種文件類型一個 ruleset。

| Ruleset ID | Document Type | Rule 數 | 說明                                |
| ---------- | ------------- | ------- | ----------------------------------- |
| spec.srs   | srs           | 44      | Software Requirements Specification |
| spec.sds   | sds           | 44      | Software Design Specification       |
| spec.sts   | sts           | 44      | Software Test Specification         |
| spec.cas   | cas           | 44      | Coding Architecture Specification   |
| spec.cis   | cis           | 44      | Coding Implementation Specification |
| spec.css   | css           | 44      | Coding Style Specification          |

**組織原則：**
- 每個 document type 一個 ruleset
- 所有 ruleset 包含相同的 44 條 rule references
- 差異僅在 `applicability.document_type`

**Rule 組成（44 條）：**
- 流程規則 37 條：TR(6) + BD(7) + AR(5) + ST(6) + CN(3) + LG(9)
- CC 內容約束 7 條：C01~C07

**檔案：**
- `spec.srs.yaml`
- `spec.sds.yaml`
- `spec.sts.yaml`
- `spec.cas.yaml`
- `spec.cis.yaml`
- `spec.css.yaml`

---

### LANG Ruleset（程式語言品質約束）

LANG rulesets 按 **Programming Language** 組織，每種語言一個 ruleset。

| Ruleset ID      | Language   | Rule 數 | 組成                    |
| --------------- | ---------- | ------- | ----------------------- |
| lang.go         | Go         | 13      | 11 Pattern + 2 Concrete |
| lang.java       | Java       | 15      | 11 Pattern + 4 Concrete |
| lang.javascript | JavaScript | 14      | 11 Pattern + 3 Concrete |
| lang.typescript | TypeScript | 14      | 11 Pattern + 3 Concrete |
| lang.python     | Python     | 14      | 11 Pattern + 3 Concrete |
| lang.rust       | Rust       | 14      | 11 Pattern + 3 Concrete |

**組織原則：**
- 每個程式語言一個 ruleset
- 所有 ruleset 共用 11 條 Pattern Rules (`LANG-CC-ALL-P01~P11`)
- 各 ruleset 加入該語言專屬的 Concrete Rules

**Pattern Rules（11 條，跨語言共用）：**
- P01: Constrained Execution
- P02: Validity vs Correctness
- P03: Explicit Governance
- P04: Violation Visibility
- P05: Deterministic Behavior
- P06: Explicit Control Flow
- P07: Sensitive Data Safety
- P08: Explicit Error Handling
- P09: Intent-Revealing Structure
- P10: Immutable Preference
- P11: Boundary Validation

**Concrete Rules（各語言專屬）：**
| Language   | Concrete Rules                 | Count |
| ---------- | ------------------------------ | ----- |
| Go         | GO-C01, GO-C02                 | 2     |
| Java       | JV-C01, JV-C02, JV-C03, JV-C04 | 4     |
| JavaScript | JS-C01, JS-C02, JS-C03         | 3     |
| TypeScript | TS-C01, TS-C02, TS-C03         | 3     |
| Python     | PY-C01, PY-C02, PY-C03         | 3     |
| Rust       | RS-C01, RS-C02, RS-C03         | 3     |

**檔案：**
- `lang.go.yaml`
- `lang.java.yaml`
- `lang.javascript.yaml`
- `lang.typescript.yaml`
- `lang.python.yaml`
- `lang.rust.yaml`

---

## 統計

| Domain    | Rulesets | 組織原則          | 說明           |
| --------- | -------- | ----------------- | -------------- |
| CODE      | 8        | Artifact × Intent | 程式碼生成場景 |
| SPEC      | 6        | Document Type     | 規格文件類型   |
| LANG      | 6        | Language          | 程式語言標準   |
| **Total** | **20**   | —                 |                |

---

## 跨域組合

Rulesets 僅組合 **單一 Domain** 的規則。跨域應用使用 overlay 方式：

```
CODE ruleset + LANG ruleset = 完整程式碼約束
  Example: code.source.add + lang.go

CODE ruleset 與 SPEC ruleset = 互斥（不同執行路徑）

SPEC ruleset 與 LANG ruleset = 不適用（不同產出物類型）
```

**Overlay 行為：**
- 各 ruleset 的規則疊加
- 無優先級或覆蓋機制
- 衝突為設計錯誤（不應存在）

---

## 檔案命名對照

| Ruleset ID           | 檔案名稱                      |
| -------------------- | ----------------------------- |
| code.source.add      | code.source.add.yaml          |
| code.source.change   | code.source.change.yaml       |
| code.source.fix      | code.source.fix.yaml          |
| code.source.refactor | code.source.refactor.yaml     |
| code.test.add        | code.test.add.yaml            |
| code.test.change     | code.test.change.ruleset.yaml |
| code.test.fix        | code.test.fix.yaml            |
| test.execution       | test.execution.yaml           |
| spec.srs             | spec.srs.yaml                 |
| spec.sds             | spec.sds.yaml                 |
| spec.sts             | spec.sts.yaml                 |
| spec.cas             | spec.cas.yaml                 |
| spec.cis             | spec.cis.yaml                 |
| spec.css             | spec.css.yaml                 |
| lang.go              | lang.go.yaml                  |
| lang.java            | lang.java.yaml                |
| lang.javascript      | lang.javascript.yaml          |
| lang.typescript      | lang.typescript.yaml          |
| lang.python          | lang.python.yaml              |
| lang.rust            | lang.rust.yaml                |
