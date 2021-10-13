module mydff(d,q,qb,clk);
input d,clk;
output q,qb;
reg q,qb; initial
begin
q=1'b0; qb=1'b1;
end
always @ (posedge clk)
begin q=d;
qb= ~d; end
endmodule
module dff_tb; reg d;
reg clk; integer i;
wire q,qb;
mydff out(d,q,qb,clk);
initial
begin
$dumpfile("dumpu.vcd"); $dumpvars(0,dff_tb); $display("T\tq\tqb"); $monitor("%b\t%b\t%b",d,q,qb); d=0;
#10;
d=1;
#10;
$finish;
end
initial begin
clk=0;
for(i=0;i<=30;i++)
#10 clk=~clk;
$finish;
end
endmodule