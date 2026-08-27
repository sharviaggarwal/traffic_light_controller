module traffic_light_controller_tb;

    reg clk;
    reg rst;

    wire A_red;
    wire A_yellow;
    wire A_green;

    wire B_red;
    wire B_yellow;
    wire B_green;


    // Instantiate DUT
    traffic_light_controller DUT (

        .clk(clk),
        .rst(rst),

        .A_red(A_red),
        .A_yellow(A_yellow),
        .A_green(A_green),

        .B_red(B_red),
        .B_yellow(B_yellow),
        .B_green(B_green)

    );
 initial begin
        clk = 0;

        forever #5 clk = ~clk;
    end


    // Test sequence
    initial begin

        // Reset
        rst = 1;

        #10;

        rst = 0;
        

    end


    // Monitor outputs
    initial begin

        $monitor(
            "Time=%0t | Rst=%b | A(RYG)=%b%b%b | B(RYG)=%b%b%b",
            $time,
            rst,
            A_red, A_yellow, A_green,
            B_red, B_yellow, B_green
        );

    end

endmodule
