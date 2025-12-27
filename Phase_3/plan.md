### Phase 3: UVM 框架搭建 (The Industry Standard)

**目標：** 雖然很繁瑣，但請用「填空題」的方式完成它。不要從零手寫。

#### ✅ 任務 3.1：環境骨架 (Hello World)

* **行動：** 從 UVM Template 複製一個最簡單的架構。
* **內容：** 包含 `uvm_test`, `uvm_env`。
* **目標：** 只要能 Compile 通過，並在 Log 裡印出 `UVM_INFO: Hello World` 就算成功。

#### ✅ 任務 3.2：手腳與大腦 (Driver & Monitor)

* **Driver (手)：** 從 Sequencer 拿到封包，按照時序（例如：拉高 `wr_en`）把資料塞進 Interface。
* **Monitor (眼)：** 觀察 Interface 的訊號，當發現一次有效的寫入或讀取時，把資料打包傳出去。
* **CS 思考點：** Driver 是「Producer」，Monitor 是「Observer」。

#### ✅ 任務 3.3：計分板 (Scoreboard) —— **驗證的核心**

* **行動：** 建立一個 Scoreboard 組件。
* **邏輯：** 裡面維護一個軟體的 Queue (SystemVerilog Queue)。
* 當 Monitor 看到寫入，Scoreboard 就把資料 `push_back` 到 Queue。
* 當 Monitor 看到讀出，Scoreboard 就從 Queue `pop_front` 並比對資料是否一致。


* **產出：** 當硬體 FIFO 運作正確時，Scoreboard 顯示 "PASS"；當你故意把硬體改壞，Scoreboard 報錯 "MISMATCH"。
