// `timescale 1ns/1ns
// `include "fsm.v"
module fsm_tb();
    reg clock_t=0;
    reg reset_t;
    reg [1:0] in;
    wire [1:0] out;
    vdf_2_fsm tb_obj(.clk(clock_t),.rst(reset_t),.in(in),.out(out));
    initial 
        begin
            // $display("in");
            $dumpfile("fsm_sim.vcd");
            $dumpvars(0,fsm_tb);
            // clock_t=1'b0;
            reset_t=1'b0;
            #1 reset_t=1'b1;
            #14 in=2'b01;
            #20 in=2'b10;
            #20 in=2'b11;
            #20 in=2'b00;
            #20 in=2'b01;
            #16 reset_t=1'b0;
            #1 in=2'b00;
            #22 in=2'b01;
            #20 in=2'b10;
            #20 in=2'b00;
            #20 in=2'b10;
            #20 in=2'b00;
            #20 in=2'b01;
            #40 in=2'b11;
            #20 in=2'b00;
            #20 in=2'b10;
            #20 in=2'b00;
            #20 in=2'b01;
            #20 in=2'b11;
            #20 in=2'b01;
            #20 in=2'b00;
            #20 in=2'b01;
            #60 in=2'b11;
            #20 in=2'b01;
            #20 in=2'b00;
            #20 in=2'b01;
            #20 in=2'b11;
            #40 in=2'b10;
            #20 in=2'b00;
            #20 in=2'b11;
            #20 in=2'b01;
            #60 in=2'b11;
            #20 in=2'b10;
            #20 in=2'b00;
            #20 in=2'b10;
            #20 in=2'b00;
            #20 in=2'b01;
            #20 in=2'b11;
            #20 in=2'b01;
            #20 in=2'b10;
            #20 in=2'b00;
            #20 in=2'b01;
            #20 in=2'b00;
            #20 in=2'b10;
            #20 in=2'b00;
            #20 in=2'b01;
            #20 in=2'b00;
            #20 in=2'b11;

            // #20 in=2'b00;
            // #20 in=2'b01;
            // #20 in=2'b00;
            // #20 in=2'b11;
            // #20 in=2'b00;
            // #20 in=2'b01;
            // #20 in=2'b11;

            // #20 in=2'b01;
            // #20 in=2'b10;
            // #20 in=2'b00;
            // #20 in=2'b01;
            // #20 in=2'b00;
            // #20 in=2'b01;
            // #20 in=2'b10;
            // #20 in=2'b01;
            #100 $finish;
        end
    always #10 clock_t = ~clock_t;
endmodule