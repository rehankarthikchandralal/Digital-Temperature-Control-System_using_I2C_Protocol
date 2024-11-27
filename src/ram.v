module RAM128x32 #(
    parameter Data_width = 32, // Number of bits in each word
    Addr_width = 7           // Number of address bits
)(
    // Ports
    input wire clk,
    input wire we,           // Write enable
    input wire [(Addr_width-1):0] address, // Address input
    input wire [(Data_width-1):0] d,        // Data input
    output reg [(Data_width-1):0] q        // Registered output
);

    // Declare a memory array with 128 locations, each 32 bits wide
    reg [Data_width-1:0] ram [0:(2**Addr_width)-1];

    // Always block for synchronous write and read operations
    always @(posedge clk) begin
        if (we) begin
            // Write operation: store data at the specified address
            ram[address] <= d;
        end
        // Read operation: register the output on every clock cycle
        q <= ram[address];
    end

endmodule

