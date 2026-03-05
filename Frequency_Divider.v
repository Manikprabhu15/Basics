module fd(
	input clk,
  input rst,
	input [4:0]factor,
	output reg new_clk
);
  
	integer count;
	always@(posedge clk or negedge clk) begin
		if(rst) begin
			new_clk <= 0;
			count <= 1'b0;
		end else begin
				if(count==(factor -1)) begin
					new_clk <= ~new_clk;
					count <= 1'b0;
				end	else begin
					new_clk <= new_clk;
					count <= count + 1'b1;
				end
			end
	end
endmodule
