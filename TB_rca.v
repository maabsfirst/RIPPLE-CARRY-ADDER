`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2025 08:50:00 PM
// Design Name: 
// Module Name: TB_rca
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for 4-bit Ripple Carry Adder/Subtractor
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module TB_rca;

reg [3:0] a, b;
reg cin;  // This is S in your main module: 0 for add, 1 for subtract
wire [3:0] sum;
wire c4;

rca uut(a, b, cin, sum, c4);

initial begin
    $display("Time\tS\tA\tB\t|\tSUM\tC4");
    $display("-------------------------------------------------");
    $monitor("%0t\t%b\t%b\t%b\t|\t%b\t%b", $time, cin, a, b, sum, c4);

    // Test addition (S = 0)
    cin = 0;
    a = 4'b0110; b = 4'b1100; // 6 + 12
    #10;

    a = 4'b1110; b = 4'b1000; // 14 + 8
    #10;

    // Test subtraction (S = 1)
    cin = 1;
    a = 4'b0111; b = 4'b1110; // 7 - 14
    #10;

    a = 4'b0010; b = 4'b1001; // 2 - 9
    #10;

    $finish();
end

endmodule
