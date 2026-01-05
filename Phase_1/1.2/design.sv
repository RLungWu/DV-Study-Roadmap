// Code your design here
module seq_detector (
    input clk,
    input rst_n,    // 非同步低電位重置 (業界標準)
    input in,
    output reg out
);

    // 定義狀態 (使用 Localparam)
    localparam IDLE  = 2'b00,
               S1    = 2'b01,
               S10   = 2'b10,
               S101  = 2'b11;

    reg [1:0] curr_state, next_state;

    // --- 第一段：狀態轉移 (Sequential Logic) ---
    // 這裡只管「時間到，就換狀態」，一定要用 <=
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            curr_state <= IDLE;
        else
            curr_state <= next_state;
    end

    // --- 第二段：決定下一個狀態 (Combinational Logic) ---
    // 這裡純粹是邏輯判斷，一定要用 =
    always @(*) begin
        case (curr_state)
            IDLE: next_state = (in == 1) ? S1   : IDLE;
            S1:   next_state = (in == 0) ? S10  : S1;
            S10:  next_state = (in == 1) ? S101 : IDLE;
            S101: next_state = (in == 0) ? S10  : S1; // 這裡考慮了序列重疊 (10101)
            default: next_state = IDLE;
        endcase
    end

    // --- 第三段：決定輸出 (Combinational Logic) ---
    // 也可以合併在第二段，但分開寫最清晰
    always @(*) begin
        if (curr_state == S101)
            out = 1'b1;
        else
            out = 1'b0;
    end

endmodule