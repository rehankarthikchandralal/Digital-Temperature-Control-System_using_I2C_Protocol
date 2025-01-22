module alu (
    input [31:0] A,  
    input [31:0] B,  
    input [2:0] opcode,  
    output reg [31:0] Y  
);

always @(*) begin
    case (opcode)
        3'b000: Y = A;           
        3'b001: Y = A + B;        
        3'b010: Y = A - B;        
        3'b011: Y = A & B;        
        3'b100: Y = A | B;        
        3'b101: Y = A + 1;       
        3'b110: Y = A - 1;        
        3'b111: Y = B;            
        default: Y = 32'b0;       
    endcase
end

endmodule
