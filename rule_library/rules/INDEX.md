# Rule Index

規則總覽，依 Domain 與 Category 分類。

**Type 說明**

| Type | 意義                                                     |
| ---- | -------------------------------------------------------- |
| P    | Precondition — 前置 / 停止規則（條件不符時執行必須停止） |
| C    | Constraint — 約束規則（執行過程中不得違反的行為限制）    |

---

## Domain: CODE（程式碼生成）

### TR — Traceability（可追溯性）

| ID          | Type | Description                                                   |
| ----------- | ---- | ------------------------------------------------------------- |
| CODE-TR-P01 | P    | 每個產生或修改的程式碼產出物必須包含至少一個 Trace ID         |
| CODE-TR-P02 | P    | Trace ID 必須嵌入程式碼實際內容中，不得僅出現於注解或外部紀錄 |
| CODE-TR-P03 | P    | 單次程式碼變更不得包含多個 Trace ID                           |
| CODE-TR-C01 | C    | 輸入產出物中既有的 Trace ID 不得從對應輸出產出物中移除        |
| CODE-TR-C02 | C    | 不得產生沒有 Trace ID 的孤立程式碼                            |

### BD — Boundary & Stop（邊界與停止）

| ID          | Type | Description                                        |
| ----------- | ---- | -------------------------------------------------- |
| CODE-BD-P01 | P    | 若未宣告邊界，程式碼執行必須停止                   |
| CODE-BD-P02 | P    | 若宣告的邊界之間存在衝突，程式碼執行必須停止       |
| CODE-BD-P03 | P    | 若宣告的邊界不含任何可執行目標，程式碼執行必須停止 |
| CODE-BD-C01 | C    | 程式碼不得修改宣告邊界以外的產出物                 |
| CODE-BD-C02 | C    | 程式碼不得存取宣告邊界以外的模組或資源             |
| CODE-BD-C03 | C    | 程式碼不得引入未宣告的外部相依項目                 |
| CODE-BD-C04 | C    | 生成目標須限於明確宣告的區域                       |

### AR — Artifact Isolation（產出物隔離）

| ID          | Type | Description                        |
| ----------- | ---- | ---------------------------------- |
| CODE-AR-P01 | P    | 建立新產出物的許可必須明確宣告     |
| CODE-AR-P02 | P    | 所有產生的產出物必須可定址且可定位 |
| CODE-AR-C01 | C    | 禁止建立未宣告類型的產出物         |
| CODE-AR-C02 | C    | 禁止修改未宣告類型的產出物         |
| CODE-AR-C03 | C    | 單次執行不得同時修改多種產出物類型 |

### ST — Structural Change（結構變更）

| ID          | Type | Description                                  |
| ----------- | ---- | -------------------------------------------- |
| CODE-ST-P01 | P    | 結構重構的許可必須明確宣告                   |
| CODE-ST-C01 | C    | 未取得許可的結構重構一律禁止                 |
| CODE-ST-C02 | C    | 結構重構與邏輯變更不得在同一次執行中同時進行 |
| CODE-ST-C03 | C    | 除非明確允許，否則禁止引入新功能             |
| CODE-ST-C04 | C    | 除非明確允許，否則禁止移除既有行為           |
| CODE-ST-C05 | C    | 結構元素不得挪用於嵌入行為或邏輯             |

### TI — Test Integrity（測試完整性）

| ID          | Type | Description                        |
| ----------- | ---- | ---------------------------------- |
| CODE-TI-P01 | P    | 測試修改必須保留原始測試結構與意圖 |
| CODE-TI-C01 | C    | 測試產出物不得修改或影響正式程式碼 |
| CODE-TI-C02 | C    | 測試變更不得擴張驗證範疇           |
| CODE-TI-C03 | C    | 測試不得重新定義預期行為           |
| CODE-TI-C04 | C    | 測試不得從實作推論需求或行為       |

### CN — Constraint Neutrality（約束中立性）

