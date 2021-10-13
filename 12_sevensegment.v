module segment(inp,outp);
input [3:0]inp;
output [6:0]outp;
reg [6:0]outp;
always @(*)
begin
case(inp)
4'b0000:outp=7'b1111110;
4'b0001:outp=7'b0110000;
4'b0010:outp=7'b1101101;
4'b0011:outp=7'b1111001;
4'b0100:outp=7'b0110011;
4'b0101:outp=7'b1011101;
4'b0110:outp=7'b1011111;
4'b0111:outp=7'b1110000;
4'b1001:outp=7'b1111011;
4'b1010:outp=7'b1011111;
4'b1011:outp=7'b0011111;
4'b1100:outp=7'b1001110;
4'b1101:outp=7'b0111101;
4'b1110:outp=7'b1101111;
4'b1111:outp=7'b1100111;
endcase
end
endmodule

 module test;
 reg[3:0] inp;
 wire[6:0] outp;
 segment s(inp, outp);
 initial begin
      $dumpfile("dump.vcd");
 $dumpvars(0,test);
 $display("hex \t 7segcode");
 $monitor("%h \t %b",inp,outp);
 #10 inp=4'b0000;
 #10 inp=4'b0001;
 #10 inp=4'b0010;
 #10 inp=4'b0011;
 #10 inp=4'b0100;
 #10 inp=4'b0101;
 #10 inp=4'b0110;
 #10 inp=4'b0111;
 $finish;
 end
 endmodule