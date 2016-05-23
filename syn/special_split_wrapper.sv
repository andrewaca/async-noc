`timescale 1ns/10ps

module special_split_wrapper(interface In, Out0, Out1, input _RESET);
	e1ofN_M #(.N(2), .M(1)) In_buf ();
	e1ofN_M #(.N(2), .M(1)) Out0_buf ();
	e1ofN_M #(.N(2), .M(1)) Out1_buf ();
	
	full_buffer #(.W(1)) f3(In, In_buf);
	full_buffer #(.W(1)) f1(Out0_buf, Out0);
	full_buffer #(.W(1)) f2(Out1_buf, Out1);

	special_split_cosim_wrapper split_rtl(.In(In_buf), .Out0(Out0_buf), .Out1(Out1_buf), ._RESET(_RESET));
endmodule

