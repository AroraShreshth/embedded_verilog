module demux12(A,S,Y1,Y2,Y3,Y4); 
input A;
input[1:0] S;
output Y1,Y2,Y3,Y4;
reg Y1,Y2,Y3,Y4; always @ (*) begin
if(S==2'b00) begin
Y1=A; Y2=0; Y3=0; Y4=0;
end
else if(S==2'b01) begin
Y1=0; Y2=A; Y3=0; Y4=0;
end
else if(S==2'b10) begin
Y1=0; Y2=0; Y3=A; Y4=0;
end
else if(S==2'b11) begin
Y1=0; Y2=0; Y3=0; Y4=A;
end end
endmodule
module main; reg A;
reg [1:0]S;
wire Y1,Y2,Y3,Y4;
demux12 dmx(A,S,Y1,Y2,Y3,Y4);
initial
begin
$dumpfile( "demux.vcd" );
$dumpvars( 0, main);
$display("A\tS[0]\tS[1]\tY1\tY2\tY3\tY4"); $monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b",A,S[0],S[1],Y1,Y2,Y3,Y4);
A=0; S=2'b00; #10 S=2'b01; #10 S=2'b10; #10 S=2'b11;
A=1; S=2'b00; #10 S=2'b01; #10 S=2'b10; #10 S=2'b11; $finish;
end endmodule