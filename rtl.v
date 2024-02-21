//port declaration and create a module
module full_adder(a,b,c,sum,carry);
//port direction
input a,b,c;//input port
output sum,carry; //output port
//reg sum,carry; //output port
wire [2:0]p; //take as wire
//gate level modeling
xor x1(sum,a,b,c);
and a1(p[0],a,b);
and a2(p[1],b,c);
and a3(p[2],a,c);
or o1(carry,p[0],p[1],p[2]);
//data flow level modeling
/* assign sum = a ^ b ^ c;
assign carry = a&b | a&c | b&c; */
//behaviour modeling
/* always@(*) begin
	casex({a,b,c})
		3'b000 : begin sum=1'b0; carry=1'b0; end
		3'b001 : begin sum=1'b1; carry=1'b0; end
		3'b010 : begin sum=1'b1; carry=1'b0; end
		3'b011 : begin sum=1'b0; carry=1'b1; end
		3'b100 : begin sum=1'b1; carry=1'b0; end
		3'b101 : begin sum=1'b0; carry=1'b1; end
		3'b110 : begin sum=1'b0; carry=1'b1; end
		3'b111 : begin sum=1'b1; carry=1'b1; end
		3'bxxx : begin sum=1'bx; carry=1'bx; end
	endcase
end */
endmodule


module full_adder_tb;
//port direction
reg a,b,c; //input
wire sum,carry; //output
//dut
full_adder dut(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
//task for monitor
task monitor();
	$monitor("a=%0d,b=%0d,c=%0d,sum=%0d,carry=%0d",a,b,c,sum,carry);
endtask
//initialization
	initial begin
		monitor();
		a=1'b0; b=1'b0; c=1'b0;
		#10;
		a=1'b0; b=1'b0; c=1'b1;
		#10;
		a=1'b0; b=1'b1; c=1'b0;
		#10;
		a=1'b0; b=1'b1; c=1'b1;
		#10;
		a=1'b1; b=1'b0; c=1'b0;
    		#10;
		a=1'b1; b=1'b0; c=1'b1;
		#10;
		a=1'b1; b=1'b1; c=1'b0;
		#10;
		a=1'b1; b=1'b1; c=1'b1;
		#10;
		a=1'bx; b=1'bx; c=1'bx;
		#10;
		a=1'bx; b=1'bx; c=1'b0;
		#10;
		a=1'bx; b=1'b0; c=1'b0;
		#10;
		a=1'b0; b=1'b0; c=1'bx;
		#10;
		a=1'b0; b=1'bx; c=1'bx;
		#10;
		a=1'b0; b=1'bx; c=1'b0;
		#10;
		$finish;
	end
endmodule
