module mytff(t,q,qb,clk); input t,clk;
output q,qb;
reg q,qb;
initial q=0; always@(posedge clk) begin
if (t==1) begin
q=~q;
end Else
begin q=q;
end
qb=~q; end
endmodule
module tff_tb;
reg a,b;
wire y,yb;
mytff out(.t(a), .clk(b),.q(y),.qb(yb)); initial
begin
$dumpfile("dumpu.vcd");
$dumpvars(0,tff_tb);
$display("a0\tb0\ty0\tyb0"); $monitor("a=%d,b=%d,y=%d,yb=%d,\n",a,b,y,yb);
a=0; b=0;#100; b=1;#100;
a=1; b=0;#100; b=1;#100;
end endmodule