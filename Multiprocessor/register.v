module register(
	input [31:0] inreg,
	output reg [31:0] outreg
);
	always @(*)
	begin
		outreg <= inreg;
	end
endmodule 