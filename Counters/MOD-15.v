module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [13:0] q);
    always@(posedge clk)
        begin
            if(reset == 1)
                begin
                    q<=4'b0;
                end
            else
                begin
                    q<=q+1;
                end
        end
endmodule
