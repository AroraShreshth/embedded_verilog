module test;
reg a,b,c;
initial
begin
$display("\t \t Time \t a \t b \t c");
$monitor("\t \t %d \t %b \t %b \t %b" ,$time,a,b,c); a<=#10 1;
b<=#20 0; c<=#30 1; end endmodule