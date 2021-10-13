module fullsubtractor(x,y,z,d,b); 
input x,y,z;
output d,b;
assign d=x^y^z;
assign b=~x&z|~x&y|y&z; 
endmodule

module test;
reg x1,y1,z1;
wire s1,c1;
fullsubtractor g1(x1,y1,z1,s1,c1); 
initial
begin
$dumpfile("dump1.vcd");
$dumpvars(0,test);
$display("x y z d b"); $monitor("%b\t%b\t%b\t%b\t%b",x1,y1,z1,s1,c1); x1=0;
y1=0;
z1=0;
#10 x1=0; y1=0; z1=0;
#10 x1=0; y1=0; z1=1;
#10 x1=0; y1=1; z1=0;
#10 x1=0; y1=1; z1=1;
#10 x1=1; y1=0; z1=0;
#10 x1=1; y1=0; z1=1;
#10 x1=1; y1=1; z1=0;
#10 x1=1; y1=1; z1=1;
#10
$finish;
end
endmodule