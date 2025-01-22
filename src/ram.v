module RAM128x32 #(
    parameter Data_width = 32, 
    Addr_width = 7          
)(
    // Ports
    input wire clk,
    input wire we,           
    input wire [(Addr_width-1):0] address, 
    input wire [(Data_width-1):0] d,        
    output reg [(Data_width-1):0] q        
);
    reg [Data_width-1:0] ram [0:(2**Addr_width)-1];

    always @(posedge clk) begin
        if (we) begin
            ram[address] <= d;
        end
        q <= ram[address];
    end
endmodule

