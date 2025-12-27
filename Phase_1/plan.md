### Phase 1: 硬體思維的重塑 (Verilog & Digital Logic)

**目標：** 在 EDA Playground 上跑通你的第一個硬體模組，並理解「時序」。

#### ✅ 任務 1.1：搞懂「賦值」的詛咒 (Blocking vs Non-blocking)

* **行動：** 寫兩個簡單的 `always` block，一個用 `=`，一個用 `<=`。觀察波形（Waveform）中變數變化的時間點。
* **CS 思考點：** 為什麼軟體裡的 `a=b; b=a;` 會失敗，但硬體裡的 `<=` 卻能成功交換數值？（關鍵字：Event Queue）。
* **產出：** 一張波形圖，證明你理解 Race Condition。

#### ✅ 任務 1.2：狀態機 (FSM) 的三段式寫法

* **行動：** 設計一個簡單的「序列偵測器」（例如：輸入 `1011` 就輸出 `1`）。
* **實作細節：** 練習標準的「三段式寫法」：
1. State Transition (Sequential logic)
2. Next State Logic (Combinational logic)
3. Output Logic (Combinational logic)


* **面試考點：** Mealy Machine vs. Moore Machine 的差別在哪？（輸出是否與當下輸入有關）。

#### ✅ 任務 1.3：同步 FIFO (Synchronous FIFO) —— **本階段的大魔王**

* **行動：** 實作一個 FIFO（先進先出佇列）。
* **關鍵邏輯：**
* **Circular Buffer (環形緩衝區)：** 用 Read Pointer 和 Write Pointer 來管理記憶體。
* **Full/Empty 判斷：** 當 `rd_ptr == wr_ptr` 時，是空還是滿？（通常需要多一個 bit 來區分）。


* **CS 思考點：** 這跟軟體的 Queue 結構一樣，但你需要處理 `Clock` 和 `Reset`，並確保在讀寫同時發生時數據不會壞掉。
* **產出：** 一個完整的 `fifo.v` 和簡單的 `fifo_tb.v`。