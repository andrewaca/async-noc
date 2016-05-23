`timescale 1ns/10ps

module data_generator (interface r);
	parameter WIDTH = 9;
	parameter FL = 10;
	logic [WIDTH-1:0] SendValue= 0;

	always
	begin
		SendValue = $random() % (2**WIDTH);
		wait(router_cosim_tb._RESET);
		#FL;
		r.Send(SendValue);
	end
endmodule

module cosim_checker_router(interface Packet_gold, Packet_rtl);
	parameter WIDTH = 9;
	parameter BL = 1;
	logic [WIDTH-1:0] packet_gold, packet_rtl;

	real curr_time;
	
	//integer value;

	always
	begin
		fork
			Packet_gold.Receive(packet_gold);
			Packet_rtl.Receive(packet_rtl);
		join
		//value = router_cosim_tb.values.pop_front();
		curr_time = $realtime;
		if ( packet_gold != packet_rtl ) begin
			$display("%m :\t%3d ns : ERROR, gold = %d, rtl = %d", curr_time, packet_gold, packet_rtl);
			$stop();
		end

		#BL;
	end
endmodule

module copy (interface L, interface R1, interface R2);
	parameter W = 4;
	parameter FL = 1;
	logic [W-1:0] data = 0;

	always
	begin
		L.Receive(data);
		#FL;
		fork
			R1.Send(data);
			R2.Send(data);
		join
	end
endmodule

module router_cosim_tb;
	parameter WIDTH = 9;
	parameter ADDRESS = 4'b1000;
	parameter MASK = 4'b1000;
	
	integer values [$] = {};
	reg _RESET;
	
	e1ofN_M #(.N(2), .M(9)) C1in ();
	e1ofN_M #(.N(2), .M(9)) C2in ();
	e1ofN_M #(.N(2), .M(9)) Pin ();
	data_generator #(.WIDTH(WIDTH)) dg_C1(C1in);
	data_generator #(.WIDTH(WIDTH)) dg_C2(C2in);
	data_generator #(.WIDTH(WIDTH)) dg_P (Pin);
	
	e1ofN_M #(.N(2), .M(9)) C1in_gold ();
	e1ofN_M #(.N(2), .M(9)) C2in_gold ();
	e1ofN_M #(.N(2), .M(9)) Pin_gold ();
	e1ofN_M #(.N(2), .M(9)) C1in_rtl ();
	e1ofN_M #(.N(2), .M(9)) C2in_rtl ();
	e1ofN_M #(.N(2), .M(9)) Pin_rtl ();
	copy #(.W(9)) c1(C1in, C1in_gold, C1in_rtl);
	copy #(.W(9)) c2(C2in, C2in_gold, C2in_rtl);
	copy #(.W(9)) c3(Pin,  Pin_gold,  Pin_rtl);
	
	e1ofN_M #(.N(2), .M(9)) C1out_gold ();
	e1ofN_M #(.N(2), .M(9)) C2out_gold ();
	e1ofN_M #(.N(2), .M(9)) Pout_gold ();
	e1ofN_M #(.N(2), .M(9)) C1out_rtl ();
	e1ofN_M #(.N(2), .M(9)) C2out_rtl ();
	e1ofN_M #(.N(2), .M(9)) Pout_rtl ();
	
	cosim_checker_router db1(C1out_gold, C1out_rtl);
	cosim_checker_router db2(C2out_gold, C2out_rtl);
	cosim_checker_router db3(Pout_gold, Pout_rtl);
	
	e1ofN_M #(.N(2), .M(1)) arb [0:8] ();
	
	genvar i;
	generate
		for(i = 0; i <= 6; i = i+3) begin : arbiter
			arbiter a_gold(arb[i], arb[i+1], arb[i+2]);
		end
	endgenerate
	
	router_gold #( .ADDRESS(ADDRESS), .MASK(MASK) ) r_gold(
		.C1in(C1in_gold), .C1out(C1out_gold), .C2in(C2in_gold), .C2out(C2out_gold), .Pin(Pin_gold), .Pout(Pout_gold),
		.C2_sel0(arb[0]), .P_sel0(arb[1]), .C1_Grant(arb[2]),
		.C1_sel0(arb[3]), .P_sel1(arb[4]), .C2_Grant(arb[5]),
		.C1_sel1(arb[6]), .C2_sel1(arb[7]), .P_Grant(arb[8]) );
	
	e1ofN_M #(.N(2), .M(1)) arb0 ();
	e1ofN_M #(.N(2), .M(1)) arb1 ();
	e1ofN_M #(.N(2), .M(1)) arb2 ();
	e1ofN_M #(.N(2), .M(1)) arb3 ();
	e1ofN_M #(.N(2), .M(1)) arb4 ();
	e1ofN_M #(.N(2), .M(1)) arb5 ();
	e1ofN_M #(.N(2), .M(1)) arb6 ();
	e1ofN_M #(.N(2), .M(1)) arb7 ();
	e1ofN_M #(.N(2), .M(1)) arb8 ();
	
	arbiter a0( arb0, arb1, arb2 );
	arbiter a1( arb3, arb4, arb5 );
	arbiter a2( arb6, arb7, arb8 );
	
	//router_gold #( .ADDRESS(ADDRESS), .MASK(MASK) ) r_rtl(
	router2_wrapper r2(
	.C1in(C1in_rtl), .C1out(C1out_rtl), .C2in(C2in_rtl), .C2out(C2out_rtl), .Pin(Pin_rtl), .Pout(Pout_rtl),
		.C2_sel0(arb0),	.P_sel0(arb1), .C1_Grant(arb2),
		.C1_sel0(arb3),	.P_sel1(arb4), .C2_Grant(arb5),
		.C1_sel1(arb6),	.C2_sel1(arb7),	.P_Grant(arb8),
		._RESET(_RESET)
		);

	initial begin
		_RESET = 0;
		reset_d_log_0();
		reset_e_log_0();
		#400;
		_RESET =  1;
		reset_e_log_1();	
	end
	
	/*
	reg c1_c2, c1_p, c2_c1, c2_p, p_c1, p_c2, p_dest;
	reg [3:0] c1_dest, c2_dest, c1_mask, c2_mask;
	always@(*) begin
		c1_dest = C1in.data[`DEST];
		c1_mask = c1_dest & MASK;
		if( c1_mask == ADDRESS) begin
			c1_c2 = 1;
			c1_p = 0;
		end else begin
			c1_p = 1;
			c1_c2 = 0;
		end
		
		c2_dest = C2in.data[`DEST];
		c2_mask = c2_dest & MASK;
		if( c2_mask == ADDRESS) begin
			c2_c1 = 1;
			c2_p = 0;
		end else begin
			c2_p = 1;
			c2_c1 = 0;
		end
		
		p_dest = Pin.data[`DEST2];
		if( p_dest == 1'b0 ) begin
			p_c1 = 1;
			p_c2 = 0;
		end else begin
			p_c2 = 1;
			p_c1 = 0;
		end
	end
	*/
	
	task reset_d_log_0;
	begin
		r2.d0.In_buf.d_log = '0;
		r2.d1.In_buf.d_log = '0;
		r2.d2.In_buf.d_log = '0;
	
		r2.s0.In_buf.d_log = '0;
		r2.s1.In_buf.d_log = '0;
		r2.s2.In_buf.d_log = '0;
		
		r2.m0.In0_buf.d_log = '0;
		r2.m0.In1_buf.d_log = '0;
		r2.m0.S_buf.d_log = '0;
		r2.m1.In0_buf.d_log = '0;
		r2.m1.In1_buf.d_log = '0;
		r2.m1.S_buf.d_log = '0;
		r2.m2.In0_buf.d_log = '0;
		r2.m2.In1_buf.d_log = '0;
		r2.m2.S_buf.d_log = '0;
	end
	endtask
	
	task reset_e_log_0;
	begin
		r2.d0.Out0_buf.e_log = '0;
		r2.d0.Out1_buf.e_log = '0;
		r2.d0.S_buf.e_log = '0;
		r2.d1.Out0_buf.e_log = '0;
		r2.d1.Out1_buf.e_log = '0;
		r2.d1.S_buf.e_log = '0;
		r2.d2.Out0_buf.e_log = '0;
		r2.d2.Out1_buf.e_log = '0;
		r2.d2.S_buf.e_log = '0;
	
		r2.s0.Out0_buf.e_log = '0;
		r2.s0.Out1_buf.e_log = '0;
		r2.s1.Out0_buf.e_log = '0;
		r2.s1.Out1_buf.e_log = '0;
		r2.s2.Out0_buf.e_log = '0;
		r2.s2.Out1_buf.e_log = '0;
		
		r2.m0.Out_buf.e_log = '0;
		r2.m1.Out_buf.e_log = '0;
		r2.m2.Out_buf.e_log = '0;
	end
	endtask
	
	task reset_e_log_1;
	begin
		r2.d0.Out0_buf.e_log = '1;
		r2.d0.Out1_buf.e_log = '1;
		r2.d0.S_buf.e_log = '1;
		r2.d1.Out0_buf.e_log = '1;
		r2.d1.Out1_buf.e_log = '1;
		r2.d1.S_buf.e_log = '1;
		r2.d2.Out0_buf.e_log = '1;
		r2.d2.Out1_buf.e_log = '1;
		r2.d2.S_buf.e_log = '1;
	
		r2.s0.Out0_buf.e_log = '1;
		r2.s0.Out1_buf.e_log = '1;
		r2.s1.Out0_buf.e_log = '1;
		r2.s1.Out1_buf.e_log = '1;
		r2.s2.Out0_buf.e_log = '1;
		r2.s2.Out1_buf.e_log = '1;
		
		r2.m0.Out_buf.e_log = '1;
		r2.m1.Out_buf.e_log = '1;
		r2.m2.Out_buf.e_log = '1;
	end
	endtask
endmodule