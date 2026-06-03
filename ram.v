module ram (
    input Clk,
    input Write,
    input [3:0] Operand1,
    input [3:0] Operand2,
    input [3:0] Result,
    output reg [3:0] Operand1_Out,
    output reg [3:0] Operand2_Out,
    output reg [3:0] Result_Out
);

reg [3:0] memory [15:0]; // 16 registers, 4 bits each

always @(posedge Clk) begin
    if (Write == 1) begin
        memory[4'b0000] = Operand1;
        memory[4'b0001] = Operand2;
        memory[4'b0010] = Result;
    end
    else begin
        Operand1_Out = memory[4'b0000];
        Operand2_Out = memory[4'b0001];
        Result_Out  = memory[4'b0010];
    end
end
endmodule
