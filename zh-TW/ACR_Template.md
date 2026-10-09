# ✅ ACR Template（驗收報告範本）

---
id: <DOC-ID>        # 必填，全專案唯一，如：SRS-Nexus-v1.0.0
type: <TYPE>        # 必填，如：SRS/SDS/SAS/STS/VDP/ACR/REPORT/NOTE
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


## 0. 變更紀錄

| 版本   | 日期       | 編輯     | 摘要     |
| ------ | ---------- | -------- | -------- |
| v0.1.0 | YYYY-MM-DD | `<Name>` | 建立初稿 |

---

## 1. 版本摘要

| 項目             | 內容                        |
| ---------------- | --------------------------- |
| 目標             | `<本版主要交付／改善>`      |
| 範圍             | `<In Scope / Out of Scope>` |
| 重要里程碑       | `<日期 + 事件>`             |
| Git Tag / Commit | `vX.Y.Z / <hash>`           |

---

## 2. 覆蓋率指標

| 指標              | 公式                        | 目標 | 實際    | 達成？ |
| ----------------- | --------------------------- | ---- | ------- | ------ |
| 需求覆蓋率（RCR） | `Covered Req / Total Req`   | 95%  | `<XX%>` | ✅ / ❌  |
| 追蹤覆蓋率（TCR） | `Traceable Req / Total Req` | 95%  | `<XX%>` | ✅ / ❌  |
| 需求成功率（RSR） | `Accepted Req / Total Req`  | 100% | `<XX%>` | ✅ / ❌  |
| 自動化測試通過率  | `Passed / Total`            | 100% | `<XX%>` | ✅ / ❌  |

附上 RTM 報表或鏈結：`Reports/i18n/zh-TW/traceability/...`

---

## 3. 測試結果總覽

| 測試套件      | 案例數 | 通過 | 失敗 | 阻塞 | 備註   |
| ------------- | ------ | ---- | ---- | ---- | ------ |
| STS-SUITE-UI  | 25     | 25   | 0    | 0    | 自動化 |
| STS-SUITE-API | 18     | 17   | 1    | 0    | 缺資料 |

### 3.1 重大缺陷

| ID      | 影響 | 狀態   | 對策                  |
| ------- | ---- | ------ | --------------------- |
| DEF-123 | 中   | 已關閉 | 修補於 PR-455         |
| DEF-456 | 高   | 未解   | Hotfix 計畫：`<說明>` |

---

## 4. 文件與產出檢查

| 文件    | 版本     | 備註           |
| ------- | -------- | -------------- |
| SRS     | `v1.1.0` | 已審查         |
| SDS     | `v1.1.0` |                |
| STS     | `v1.1.0` |                |
| VDP     | `v1.1.0` | 完成所有里程碑 |
| Reports | `v1.1.0` | 已同步         |

---

## 5. 決策與建議

### 5.1 交付決策
- **是否接受交付？** ✅ 是 / ❌ 否 / ⚠️ 有條件通過  
- **封版決議：** 例：建立 Git Tag `v1.1.0`，準備部署至 Production。  
- **附加條件（若有）：** 例：需先修復 DEF-456 才能進入 Production。

### 5.2 後續建議  
1. **下一版優先事項：**  
   - `<例：增加效能監控儀表板>`  
   - `<例：補強 NFR 測試覆蓋>`  

2. **流程改進：**  
   - `<例：自動化 RTM 產生流程>`  
   - `<例：導入 Contract Testing>`

3. **技術債務：**  
   - `<例：重構 legacy API，預估 3 sprints>`  

---

## 6. 簽核

| 角色             | 姓名 | 日期 | 簽名 |
| ---------------- | ---- | ---- | ---- |
| Product / PM     |      |      |      |
| Engineering Lead |      |      |      |
| QA / Validation  |      |      |      |
| GRC / Compliance |      |      |      |

---

## 7. 附錄

- 連結：`RTM 報表、測試報告、部署記錄、Hotfix 計畫`
- 若有追加補充說明，可附在此處或連結至 `.aiddm/session_context.md` 紀錄。
