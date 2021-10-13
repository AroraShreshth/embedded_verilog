module jkff(input [1:0] jk,input clk,output q,output qb); reg q,qb;
always@(posedge clk) begin
case(jk)
2'b00:q=q;
2'b01:q=0; 2'b10:q=1; 2'b11:q=~q; endcase qb=~q;
end endmodule
module test;
reg [1:0]jk;
reg clk,i;
wire q,qb;
jkff s(jk,clk,q,qb); initial
begin
$dumpfile("first.vcd");
$dumpvars(1,test);
$display("clk\tjk1\tjk0\tq\t~q"); $monitor("%b\t%b\t%b\t%b\t%b",clk,jk[1],jk[0],q,qb); jk=2'b00;#10
jk=2'b01;#10
jk=2'b10;#10
jk=2'b11;#10
$finish;
end
initial
begin
clk=0;
for(i=0;i<=20;i++)
#5 clk=~clk;
end
endmodule