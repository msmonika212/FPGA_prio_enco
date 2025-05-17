module priority_encoder_4to2 (
    input  [3:0] in,   // Input lines (in[3] = highest priority)
    output reg [1:0] out,  // Encoded output
    output reg valid       // High if any input is active
);

always @(*) begin
    valid = 1'b1;  // Assume at least one input is high
    casez (in)
        4'b1???: begin out = 2'b11; end // in[3]
        4'b01??: begin out = 2'b10; end // in[2]
        4'b001?: begin out = 2'b01; end // in[1]
        4'b0001: begin out = 2'b00; end // in[0]
        default: begin out = 2'b00; valid = 1'b0; end // No input is high
    endcase
end

endmodule
