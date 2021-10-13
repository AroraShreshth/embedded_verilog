module m1(A,B,C,D,E,F,G,H,I); 
input A,B;
output C,D,E, F, G, H, I;
assign C= A&B;
assign D= A|B; 
assign E= A^B; 
assign F= ~(A&B); 
assign G= ~(A|B); 
assign H= ~(A^B); 
assign I= ~A; 
endmodule

module test;
reg a,b;
wire c,d,e,f,g,h,i;
m1 g1(a,b,c,d,e,f,g,h,i); 
initial
    begin
    $dumpfile("first.vcd");
    $dumpvars(0,test); 
    $display("a\tb\tAND\tOR\tXOR\tNAND\tNOR\tXNOR\tNOT(A)"); $monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",a,b,c,d,e,f,g,h,i); 
    a=0;b=0;
    #10 a=0;b=1;
    #10 a=1;b=0;
    #10 a=1;b=1;
    #10
    $finish;
end
endmodule
