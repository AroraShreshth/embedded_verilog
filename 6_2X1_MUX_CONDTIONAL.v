 module m1(C, A, B, D);
 input A, B, C;
 output D;
 assign D=C? B: A;
 endmodule
 
 module test2;
 reg a, b, c;
 wire d;
 m1 g1( c, a, b, d);
initial begin
 $dumpfile( "mux.vcd" );
 $dumpvars( 0, test2);
 $display( "S\tA\tB\tR" );
 $monitor( "%b\t%b\t%b\t%b" , c, a, b, d);
 a= 0; b= 0; c= 0;
 #10a= 0; b= 0; c= 1;
 #10a= 0; b= 1; c= 0;
 #10a= 0; b= 1; c= 1;
 #10a= 1; b= 0; c= 0;
 #10a= 1; b= 0; c= 1;
 #10a= 1; b= 1; c= 0;
 #10a= 1; b= 1; c= 1;
#10 $finish;
end
endmodule