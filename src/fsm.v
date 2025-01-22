module FSM(
    input In1,          
    input RST,         
    input CLK,         
    output reg Out1    
);

    // State encoding
    typedef enum logic [1:0] {
        S_A = 2'b00,    
        S_B = 2'b01,    
        S_C = 2'b10     
    } state_t;

    state_t current_state, next_state;

 
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            current_state <= S_A;  
        end else begin
            current_state <= next_state; 
        end
    end

 
    always @(*) begin
        next_state = current_state;
        Out1 = 1'b0;

        case (current_state)
            S_A: begin
                Out1 = 1'b0;  
                if (In1) begin
                    next_state = S_B;
                end else begin
                    next_state = S_C;
                end
            end

            S_B: begin
                Out1 = 1'b0;  
                if (In1) begin
                    next_state = S_B;
                end else begin
                    next_state = S_C;
                end
            end

            S_C: begin
                Out1 = 1'b1;  
                if (In1) begin
                    next_state = S_B;
                end else begin
                    next_state = S_C;
                end
            end

            default: begin
                next_state = S_A; 
                Out1 = 1'b0;
            end
        endcase
    end

endmodule

