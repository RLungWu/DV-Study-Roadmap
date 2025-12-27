// Code your testbench here
// or browse Examples
module tb;
    reg clk;
    reg [7:0] data_in;
    wire [7:0] ab, bb, anb, bnb;

    // 實體化設計
    blocking_vs_nonblocking dut (
        .clk(clk),
        .data_in(data_in),
        .a_block(ab), .b_block(bb),
        .a_nonblock(anb), .b_nonblock(bnb)
    );

    // 產生時脈 (每 5 單位翻轉一次)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // 餵測試資料
    initial begin
        $dumpfile("dump.vcd"); $dumpvars;
        data_in = 8'hAA;
        #12 data_in = 8'h55;
        #10 data_in = 8'hEE;
        #50 $finish;
    end
endmodule