<h2>About The Project </h2><br>
This project is about designing and testing a simple Multi-Cycle RISC processor using HDL Verilog language.
The processor follows a 32-bit instruction format and incorporates 32 general-purpose registers (R0 to
R31) along with a program counter (PC). Additionally, it includes a control stack to store return
addresses, managed by a stack pointer (SP) that points to the top of the stack. The stack is assumed
to be implemented using on-chip memory, and the initial value of SP is zero. The processor
supports four instruction types: R-type, I-type, J-type, and S-type. It features an ALU with a "zero"
output signal that indicates when the result of the previous ALU operation is zero. The design also
includes separate memories for data and instructions.