| ID          | Type | Description              |
| ----------- | ---- | ------------------------ |
| CODE-CN-C01 | C    | 不得推論未宣告的邊界     |
| CODE-CN-C02 | C    | 不得推論未宣告的需求、行為、機制、實作細節或執行流程 |
| CODE-CN-C03 | C    | 不得推論未宣告的驗證目標 |

### LG — Logging & Report（日誌與報告）

| ID          | Type | Description                        |
| ----------- | ---- | ---------------------------------- |
| CODE-LG-P01 | P    | 每次執行必須產生可定位的執行記錄   |
| CODE-LG-P02 | P    | 執行記錄必須與對應的 Trace ID 連結 |
| CODE-LG-P03 | P    | 每次執行必須包含理由說明           |
| CODE-LG-P04 | P    | 必須提供變更摘要                   |
| CODE-LG-P05 | P    | 變更摘要必須與實際程式碼變更相符   |
| CODE-LG-P06 | P    | 必須產生規則評估報告               |
| CODE-LG-P07 | P    | 規則報告必須包含每條規則的評估結果 |
| CODE-LG-C01 | C    | 理由說明不得為空白或純重複文字     |
| CODE-LG-C02 | C    | 規則違反不得被靜默忽略             |

---

## Domain: LANG（程式碼語言約束）

### CC — Content Constraints（語言層約束）

> **Pattern + Concrete 架構**：11 條 Pattern Rule（跨語言）+ 18 條 Concrete Rule（語言專屬）= 29 條，覆蓋 54 條 v3.0 AIGM Lang Rules。

| ID              | Type | Pattern  | Lang | Description                            |
| --------------- | ---- | -------- | ---- | -------------------------------------- |
| LANG-CC-ALL-P01 | C    | Pattern  | ALL  | AI 必須作為受限執行者，遵守所有適用標準     |
| LANG-CC-ALL-P02 | C    | Pattern  | ALL  | AI 確保結構有效性，不假定語義正確性         |
| LANG-CC-ALL-P03 | C    | Pattern  | ALL  | AI 不得基於隱含意圖行動                   |
| LANG-CC-ALL-P04 | C    | Pattern  | ALL  | 違規必須可見，不得靜默修正                 |
| LANG-CC-ALL-P05 | C    | Pattern  | ALL  | 程式碼必須具確定性                       |
| LANG-CC-ALL-P06 | C    | Pattern  | ALL  | 控制流程必須明確                         |
| LANG-CC-ALL-P07 | C    | Pattern  | ALL  | 敏感資料不得暴露                         |
| LANG-CC-ALL-P08 | C    | Pattern  | ALL  | 錯誤不得靜默忽略                         |
| LANG-CC-ALL-P09 | C    | Pattern  | ALL  | 程式碼應揭示意圖                         |
| LANG-CC-ALL-P10 | C    | Pattern  | ALL  | 資料應為不可變                           |
| LANG-CC-ALL-P11 | C    | Pattern  | ALL  | 輸入應驗證                             |
| LANG-CC-GO-C01  | C    | Concrete | GO   | 並發歸屬必須明確                         |
| LANG-CC-GO-C02  | C    | Concrete | GO   | 介面必須最小化                          |
| LANG-CC-JV-C01  | C    | Concrete | JV   | 必須使用明確型別                         |
| LANG-CC-JV-C02  | C    | Concrete | JV   | 繼承應受控制                           |
| LANG-CC-JV-C03  | C    | Concrete | JV   | null 處理必須明確                       |
| LANG-CC-JV-C04  | C    | Concrete | JV   | 例外不得被忽略                          |
| LANG-CC-JS-C01  | C    | Concrete | JS   | 必須使用 const/let                      |
| LANG-CC-JS-C02  | C    | Concrete | JS   | 必須使用嚴格等號                         |
| LANG-CC-JS-C03  | C    | Concrete | JS   | 不得使用隱含全域變數                     |
| LANG-CC-TS-C01  | C    | Concrete | TS   | 必須啟用嚴格型別檢查                     |
| LANG-CC-TS-C02  | C    | Concrete | TS   | 公開 API 必須明確標註型別                |
| LANG-CC-TS-C03  | C    | Concrete | TS   | 不得使用不安全的型別斷言                 |
| LANG-CC-PY-C01  | C    | Concrete | PY   | 例外必須明確處理                         |
| LANG-CC-PY-C02  | C    | Concrete | PY   | 核心邏輯必須具確定性                     |
| LANG-CC-PY-C03  | C    | Concrete | PY   | 輸入應在邊界驗證                        |
| LANG-CC-RS-C01  | C    | Concrete | RS   | 所有權與借用必須正確                     |
| LANG-CC-RS-C02  | C    | Concrete | RS   | 不得使用 unsafe                         |
| LANG-CC-RS-C03  | C    | Concrete | RS   | 生命週期合約應明確                       |

