module decoder(in,out); input [2:0]in;
output [7:0]out;
reg [7:0]out;
always@(*) 
begin 
    case(in) 
    3'b000:out=8'b00000001; 
    3'b001:out=8'b00000010; 
    3'b010:out=8'b00000100; 
    3'b011:out=8'b00001000; 
    3'b100:out=8'b00010000; 
    3'b101:out=8'b00100000; 
    3'b110:out=8'b01000000; 
    3'b111:out=8'b10000000; 
    endcase
end endmodule

module test; 
reg [2:0]in; 
wire [7:0]out;
decoder m1(in,out); 
initial begin
$dumpfile("deco.vcd"); $dumpvars(0,test);
$display("in1\tin2\tin3\t\tout0\tout1\tout2\tout3\tout4\tout5\tout6\tout7"); 
$monitor("%b\t%b\t%b\t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t",in[2],in[1],in[0],out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7]);
in=3'b000;
#10;
in=3'b001;
#10;
in=3'b010;
#10;
in=3'b011;
#10;
in=3'b100;
#10;
in=3'b101;
#10;
in=3'b110; 
#10; 
in=3'b111; 
#10;
end 
endmodule