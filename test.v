module des(a,b,c,d,s,w,ox,y,oz);
input a,b,c,d,s;
output w,ox,y, oz;
wire w1,ox1,y1,oz1,w2,ox2;
// BCD to Excess3
assign w1= a |(b&c) | (b&d);
assign ox1= (~b&c) | (~b&d) |(b&~c&~d); 
assign y= ~(c^d);
assign oz1=~d;
// Encoder 
assign w2 = a|b;
assign ox2 = a|c;
// 2:1 Muxing all Variable depdning on S
assign w    = s ? w1:w2;
assign ox   = s ? ox1 : ox2;
assign y    = s ? 1'bx : y1;
assign oz   = s ? 1'bx : oz1;
endmodule

module test;
    reg     ta,tb,tc,td,ts;
    wire    tw,tx,ty,tz;
    des g1(ta,tb,tc,td,ts,tw,tx,ty,tz);
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, test);
        $display("s\ta\tb\tc\td\t\tw\tx\ty\tz");
        $monitor("%b\t%b\t%b\t%b\t%b\t\t%b\t%b\t%b\t%b\t", ts,ta,tb,tc,td,tw,tx,ty,tz);
        ts=0; ta=0 ;tb=0 ;tc=0 ;td=0 ;
        #10
        ts=0; ta=0 ;tb=0 ;tc=0 ;td=1 ;
        #10
        ts=0; ta=0 ;tb=0 ;tc=1 ;td=0 ;
        #10
        ts=0; ta=0 ;tb=0 ;tc=1 ;td=1 ;
        #10
        ts=0; ta=0 ;tb=1 ;tc=0 ;td=0 ;
        #10
        ts=0; ta=0 ;tb=1 ;tc=0 ;td=1 ;
        #10
        ts=0; ta=0 ;tb=1 ;tc=1 ;td=0 ;
        #10
        ts=0; ta=0 ;tb=1 ;tc=1 ;td=1 ;
        #10
        ts=0; ta=1 ;tb=0 ;tc=0 ;td=0 ;
        #10
        ts=0; ta=1 ;tb=0 ;tc=0 ;td=1 ;
        #10
        ts=0; ta=1 ;tb=0 ;tc=1 ;td=0 ;
        #10
        ts=0; ta=1 ;tb=0 ;tc=1 ;td=1 ;
        #10
        ts=0; ta=1 ;tb=1 ;tc=0 ;td=0 ;
        #10
        ts=0; ta=1 ;tb=1 ;tc=0 ;td=1 ;
        #10
        ts=0; ta=1 ;tb=1 ;tc=1 ;td=0 ;
        #10
        ts=0; ta=1 ;tb=1 ;tc=1 ;td=1 ;

        ts=1; ta=0 ;tb=0 ;tc=0 ;td=0 ;
        #10
        ts=1; ta=0 ;tb=0 ;tc=0 ;td=1 ;
        #10
        ts=1; ta=0 ;tb=0 ;tc=1 ;td=0 ;
        #10
        ts=1; ta=0 ;tb=0 ;tc=1 ;td=1 ;
        #10
        ts=1; ta=0 ;tb=1 ;tc=0 ;td=0 ;
        #10
        ts=1; ta=0 ;tb=1 ;tc=0 ;td=1 ;
        #10
        ts=1; ta=0 ;tb=1 ;tc=1 ;td=0 ;
        #10
        ts=1; ta=0 ;tb=1 ;tc=1 ;td=1 ;
        #10
        ts=1; ta=1 ;tb=0 ;tc=0 ;td=0 ;
        #10
        ts=1; ta=1 ;tb=0 ;tc=0 ;td=1 ;
        #10
        ts=1; ta=1 ;tb=0 ;tc=1 ;td=0 ;
        #10
        ts=1; ta=1 ;tb=0 ;tc=1 ;td=1 ;
        #10
        ts=1; ta=1 ;tb=1 ;tc=0 ;td=0 ;
        #10
        ts=1; ta=1 ;tb=1 ;tc=0 ;td=1 ;
        #10
        ts=1; ta=1 ;tb=1 ;tc=1 ;td=0 ;
        #10
        ts=1; ta=1 ;tb=1 ;tc=1 ;td=1 ;

    end
endmodule