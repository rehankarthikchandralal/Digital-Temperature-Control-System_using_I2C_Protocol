`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2024 17:03:22
// Design Name: 
// Module Name: comparator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module comparator #(parameter BIT_WIDTH=4)(
    input wire [BIT_WIDTH-1:0] input_1,
    input wire [BIT_WIDTH-1:0] input_2,
    output wire output_greater,
    output wire output_equal,
    output wire output_lower
    );

// Use continuous assignments directly for the outputs
assign output_greater = (input_1 > input_2);
assign output_equal = (input_1 == input_2);
assign output_lower = (input_1 < input_2);

endmodule
