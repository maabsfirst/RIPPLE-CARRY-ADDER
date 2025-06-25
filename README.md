4-Bit Ripple Carry Adder/Subtractor in Verilog
This project implements a 4-bit Ripple Carry Adder (RCA) that performs both addition and subtraction using Verilog HDL. It includes:

A full-adder module

A ripple-carry-based 4-bit adder/subtractor

A testbench for simulation in Xilinx Vivado

🧠 Functionality
The rca module performs:

✅ Addition when control input S = 0

➖ Subtraction when control input S = 1

Subtraction is implemented using 2's complement logic:
B 
′
 =B XOR 1, C 
in
​
 =1
A−B=A+(∼B+1)

📁 File Structure
📂 RIPPLE_CARRY_ADDER/
├── rca.v               # 4-bit Adder/Subtractor logic
├── full_adder.v        # 1-bit Full Adder module
├── TB_rca.v            # Testbench to simulate the design
├── README.md           # Project documentation
├── Capture.png         # Waveform screenshot
└── (other project files)

📦 Module Overview
full_adder.v
Implements a 1-bit full adder:

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output carry
);
    assign sum   = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (cin & a);
endmodule

rca.v
Chains four full adders to create a 4-bit adder/subtractor.
Handles subtraction logic using XOR gates to invert input B if S = 1.

TB_rca.v
Testbench to verify the rca module. It includes:
✅ 2 test cases for addition
➖ 2 test cases for subtraction

🔍 Simulation Output (Vivado XSIM)
Time     S   A       B       | SUM     C4
---------------------------------------
0 ns     0   0110    1100    | 0010    1   -> 6 + 12 = 18
10 ns    0   1110    1000    | 0110    1   -> 14 + 8 = 22
20 ns    1   0111    1110    | 1001    0   -> 7 - 14 = -7 (2's comp)
30 ns    1   0010    1001    | 1001    0   -> 2 - 9 = -7

✔️ All outputs match the expected results in binary.

✅ How to Run
Clone the repository:

git clone https://github.com/maabsfirst/RIPPLE-CARRY-ADDER.git
cd RIPPLE_CARRY_ADDER

Open the project in Vivado or any Verilog simulator.

Add all .v files to your project:

rca.v

full_adder.v

TB_rca.v

Run the simulation using TB_rca.v.

📷 Waveform Example
A Vivado waveform configuration file (.wcfg) is included in the project for easy viewing of signals.
You can use D:/VIVADO_PROJECTS/RIPPLE_CARRY_ADDER/TB_rca_behav.wcfg to view signals for A, B, Sum, C4, and S.
