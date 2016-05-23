`timescale 1ns/10ps

module decoder10_wrapper(interface In, Out0, Out1, S, input _RESET);
	e1ofN_M #(.N(2), .M(9)) In_buf ();
	e1ofN_M #(.N(2), .M(9)) Out0_buf ();
	e1ofN_M #(.N(2), .M(9)) Out1_buf ();
	e1ofN_M #(.N(2), .M(1)) S_buf ();
	
	full_buffer #(.W(9)) f1(In, In_buf);
	full_buffer #(.W(9)) f2(Out0_buf, Out0);
	full_buffer #(.W(9)) f3(Out1_buf, Out1);
	full_buffer #(.W(1)) f4(S_buf, S);	
	
	decoder10_cosim_wrapper dec( .In(In_buf), .Out0(Out0_buf), .Out1(Out1_buf), .S(S_buf), ._RESET(_RESET) );
endmodule
