// =============================================
// QUANTUM PROBLEM PARSER
// =============================================
// Converts global challenges into molecular structures

module problem_parser (
    input clk,
    input reset,
    input [1023:0] global_challenges,
    input challenge_valid,
    output reg [255:0] current_molecule,
    output reg molecule_ready
);
    
    always @(posedge clk) begin
        if (reset) begin
            molecule_ready <= 0;
            current_molecule <= 256'h0;
        end else begin
            molecule_ready <= 0;
            
            if (challenge_valid) begin
                current_molecule <= global_challenges[255:0];
                molecule_ready <= 1;
                $display("🔬 QUANTUM PARSER: Loaded molecular structure for analysis");
            end
        end
    end

endmodule
