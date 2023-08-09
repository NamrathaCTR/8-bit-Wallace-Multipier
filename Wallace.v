module Wallace(a,b,out);
input [7:0] a;
input [7:0] b;
output [15:0] out;
wire [7:0] partialProduct1;
wire [8:1] partialProduct2;
wire [9:2] partialProduct3;
wire [10:3] partialProduct4;
wire [11:4] partialProduct5;
wire [12:5] partialProduct6;
wire [13:6] partialProduct7;
wire [14:7] partialProduct8;

// stage 1 wires
wire carries_1_1;  // carries_stageNo_BitPosition
wire carries_1_2;
wire carries_1_3;
wire carries_1_4;
wire [1:0] carries_1_5;
wire [1:0] carries_1_6;
wire [1:0] carries_1_7;
wire [1:0] carries_1_8;
wire [1:0] carries_1_9;
wire carries_1_10;
wire carries_1_11;
wire carries_1_12;
wire sum_1_1,sum_1_2,sum_1_3,sum_1_4,sum_1_10,sum_1_11,sum_1_12;
wire [1:0] sum_1_5,sum_1_6,sum_1_7,sum_1_8,sum_1_9;


// stage 2 wires
 wire sum_2_2,sum_2_3,sum_2_4,sum_2_5,sum_2_6,sum_2_9,sum_2_10,sum_2_11,sum_2_13;
 wire [1:0] sum_2_7,sum_2_8;
 
 wire carries_2_2,carries_2_3,carries_2_4,carries_2_5,carries_2_6,carries_2_9,carries_2_10,carries_2_11,carries_2_13;
 wire [1:0] carries_2_7,carries_2_8;
 
 
 //stage 3 wires
 wire sum_3_4,sum_3_3,sum_3_6,sum_3_7,sum_3_8,sum_3_9,sum_3_10,sum_3_12;
 wire carries_3_4,carries_3_3,carries_3_6,carries_3_7,carries_3_8,carries_3_9,carries_3_10,carries_3_12;


  //stage 4 wires
wire sum_4_4,sum_4_5,sum_4_6,sum_4_7,sum_4_8,sum_4_9,sum_4_10,sum_4_11;
wire carries_4_4,carries_4_5,carries_4_6,carries_4_7,carries_4_8,carries_4_9,carries_4_10,carries_4_11;





