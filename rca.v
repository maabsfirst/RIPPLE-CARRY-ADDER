`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2025 08:33:19 PM
// Design Name: 
// Module Name: rca
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rca(
input [3:0] A,
input [3:0] B,
input S, // Control signal: S=0 for addition, S=1 for subtraction
output [3:0] Sum,
output C4 // Final carry-out
);
    // Internal wires for carries between full adders
    wire [2:0] C; 
    // Internal wires for B' (inverted B for subtraction) or B (for addition)
    wire [3:0] X; 
    
    // Intermediate wires for the last Full Adder's outputs


    // XOR gates to perform 2's complement for subtraction: B XOR S
    // If S=0 (addition), X[i] = B[i] XOR 0 = B[i]
    // If S=1 (subtraction), X[i] = B[i] XOR 1 = ~B[i] (1's complement)
    xor x1(X[0],S,B[0]);
    xor x2(X[1],S,B[1]);
    xor x3(X[2],S,B[2]);
    xor x4(X[3],S,B[3]);

    // Instantiate Full Adders
    // For subtraction, the initial cin (S) acts as +1 for 2's complement
full_adder fa0(.a(A[0]), .b(X[0]), .cin(S),    .sum(Sum[0]), .carry(C[0]));
full_adder fa1(.a(A[1]), .b(X[1]), .cin(C[0]), .sum(Sum[1]), .carry(C[1]));
full_adder fa2(.a(A[2]), .b(X[2]), .cin(C[1]), .sum(Sum[2]), .carry(C[2]));
full_adder fa3(.a(A[3]), .b(X[3]), .cin(C[2]), .sum(Sum[3]), .carry(C4));


    // Assign the intermediate wires to the module's output ports
      
           
           
                
endmodule
