`include "/home/scf-12/ee552/proteus/pdk/proteus/svc2rtl.sv"
`E1OFN_M(2,9)
`E1OFN_M(2,1)
`E1OFN_M(2,4)

module decoder1(
e1of2_9.In In,
e1of2_9.Out Out0, Out1,
e1of2_1.Out S
);

	logic [In.W-1:0] data;
	logic [3:0] address;
	logic [3:0] mask;
	logic leaf;

	always begin
		data = 0;
		address = 4'b0000;
		mask = 4'b1000;
		leaf = 0;
		
		forever begin
			In.Receive(data);
			#1;
			if(leaf == 1) begin
				if( (data[8:5] & mask) == address ) begin
					S.Send(0);
					#1;
					Out0.Send(data);
				end else begin
					S.Send(1);
					#1;
					Out1.Send(data);
				end
			end else begin
				if(	( (mask == 4'b0000) && (data[8] == 1'b0) ) || 
					( (mask == 4'b1000) && (data[7] == 1'b0) ) ||
					( (mask == 4'b1100) && (data[6] == 1'b0) ) || 
					( (mask == 4'b1110) && (data[5] == 1'b0) ) ) begin
					S.Send(0);
					#1;
					Out0.Send(data);
				end else begin
					S.Send(1);
					#1;
					Out1.Send(data);
				end			
			end
			#1;
		end
	end
endmodule
