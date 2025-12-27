### Phase 4: CS 優勢的火力展示 (Automation & DPI)

**目標：** 這是你跟純 EE 背景學生拉開差距的地方。

#### ✅ 任務 4.1：DPI-C 整合 (C++ Golden Model)

* **行動：** 用 C++ 寫一個簡單的函數（例如：`int expected_fifo_depth()`）。
* **整合：** 在 SystemVerilog 裡用 `import "DPI-C"` 呼叫它。
* **面試話術：** 「我曾經處理過複雜演算法驗證，因為 SV 跑太慢，所以我用 C++ 寫 Reference Model 來加速。」

#### ✅ 任務 4.2：自動化回歸測試 (Regression Script)

* **行動：** 寫一個 Python 腳本（或 Makefile）。
* **功能：**
1. 迴圈跑 10 次模擬，每次給不同的 Random Seed。
2. 分析 Log 檔，檢查有沒有關鍵字 `UVM_ERROR`。
3. 如果有錯，把 Seed 記錄下來存成 `fail.log`。


* **產出：** 這就是 CI/CD 的雛形。
