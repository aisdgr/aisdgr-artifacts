# AIGDCNL
AI 治理義務與約束規範語言 (AI Governance Deontic & Constraint Normative Language)

**版本：** 1.0  
**狀態：** 現行 (Active)  
**對象：** 人類作者、驗證者、生成器

---

## 1. 目的 (PURPOSE)

AIGDCNL 定義了一種受控的規範性語言，用於在 AIGDMM 相關文件中表達治理規則、約束與不變量 (Invariants)。

本規範旨在：
- 驗證治理文件
- 生成基於規則的策略 (Policies)
- 強制執行 G-類文件之間的一致性

AIGDCNL **並非**設計作為 AI 提示詞語言 (Prompt language)。

---

## 2. 概念 (CONCEPTS)

### 2.1 規則 (Rule)

**規則**表達了一項義務、禁止、許可或建議。

一項規則：
- **必須**是宣告式的 (Declarative)
- **必須**是可測試的
- **必須**能透過 ID 被引用

**範例：**
> 生成器必須產出一個輸出文件。(RULE:GEN-001)

---

### 2.2 約束 (Constraint)

**約束**限制了可允許的行為或結構。

約束：
- 通常限制範疇、邊界或結構
- **可以**在執行前或執行期間強制執行

**範例：**
> 生成器絕不可修改宣告範疇之外的檔案。(CONSTRAINT:GEN-014)

---

### 2.3 不變量 (Invariant)

**不變量**是必須在所有時間點均成立的規則。

不變量：
- **不得**依賴於執行模式
- 違反不變量**必須**阻斷執行

**範例：**
> 治理規則必須保持為人類可審閱狀態。(INVARIANT:CORE-001)

---

## 3. 標準關鍵字 (NORMATIVE KEYWORDS)

以下關鍵字定義具備嚴格含義：

| 關鍵字         | 意義              |
| :------------- | :---------------- |
| **MUST**       | 絕對要求 (必須)   |
| **MUST NOT**   | 絕對禁止 (絕不可) |
| **SHOULD**     | 強烈建議 (應該)   |
| **SHOULD NOT** | 強烈反對 (不該)   |
| **MAY**        | 選填行為 (可以)   |

**備註：**
- 不允許使用 「SHALL」
- 關鍵字區分大小寫

---

## 4. 語句結構 (STATEMENT STRUCTURE)

每一項規範性陳述**必須**遵循以下邏輯形式：

```
<Subject> <Normative Keyword> <Action> [<Condition>] [<Exception>].
```

其中：
- **主體 (Subject)**：生成器 (generator)、驗證者 (validator)、系統、使用者、審計員、流水線等。
- **動作 (Action)**：可觀察的行為。
- **條件 (Condition)**：when / if / unless 子句。
- **例外 (Exception)**：明確說明的例外情況。

---

## 5. 識別碼 (IDENTIFIERS)

每一項規則、約束或不變量**必須**包含一個識別碼。

**格式：**

```
<RULE|CONSTRAINT|INVARIANT>:<DOMAIN>-<NUMBER>
```

**範例：**
- RULE:GEN-001
- CONSTRAINT:CAS-012
- INVARIANT:CORE-001

---

## 6. 禁止用語 (PROHIBITED LANGUAGE)

標準規範陳述中禁止使用以下詞彙：

- 盡力而為 (best effort)
- 視需要 (as needed)
- 等等 (etc.)
- 且/或 (and/or)
- 嘗試 (try to)
- 可能 (maybe)
- 通常 (usually)
- 一般而言 (generally)

**原因：** 這些詞彙無法經由機器驗證。

---

## 7. 使用範疇 (USAGE SCOPE)

AIGDCNL 適用於：
- GCG (治理憲章指南)
- GCS (治理代碼標準)
- GEC (治理執行約束)
- GEP (治理執行計劃)
- 所有衍生的治理策略

---

## 8. 非目標 (NON-GOALS)

AIGDCNL **不**定義：
- 執行工作流
- AI 提示策略 (AI prompting strategies)
- 模型特定指令 (Model-specific instructions)