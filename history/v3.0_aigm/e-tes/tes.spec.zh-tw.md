# TES — 任務執行規格書 (TASK EXECUTION SPECIFICATION)

## 識別碼 (ID)
（標準性內容 / NORMATIVE）

TES-[範圍/SCOPE]-[序號/SERIAL]

此 ID 用於唯一識別本任務執行規格書。一旦被任何執行日誌引用，本規格書必須保持**不可變 (IMMUTABLE)**。

---

## 描述 (DESCRIPTION)
（非標準性內容 / NON-NORMATIVE）

用於理解上下文的人類可讀描述。本章節**不得**被用於執行決策。

---

## 目標 (GOAL)
（標準性內容 / NORMATIVE）

「目標」定義了本次執行的權威目的與正當性。

* 當不存在上游規格時，本章節應被視為執行與審計目的之**原始來源文件**。
* 當存在上游規格時，本章節**不得**重新定義或覆蓋其意圖。

---

## 執行模式 / 類型 (EXECUTION MODE / TYPE)
（標準性內容 / NORMATIVE）

宣告本次執行的分類方式。

* **模式 (MODE)**
    * <分析 (ANALYSIS) | 對話 (CHAT) | 執行 (EXECUTION)>
* **類型 (TYPE)**
    * <新增 (ADD) | 變更 (CHANGE) | 修復 (FIX) | 重構 (REFACTOR)>

本章節僅用於宣告分類，**不**觸發執行行為。

---

## 邊界 (BOUNDARY)
（標準性內容 / NORMATIVE）

「邊界」定義了本規格書的適用性限制。

* 當執行影響範圍未知時，「邊界」應約束**來源輸入域 (SOURCE INPUT DOMAIN)**。
* 當執行影響範圍已知時，「邊界」應約束**受影響的輸出域 (AFFECTED OUTPUT DOMAIN)**。

「邊界」之應用應遵循本文件中定義的「來源輸入」規則。

---

## 來源輸入 (SOURCE INPUT)
（標準性內容 / NORMATIVE）

宣告執行所需的所有權威輸入。

* 若定義了「使用者檔案注入 (USER FILE INJECTION)」，執行基準**必須**衍生自該注入內容，並進一步受「邊界」約束。
* 若未定義「使用者檔案注入」，執行基準應完全依賴「邊界」之規範。

### 系統 (SYSTEM)
* <類別/KIND>:<名稱/NAME>:<路徑/PATH>

### 使用者 (USER)
* <類別/KIND>:<名稱/NAME>:<路徑/PATH>

---

## 結果條件 (RESULT CONDITION)
（標準性內容 / NORMATIVE，必填）

**結果條件**必須被明確定義。未定義結果條件的執行視為**無效 (INVALID)**。

結果條件定義如何評估執行結果，以及如何決定執行流程。執行結果依據三個面向進行評估：

* 成功判定 (Success determination)
* 失敗語義 (Failure semantics)
* 結果後處理 (Post-result handling)

---

### 成功條件 (SUCCESS CONDITION)
（標準性內容 / NORMATIVE）

成功條件必須使用下列其中**一種**方式明確定義。若執行結果不滿足所宣告的「成功條件」，應被視為**失敗 (FAILURE)**。

#### **基於場景 (SCENARIO-BASED)（選填）**
當不存在上游規格時使用。

場景 <名稱>:
* **假定 (GIVEN)** <上下文>
* **當 (WHEN)** <事件發生>
* **則 (THEN)** <預期結果>

#### **基於引用 (REFERENCE-BASED)（選填）**
當上游規格已存在時使用。成功的判定僅取決於是否符合所引用的文件。

* <類別/KIND>:<識別碼/ID>
* <類別/KIND>:<識別碼/ID>

---

### 失敗語義 (FAILURE SEMANTICS)
（標準性內容 / NORMATIVE）

任何不滿足所宣告「成功條件」的執行結果，均應被視為**失敗 (FAILURE)**。

---

### 結果後處理 (POST-RESULT HANDLING)
（標準性內容 / NORMATIVE）

定義結果評估後的執行流程走向。

* **成功時 (ON SUCCESS)：**
    * <繼續 (CONTINUE) | 完成 (COMPLETE)>
* **失敗時 (ON FAILURE)：**
    * <重試 (RETRY) | 中止 (ABORT) | 升級 (ESCALATE)>

---

## 輸出產物 (OUTPUT ARTIFACT)
（標準性內容 / NORMATIVE）

宣告預期或受影響的輸出產物。實際的輸出結果**必須**記錄在執行日誌中。

* **類型 (TYPE)**
    * <文件 (DOCUMENT) | 源代碼 (SOURCE_CODE) | 測試代碼 (TEST_CODE)>
* **路徑 (PATH)**
    * <路徑>
* **語言 (LANGUAGE)**
    * <EN-US | ZH-TW | JA-JP | ...>
    * <PYTHON | TS | JAVA | GO | ...>