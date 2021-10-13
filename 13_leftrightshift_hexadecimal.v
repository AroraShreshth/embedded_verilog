 module left(in,dis);
 input [3:0]in;
 output [4:0]dis;
 assign dis=in<<1;
 endmodule
 module right(in,dis);
 input [3:0]in;
 output [4:0]dis;
 assign dis=in>>1;
 endmodule
 module test;
 reg [3:0]in;
 wire [4:0]dis;
 wire [4:0]disr;
 left l(in,dis);
 right r(in,disr);

 initial begin
$display("Number\t LeftShift \tRightShift");
$monitor("%h \t %d \t\t%d",in,dis,disr);
in=4'b0000;
#10 in=4'b0001;
#10 in=4'b0010;
#10 in=4'b0011;
#10 in=4'b0100;
#10 in=4'b0101;
#10 in=4'b0110;
#10 in=4'b0111;
#10 in=4'b1000;
#10 in=4'b1001;
#10 in=4'b1010;
#10 in=4'b1011;
#10 in=4'b1100;
#10 in=4'b1101;
#10 in=4'b1110;
#10 in=4'b1111;
#10
$finish;
end
endmodule