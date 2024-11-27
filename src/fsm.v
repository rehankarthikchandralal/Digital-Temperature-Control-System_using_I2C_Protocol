module FSM(
    input In1,          // Input signal
    input RST,          // Active-low Reset
    input CLK,          // Clock
    output reg Out1     // Output signal
);

    // State encoding
    typedef enum logic [1:0] {
        S_A = 2'b00,    // State A
        S_B = 2'b01,    // State B
        S_C = 2'b10     // State C
    } state_t;

    state_t current_state, next_state;

    // Sequential block: State transition on clock edge or reset
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            current_state <= S_A;  // Reset to State A
        end else begin
            current_state <= next_state; // Transition to next state
        end
    end

    // Combinational block: Determine next state and output
    always @(*) begin
        // Default values to avoid latches
        next_state = current_state;
        Out1 = 1'b0;

        case (current_state)
            S_A: begin
                Out1 = 1'b0;  // Output for State A
                if (In1) begin
                    next_state = S_B;
                end else begin
                    next_state = S_C;
                end
            end

            S_B: begin
                Out1 = 1'b0;  // Output for State B
                if (In1) begin
                    next_state = S_B;
                end else begin
                    next_state = S_C;
                end
            end

            S_C: begin
                Out1 = 1'b1;  // Output for State C
                if (In1) begin
                    next_state = S_B;
                end else begin
                    next_state = S_C;
                end
            end

            default: begin
                next_state = S_A; // Default state
                Out1 = 1'b0;
            end
        endcase
    end

endmodule

