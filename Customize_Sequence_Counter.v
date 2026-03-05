module tff (
    input wire clk,
	input wire rst,
    input wire T,
    output reg Q
);
    always@(posedge clk or negedge rst) begin
      if(!rst) begin
			Q <= 1'b0;
      end else if(T) begin
            Q <= ~Q;
        end else begin
            Q <= Q;
		end
    end
endmodule

module Counter(
	input wire clk,
	input wire rst,
	output wire [3:0]count
	);
	
	wire t0,t1,t2,t3;
	reg q0,q1,q2,q3;
	
	assign t0 = (q2 & (~q1)) | ((~q3) & q1);
	assign t1 = (q1 & q0) | (q3 & q2) | ((~q2) & (~q1));
	assign t2 = (q1 & ((~q0) | q3));
	assign t3 = (q3 ^ q2);

	tff T0( .clk(clk), .rst(rst), .T(t0), .Q(q0));
	tff T1( .clk(clk), .rst(rst), .T(t1), .Q(q1));
	tff T2( .clk(clk), .rst(rst), .T(t2), .Q(q2));
	tff T3( .clk(clk), .rst(rst), .T(t3), .Q(q3));
	
	assign count = {q3,q2,q1,q0};
endmodule
