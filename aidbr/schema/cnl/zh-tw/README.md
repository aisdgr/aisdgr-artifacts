# CNL (Constraint Normative Language) README

## 1. 目的（Purpose）

CNL 定義了一種 **受控規範語言 (Controlled Normative Language)**，用於向 AI 系統表達 **強制性的行為約束**。

CNL 的設計旨在：
- 減少由自然語言歧義引起的語義偏移 (Semantic Drift)
- 使用明確的語態 (Modality) 鎖定行為邊界
- 提供穩定且可重複的約束表達方式

CNL **不** 描述：
- 意圖或動機
- 背景或需求
- 治理流程或標準作業程序 (SOP)
- 期望的結果或偏好

CNL **僅表達可執行的行為約束**。

---

## 2. 適用範圍（Scope）

CNL 適用於**任何必須約束 AI 行為的交互場景**。

它獨立於以下各項：
- 領域（程式碼、文件、代理人、流水線、對話）
- 工具或平台
- 治理或工作流系統

CNL 可用於：
- 直接應用於 AI 提示詞（Prompts）
- 嵌入於結構化產出物中（例如規則）
- 作為驗證或分析工具的輸入

其適用性完全取決於**是否必須約束 AI 行為**，而非取決於使用案例的類別。

---

## 3. 關鍵字（Normative Keywords）

CNL 將規範語態（Normative Modality）限制在一個極小且明確的集合內：

- MUST
- MUST NOT
- SHOULD
- SHOULD NOT

這些關鍵字定義了義務的強度，且必須依字面意思解讀。 不允許使用任何其他的語態表達方式。

---

## 4. 禁止字（Forbidden / Discouraged Words）

### ❌ 禁止使用（Forbidden）

以下詞彙**會大幅增加語義漂移風險**，禁止出現在 CNL 中：

- may / might
- try / attempt
- possibly
- if possible
- as appropriate

### ⚠️ 不建議使用（Discouraged）

- should（除非明確定義為 SHALL）
- normally / usually
- best effort
- recommended

原則一句話：

> **CNL 中不允許存在模糊彈性空間**

---

## 5. 語句結構 (Sentence Structure)

CNL 遵循一種受限的語句結構，旨在減少歧義，同時保留自然語言的可讀性。

此結構是**概念性**的，而非語法上的強制要求。 它的存在是為了引導嚴謹的撰寫風格，而非定義一個由解析器驅動的特定領域語言 (DSL)。

其概念性結構為：

<主體 (Subject)> <規範關鍵字 (Normative Keyword)> <動作 (Action)> <目標 (Target)> [條件 (Condition)]

---

### 5.1 語言角色 (概念性)

語句結構是由**語言角色 (Linguistic Roles)** 組成，而非架構欄位。

| 角色                           | 意義                                          |
| ------------------------------ | --------------------------------------------- |
| 主體 (Subject)                 | 受約束的產出物、輸出或執行上下文              |
| 規範關鍵字 (Normative Keyword) | 義務強度 (MUST, MUST NOT, SHOULD, SHOULD NOT) |
| 動作 (Action)                  | 受約束的行為                                  |
| 目標 (Target)                  | 動作的對象                                    |
| 條件 (Condition)               | 選用的縮小適用範圍條件                        |

這些角色：

- 不會被顯式標註
- 不需要出現在固定位置
- 不會被語法規則提取或驗證

它們的存在是為了**形塑約束的撰寫方式**，而非形塑它們被解析的方式。

---

### 5.2 主體選擇原則

CNL 強烈偏好**以產出物為導向的主體 (Artifact-oriented subjects)**，而非對話式或基於角色的主體。

主體應當 (SHOULD) 代表：

- 一個具體的產出物（例如：報告、輸出、文件）
- 一個執行狀態（例如：執行、驗證）
- 一個可觀察的結果

主體不應 (SHOULD NOT) 代表：

- 一個對話式的人格特質 (Persona)
- 一個隱含的說話者或聽者

**設計原則**

> 偏好描述**什麼必須存在或改變**，而非**誰必須執行該動作**。

這能減少對話偏誤，並使跨上下文的解讀更加穩定。

---

### 5.3 動作與目標的清晰度

動作應當 (SHOULD)：

