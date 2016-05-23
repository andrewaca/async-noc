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

module decoder_parent(
e1of2_9.In In,
e1of2_9.Out Out0, Out1,
e1of2_1.Out S
);
	logic [3:0] mask;

	logic [In.W-1:0] data;
	logic sendC1;
	/*
	C1:
	DEST && MASK == ADDRESS -> Send to C2, SEL = 0
	else -> Send to P, SEL = 1

	C2:
	DEST && MASK == ADDRESS -> Send to C1, SEL = 0
	else -> Send to P, SEL = 1

	P:
	First non-masked bit of dest == zero -> Send to C1, SEL = 0
	else -> Send to C2, SEL = 1
	*/
	always begin
		data = 0;
		sendC1 = 0;
		mask = 4'b1001;
		
		forever begin
			In.Receive(data);
			#1;
			case(mask)
				4'b0000:
				begin
					if( data[8] == 1'b0 )
						sendC1 = 1'b1;
					else
						sendC1 = 1'b0;
				end
				4'b1000:
				begin
					if( data[7] == 1'b0 )
						sendC1 = 1'b1;
					else
						sendC1 = 1'b0;
				end
				4'b1100:
				begin
					if( data[6] == 1'b0 )
						sendC1 = 1'b1;
					else
						sendC1 = 1'b0;
				end
				4'b1110:
				begin
					if( data[5] == 1'b0 )
						sendC1 = 1'b1;
					else
						sendC1 = 1'b0;
				end
				default: sendC1 = 1'b0;
			endcase

			if( sendC1 == 1'b1) begin
				S.Send(1'b0);
				#1;
				Out0.Send(data);
			end else begin
				S.Send(1'b1);
				#1;
				Out1.Send(data);
			end
			#1;
		end
	end
endmodule

module decoder_leaf(
e1of2_9.In In,
e1of2_9.Out Out0, Out1,
e1of2_1.Out S);

	logic [3:0] mask;
	logic [3:0] address;

	logic [In.W-1:0] data;
	logic sendLeaf;
	logic [3:0] maskData;

	always begin
		data = 0;
		maskData = 0;
		sendLeaf = 0;
		
		mask = 4'b1001;
		address = 4'b0110;	
		
		forever begin
			In.Receive(data);
			#1;
			maskData[3] = data[8] && mask[3];
			maskData[2] = data[7] && mask[2];
			maskData[1] = data[6] && mask[1];
			maskData[0] = data[5] && mask[0];
			sendLeaf = maskData == address;
			if( sendLeaf == 1'b1 ) begin
				S.Send(1'b0);
				#1;
				Out0.Send(data);
			end else begin
				S.Send(1'b1);
				#1;
				Out1.Send(data);
			end
			#1;
		end
	end
endmodule

module router(
e1of2_9.In C1in, C2in, Pin,
e1of2_9.Out C1out, C2out, Pout,
e1of2_1.Out C2_sel0, P_sel0, C1_sel0, P_sel1, C1_sel1, C2_sel1,
e1of2_1.In C1_Grant, C2_Grant, P_Grant
);
	/*
	Channel #(.hsProtocol(P4PhaseBD), .WIDTH(1)) C1_sel0 ();
	Channel #(.hsProtocol(P4PhaseBD), .WIDTH(1)) C1_sel1 ();
	Channel #(.hsProtocol(P4PhaseBD), .WIDTH(1)) C2_sel0 ();
	Channel #(.hsProtocol(P4PhaseBD), .WIDTH(1)) C2_sel1 ();
	Channel #(.hsProtocol(P4PhaseBD), .WIDTH(1)) P_sel0 ();
	Channel #(.hsProtocol(P4PhaseBD), .WIDTH(1)) P_sel1 ();
	Channel #(.hsProtocol(P4PhaseBD), .WIDTH(1)) C1_Grant ();
	Channel #(.hsProtocol(P4PhaseBD), .WIDTH(1)) C2_Grant ();
	Channel #(.hsProtocol(P4PhaseBD), .WIDTH(1)) P_Grant ();
	
	arbiter arb_c1(C2_sel0, P_sel0, C1_Grant);
	arbiter arb_c2(C1_sel0, P_sel1, C2_Grant);
	arbiter arb_P (C1_sel1, C2_sel1, P_Grant);
	*/
	
	e1of2_1 C1_S ();
	e1of2_1 C2_S ();
	e1of2_1 P_S ();
	e1of2_9 C1_0 ();
	e1of2_9 C1_1 ();
	e1of2_9 C2_0 ();
	e1of2_9 C2_1 ();
	e1of2_9 P_0 ();
	e1of2_9 P_1 ();

	decoder_leaf dec_C1(.In(C1in), .Out0(C1_0), .Out1(C1_1), .S(C1_S));
	decoder_leaf  dec_C2(.In(C2in), .Out0(C2_0), .Out1(C2_1), .S(C2_S));
	decoder_parent dec_P(.In(Pin), .Out0(P_0), .Out1(P_1), .S(P_S));

	special_split sp_C1(.In(C1_S), .Out0(C1_sel0), .Out1(C1_sel1) );
	special_split sp_C2(.In(C2_S), .Out0(C2_sel0), .Out1(C2_sel1) );
	special_split sp_P(.In(P_S), .Out0(P_sel0), .Out1(P_sel1) );
	
	merge merge_P(.In0(C1_1), .In1(C2_1), .S(P_Grant), .Out(Pout) );
	merge merge_C1(.In0(C2_0), .In1(P_0), .S(C1_Grant), .Out(C1out) );
	merge merge_C2(.In0(C1_0), .In1(P_1), .S(C2_Grant), .Out(C2out) );
endmodule

