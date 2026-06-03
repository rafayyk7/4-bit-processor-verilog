module programcounter (
    input clk,
    input reset,           // Resets PC to 0
    input load_pc,         // Load a new value
    input enable_pc,       // Enable increment
    input [3:0] load_val,  // Value to load
    output reg [3:0] pc    // Current PC value
);

always @(posedge clk ) begin
    if (reset)
        pc <= 4'b0000;         // Reset to 0
    else if (load_pc)
        pc <= load_val;        // Load jump address
    else if (enable_pc)
        pc <= pc + 1;          // Increment
end
endmodule
