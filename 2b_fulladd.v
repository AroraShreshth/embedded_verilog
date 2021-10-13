 module fulladder(a,b,c,carry,sum);
 input a,b,c;
 output carry,sum;
 assign carry=a&b|a&c|b&c;
 assign sum=a^b^c;
 endmodule
 module test;
 reg a1,b1,c1;
 wire carry1,sum1;
 fulladder h1(a1,b1,c1,carry1,sum1);
initial begin
$dumpfile("dump1.vcd");
$dumpvars(0,test);
$display("a\tb\tc\tcarry\tsum");
$monitor("%b\t%b\t%b\t%b\t%b",a1,b1,c1,carry1,sum1);
a1=0;b1=0;
c1=0;#10;
a1=0;b1=0;
c1=1;#10;
a1=0;b1=1;
c1=0;#10;
a1=0;b1=1;
c1=1;#10;
a1=1;b1=0;
c1=0;#10;
a1=1;b1=0;
c1=1;#10;
a1=1;b1=1;
c1=0;#10;
a1=1;b1=1;
c1=1;#10;
$finish;
end
endmodule