- 具體
- 可觀察
- 無歧義

目標應當 (SHOULD)：

- 為明確的產出物（例如：報告、文件、輸出）
- 為定義清晰的邊界概念（例如：FILE_SCOPE, INPUT_SET）

避免使用需要推論的模糊或帶有評價性質的措辭。

---

### 5.4 條件 (選用)

條件可用於縮小適用範圍。

條件：

- 絕不可 (MUST NOT) 引入執行邏輯
- 絕不可 (MUST NOT) 描述程序步驟
- 應當 (SHOULD) 保持簡單且具事實性

條件的存在是為了限制約束套用的**時機**，而非規定該**如何**處理。

---

### 5.5 結構化紀律，而非語法強制

CNL 「不」要求：

- 固定的語句模板
- 由解析器強制的語法
- 對角色進行顯式標記

該結構的存在是為了：

- 減少解讀偏差
- 提高不同約束之間的一致性
- 協助 AI 與人類識別邊界

CNL 始終是一項**語言紀律 (Language Discipline)**，而非程式語言。

---

## 6. 範例 (Examples)

本節提供 CNL 用法之**說明性範例**。

範例旨在展示**撰寫品質**，而非窮舉式的正確性。它們根據清晰度與約束強度進行分組。

---

### 6.1 偏好的範例 (佳)

```text
Report MUST include a count of all warning-level findings.
Execution MUST stop when required input is missing.
Output MUST NOT contain data outside FILE_SCOPE.
```

特性：

- 以產出物為導向的主體
- 明確的動作
- 清晰的目標
- 強而有力的規範關鍵字

---

### 6.2 可接受的範例

```text
The system MUST generate a validation report.
The execution process MUST terminate on failure.
```

特性：

- 約束清晰
- 主體略微抽象
- 仍具強制性且無歧義

---

### 6.3 不建議的範例

```text
You MUST include a count of all warning-level findings.
The AI MUST stop when something is wrong.
```

問題：

- 以對話或人格特質為基礎的主體
- 隱含或模糊的目標
- 增加了解讀偏移的風險

---

### 6.4 無效的範例

```
Please try to include warnings if possible.
It would be better to stop execution when input is missing.
```

問題：

- 缺乏規範關鍵字
- 語氣委婉或僅具建議性質
- 無可執行的約束內容

---

### 6.5 比較範例：產出物導向 vs. 對話式主體

```text
Report MUST list all validation warnings before execution continues.
```

優於：

```text
You MUST list all validation warnings before continuing.
```

原因：

- 約束被錨定在一個可觀察的產出物上
- 避免了對話式角色的假設
- 無論提示詞框架或系統角色為何，該約束始終有效

---

## 7. Schema 用途（Schema Purpose）

CNL 的 schema **不是為了寫程式邏輯**，而是為了：

1.  **限制語句形狀（Sentence Shape Constraint）**
2.  **限制可用關鍵字（Keyword Locking）**
3.  **讓 AI、工具與人類都清楚「這是一段約束」**

Schema 的存在本身就是一種 **Constraint**。

---

## 8. Schema 使用範例（Usage Example）

### 8.1 cnl.schema.yaml（結構定義）

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

### 8.2 cnl.yaml（實際 CNL Artifact）

```yaml
statements:
  - "Generator MUST stop on test failure."
  - "System MUST NOT modify files outside FILE_SCOPE."
  - "Report MUST count warning entries."
```

---

### 8.3 在 Rule 中使用（作為 AI 約束）

```yaml
rule:
  id: RULE-STOP-001
  description:
    ref: cnl.schema.yaml
    text: "Generator MUST stop on test failure."
```

---

### 8.4 在 Prompt 中使用（直接對 AI）

```text
You are an AI agent.

The following constraints apply:

- Generator MUST stop on test failure.
- System MUST NOT modify files outside FILE_SCOPE.
```

---

## 9. 核心總結

CNL 的本質是：

> **不是讓 AI 更自由，而是讓 AI 更難偏離邊界**

它透過：

- 受限關鍵字
- 受限句型
- 結構化表達

把 AI 的不確定性，從「不可控漂移」  
降低為「可接受誤差」。

---

**CNL 是語言，但它是一種被約束的語言。**
