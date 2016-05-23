`include "/home/scf-12/ee552/proteus/pdk/proteus/svc2rtl.sv"
`E1OFN_M(2,9)
`E1OFN_M(2,1)
`E1OFN_M(2,4)

module special_split(e1of2_1.In In, e1of2_1.Out Out0, Out1);
	logic sel;
	always begin
		sel = 0;
		forever begin
			In.Receive(sel);
			#1;
			if(sel == 0) begin
				Out0.Send(1);
			end
			else if(sel == 1) begin
				Out1.Send(1);
			end
			#1;
		end
	end
endmodule
