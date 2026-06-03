module tb_topmodule;

    // Inputs
    reg clk;
    reg reset;
    reg load_pc;
    reg enable_pc;
    reg [3:0] jump_addr;
    reg load_operands;
    reg [3:0] operand1;
    reg [3:0] operand2;
    reg [1:0] op_code;

    // Outputs
    wire [3:0] RO_out;
    wire [3:0] R1_out;
    wire [3:0] alu_result;
    wire [3:0] pc_out;

    // Instantiate the topmodule
    topmodule uut (
        .clk(clk),
        .reset(reset),
        .load_pc(load_pc),
        .enable_pc(enable_pc),
        .jump_addr(jump_addr),
        .load_operands(load_operands),
        .op_code(op_code),
        .operand1(operand1),
        .operand2(operand2),
        .RO_out(RO_out),
        .R1_out(R1_out),
        .alu_result(alu_result),
        .pc_out(pc_out)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initial state
        clk = 0;
        reset = 1;
        load_pc = 0;
        enable_pc = 0;
        load_operands = 0;
        operand1 = 4'b1111;
        operand2 = 4'b0000;
        op_code = 2'b00; // Default to ADD
        jump_addr = 4'b0000;

        // Hold reset briefly
        #10 reset = 0;

        // Load values into RAM (simulate instruction write)
        operand1 = 4'b1111; // Example: 8
        operand2 = 4'b0000; // Example: 8
        op_code = 2'b00;    // ADD
        load_operands = 1;
        #10 load_operands = 0;

        // Wait and observe result
        #20;

        // Enable PC to increment for a few cycles
        enable_pc = 1;
        #50;
        enable_pc = 0;

        // Simulate a jump
        jump_addr = 4'b1010;
        load_pc = 1;
        #10 load_pc = 0;

        // Observe PC and ALU results
        #100;

        $finish;
    end
endmodule
