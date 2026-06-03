module alu (
    input [3:0] Operand1,
    input [3:0] Operand2,
    input [1:0] Opcode,
    output reg [3:0] Result,
    output reg Carry_Out
);

always @(*) begin
    if (Opcode == 2'b00) begin
        {Carry_Out, Result} = Operand1 + Operand2;
    end
    else if (Opcode == 2'b01) begin
        {Carry_Out, Result} = Operand1 - Operand2; // Carry_Out as borrow flag
    end
    else if (Opcode == 2'b10) begin
        Result = Operand1 & Operand2;
    end
    else begin
        Result = Operand1 | Operand2;
    end
end
endmodule
