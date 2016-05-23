`include "/home/scf-12/ee552/proteus/pdk/proteus/svc2rtl.sv"
`E1OFN_M(2,9)
`E1OFN_M(2,1)
`E1OFN_M(2,4)

module merge(e1of2_9.In In0, In1, e1of2_1.In S, e1of2_9.Out Out);
	logic [In0.W-1:0] data;
	logic sel;
	always begin
		data = 0;
		sel = 0;
		forever begin
			S.Receive(sel);
			#1;
			if(sel == 0) begin
				In0.Receive(data);
			end
			else if(sel == 1) begin
				In1.Receive(data);
			end
			#1;
			Out.Send(data);
			#1;
		end
	end
endmodule
