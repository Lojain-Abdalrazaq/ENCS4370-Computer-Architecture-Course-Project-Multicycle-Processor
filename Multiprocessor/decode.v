module decode(

	input clk,
	input [31:0] Instruction,
	output reg [4:0] Rs1,
	output reg [4:0] Rs2,
	output reg [4:0] Rd,
	output reg [13:0] I_Immediate,
	output reg [23:0] J_Immediate,
	output reg [31:0] pc_JA,
	output reg [4:0] Func,
	output reg [1:0] Type,
	output reg Stop,
	output reg [8:0] R_unused,
	output reg [3:0] S_unused,
	output reg [4:0] SA
); 

	reg [1:0] TypeBits;
	reg [31:0] imm32;

	always @(Instruction) begin
		TypeBits = Instruction[2:1]; // save type bits 
		
		case (TypeBits)
		    /* when R-type */
			2'b00: begin    
			Stop     <= Instruction[0];
			Type     <= Instruction[2:1];
			R_unused <= Instruction[11:3];
			Rs2      <= Instruction[16:12];
			Rd       <= Instruction[21:17];
			Rs1      <= Instruction[26:22];
			Func     <= Instruction[31:27];
			end
			/* when J-type */
			2'b01: begin
			Stop     	<= Instruction[0];
			Type     	<= Instruction[2:1];
			J_Immediate <= Instruction[26:3];
			Func     	<= Instruction[31:27];
			/* calculate jumb address*/ 
			imm32 = {{9{J_Immediate[23]}}, J_Immediate};
			pc_JA <= imm32;
			
			end
			/* when I-type */
			2'b10: begin
			Stop     	<= Instruction[0];
			Type     	<= Instruction[2:1];
			I_Immediate <= Instruction[16:3];
			Rd      	<= Instruction[21:17];
			Rs1       	<= Instruction[26:22];
			Func     	<= Instruction[31:27];
			end
			/* when S-type */
			2'b11: begin
			Stop     <= Instruction[0];
			Type     <= Instruction[2:1];
			S_unused <= Instruction[6:3];
			SA       <= Instruction[11:7];
			Rs2      <= Instruction[16:12];
			Rd       <= Instruction[21:17];
			Rs1      <= Instruction[26:22];
			Func     <= Instruction[31:27];			
			end
		endcase
	end
endmodule 