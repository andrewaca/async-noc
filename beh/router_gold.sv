`timescale 1ns/10ps
//import SystemVerilogCSP::*;

module merge_gold(interface In0, In1, S, Out);
	parameter WIDTH = 9;
	logic [WIDTH-1:0] data;
	logic sel;
	always begin
		data = 0;
		sel = 0;
		forever begin
			S.Receive(sel);
			if(sel == 0) begin
				In0.Receive(data);
			end
			else if(sel == 1) begin
				In1.Receive(data);
			end
			Out.Send(data);
		end
	end
endmodule

module special_split_gold(interface In, Out0, Out1);
	logic sel;
	always begin
		sel = 0;
		forever begin
			In.Receive(sel);
			if(sel == 0) begin
				Out0.Send(1);
			end
			else if(sel == 1) begin
				Out1.Send(1);
			end
		end
	end
endmodule

/*
module decoder_parent_gold(interface In, Out0, Out1, S);
	parameter WIDTH = 9;
	parameter MASK = 4'd0;

	logic [WIDTH-1:0] data;

	C1:
	DEST && MASK == ADDRESS -> Send to C2, SEL = 0
	else -> Send to P, SEL = 1

	C2:
	DEST && MASK == ADDRESS -> Send to C1, SEL = 0
	else -> Send to P, SEL = 1

	P:
	First non-masked bit of dest == zero -> Send to C1, SEL = 0
	else -> Send to C2, SEL = 1

	always begin
		data = 0;
		
		forever begin
			In.Receive(data);
			
			if(	( (MASK == 4'b0000) && (data[8] == 1'b0) ) || ( (MASK == 4'b1000) && (data[7] == 1'b0) ) ||
				( (MASK == 4'b1100) && (data[6] == 1'b0) ) || ( (MASK == 4'b1110) && (data[5] == 1'b0) ) ) begin
				S.Send(1'b0);
				Out0.Send(data);
			end else begin
				S.Send(1'b1);
				Out1.Send(data);
			end
		end
	end
endmodule

module decoder_leaf_gold(interface In, Out0, Out1, S);
	parameter ADDRESS = 4'd0;
	parameter MASK = 4'd0;
	parameter WIDTH = 9;

	logic [WIDTH-1:0] data;

	always begin
		data = 0;
		
		forever begin
			In.Receive(data);
			if( (data[8:5] & MASK) == ADDRESS ) begin
				S.Send(1'b0);
				Out0.Send(data);
			end else begin
				S.Send(1'b1);
				Out1.Send(data);
			end
		end
	end
endmodule
*/

module decoder_gold(interface In, Out0, Out1, S);
	parameter ADDRESS = 4'd0;
	parameter MASK = 4'd0;
	parameter WIDTH = 9;
	parameter LEAF = 0;

	logic [WIDTH-1:0] data;

	always begin
		data = 0;
		
		forever begin
			In.Receive(data);
			if(LEAF == 1) begin
				if( (data[8:5] & MASK) == ADDRESS ) begin
					S.Send(0);
					Out0.Send(data);
				end else begin
					S.Send(1);
					Out1.Send(data);
				end
			end else begin
				if(	( (MASK == 4'b0000) && (data[8] == 1'b0) ) || 
					( (MASK == 4'b1000) && (data[7] == 1'b0) ) ||
					( (MASK == 4'b1100) && (data[6] == 1'b0) ) || 
					( (MASK == 4'b1110) && (data[5] == 1'b0) ) ) begin
					S.Send(0);
					Out0.Send(data);
				end else begin
					S.Send(1);
					Out1.Send(data);
				end			
			end
		end
	end
endmodule

module router_gold(interface
C1in, C2in, Pin,
C1out, C2out, Pout,
C2_sel0, P_sel0, C1_Grant,
C1_sel0, P_sel1, C2_Grant,
C1_sel1, C2_sel1, P_Grant
);
	parameter ADDRESS = 4'd0;
	parameter MASK = 4'd0;
	parameter WIDTH = 9;

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
	
	e1ofN_M #(.N(2), .M(1)) C1_S ();
	e1ofN_M #(.N(2), .M(1)) C2_S ();
	e1ofN_M #(.N(2), .M(1)) P_S ();

	e1ofN_M #(.N(2), .M(WIDTH)) C1_0 ();
	e1ofN_M #(.N(2), .M(WIDTH)) C1_1 ();
	e1ofN_M #(.N(2), .M(WIDTH)) C2_0 ();
	e1ofN_M #(.N(2), .M(WIDTH)) C2_1 ();
	e1ofN_M #(.N(2), .M(WIDTH)) P_0 ();
	e1ofN_M #(.N(2), .M(WIDTH)) P_1 ();

	decoder_gold #(.LEAF(1), .ADDRESS(ADDRESS), .MASK(MASK) ) dec_C1(.In(C1in), .Out0(C1_0), .Out1(C1_1), .S(C1_S));
	decoder_gold #(.LEAF(1), .ADDRESS(ADDRESS), .MASK(MASK) ) dec_C2(.In(C2in), .Out0(C2_0), .Out1(C2_1), .S(C2_S));
	decoder_gold #(.LEAF(0), .ADDRESS(ADDRESS), .MASK(MASK) ) dec_P (.In(Pin) , .Out0(P_0) , .Out1(P_1) , .S(P_S) );

	special_split_gold sp_C1(.In(C1_S), .Out0(C1_sel0), .Out1(C1_sel1));
	special_split_gold sp_C2(.In(C2_S), .Out0(C2_sel0), .Out1(C2_sel1));
	special_split_gold sp_P(.In(P_S), .Out0(P_sel0), .Out1(P_sel1));
	
	merge_gold merge_P(.In0(C1_1), .In1(C2_1), .S(P_Grant), .Out(Pout));
	merge_gold merge_C1(.In0(C2_0), .In1(P_0), .S(C1_Grant), .Out(C1out));
	merge_gold merge_C2(.In0(C1_0), .In1(P_1), .S(C2_Grant), .Out(C2out));
endmodule

/*
module router_leaf_gold(interface
C1in, C2in, Pin,
C1out, C2out, Pout,
C1_Error, C2_Error,
C2_sel0, P_sel0, C1_Grant,
C1_sel0, P_sel1, C2_Grant,
C1_sel1, C2_sel1, P_Grant
);
	parameter ADDRESS = 4'd0;
	parameter MASK = 4'd0;
	parameter WIDTH = 9;
	
	e1ofN_M #(.N(2), .M(1)) C1_S ();
	e1ofN_M #(.N(2), .M(1)) C2_S ();
	e1ofN_M #(.N(2), .M(1)) P_S ();

	e1ofN_M #(.N(2), .M(WIDTH)) C1_0 ();
	e1ofN_M #(.N(2), .M(WIDTH)) C1_1 ();
	e1ofN_M #(.N(2), .M(WIDTH)) C2_0 ();
	e1ofN_M #(.N(2), .M(WIDTH)) C2_1 ();
	e1ofN_M #(.N(2), .M(WIDTH)) P_0 ();
	e1ofN_M #(.N(2), .M(WIDTH)) P_1 ();
	
	e1ofN_M #(.N(2), .M(WIDTH)) C1_det ();
	e1ofN_M #(.N(2), .M(WIDTH)) C2_det ();

	decoder_leaf_gold #( .ADDRESS(ADDRESS), .MASK(MASK) ) dec_C1(.In(C1in), .Out0(C1_0), .Out1(C1_1), .S(C1_S));
	decoder_leaf_gold  #( .ADDRESS(ADDRESS), .MASK(MASK) ) dec_C2(.In(C2in), .Out0(C2_0), .Out1(C2_1), .S(C2_S));
	decoder_parent_gold  #( .MASK(MASK) ) dec_P(.In(Pin), .Out0(P_0), .Out1(P_1), .S(P_S));

	special_split_gold sp_C1(.In(C1_S), .Out0(C1_sel0), .Out1(C1_sel1));
	special_split_gold sp_C2(.In(C2_S), .Out0(C2_sel0), .Out1(C2_sel1));
	special_split_gold sp_P(.In(P_S), .Out0(P_sel0), .Out1(P_sel1));
	
	merge_gold merge_P(.In0(C1_1), .In1(C2_1), .S(P_Grant), .Out(Pout));
	merge_gold merge_C1(.In0(C2_0), .In1(P_0), .S(C1_Grant), .Out(C1_det));
	merge_gold merge_C2(.In0(C1_0), .In1(P_1), .S(C2_Grant), .Out(C2_det));
	
	errorDetect_gold e0(.In(C1_det), .Out(C1out), .Error(C1_Error));
	errorDetect_gold e1(.In(C2_det), .Out(C2out), .Error(C2_Error));
endmodule
*/

module errorDetect_gold(interface In, Out, Error);
	parameter WIDTH = 9;
	logic [WIDTH-1:0] data;
	logic receivedParity;
	always begin
		data = 0;
		receivedParity = 0;
		forever begin
			In.Receive(data);
			Out.Send(data);

			receivedParity = ^data[8:1];
			if( receivedParity != data[0] ) begin
				Error.Send(1);
			end else begin
				Error.Send(0);
			end
		end
	end
endmodule

module arbiter (interface R0, R1, Grant);
	logic lastpick, data;
	always
	begin
		lastpick = 0;
		data = 0;
		forever begin
			wait( (R0.status == 2) || (R1.status == 2) );
			begin
				if( (R0.status == 2) && (R1.status == 2) ) begin
					if(lastpick == 1'b0) begin
						R1.Receive(data);
						Grant.Send(1'b1);
					end else begin
						R0.Receive(data);
						Grant.Send(1'b0);
					end
					lastpick = ~lastpick;
				end
				else if( R0.status == 2 ) begin
					R0.Receive(data);
					Grant.Send(1'b0);
				end
				else if( R1.status == 2 ) begin
					R1.Receive(data);
					Grant.Send(1'b1);
				end
			end
		end
	end
endmodule

module full_buffer (interface L, interface R);
	parameter W = 9;
	logic [W-1:0] data = 0;

	always
	begin
		L.Receive(data);
		R.Send(data);
	end
endmodule
