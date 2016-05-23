`timescale 1ns/10ps

module data_generator (interface r);
	parameter WIDTH = 9;
	parameter FL = 10;
	logic [WIDTH-1:0] SendValue= 0;

	always
	begin
		SendValue = $random() % (2**WIDTH);
		wait(merge_cosim_tb._RESET);
		#FL;
		r.Send(SendValue);
		merge_cosim_tb.values.push_back(SendValue);
	end
endmodule

module cosim_checker_merge(interface Packet_gold, Packet_rtl);
	parameter WIDTH = 9;
	parameter BL = 1;
	logic [WIDTH-1:0] packet_gold, packet_rtl;

	real curr_time;
	
	integer value;

	always
	begin
		fork
			Packet_gold.Receive(packet_gold);
			Packet_rtl.Receive(packet_rtl);
		join
		value = merge_cosim_tb.values.pop_front();
		curr_time = $realtime;
		if ( packet_gold == packet_rtl )
			$display("%m :\t%3d ns : CORRECT", curr_time);
		else begin
			$display("\nERROR: gold = %d, rtl = %d\n", packet_gold, packet_rtl);
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

module merge_cosim_tb;
	parameter WIDTH = 9;
	
	integer values [$] = {};
	reg _RESET;

	e1ofN_M #(.N(2), .M(WIDTH)) In0 ();
	e1ofN_M #(.N(2), .M(WIDTH)) In1 ();
	e1ofN_M #(.N(2), .M(1))		 S ();
	
	e1ofN_M #(.N(2), .M(WIDTH)) In0_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) In1_gold ();
	e1ofN_M #(.N(2), .M(1))		 S_gold ();
	
	e1ofN_M #(.N(2), .M(WIDTH)) In0_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) In1_rtl ();
	e1ofN_M #(.N(2), .M(1))		 S_rtl ();
	
	copy #(.W(9)) c1(In0, In0_gold, In0_rtl);
	copy #(.W(9)) c2(In1, In1_gold, In1_rtl);
	copy #(.W(1)) c3(S,  	S_gold,  S_rtl);
	
	data_generator #(.WIDTH(WIDTH)) dg_C1(In0);
	data_generator #(.WIDTH(WIDTH)) dg_C2(In1);
	data_generator #(.WIDTH(1)) dg_P 	(S);
	
	e1ofN_M #(.N(2), .M(WIDTH)) Out_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Out_rtl ();

	cosim_checker_merge db1(Out_gold, Out_rtl);
		
	merge_gold m0(In0_gold, In1_gold, S_gold, Out_gold);
	merge_wrapper merge_rtl( .In0(In0_rtl), .In1(In1_rtl), .S(S_rtl), .Out(Out_rtl), ._RESET(_RESET) );
	
	initial begin
		_RESET = 0;
		reset_d_log_0();
		reset_e_log_0();
		#400;
		_RESET =  1;
		reset_e_log_1();		
	end
		
	task reset_d_log_0;
	begin
		merge_rtl.In0_buf.d_log = '0;
		merge_rtl.In1_buf.d_log = '0;
		merge_rtl.S_buf.d_log = '0;
	end
	endtask
	
	task reset_e_log_0;
	begin
		merge_rtl.Out_buf.e_log = '0;
	end
	endtask
	
	task reset_e_log_1;
	begin
		merge_rtl.Out_buf.e_log = '1;
	end
	endtask
endmodule