---

## Domain: SPEC（規格文件生成）

### TR — Traceability（可追溯性）

| ID          | Type | Description                                                     |
| ----------- | ---- | --------------------------------------------------------------- |
| SPEC-TR-P01 | P    | 每個產生或修改的規格文件必須包含至少一個 Trace ID               |
| SPEC-TR-P02 | P    | Trace ID 必須嵌入規格文件實際內容中，不得僅出現於注解或外部紀錄 |
| SPEC-TR-P03 | P    | 單次規格文件變更不得包含多個 Trace ID                           |
| SPEC-TR-C01 | C    | 輸入產出物中既有的 Trace ID 不得從對應輸出產出物中移除          |
| SPEC-TR-C02 | C    | 不得產生沒有 Trace ID 的孤立規格文件                            |
| SPEC-TR-C03 | C    | 規格文件中的 Trace ID 不得參照上游文件中不存在的項目            |

### BD — Boundary & Stop（邊界與停止）

| ID          | Type | Description                                            |
| ----------- | ---- | ------------------------------------------------------ |
| SPEC-BD-P01 | P    | 若未宣告邊界，規格生成執行必須停止                     |
| SPEC-BD-P02 | P    | 若宣告的邊界之間存在衝突，規格生成執行必須停止         |
| SPEC-BD-P03 | P    | 若宣告的邊界不含任何可執行目標，規格生成執行必須停止   |
| SPEC-BD-C01 | C    | 規格生成不得修改執行邊界以外的規格文件                 |
| SPEC-BD-C02 | C    | 規格生成不得存取宣告邊界以外的章節、標準參考或外部規格 |
| SPEC-BD-C03 | C    | 規格生成不得引入未宣告的外部標準或參考                 |
| SPEC-BD-C04 | C    | 生成目標須限於明確宣告的區域                           |

### AR — Artifact Isolation（產出物隔離）

| ID          | Type | Description                            |
| ----------- | ---- | -------------------------------------- |
| SPEC-AR-P01 | P    | 建立新規格產出物的許可必須明確宣告     |
| SPEC-AR-P02 | P    | 所有產生的規格產出物必須可定址且可定位 |
| SPEC-AR-C01 | C    | 禁止建立未宣告類型的規格產出物         |
| SPEC-AR-C02 | C    | 禁止修改未宣告類型的規格產出物         |
| SPEC-AR-C03 | C    | 單次執行不得同時修改多種產出物類型     |

### ST — Structural Change（結構變更）

| ID          | Type | Description                                                    |
| ----------- | ---- | -------------------------------------------------------------- |
| SPEC-ST-C01 | C    | 禁止對範本定義的章節結構執行任何修改（絕對禁止，不設條件例外） |
| SPEC-ST-C02 | C    | 章節結構異動與內容邏輯變更不得在同一次執行中同時進行           |
| SPEC-ST-C03 | C    | 除非明確允許，否則禁止引入範本未定義的新章節、需求或驗收條件   |
| SPEC-ST-C04 | C    | 除非明確允許，否則禁止移除範本定義的章節或既有需求項目         |
| SPEC-ST-C05 | C    | 在任何情況下，範本定義的章節結構均不得更改                     |
| SPEC-ST-C06 | C    | 結構元素不得被挪用於嵌入行為、邏輯或決策規則                   |

