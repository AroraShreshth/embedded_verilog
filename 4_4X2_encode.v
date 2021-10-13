module enc(in, out);
input [3:0] in; 
output [1:0] out; 
reg[1:0]out; 
always @(*) begin
case(in) 4'b0001:
out=2'b00; 
4'b0010: out=2'b01; 
4'b0100: out=2'b10; 
4'b1000: out=2'b11;
endcase 
end 
endmodule

module test; 
reg [3:0] in; 
wire [1:0] out; 
enc e(in,out); initial
begin
$dumpfile("dump.vcd");
$dumpvars(0,test);
$display("in3\tin2\tin2\tin0\to1\to0"); 
$monitor("%b\t%b\t%b\t%b\t%b\t%b",in[3],in[2],in[1],in[0],out[1],out[0]); 
in=4'b0001;
#10
in=4'b0010;
#10
in=4'b0100;
#10
in=4'b1000;
#10 $finish;
end
endmodule