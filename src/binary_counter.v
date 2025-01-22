module LS161a (
    input [3:0] D,       
    input CLK,           
    input CLR_n,         
    input LOAD_n,        
    input ENP,           
    input ENT,           
    output reg [3:0] Q,  
    output RCO           
);

always @(posedge CLK or negedge CLR_n) begin
    if (!CLR_n) begin
        Q <= 4'b0000;
    end else if (!LOAD_n) begin
        Q <= D;
    end else if (ENP && ENT) begin
        Q <= Q + 1;
    end
end

assign RCO = (Q == 4'b1111) && ENT;

endmodule

