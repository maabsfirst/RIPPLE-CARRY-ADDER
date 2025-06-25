# 4-Bit Ripple Carry Adder/Subtractor in Verilog

This project implements a 4-bit Ripple Carry Adder (RCA) that performs both **addition** and **subtraction** using Verilog HDL. It includes:

- A full-adder module  
- A ripple-carry-based 4-bit adder/subtractor  
- A comprehensive testbench for simulation in Xilinx Vivado  

## 🧠 Functionality

The `rca` module performs either:

- **Addition** when control input `S = 0`  
- **Subtraction** when control input `S = 1`  

Subtraction is done using **2's complement logic**:  
`B' = B XOR 1`, `Cin = 1` → A - B = A + (~B + 1)

## 📁 File Structure

📂 RIPPLE_CARRY_ADDER/
├── rca.v # 4-bit Adder/Subtractor
├── full_adder.v # Basic 1-bit full adder
├── TB_rca.v # Testbench for simulation
├── Capture.png # Output waveform
├── README.md # Project documentation

nginx
Copy
Edit

## 📦 Modules

### `full_adder.v`

Implements a 1-bit full adder using basic gates:

```verilog
assign sum   = a ^ b ^ cin;
assign carry = (a & b) | (b & cin) | (cin & a);
rca.v
Chains 4 full adders and handles subtraction logic using XOR gates to invert B if S = 1.

TB_rca.v
Testbench that verifies the design for:

2 addition cases

2 subtraction cases

🔍 Simulation Output (Vivado XSIM)
yaml
Copy
Edit
Time    S   A      B      | SUM   C4
---------------------------------------
0 ns    0   0110   1100   | 0010   1   -> 6 + 12 = 18 (Carry out = 1)
10 ns   0   1110   1000   | 0110   1   -> 14 + 8 = 22
20 ns   1   0111   1110   | 1001   0   -> 7 - 14 = -7 (2's complement = 1001)
30 ns   1   0010   1001   | 1001   0   -> 2 - 9 = -7
✔️ All outputs match expected binary results.

📷 Waveform Example


🔺 Make sure Capture.png is in the same folder as README.md and named exactly like that (case-sensitive!).

✅ How to Run
Clone this repo:

bash
Copy
Edit
git clone https://github.com/yourusername/RIPPLE_CARRY_ADDER.git
cd RIPPLE_CARRY_ADDER
Then:

Open the project in Vivado or another Verilog simulator.

Add all .v files to your simulation project.

Run TB_rca.v.

📌 Notes
This is a purely combinational circuit.

Overflow is not handled explicitly but can be observed via C4.

Negative outputs use 2’s complement representation.
