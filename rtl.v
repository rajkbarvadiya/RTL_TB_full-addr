//port declaration and create a module
module full_adder(a,b,c,sum,carry);
//port direction
input a,b,c;//input port
output sum,carry; //output port
//reg sum,carry; //output port
wire [2:0]p; //take as wire
//gate level modeling

//data flow level modeling
xor z1(sum,a,b,c);
and d1(p[0],a,b);
and d2(p[1],b,c);
and d3(p[2],a,c);
or o1(carry,p[0],p[1],p[2]);
//data flow level modeling
assign sum = a ^ b ^ c;
assign carry = a&b | a&c | b&c; */
endmodule