### CN — Constraint Neutrality（約束中立性）

| ID          | Type | Description                                      |
| ----------- | ---- | ------------------------------------------------ |
| SPEC-CN-C01 | C    | 規格生成不得推論未宣告的邊界                     |
| SPEC-CN-C02 | C    | 不得推論未宣告的需求、行為、機制、實作細節或執行流程 |
| SPEC-CN-C03 | C    | 不得推論未宣告的驗收條件、驗證項目或測試案例項目 |

### LG — Logging & Report（日誌與報告）

| ID          | Type | Description                              |
| ----------- | ---- | ---------------------------------------- |
| SPEC-LG-P01 | P    | 每次規格生成執行必須產生可定位的執行記錄 |
| SPEC-LG-P02 | P    | 執行記錄必須與對應的 Trace ID 連結       |
| SPEC-LG-P03 | P    | 每次規格生成執行必須包含理由說明         |
| SPEC-LG-P04 | P    | 必須提供變更摘要                         |
| SPEC-LG-P05 | P    | 變更摘要必須與實際文件變更相符           |
| SPEC-LG-P06 | P    | 必須產生規則評估報告                     |
| SPEC-LG-P07 | P    | 規則報告必須包含每條規則的評估結果       |
| SPEC-LG-C01 | C    | 理由說明不得為空白或純重複文字           |
| SPEC-LG-C02 | C    | 規則違反不得被靜默忽略                   |

### CC — Content Constraints（產出物內容約束）

> **Pattern Rule 架構**：7 條 Pattern Rule + 1 Section Type Mapping 覆蓋全部 99 條原始 GEC/GGC 規則。

| ID          | Type | Pattern | Description                                                    | 覆蓋數 |
| ----------- | ---- | ------- | -------------------------------------------------------------- | ------ |
| SPEC-CC-C01 | C    | GEC     | Informative Section：資訊性區段必須僅為描述性，不得定義權威內容   | 13     |
| SPEC-CC-C02 | C    | GEC     | Boundary Section：邊界區段僅定義範圍，不得描述實作               | 6      |
| SPEC-CC-C03 | C    | GEC     | Authoritative Section：權威區段必須明確、聲明式且可追溯           | 31     |
| SPEC-CC-C04 | C    | GGC     | Generation Scope：AI 預設不得生成，僅限明確宣告範圍或佔位符       | 12     |
| SPEC-CC-C05 | C    | GGC     | Inference Prohibition：AI 不得推論、捏造、擴展或重新解讀內容       | 14     |
| SPEC-CC-C06 | C    | GGC     | Prescriptive Prohibition：AI 不得生成預設性內容（實作、邏輯、機制） | 17     |
| SPEC-CC-C07 | C    | GGC     | Appendix Generation：AI 預設不得生成附錄                          | 6      |

> **Section Type Mapping**：`aisdgr/rules/spec/SPEC-CC-SECTION-TYPES.yaml`
> 定義每個文件類型中各區段的權威分類（informative / boundary / authoritative），
> 作為 GEC Pattern Rule（C01~C03）的適用依據。

---

## 統計

| Domain | TR  | BD  | AR  | ST  | TI  | CN  | LG  | CC  | 合計 |
| ------ | --- | --- | --- | --- | --- | --- | --- | --- | ---- |
| CODE   | 5   | 7   | 5   | 6   | 5   | 3   | 9   | —   | 40   |
| LANG   | —   | —   | —   | —   | —   | —   | —   | 29  | 29   |
| SPEC   | 6   | 7   | 5   | 6   | —   | 3   | 9   | 7   | 43   |