assign partialProduct1=a &{8'h8{b[0]}};
assign partialProduct2=a &{8'h8{b[1]}};
assign partialProduct3=a &{8'h8{b[2]}};
assign partialProduct4=a &{8'h8{b[3]}};
assign partialProduct5=a &{8'h8{b[4]}};
assign partialProduct6=a &{8'h8{b[5]}};
assign partialProduct7=a &{8'h8{b[6]}};
assign partialProduct8=a &{8'h8{b[7]}};


//////////////////////// stage 1 ////////////////////////////////////////

halfAdder ha1_S1(partialProduct1[1],partialProduct2[1],sum_1_1, carries_1_1);
fullAdder fa1_S1(partialProduct1[2],partialProduct2[2],partialProduct3[2],sum_1_2, carries_1_2);
fullAdder fa2_S1(partialProduct1[3],partialProduct2[3],partialProduct3[3],sum_1_3, carries_1_3);
fullAdder fa3_S1(partialProduct1[4],partialProduct2[4],partialProduct3[4],sum_1_4, carries_1_4);

fullAdder fa4_S1(partialProduct1[5],partialProduct2[5],partialProduct3[5],sum_1_5[0], carries_1_5[0]);
fullAdder fa5_S1(partialProduct4[5],partialProduct5[5],partialProduct6[5],sum_1_5[1], carries_1_5[1]);

fullAdder fa6_S1(partialProduct1[6],partialProduct2[6],partialProduct3[6],sum_1_6[0], carries_1_6[0]);
fullAdder fa7_S1(partialProduct4[6],partialProduct5[6],partialProduct6[6],sum_1_6[1], carries_1_6[1]);

fullAdder fa8_S1(partialProduct1[7],partialProduct2[7],partialProduct3[7],sum_1_7[0], carries_1_7[0]);
fullAdder fa9_S1(partialProduct4[7],partialProduct5[7],partialProduct6[7],sum_1_7[1], carries_1_7[1]);

fullAdder fa10_S1(partialProduct2[8],partialProduct3[8],partialProduct4[8],sum_1_8[0], carries_1_8[0]);
fullAdder fa11_S1(partialProduct5[8],partialProduct6[8],partialProduct7[8],sum_1_8[1], carries_1_8[1]);

fullAdder fa12_S1(partialProduct3[9],partialProduct4[9],partialProduct5[9],sum_1_9[0], carries_1_9[0]);
fullAdder fa13_S1(partialProduct6[9],partialProduct7[9],partialProduct8[9],sum_1_9[1], carries_1_9[1]);

fullAdder fa14_S1(partialProduct4[10],partialProduct5[10],partialProduct6[10],sum_1_10, carries_1_10);

fullAdder fa15_S1(partialProduct5[11],partialProduct6[11],partialProduct7[11],sum_1_11, carries_1_11);

fullAdder fa16_S1(partialProduct6[12],partialProduct7[12],partialProduct8[12],sum_1_12, carries_1_12);


//////////////////////// stage 2 ////////////////////////////////////////


halfAdder ha1_S2(sum_1_2,carries_1_1,sum_2_2, carries_2_2);


fullAdder fa1_S2(sum_1_3,carries_1_2,partialProduct4[3],sum_2_3, carries_2_3);

fullAdder fa2_S2(partialProduct4[4],partialProduct5[4],sum_1_4,sum_2_4, carries_2_4);

fullAdder fa3_S2(sum_1_5[0],sum_1_5[1],carries_1_4,sum_2_5, carries_2_5);

fullAdder fa4_S2(sum_1_6[0],sum_1_6[1],partialProduct7[6],sum_2_6, carries_2_6);

fullAdder fa5_S2(sum_1_7[0],sum_1_7[1],carries_1_6[0],sum_2_7[0], carries_2_7[0]);
fullAdder fa6_S2(partialProduct7[7],partialProduct8[7],carries_1_6[1],sum_2_7[1], carries_2_7[1]);

fullAdder fa7_S2(carries_1_7[0],sum_1_8[0],partialProduct8[8],sum_2_8[0], carries_2_8[0]);
halfAdder ha2_S2(carries_1_7[1],sum_1_8[1],sum_2_8[1], carries_2_8[1]);

fullAdder fa8_S2(sum_1_9[0],sum_1_9[1],carries_1_8[0],sum_2_9, carries_2_9);

fullAdder fa9_S2(sum_1_10,partialProduct7[10],partialProduct8[10],sum_2_10, carries_2_10);

fullAdder fa10_S2(partialProduct8[11],sum_1_11,carries_1_10,sum_2_11, carries_2_11);

fullAdder fa11_S2(carries_1_12,partialProduct7[13],partialProduct8[13],sum_2_13, carries_2_13);




//////////////////////// stage 3 ////////////////////////////////////////

fullAdder fa1_S3(carries_1_3,carries_2_3,sum_2_4,sum_3_4, carries_3_4);

fullAdder fa2_S3(sum_2_6,carries_1_5[0],carries_1_5[1],sum_3_6, carries_3_6);

fullAdder fa3_S3(sum_2_7[0],sum_2_7[1],carries_2_6,sum_3_7, carries_3_7);


fullAdder fa4_S3(sum_2_8[0],sum_2_8[1],carries_2_7[0],sum_3_8, carries_3_8);



fullAdder fa5_S3(carries_1_8[1],sum_2_9,carries_2_8[0],sum_3_9, carries_3_9);

fullAdder fa6_S3(carries_1_9[0],carries_1_9[1],sum_2_10,sum_3_10, carries_3_10);

fullAdder fa7_S3(sum_1_12,carries_1_11,carries_2_11,sum_3_12, carries_3_12);


halfAdder ha1_S3(sum_2_3,carries_2_2,sum_3_3,carries_3_3 );









////////////////////////////////// stage 4 /////////////////////////////////////




fullAdder fa1_S4(sum_2_5,carries_2_4,carries_3_4,sum_4_5, carries_4_5);

fullAdder fa2_S4(sum_3_8,carries_3_7,carries_2_7[1], sum_4_8,carries_4_8);

fullAdder fa3_S4(sum_3_9,carries_3_8,carries_2_8[1], sum_4_9,carries_4_9);

fullAdder fa4_S4(sum_3_10,carries_3_9,carries_2_9,sum_4_10,carries_4_10);

fullAdder fa5_S4(carries_3_10,carries_2_10,sum_2_11,sum_4_11,carries_4_11);

halfAdder ha1_S4(sum_3_4,carries_3_3,sum_4_4, carries_4_4 );

halfAdder ha2_S4(sum_3_6,carries_2_5,sum_4_6, carries_4_6);

halfAdder ha3_S4(sum_3_7,carries_3_6,sum_4_7,carries_4_7 );


assign out[0]=partialProduct1[0];
assign out[1]=sum_1_1;
assign out[2]=sum_2_2;
assign out[3]=sum_3_3;
assign out[4]=sum_4_4;


assign out[15:5]={partialProduct8[14],sum_2_13,sum_3_12,sum_4_11,sum_4_10,sum_4_9,sum_4_8,sum_4_7,sum_4_6,sum_4_5} +{carries_2_13,carries_3_12,carries_4_11,carries_4_10,carries_4_9,carries_4_8,carries_4_7,carries_4_6,carries_4_5,carries_4_4};








endmodule