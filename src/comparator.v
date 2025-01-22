`timescale 10ns / 1ps

module comparator #(parameter BIT_WIDTH=4)(
    input wire [BIT_WIDTH-1:0] input_1,
    input wire [BIT_WIDTH-1:0] input_2,
    output wire output_greater,
    output wire output_equal,
    output wire output_lower
    );

assign output_greater = (input_1 > input_2);
assign output_equal = (input_1 == input_2);
assign output_lower = (input_1 < input_2);

endmodule
