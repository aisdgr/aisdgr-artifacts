# 🧪 STS Template（測試規格書範本）

---
id: <DOC-ID>        # 必填，全專案唯一，如：STS-Nexus-v1.0.0
type: STS           # 必填，如：SRS/SDS/SAS/STS/VDP/ACR/REPORT/NOTE
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

## 1. 測試總覽

### 1.1 目的與範圍
描述本版測試覆蓋的功能、模組與不測項目（Out of Scope）。

### 1.2 測試策略
- 測試層級（Unit / Integration / E2E / Acceptance）
- 自動化比例與工具（pytest、Playwright、Postman）
- 驗收通過門檻（例如：所有 Must 項需通過，NFR 指標達標）

### 1.3 測試環境
| 環境 | 描述                   | URL / 連線資訊            |
| ---- | ---------------------- | ------------------------- |
| QA   | 模擬生產、供自動化使用 | `https://qa.example.com`  |
| UAT  | 客戶驗收               | `https://uat.example.com` |

---

## 2. 測試套件與案例

### 2.1 套件摘要
| 套件 ID       | 類別        | 覆蓋 SRS        | 自動化 | 備註           |
| ------------- | ----------- | --------------- | ------ | -------------- |
| STS-SUITE-UI  | E2E / UI    | SRS-FR-001、002 | ✅      | Playwright     |
| STS-SUITE-API | Integration | SRS-FR-003      | ✅      | pytest + httpx |

### 2.2 測試案例格式

| 欄位         | 說明                                |
| ------------ | ----------------------------------- |
| Test Case ID | `TC-<Suite>-###`（例：`TC-UI-001`） |
| 對應需求     | SRS ID / SD ID                      |
| 前置條件     | 測試前需建置的資料或狀態            |
| 測試步驟     | Step 1, Step 2…                     |
| 預期結果     | 驗證點、回傳資料、UI 呈現           |
| 自動化狀態   | Manual / Automated                  |

> 建議使用 Markdown 表格或流程編號格式，維持一致性。

### 2.3 測試案例範例

#### 範例一：API 整合測試

| 項目         | 內容                                                                                                                            |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------- |
| Test Case ID | `TC-API-001`                                                                                                                    |
| 需求對應     | SRS-FR-001                                                                                                                      |
| 前置條件     | 1. QA 環境已部署<br>2. 測試 workspace 已建立<br>3. OAuth Token 有效                                                             |
| 測試步驟     | 1. POST `/metrics/ingest` 帶入合法 payload<br>2. 驗證回應 201<br>3. GET `/metrics/{workspace_id}`<br>4. 驗證回傳資料完整性      |
| 預期結果     | - 步驟 2 回傳 `201 Created` + 新增紀錄 ID<br>- 步驟 4 回傳健康指標包含 `coverage`, `health_score` 欄位<br>- 資料時間戳在 5 秒內 |
| 自動化狀態   | ✅ Automated（pytest + httpx）                                                                                                   |
| 執行頻率     | 每次 PR + Nightly Build                                                                                                         |

**自動化腳本參考：**
```python
# tests/api/test_metrics_ingest.py
def test_metrics_ingest_and_retrieve(api_client, workspace_fixture):
    # Arrange
    payload = {"workspace_id": workspace_fixture.id, "metrics": {...}}
    
    # Act
    response = api_client.post("/metrics/ingest", json=payload)
    
    # Assert
    assert response.status_code == 201
    metric_id = response.json()["id"]
    
    # Verify retrieval
    get_response = api_client.get(f"/metrics/{workspace_fixture.id}")
    assert get_response.status_code == 200
    assert "health_score" in get_response.json()
```

#### 範例二：UI E2E 測試

| 項目         | 內容                                                                                         |
| ------------ | -------------------------------------------------------------------------------------------- |
| Test Case ID | `TC-UI-005`                                                                                  |
| 需求對應     | SRS-FR-002                                                                                   |
| 前置條件     | 使用者已登入 Dashboard                                                                       |
| 測試步驟     | 1. 導航至「專案總覽」頁面<br>2. 點選「匯出報告」按鈕<br>3. 選擇 PDF 格式<br>4. 確認下載      |
| 預期結果     | - PDF 檔案成功下載<br>- 檔名格式為 `report_{workspace}_{date}.pdf`<br>- 內容包含所有必要指標 |
| 自動化狀態   | ✅ Automated（Playwright）                                                                    |
| 執行頻率     | Nightly Build                                                                                |

---

## 3. 非功能測試

| 項目   | 指標           | 工具              | 驗證方式     |
| ------ | -------------- | ----------------- | ------------ |
| 效能   | TPU 95% < 2.5s | k6、Azure Monitor | 壓測報告     |
| 安全   | OWASP Top 10   | Zap Scan          | 漏洞掃描報告 |
| 可用性 | SLA 99.5%      | Synthetic         | 監控儀表     |

---

## 4. 測試覆蓋與追蹤

| 需求 ID    | 測試案例              | 結果    | 備註     |
| ---------- | --------------------- | ------- | -------- |
| SRS-FR-001 | TC-UI-001, TC-API-001 | Pass    |          |
| SRS-BR-002 | TC-API-004            | Pending | 等待資料 |

> 建議於每次測試循環後更新並同步至 ACR / Reports。

---

## 5. 風險與阻塞

| 編號     | 描述           | 影響 | 對策       |
| -------- | -------------- | ---- | ---------- |
| BLOCK-01 | `<風險或阻塞>` | High | 指派 Owner |

---

## 6. 簽核

- QA Lead：`[ ]`  
- PM/PO：`[ ]`  
- Compliance / GRC：`[ ]`

