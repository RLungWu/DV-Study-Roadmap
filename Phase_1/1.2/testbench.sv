// Code your testbench here
// or browse Examples
module tb_seq_detector;

    logic clk;
    logic rst_n;
    logic in;
    logic out;

    // DUT (Device Under Test)
    seq_detector dut (
        .clk   (clk),
        .rst_n (rst_n),
        .in    (in),
        .out   (out)
    );

    // 1️⃣ Clock generator (10ns period)
    initial clk = 0;
    always #5 clk = ~clk;

    // 2️⃣ Test sequence
    initial begin
      	 $dumpfile("dump.vcd");
    	$dumpvars;
        // 初始值
        rst_n = 0;
        in    = 0;

        // reset 保持一段時間
        #12;
        rst_n = 1;

        // 等一個 clock 邊緣，讓狀態穩定
        @(posedge clk);

        // 3️⃣ 輸入序列：1,0,1,0,1
        in = 1; @(posedge clk);
        in = 0; @(posedge clk);
        in = 1; @(posedge clk);
        in = 0; @(posedge clk);
        in = 1; @(posedge clk);

        // 再跑幾個 clock 看結果
        @(posedge clk);
        @(posedge clk);

        $finish;
    end

endmodule
