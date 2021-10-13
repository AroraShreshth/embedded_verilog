 module counter(input clk, input rst, input enable, output [3:0] count );
 reg [3:0] count;
 always@(posedge (clk)) begin
 if(rst==1)
 count = 4'b0000;
 else if(enable==1)
 count = count + 4'b0001;
end
endmodule

 module test;
 reg clk,rst,enable;
 wire [3:0] count;
 integer a;
 counter s1(clk,rst,enable,count);
 initial begin
 $dumpfile("h1.vcd");
 $dumpvars(0,test);
 $display("clk reset enable count");
 $monitor("%b %b %b %b",clk,rst,enable,count);
 rst = 1 ;
 #3 enable = 1;
 rst = 0;
 #10 enable = 0;
 rst = 0;
 #10 enable = 1;
 rst = 0;
 #100 enable = 1;
 rst = 1;
#10
$finish;
end 
initial 
begin
    clk=0;
    for( a=0;a<100;a++)
    #2 clk = ~clk;
end
endmodule
