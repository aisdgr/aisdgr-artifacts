# AI Struct Language（AISL）

AI Struct Language（AISL）是一套**為 AI 行為而設計的結構化語言體系**，  
其核心目標是：**以明確結構取代隱含推論，最大幅度降低 AI 語義漂移（semantic drift）**。

AISL 不是 Prompt 格式、不是 Policy 引擎，也不是 Metadata 框架。  
它是一組**語言層級明確分工的結構化語言家族**，用來描述：

- AI **必須做什麼**
- AI **不得重新詮釋什麼**
- AI 行為所依附的**文件結構邊界**

---

## 為什麼需要 AISL

現代 AI 模型擅長推論，但這個能力本身就是風險來源。

在沒有結構約束的情況下，AI 傾向於：

- 重新詮釋指令
- 合理化模糊描述
- 自動補齊未明示的意圖
- 為了「完成任務」而弱化限制

AISL 的出發點只有一個：

> **AI 行為必須由「結構」約束，而不是由 AI 自行解讀。**

AISL 將規範、語言與文件結構明確拆層，  
讓 AI **沒有空間自行補語意**。

```
AI Struct Language (AISL)
├─ AISL-NNL (Normative Natural Language)
├─ AISL-CNL (Constraint Normative Language)
├─ AISL-Rule (Rule Struct Language)
└─ AISL-Doc (Document Struct Language)
```

每一層都有清楚的責任邊界。

---

## 1️⃣ AISL-NNL（Normative Natural Language）

**用途：**  
以接近人類自然語言的方式表達「規範意圖」。

**特性：**
- 易於閱讀與討論
- 適合設計階段與共識形成
- 不保證可被機械驗證
- 語意彈性高

**定位：**  
AISL-NNL 是**規範的概念來源**，但不是執行依據。

---

## 2️⃣ AISL-CNL（Constraint Normative Language）

**用途：**  
降低語義模糊性，防止 AI 重新詮釋。

**特性：**
- 受限語法
- 明確的規範關鍵字（MUST / MUST NOT / SHOULD / MAY）
- 一句一義
- 可被 parser 檢查

**定位：**  
AISL-CNL 是**唯一具有行為權威的語言層**。

只有以 AISL-CNL 撰寫的敘述，才被視為 AI 必須遵守的行為規範。

---

## 3️⃣ AISL-Rule（Rule Struct Language）

**用途：**  
將一條規範語句，包裝成 AI 可執行的最小結構單位。

**特性：**
- 不產生 policy
- 不做 enforcement
- 不做 metadata 治理
- 不使用 enum 限制語彙

**結構重點：**
- 單一、不可取代的 CNL 描述
- 其餘欄位僅作為「結構化自然語言提示」

**定位：**  
AISL-Rule 定義的是：

> **AI 應該做什麼，而不是系統如何強制它。**

---

## 4️⃣ AISL-Doc（Document Struct Language）

**用途：**  
定義文件本身的合法結構與章節形態。

**特性：**
- 明確的章節定義
- 可使用 enum
- 驗證章節順序與存在性
- 面向 parser 與 validator

**重要說明：**  
AISL-Doc 中允許 enum，因為這一層描述的是**靜態文件結構**，  
而不是 AI 語義。

**定位：**  
AISL-Doc 管的是**文件形狀，不是行為語意**。

---

## AISL 不是什麼

AISL **刻意不嘗試**成為以下系統：

- Prompt Engineering Framework
- Policy 執行引擎
- 規則 enforcement 系統
- 工作流程或 metadata 管理器

AISL 的責任**只到語言與結構為止**。

執行、驗證、稽核、治理，應該存在於 AISL 之上，而非內嵌其中。

---

## AISL 與 AIGDMM 的關係

AISL 是 **AIGDMM（AI-Guided, Document-Driven Methodology）** 的語言基礎。

在 AIGDMM 中：

- AISL 提供穩定的語言核心
- 文件提供上下文邊界
- Pipeline 負責協調與執行
- 系統負責治理與稽核

這樣的分層，確保 AI 行為：

- 可理解
- 可檢視
- 可長期演進

---

## 指導原則（Guiding Principle）

> **AI 不應該猜我們的意思，  
> 而是我們應該把意思結構化。**

AISL 的存在，就是為了讓這件事成為可能。

---

## 狀態說明

AISL 是一套持續演進的語言體系。  
其核心層刻意保持最小化，以確保長期穩定性。

未來可以擴充新的結構層，但基礎原則不應被破壞。
