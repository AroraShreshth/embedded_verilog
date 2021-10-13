module SRFF(input [1:0] sr,input clk, output q, output qbar); reg q;
reg qbar;
always @(posedge clk) begin
case(sr) 2'b00:
q=q;
2'b01:
q=0;
2'b10:
q=1;
2'b11: q=1'bZ; endcase qbar=~q; end endmodule module test; reg [1:0] sr;
reg clk;
integer i;
wire q,qbar;
SRFF srt(sr,clk,q,qbar); initial begin $dumpfile("first.vcd"); $dumpvars(0,test); sr=2'b00;
#10 sr=2'b01; #10 sr=2'b10; #10 sr=2'b11; #10
$finish;
end
initial begin
clk=0; for(i=0;i<=100;i++) #5 clk=~clk; $finish;
end endmodule