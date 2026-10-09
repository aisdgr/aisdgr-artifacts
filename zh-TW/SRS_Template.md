# 📄 SRS Template（需求規格書範本）

---
id: <DOC-ID>        # 必填，全專案唯一，如：SRS-Nexus-v1.0.0
type: SRS           # 必填，如：SRS/SDS/SAS/STS/VDP/ACR/REPORT/NOTE
title: "<文件標題>"
version: "vX.Y.Z"
status: Draft        # Draft / In Review / Approved / In Development / Ready / Released / Archived
created: YYYY-MM-DD
updated: YYYY-MM-DD
owner: "<文件負責人>"
reviewer: "<審查人>"
approver: "<簽核人>"
related:
  - SRS-...
  - SDS-...
  - STS-...
---

---

## 0. 變更紀錄

| 版本   | 日期       | 編輯     | 摘要     |
| ------ | ---------- | -------- | -------- |
| v0.1.0 | YYYY-MM-DD | `<Name>` | 建立初稿 |

---

## 1. 簡介

### 1.1 文件目的
說明此 SRS 的用途、目標讀者，以及與其他文件（VDP/SDS/STS）間的關係。

### 1.2 範圍
描述本版本（或模組）的範圍與目標，明確指出「本版本必須交付什麼」。

### 1.3 參考資料
- `<文件或標準名稱>`
- `<外部連結或政策>`

### 1.4 名詞與縮寫
| 名詞         | 說明                                             |
| ------------ | ------------------------------------------------ |
| Health Score | 系統健康指標                                     |
| RTM          | Requirements Traceability Matrix（需求追蹤矩陣） |

---

## 2. 總體描述

### 2.1 系統視角
描述系統與現有平台／第三方服務之整合情形，可搭配架構圖或情境圖。

### 2.2 使用者類型
| 角色 | 需求／特性             |
| ---- | ---------------------- |
| PMO  | 需要即時掌握交付健康度 |
| QA   | 需要追蹤測試覆蓋       |

### 2.3 假設與相依性
- `<外部系統或 API>` 需維持 ≥99.5% 可用度。
- 使用者皆採 Azure AD 單一登入。

---

## 3. 功能需求（Functional Requirements）

| ID（SRS-FR-###） | 需求敘述                                            | 優先級 | 驗收條件（AC）                                 | 追蹤（SDS/STS）        |
| ---------------- | --------------------------------------------------- | ------ | ---------------------------------------------- | ---------------------- |
| SRS-FR-001       | 使用者可透過儀表板查看工作區健康指標與即時狀態      | Must   | 1. 顯示 RCR/TCR/RSR 指標<br>2. 資料延遲 < 5 秒 | SDS-CMP-001/STS-TC-001 |
| SRS-FR-002       | 系統每日自動產生追蹤報告並透過 Email/Slack 通知團隊 | Should | 1. 報告包含所有專案指標<br>2. 通知成功率 ≥ 99% | SDS-API-003/STS-TC-015 |
| SRS-FR-003       | `<補充更多需求>`                                    | Could  | `<驗收條件>`                                   | `<追蹤對應>`           |

> 建議至少包含：主要流程、例外流程、錯誤處理與通知規則。

---

## 4. 商務／規則需求（Business Rules）

| ID（SRS-BR-###） | 規則內容     | 適用情境 | 追蹤（SDS/STS） |
| ---------------- | ------------ | -------- | --------------- |
| SRS-BR-001       | `<規則描述>` | `<流程>` | `<對應項目>`    |

---

## 5. 非功能需求（NFR）

| ID          | 類別（Performance/Security/UX/Compliance） | 內容                    | 量測方式           | 對應 STS    |
| ----------- | ------------------------------------------ | ----------------------- | ------------------ | ----------- |
| SRS-NFR-001 | Performance                                | API 平均回應 < 500ms    | Synthetic + RUM    | STS-NFR-API |
| SRS-NFR-002 | Security                                   | 敏感資料以 AES-256 儲存 | Key Vault Rotation | STS-NFR-SEC |

---

## 6. 資料與介面需求

### 6.1 資料模型（Data Requirements, DR）
| 資料物件          | 說明             | 來源    | 留存天數 |
| ----------------- | ---------------- | ------- | -------- |
| workspace_metrics | 每個工作區的指標 | Tracker | 365      |

### 6.2 介面需求（Interface Requirements, IR）
| API/介面               | 描述         | 消費者 | 安全需求           |
| ---------------------- | ------------ | ------ | ------------------ |
| `POST /metrics/ingest` | 匯入健康指標 | Verify | 需附帶 OAuth token |

---

## 7. 驗收策略

1. 列出需由 STS 覆蓋的驗收案例。
2. 說明資料一致性、匯出、通知等額外檢查方式。
3. 指出與 VDP/ACR 相關的封版條件（例如：RCR ≥ 95%）。

---

## 8. 風險與未決議題

| 編號 | 說明         | 影響                | 需決策人  |
| ---- | ------------ | ------------------- | --------- |
| R-01 | `<風險描述>` | High / Medium / Low | `<Owner>` |

---

## 9. 附錄

- 流程圖／Mermaid 範例：
  ```mermaid
  flowchart TD
  A[Trigger] --> B{Decision}
  B -->|Yes| C[Action 1]
  B -->|No| D[Action 2]
  ```
- 需求追蹤矩陣樣板，可與 STS/ACR 共用。
