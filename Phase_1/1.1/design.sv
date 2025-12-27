// Code your design here
module blocking_vs_nonblocking(
    input clk,
    input [7:0] data_in,
    output reg [7:0] a_block, b_block,
    output reg [7:0] a_nonblock, b_nonblock
);

    // Case 1: Blocking Assignment (=) - 像軟體一樣一行一行執行
    always @(posedge clk) begin
        a_block = data_in;
        b_block = a_block;  // 這裡 b 會立刻拿到剛更新的 a
    end

    // Case 2: Non-blocking Assignment (<=) - 真正的硬體並行
    always @(posedge clk) begin
        a_nonblock <= data_in;
        b_nonblock <= a_nonblock; // 這裡 b 拿到的是 a 在時脈上升前「舊的值」
    end

endmodule