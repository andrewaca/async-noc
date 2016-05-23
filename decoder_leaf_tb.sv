`timescale 1ns/10ps

module data_generator (interface r);
	parameter WIDTH = 9;
	parameter FL = 10;
	logic [WIDTH-1:0] SendValue= 0;

	always
	begin
		SendValue = $random() % (2**WIDTH);
		wait(decoder_leaf_cosim_tb._RESET);
		#FL;
		r.Send(SendValue);
	end
endmodule

module cosim_checker_sp(interface Out0_gold, Out0_rtl, Out1_gold, Out1_rtl, S_gold, S_rtl);
	parameter WIDTH = 9;
	parameter BL = 1;
	logic [WIDTH-1:0] gold_data, rtl_data;
	logic s_gold_data, s_rtl_data;

	real curr_time;
	
	integer value;

	always
	begin
		fork
			S_gold.Receive(s_gold_data);
			S_rtl.Receive(s_rtl_data);
		join
		
		if( s_gold_data == s_rtl_data ) begin
		
			if(s_gold_data == 1'b0) begin
			
				fork
					Out0_gold.Receive(gold_data);
					Out0_rtl.Receive(rtl_data);
				join
				
				
			end else begin
			
				fork
					Out1_gold.Receive(gold_data);
					Out1_rtl.Receive(rtl_data);
				join
			
			end
			if ( gold_data != rtl_data ) begin
				$display("\nERROR\n");
				$stop();
			end
		
		end else begin
			$display("\s_gold_data != s_rtl_data\n");
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

module decoder_leaf_cosim_tb;
	parameter WIDTH = 9;
	parameter ADDRESS = 4'b0000;
	parameter MASK = 4'b1000;
	
	reg _RESET;
	
	e1ofN_M #(.N(2), .M(WIDTH)) In ();
	data_generator #(.WIDTH(WIDTH)) dg_C1(In);
	
	e1ofN_M #(.N(2), .M(WIDTH)) In_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) In_rtl ();	
	copy #(.W(WIDTH)) c2(In, In_gold, In_rtl);
	
	e1ofN_M #(.N(2), .M(WIDTH)) Out0_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Out1_gold ();
	e1ofN_M #(.N(2), .M(WIDTH)) Out0_rtl ();
	e1ofN_M #(.N(2), .M(WIDTH)) Out1_rtl ();
	e1ofN_M #(.N(2), .M(1)) S_gold ();
	e1ofN_M #(.N(2), .M(1)) S_rtl ();

	cosim_checker_sp db1(Out0_gold, Out0_rtl, Out1_gold, Out1_rtl, S_gold, S_rtl);
		
	decoder_gold #(.LEAF(1), .ADDRESS(ADDRESS), .MASK(MASK) ) dec_gold(.In(In_gold), .Out0(Out0_gold), .Out1(Out1_gold), .S(S_gold));
	decoder_leaf1_wrapper dec_rtl(.In(In_rtl), .Out0(Out0_rtl), .Out1(Out1_rtl), .S(S_rtl), ._RESET(_RESET));
	
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
		dec_rtl.In_buf.d_log = '0;
	end
	endtask
	
	task reset_e_log_0;
	begin
		dec_rtl.Out0_buf.e_log = '0;
		dec_rtl.Out1_buf.e_log = '0;
		dec_rtl.S_buf.e_log = '0;
	end
	endtask
	
	task reset_e_log_1;
	begin
		dec_rtl.Out0_buf.e_log = '1;
		dec_rtl.Out1_buf.e_log = '1;
		dec_rtl.S_buf.e_log = '1;
	end
	endtask
endmodule