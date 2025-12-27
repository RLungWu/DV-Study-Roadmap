### Phase 2: SystemVerilog 的物件導向驗證 (OOP Verification)

**目標：** 放棄 Verilog 的 `initial` block，改用 Class 來產生測試資料。

#### ✅ 任務 2.1：建立數據封包 (Transaction Class)

* **行動：** 定義一個 `class packet;`。
* **內容：** 包含 `rand bit [7:0] data;` 和 `rand bit [3:0] address;`。
* **CS 思考點：** 這就是 C++ 的 struct/class。試著加入 `function void display();` 來印出封包內容。

#### ✅ 任務 2.2：隨機化與約束 (Randomization)

* **行動：** 在 Class 裡加入 `constraint`。例如：地址必須偶數 (`addr % 2 == 0`)。
* **執行：** 在 module 裡呼叫 `pkt.randomize()`，並印出結果看是否符合約束。
* **產出：** 證明你能自動產生 100 組符合特定規則的測試資料，而不是手寫 100 行賦值。

#### ✅ 任務 2.3：介面封裝 (Interface)

* **行動：** 寫一個 `interface`，把 FIFO 的 `clk`, `rst`, `wr_en`, `rd_en`, `data_in`, `data_out` 包進去。
* **目的：** 讓你的 Testbench 不再需要連一堆線，而是透過 `virtual interface` 的控制代碼（Handle）來操作硬體。

