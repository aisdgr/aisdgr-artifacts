# 規則規範 (Rule Specification)

*(結構化約束表示法 – 規則設定檔)*

---

## 1. 目的

本文件定義了 **結構化約束表示法 (Structured Constraint Representation, SCR)** 框架中 **規則 (Rule)** 的概念規範。

規則是一個 **用於 AI 通訊的結構化、宣告式約束單元**，旨在以穩定、可檢查且可重用的形式，向 AI 系統表達 **強制性的行為邊界**。

規則：

- **並非治理工作流 (Governance workflow)**
- **並非執行機制 (Execution mechanism)**
- **並非政策引擎 (Policy engine)**

它是一種 **語言人工製品 (Language artifact)**，設計初衷是為了 **讓 AI 閱讀與解釋**，同時保持適用於治理、稽核與可追溯性。

---

## 2. 規則是什麼 — 以及不是什麼

### 2.1 規則是什麼

規則是：

- 一個 **單一、原子的規範性陳述 (Normative statement)**
- 使用 **規則規範語言 (Rule Normative Language, RNL)** 表達
- 輔以 **結構化的非規範性屬性**
- 旨在 **減少 AI 解釋時的語義偏移 (Semantic drift)**
- 可在工具、流水線與治理系統間移植

簡言之：

> **規則 = 為 AI 設計的結構化規範性陳述**

---

### 2.2 規則不是什麼

規則 **不定義** 以下內容：

- 治理流程
- 人機協作程序 (Human-in-the-loop procedures)
- 所有權或問責邏輯
- 執行工作流或流水線
- 授權或存取控制
- 執行引擎或運行時控制

這些關注點屬於 **外部系統**，而非規則本身。

---

## 3. 設計原則

本規範遵循以下原則：

1. **單一規則，單一約束**：每個規則僅包含一個規範性約束。
2. **約束重於控制**：規則定義的是邊界，而非程序。
3. **宣告式，而非程序式**：規則描述的是「必須維持的狀態」，而非「如何行動」。
4. **具備治理意識，但執行中立**：治理元數據支援可稽核性，但絕不可影響執行行為。
5. **表示法無關 (Representation-Agnostic)**：YAML 模式 (Schema) 是參考表示法，而非標準本身。

---

## 4. 最小規則概念

最小的有效規則被設計為極簡形式。

```yaml
execution:
  id: RULE-001
  normative: >
    當缺少必要輸入時，AI 必須 (MUST) 停止生成。
```

這個最小規則已經具備：

- 有效的 AI 約束力
- 可直接複製到提示詞 (Prompt) 中
- 人類可理解
- 系統可解釋

除此之外的所有內容，其存在目的皆是為了 **在大規模應用時減少歧義**，而非取代此核心。

---

## 5. 規則結構概覽

在概念上，一個規則由三個部分組成：

1. **規範 (Normative)** — 規範性核心
2. **套用為 (Apply As)** — AI 的解釋視點
3. **治理 (Governance)** — 描述性治理背景

僅有 **規範 (Normative)** 部分具有規範性 (Normative)。

---

## 6. 規範 (規範性核心)

### 6.1 定義

`normative` 欄位表達了規則中 **唯一的規範性陳述**。

- 必須使用 **規則規範語言 (RNL)** 編寫
- 可以使用如 **MUST (必須)**、**MUST NOT (絕不可)**、**SHALL (應)** 等規範性關鍵字
- 不得引入條件分支邏輯或執行步驟

所有的行為含義必須僅能從此欄位衍生而來。

---

### 6.2 規範獨占性

其他欄位均不得：

- 強加強制性行為
- 覆蓋或削弱規範性陳述
- 引入替代性的解釋

> **規範定義行為；其餘一切皆在解釋背景。**

---

## 7. 套用為 (Apply As)

### 7.1 目的

`apply_as` 指定了 AI 系統在解釋和套用規範性陳述時所「必須」採用的 **專業觀點 (Professional perspective)**。

它將 LLM 的解釋空間縮限至特定的領域視角，而非「由誰來執行動作」。

範例：

```yaml
apply_as: qa
```

---

### 7.2 非角色扮演性質

`apply_as`：

- 不是角色扮演 (Role-playing) 指令
- 不是責任分配
- 不暗示權限或問責歸屬

其唯一目的是透過縮限 AI 的語義視角來減少解釋上的歧義。

---

## 8. 邊界 (Boundary)

邊界宣告 **不是規則 schema 的一部分**。

決策範圍綁定是 **邊界架構 (Boundary Architecture)** 的責任，它在執行時期動態進行執行範圍綁定。規則應刻意不知悉邊界背景，以保持在不同執行環境中的可移植性與可重用性。

---

## 9. 治理 (Governance)

### 9.1 目的

`governance` 部分包含 **描述性治理元數據**。

治理資訊支援：

- 問責制 (Accountability)
- 可稽核性 (Auditability)
- 可追溯性 (Traceability)
- 政策一致性 (Policy alignment)

它 **不得** 參與執行行為。

---

### 9.2 治理欄位

治理內容可能包括：

- 版本與生命週期狀態
- 所有權 (Owner)
- 意圖與理由 (Intent and Rationale)
- 職責分配 (Responsibilities)
- 適用背景 (Applicability Context)
- 治理影響與證據預期 (Governance Impact and Evidence Expectations)

所有治理欄位僅供 **資訊參考**。

---

## 10. 意圖 (WHY)

### 目的

`intent` 從治理角度描述了 **規則為何存在**。

- 選填
- 資訊性內容
- 非規範性
- 由組織定義

範例：

```yaml
intent:
  enterprise_domain:
    - security_baseline
  industry:
    - fintech
```

意圖不得定義條件、邏輯或風險評估。

---

## 11. 職責 (WHO)

`responsibilities` 宣告 **利益相關者的問責歸屬**，而非執行角色。

範例：

```yaml
responsibilities:
  ai:
    - generator
  human:
    - reviewer
    - gatekeeper
```

職責分配不會影響執行行為。

---

## 12. 適用背景 (WHEN)

`applicability_context` 描述與 **治理相關的情境**。

它絕不可被解釋為觸發器或執行條件。

範例：

```yaml
applicability_context:
  scenario:
    test_failure:
      risk: quality
      severity: high
```

---

## 13. 治理影響 (WHAT HAPPENS)

`governance_impact` 描述 **預期的治理層面結果**。

它僅具描述性質。

範例：

```yaml
governance_impact:
  outcome:
    classification: execution_halted
  report:
    - failure_reason
    - failed_test_list
```

---

## 14. 治理就緒度 (Governance Readiness)

治理相關欄位的存在是為了支援 **未來的治理利用**。

本規範：

- 不定義治理工作流
- 不定義證據生成邏輯
- 不定義強制執行機制

> 治理用途將由 **治理證據規範 (Governance Evidence Specification, GES)** 另行定義。

---

## 15. 規則與規則集 (Rules and Rulesets)

規則是 **治理的原子單元**。

規則可由外部系統分組為規則集 (Rulesets)。

規則本身被設計為不感知其所屬規則集的組成情況。

---

## 16. 表示法與模式檔案

YAML 模式檔案是 **參考表示法**，旨在：

- 提高可讀性
- 支援工具開發
- 促進互通性

它們 **並非 SCR 標準本身**。

---

## 17. 心智模型

將規則想像為：

> 一個 **單一的規範性陳述**，
> 
> 其編寫方式使 **AI 誤解的空間極小化**，
> 
> 同時讓人類與治理系統仍能對其進行推理。

這就是規則存在的全部意義。
