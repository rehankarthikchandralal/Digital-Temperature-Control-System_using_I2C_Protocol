module majority_vote #(parameter BIT_WIDTH=4)(
    input wire [BIT_WIDTH-1:0] a,
    input wire [BIT_WIDTH-1:0] b,
    input wire [BIT_WIDTH-1:0] c,
    output wire y
);

    wire [BIT_WIDTH-1:0] majority_count;

    // Count the number of 1s in each bit position
    assign majority_count = (a & b) | (a & c) | (b & c);

    // Check if the majority of bits are 1
    assign y = majority_count[BIT_WIDTH-1] | majority_count[BIT_WIDTH-2] | majority_count[BIT_WIDTH-3] | majority_count[BIT_WIDTH-4];

endmodule