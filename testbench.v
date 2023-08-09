module testbench;
reg [7:0] a;
reg  [7:0] b;
wire [15:0] out;

Wallace DUT(a,b,out);

initial
begin
a=8'h01;b=8'h02;
#5  a=8'h07;b=8'h09;
#5 a=8'h0A;b=8'h02;
#5 a=8'h10;b=8'h01;
#5 a=8'h01;b=8'h05;
#5 a=8'h01;b=8'h05;
#5 a=8'hA0;b=8'h05;
#5 a=8'h01;b=8'h0B;
#5 a=8'h0A;b=8'h05;
#5 a=8'h1A;b=8'h05;
#5 a=8'hB1;b=8'h11;
# 60 $finish;
 end





endmodule