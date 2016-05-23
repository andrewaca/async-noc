`include "/home/scf-12/ee552/proteus/pdk/proteus/svc2rtl.sv"
`E1OFN_M(2,9)
`E1OFN_M(2,1)
`E1OFN_M(2,4)

module errorDetect(e1of2_9.In In, e1of2_9.Out Out, e1of2_1.Out Error);
	logic [In.W-1:0] data;
	logic receivedParity;
	always begin
		data = 0;
		receivedParity = 0;
		forever begin
			In.Receive(data);
			#1;
			Out.Send(data);

			receivedParity = ^data[8:1];
			if( receivedParity != data[0] ) begin
				Error.Send(1);
			end else begin
				Error.Send(0);
			end
			#1;
		end
	end
endmodule
