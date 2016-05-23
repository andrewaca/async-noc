`timescale 1ns/10ps

module data_generator (interface r);
	parameter WIDTH = 9;
	parameter FL = 10;
	logic [WIDTH-1:0] SendValue= 0;

	always
	begin
		SendValue = $random() % (2**WIDTH);
		wait(special_split_cosim_tb._RESET);
		#FL;
		r.Send(SendValue);
		special_split_cosim_tb.values.push_back(SendValue);
	end
endmodule

module cosim_checker_sp(interface Packet_gold, Packet_rtl);
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
		value = special_split_cosim_tb.values.pop_front();
		curr_time = $realtime;
		if ( packet_gold == packet_rtl )
			$display("%m :\t%3d ns : CORRECT", curr_time);
		else begin
			$display("\nERROR\n");
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

module special_split_cosim_tb;
	parameter WIDTH = 9;
	
	integer values [$] = {};
	reg _RESET;

	e1ofN_M #(.N(2), .M(1)) In0 ();
	e1ofN_M #(.N(2), .M(1)) In0_gold ();
	e1ofN_M #(.N(2), .M(1)) In0_rtl ();
	
	copy #(.W(1)) c1(In0, In0_gold, In0_rtl);
	
	data_generator #(.WIDTH(1)) dg_C1(In0);
	
	e1ofN_M #(.N(2), .M(1)) Out0_gold ();
	e1ofN_M #(.N(2), .M(1)) Out1_gold ();
	e1ofN_M #(.N(2), .M(1)) Out0_rtl ();
	e1ofN_M #(.N(2), .M(1)) Out1_rtl ();

	cosim_checker_sp db1(Out0_gold, Out0_rtl);
	cosim_checker_sp db2(Out1_gold, Out1_rtl);
		
	special_split_gold s0(In0_gold, Out0_gold, Out1_gold);
	special_split_wrapper split_rtl(In0_rtl, Out0_rtl, Out1_rtl, _RESET);
	
	initial begin
		_RESET = 0;
		reset_d_log_0();
		reset_e_log_0();
		#400;
		_RESET =  1;
		reset_e_log_1();
		#100;
		
	end
		
	task reset_d_log_0;
	begin
		split_rtl.In_buf.d_log = '0;
	end
	endtask
	
	task reset_e_log_0;
	begin
		split_rtl.Out0_buf.e_log = '0;
		split_rtl.Out1_buf.e_log = '0;
	end
	endtask
	
	task reset_e_log_1;
	begin
		split_rtl.Out0_buf.e_log = '1;
		split_rtl.Out1_buf.e_log = '1;
	end
	endtask
endmodule