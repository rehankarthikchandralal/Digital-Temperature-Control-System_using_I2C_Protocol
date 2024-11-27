module alu (
    input [31:0] A,  // 32-bit input A
    input [31:0] B,  // 32-bit input B
    input [2:0] opcode,  // 3-bit opcode
    output reg [31:0] Y  // 32-bit output Y
);

always @(*) begin
    case (opcode)
        3'b000: Y = A;            // Pass A
        3'b001: Y = A + B;        // Add A + B
        3'b010: Y = A - B;        // Subtract A - B
        3'b011: Y = A & B;        // AND
        3'b100: Y = A | B;        // OR
        3'b101: Y = A + 1;        // Increment A
        3'b110: Y = A - 1;        // Decrement A
        3'b111: Y = B;            // Pass B
        default: Y = 32'b0;       // Default case (optional safety)
    endcase
end

endmodule
