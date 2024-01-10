module RegisterFile(

	input [4:0] RA,    			// the first address register
	input [4:0] RB,    			// the second address register
	input [4:0] RW, 			// the distation register address when writing mode
	input WriteEnable,	     	// enable write bit, will be 1 when we want to write on reg
	input clock,          		// clock bit
	input [31:0] BusW, 			// the data that we want to save on the destination register
	output reg [31:0] BusA,		// Rs content -> [Rs]
	output reg [31:0] BusB,   	// Rt content -> [Rt]
	output reg [31:0] Rd   		// Rt content -> [Rt]
		
);

//-----------------------------------------------------------------
//>>>>ntialzing the array of the register, the array has 32 registers
//each register is 32-bit size
reg [31:0] registers [31:0]; // intializing the array of the registers

initial begin
   integer i; // counter
   // loop fir assigning values to each register
  for (i = 0; i < 32; i = i + 1) begin
		registers[i] = i;
    end
  end
// checking if the its the positive edge clock
// if true, then we check if the write enable is equals to 1
// it true, then we  write the value of the >>BusW>> into the address of the destination register
always @(posedge clock) begin
    if (WriteEnable) begin
		// assigning the BusW value to the dist register
		registers[RW] <= BusW;
    end
    // the output is the content value of the Register A, B
    BusA <= registers[RA];
    BusB <= registers[RB];
     
  end
  
endmodule