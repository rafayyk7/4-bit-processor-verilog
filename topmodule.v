module topmodule (
    input clk,
    input reset,               // Resets PC to 0
    input load_pc,             // Load a specific PC value (jump)
    input enable_pc,           // Enable PC increment
    input [3:0] jump_addr,     // Address to jump to (if load_pc is high)

    input load_operands,       // Load data into RAM
    input [1:0] op_code,       // ALU operation code
    input [3:0] operand1,      // Operand inputs
    input [3:0] operand2,

    output [3:0] RO_out,       // Output from RAM
    output [3:0] R1_out,
    output [3:0] alu_result,   // Output from ALU
    output [3:0] pc_out        // Current value of Program Counter
);

wire [3:0] reg_result_wire;

// Program Counter instance
programcounter PC (
    .clk(clk),
    .reset(reset),
    .load_pc(load_pc),
    .enable_pc(enable_pc),
    .load_val(jump_addr),
    .pc(pc_out)
);

// RAM (Register File) instance
ram RF (
    .Clk(clk),
    .Write(load_operands),
    .Operand1(operand1),
    .Operand2(operand2),
    .Result(alu_result),
    .Operand1_Out(RO_out),
    .Operand2_Out(R1_out),
    .Result_Out(reg_result_wire)
);

// ALU instance
alu alu_unit (
    .Operand1(RO_out),
    .Operand2(R1_out),
    .Opcode(op_code),
    .Result(alu_result)
    //.Carry_Out()    // Can be used if needed
);

endmodule
