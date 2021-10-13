module test;
reg a,b,c;
initial
begin
$display("\t \t Time \t a \t b \t c");
$monitor("\t \t %d \t %b \t %b \t %b" ,$time,a,b,c); #10 a=1;
#20 b=0; #30 c=1; end endmodule