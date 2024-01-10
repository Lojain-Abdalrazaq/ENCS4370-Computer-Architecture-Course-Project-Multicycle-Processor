module inputs(
	output reg [31:0] rs1,
	output reg [31:0] rs2,
	output reg [4:0] func,
	output reg [13:0] immd, 
	output reg [1:0] typ
);

	initial begin
		typ = 2'b10;
		func = 5'b00001;
		rs1 = 32'b00000000000000000000000000000111;
		rs2 = 32'b00000000000000000000000000001100;
		immd = 14'b00000000001100; 
	end
	
endmodule 